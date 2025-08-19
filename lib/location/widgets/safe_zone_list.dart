import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../add_safe_zone_screen.dart';

class SafeZoneList extends StatefulWidget {
  const SafeZoneList({super.key});

  @override
  State<SafeZoneList> createState() => _SafeZoneListState();
}

class _SafeZoneListState extends State<SafeZoneList> {
  bool isShowDeleteDialog = false;
  int selectedDeleteIndex = -1;

  final List<Map<String, dynamic>> safeZones = [
    {
      'title': 'Rumah',
      'address': 'Jl. Mawar No.123',
      'iconFile': 'home.png',
      'isActive': true,
    },
    {
      'title': 'Sekolah (SMP Negeri 5)',
      'address': 'Jl. Kartini No.123',
      'iconFile': 'school.png',
      'isActive': true,
    },
    {
      'title': 'Rumah Nenek',
      'address': 'Jl. Melati No.123',
      'iconFile': 'home.png',
      'isActive': false,
    },
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
                              Image.asset(
                                'assets/icons/${zone['iconFile']}',
                                width: 28,
                                height: 28,
                              ),
                              const SizedBox(width: 12),
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
                                onChanged: (bool value) {
                                  setState(() {
                                    safeZones[index]['isActive'] = value;
                                  });
                                },
                                activeTrackColor: const Color(0xFF4A80F0),
                                activeColor: Colors.white,
                                inactiveTrackColor: Colors.grey.shade300,
                                inactiveThumbColor: Colors.white,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'assets/icons/trash_icon.png',
                                  width: 20,
                                  height: 20,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddSafeZoneScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    label: Text(
                      'Tambahkan Zona Aman Baru',
                      style: AppTextStyles.textWhite.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
