import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../widgets/site_list_item.dart';
import '../widgets/add_site_dialog.dart';

class SiteListScreen extends StatefulWidget {
  const SiteListScreen({super.key});

  @override
  State<SiteListScreen> createState() => _SiteListScreenState();
}

class _SiteListScreenState extends State<SiteListScreen> {
  final List<String> _blockedSites = [
    'https://shopee.co.id',
    'https://tokopedia.co.id',
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredSites = _blockedSites
        .where(
          (site) => site.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Manajemen Situs Web', style: AppTextStyles.title),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Simpan',
              style: AppTextStyles.button.copyWith(color: AppColors.primary),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Masuk kata kunci',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredSites.isEmpty
                  ? Center(
                      child: Text(
                        'Belum menambahkan situs web',
                        style: AppTextStyles.description,
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredSites.length,
                      itemBuilder: (context, index) {
                        return SiteListItem(
                          siteUrl: filteredSites[index],
                          onEdit: () =>
                              _showAddSiteDialog(filteredSites[index]),
                          onDelete: () => _confirmDelete(filteredSites[index]),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showAddSiteDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text('Tambah Situs Web', style: AppTextStyles.textWhite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddSiteDialog([String? currentUrl]) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AddSiteDialog(initialUrl: currentUrl),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        if (currentUrl != null) {
          int index = _blockedSites.indexOf(currentUrl);
          _blockedSites[index] = result;
        } else {
          _blockedSites.add(result);
        }
      });
    }
  }

  void _confirmDelete(String url) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Situs Web', style: AppTextStyles.title),
        content: Text(
          'Yakin ingin menghapus $url ?',
          style: AppTextStyles.description,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _blockedSites.remove(url);
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deleteRed,
            ),
            child: Text('Oke', style: AppTextStyles.textWhite),
          ),
        ],
      ),
    );
  }
}
