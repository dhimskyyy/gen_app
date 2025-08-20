import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../widgets/add_site_dialog.dart';

class SiteListScreen extends StatefulWidget {
  const SiteListScreen({super.key});

  @override
  State<SiteListScreen> createState() => _SiteListScreenState();
}

class _SiteListScreenState extends State<SiteListScreen> {
  final List<String> _blockedSites = [];
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Manajemen Situs Web', style: AppTextStyles.title),
        actions: [
          TextButton(
            onPressed: () {
              // sementara kosong, nanti bisa tambahkan logic simpan
            },
            child: Text(
              'Simpan',
              style: AppTextStyles.button.copyWith(
                color: Colors.grey, // disabled
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama kategori
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                hintText: 'Nama kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.black.withOpacity(0.3)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Label Daftar Situs
            Text(
              'Daftar Situs',
              style: AppTextStyles.textReguler,
            ),
            const SizedBox(height: 8),

            // Card Tambahkan Situs Web
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListTile(
                title: Text('Tambahkan Situs Web', style: AppTextStyles.textReguler),
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.add, size: 20, color: Colors.black),
                ),
                onTap: () => _showAddSiteDialog(),
              ),
            ),

            const SizedBox(height: 16),

            // Placeholder jika belum ada data
            if (_blockedSites.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Belum menambahkan situs web',
                    style: AppTextStyles.description.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _blockedSites.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_blockedSites[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: AppColors.deleteRed),
                        onPressed: () {
                          setState(() {
                            _blockedSites.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
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
}
