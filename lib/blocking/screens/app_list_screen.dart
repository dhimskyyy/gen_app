import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../models/app_model.dart';
import '../widgets/app_item_tile.dart';
import '../widgets/search_bar.dart';

class AppListScreen extends StatefulWidget {
  const AppListScreen({super.key});

  @override
  State<AppListScreen> createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  List<AppModel> apps = [
    AppModel(
      name: 'Semua',
      iconPath: 'assets/images/semua.png',
      isBlocked: true,
    ),
    AppModel(
      name: 'Asisten',
      iconPath: 'assets/images/asisten.png',
      isBlocked: true,
    ),
    AppModel(
      name: 'Brimo',
      iconPath: 'assets/images/brimo.png',
      isBlocked: true,
    ),
    AppModel(
      name: 'Capcut',
      iconPath: 'assets/images/capcut.png',
      isBlocked: true,
    ),
    AppModel(
      name: 'Catatan',
      iconPath: 'assets/images/catatan.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Classroom',
      iconPath: 'assets/images/classroom.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Cuaca',
      iconPath: 'assets/images/cuaca.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Drive',
      iconPath: 'assets/images/drive.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'File Manager',
      iconPath: 'assets/images/file.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Galeri',
      iconPath: 'assets/images/galeri.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Gmail',
      iconPath: 'assets/images/gmail.png',
      isBlocked: false,
    ),
    AppModel(
      name: 'Instagram',
      iconPath: 'assets/images/instagram.png',
      isBlocked: false,
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<AppModel> filteredApps = apps
        .where(
          (app) => app.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Pemblokir Aplikasi', style: AppTextStyles.titlee),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBarWidget(
              hintText: 'Search',
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredApps.isEmpty
                ? Center(
                    child: Text(
                      'Aplikasi tidak ditemukan',
                      style: AppTextStyles.textReguler.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredApps.length,
                    itemBuilder: (context, index) {
                      return AppItemTile(
                        app: filteredApps[index],
                        onToggle: (value) {
                          setState(() {
                            if (index == 0) {
                              for (var app in apps) {
                                app.isBlocked = value;
                              }
                            } else {
                              filteredApps[index].isBlocked = value;
                            }
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
