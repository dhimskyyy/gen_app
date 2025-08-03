import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class SafeZoneList extends StatefulWidget {
  const SafeZoneList({super.key});

  @override
  State<SafeZoneList> createState() => _SafeZoneListState();
}

class _SafeZoneListState extends State<SafeZoneList> {
  bool isShowDeleteDialog = false;
  int selectedDeleteIndex = -1;

  final List<Map<String, dynamic>> safeZones = [
    {'title': 'Rumah', 'address': 'Jl. Mawar No.123', 'isActive': true},
    {
      'title': 'Sekolah (SMP Negeri 5)',
      'address': 'Jl. Kartini No.123',
      'isActive': true,
    },
    {'title': 'Rumah Nenek', 'address': 'Jl. Melati No.123', 'isActive': false},
  ];

  void showDeleteDialog(int index) {
    setState(() {
      selectedDeleteIndex = index;
      isShowDeleteDialog = true;
    });
  }

  void deleteZone() {
    setState(() {
      safeZones.removeAt(selectedDeleteIndex);
      isShowDeleteDialog = false;
      selectedDeleteIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Zona Aman', style: AppTextStyles.textReguler),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: safeZones.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final zone = safeZones[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: zone['isActive']
                                    ? AppColors.primary
                                    : AppColors.black,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    zone['title'],
                                    style: AppTextStyles.textReguler,
                                  ),
                                  Text(
                                    zone['address'],
                                    style: AppTextStyles.description,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Switch(
                                value: zone['isActive'],
                                onChanged: (_) {
                                  setState(() {
                                    zone['isActive'] = !zone['isActive'];
                                  });
                                },
                                activeColor: AppColors.primary,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.black,
                                ),
                                onPressed: () => showDeleteDialog(index),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18, color: Colors.white),
                    label: Text(
                      'Tambahkan Zona Aman Baru',
                      style: AppTextStyles.textWhite,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isShowDeleteDialog) _deleteDialog(),
        ],
      ),
    );
  }

  Widget _deleteDialog() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hapus Zona Aman', style: AppTextStyles.textReguler),
              const SizedBox(height: 12),
              Text(
                'Anda tidak dapat lagi memantau data lokasi, setelah menghapus zona aman.',
                style: AppTextStyles.description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: deleteZone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Lanjutkan', style: AppTextStyles.textWhite),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  setState(() {
                    isShowDeleteDialog = false;
                  });
                },
                child: Text('Batal', style: AppTextStyles.button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
