import 'package:flutter/material.dart';
import 'package:gen_app/location/widgets/route_history.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import 'widgets/safe_zone_list.dart';
import 'add_safe_zone_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late final ScrollController _scrollController;
  double _scrollProgress = 0.0;

  final List<Map<String, dynamic>> _safeZoneData = [
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

  final List<Map<String, dynamic>> _notificationData = [
    {
      'title': 'Baterai Lemah',
      'subtitle': 'Notifikasi saat baterai <20%',
      'isActive': true,
      'bgColor': AppColors.yellowSoft,
    },
    {
      'title': 'Keluar Zona Aman',
      'subtitle': 'Peringatan ketika keluar zona aman',
      'isActive': true,
      'bgColor': AppColors.redSoft,
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (mounted) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        setState(() {
          _scrollProgress = (maxScroll > 0) ? currentScroll / maxScroll : 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.greenLight,
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lacak Lokasi', style: AppTextStyles.textWhite),
            const SizedBox(height: 4),
            Text(
              'Pantau lokasi anak secara real-time',
              style: AppTextStyles.extraSmallWhite,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentLocationCard(),
              const SizedBox(height: 20),
              _locationHistorySection(),
              const SizedBox(height: 20),
              _safeZoneCard(),
              const SizedBox(height: 20),
              _notificationSettings(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentLocationCard() {
  const LatLng _center = LatLng(-6.8898, 109.6753);

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowSoft,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/map_pin.png', width: 18),
            const SizedBox(width: 8),
            Text('Lokasi Saat ini', style: AppTextStyles.textReguler),
          ],
        ),
        const SizedBox(height: 12),

        /// Ganti dari Image.asset ke GoogleMap
        SizedBox(
          height: 130,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: _center,
                    zoom: 14.5,
                  ),
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  markers: {},
                ),

                Center(
                  child: Image.asset(
                    'assets/icons/Vector.png',
                    width: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RouteHistory(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            icon: Image.asset('assets/icons/point_icon.png', width: 16),
            label: Text(
              'Buka Peta Lengkap',
              style: AppTextStyles.textWhite.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _locationHistorySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/clock.png', width: 18, height: 18),
              const SizedBox(width: 8),
              Text(
                'Riwayat Lokasi Hari Ini',
                style: AppTextStyles.textReguler.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                _historyItem('06:30', 'Rumah', AppColors.greenSoft),
                _historyItem('07:15', 'Jalan Raya', AppColors.orangeSoft),
                _historyItem('07:30', 'SMP Negeri 5', AppColors.greenSoft),
                _historyItem('14:15', 'Jalan Raya', AppColors.orangeSoft),
                _historyItem('16:00', 'Rumah Nenek', AppColors.greenSoft),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 5,
                      width: constraints.maxWidth * _scrollProgress,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyItem(String time, String label, Color dotColor) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: AppTextStyles.textReguler.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textEmail.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _safeZoneCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 150, 37, 37).withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield_outlined, color: Colors.purple, size: 20),
              const SizedBox(width: 8),
              Text('Zona Aman', style: AppTextStyles.textReguler),
            ],
          ),
          const SizedBox(height: 12),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _safeZoneData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = _safeZoneData[index];
              return _SafeZoneItem(
                title: item['title'],
                address: item['address'],
                iconFile: item['iconFile'],
                initialIsActive: item['isActive'],
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SafeZoneList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
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
    );
  }

  Widget _notificationSettings() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/shield.png', width: 18),
              const SizedBox(width: 8),
              Text('Pengaturan Notifikasi', style: AppTextStyles.textReguler),
            ],
          ),
          const SizedBox(height: 12),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _notificationData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = _notificationData[index];
              return _NotificationItem(
                title: item['title'],
                subtitle: item['subtitle'],
                initialIsActive: item['isActive'],
                bgColor: item['bgColor'],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SafeZoneItem extends StatefulWidget {
  final String title;
  final String address;
  final String iconFile;
  final bool initialIsActive;

  const _SafeZoneItem({
    required this.title,
    required this.address,
    required this.iconFile,
    required this.initialIsActive,
  });

  @override
  State<_SafeZoneItem> createState() => __SafeZoneItemState();
}

class __SafeZoneItemState extends State<_SafeZoneItem> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.initialIsActive;
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData = widget.iconFile == 'home.png'
        ? Icons.home_outlined
        : Icons.school_outlined;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.greySoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(iconData, color: Colors.black54, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.textReguler.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.address,
                  style: AppTextStyles.description.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isActive,
            onChanged: (bool value) {
              setState(() {
                _isActive = value;
              });
            },
            activeTrackColor: const Color(0xFF4A80F0),
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialIsActive;
  final Color bgColor;

  const _NotificationItem({
    required this.title,
    required this.subtitle,
    required this.initialIsActive,
    required this.bgColor,
  });

  @override
  State<_NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<_NotificationItem> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.initialIsActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyles.textReguler),
                const SizedBox(height: 4),
                Text(widget.subtitle, style: AppTextStyles.description),
              ],
            ),
          ),
          Switch(
            value: _isActive,
            onChanged: (bool value) {
              setState(() {
                _isActive = value;
              });
            },
            activeTrackColor: const Color(0xFF4A80F0),
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
