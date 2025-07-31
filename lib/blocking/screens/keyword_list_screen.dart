// lib/blocking/screens/keyword_list_screen.dart
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../widgets/add_keyword_dialog.dart';
import '../widgets/keyword_list_item.dart';

class KeywordListScreen extends StatefulWidget {
  const KeywordListScreen({super.key});

  @override
  State<KeywordListScreen> createState() => _KeywordListScreenState();
}

class _KeywordListScreenState extends State<KeywordListScreen> {
  final List<String> _keywords = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredKeywords = _keywords
        .where(
          (k) => k.toLowerCase().contains(_searchController.text.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Manajemen Kata Kunci', style: AppTextStyles.title),
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Simpan', style: AppTextStyles.button),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Nama kategori',
                filled: true,
                fillColor: AppColors.lightGrey,
                prefixIcon: Icon(Icons.search, color: AppColors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredKeywords.isEmpty
                  ? Center(child: Text('Belum menambahkan kata kunci'))
                  : ListView.builder(
                      itemCount: filteredKeywords.length,
                      itemBuilder: (context, index) {
                        return KeywordListItem(
                          keyword: filteredKeywords[index],
                          onDelete: () =>
                              setState(() => _keywords.removeAt(index)),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final newKeyword = await showDialog<String>(
                  context: context,
                  builder: (context) => AddKeywordDialog(),
                );
                if (newKeyword != null && newKeyword.isNotEmpty) {
                  setState(() => _keywords.add(newKeyword));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Tambah Kata Kunci Baru',
                style: AppTextStyles.textWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
