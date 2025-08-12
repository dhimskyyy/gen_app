import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import 'widgets/notification_item.dart';
import 'widgets/request_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedTab = 0; // 0 = Pemberitahuan, 1 = Permintaan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Pusat Notifikasi", style: AppTextStyles.titleAppBar),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: selectedTab == 0
                  ? _buildNotificationList()
                  : _buildRequestList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.lightGrey, width: 1),
        ),
      ),
      child: Row(
        children: [_tabButton("Pemberitahuan", 0), _tabButton("Permintaan", 1)],
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: isSelected
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.black, width: 2),
                  ),
                )
              : null,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.itemTitle.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNotificationList() {
    return [
      NotificationItem(
        iconPath: "assets/icons/bell.png",
        title: "Peringatan",
        message: "Redmi 13 keluar dari zona aman",
        time: "13:00",
      ),
      NotificationItem(
        iconPath: "assets/icons/bell.png",
        title: "Peringatan",
        message: "Redmi 13 mencoba membuka aplikasi Tiktok",
        time: "13:00",
      ),
      NotificationItem(
        iconPath: "assets/icons/bell.png",
        title: "Peringatan",
        message: "Redmi 13 sedang melakukan video call dengan orang lain",
        time: "13:00",
      ),
      NotificationItem(
        iconPath: "assets/icons/bell.png",
        title: "Peringatan",
        message: "Redmi 13 mencoba mengetik kata-kata yang dilarang",
        time: "13:00",
      ),
      NotificationItem(
        iconPath: "assets/icons/bell.png",
        title: "Peringatan",
        message: "Baterai Redmi 13 tersisa 20%",
        time: "13:00",
      ),
    ];
  }

  List<Widget> _buildRequestList() {
    return [
      RequestItem(
        iconPath: "assets/icons/bell.png",
        title: "Permintaan",
        message: "Redmi 13 meminta akses aplikasi Youtube",
        time: "13:00",
        onAccept: () {},
        onReject: () {},
      ),
    ];
  }
}
