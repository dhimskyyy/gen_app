import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_styles.dart';

class RouteHistory extends StatefulWidget {
  const RouteHistory({super.key});

  @override
  State<RouteHistory> createState() => _RouteHistoryState();
}

class _RouteHistoryState extends State<RouteHistory> {
  GoogleMapController? _controller;

  // Pusat peta (contoh Pekalongan sama seperti add_safe_zone)
  LatLng _center = const LatLng(-6.8898, 109.6753);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: _center, zoom: 14.5),
              onMapCreated: (controller) {
                _controller = controller;
              },
              markers: {
              Marker(
                markerId: const MarkerId('zonaAman'),
                position: _center,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ),
            },
            ),
          ),

          // AppBar Kembali
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: backButton(context),
            ),
          ),

          // Bottom Sheet Riwayat
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
  Center(
    child: Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  const SizedBox(height: 16),

  // Header: Nama device + refresh button
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Redmi 13', style: AppTextStyles.title),
      IconButton(
        onPressed: () {
          // Aksi refresh data
        },
        icon: const Icon(Icons.refresh, color: Colors.black54),
      ),
    ],
  ),
  const SizedBox(height: 8),

  // Row terakhir diperbarui
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.access_time, size: 14, color: Colors.black54),
        const SizedBox(width: 4),
        Text(
          "Terakhir diperbarui 13:08",
          style: AppTextStyles.description.copyWith(color: Colors.black87),
        ),
      ],
    ),
  ),
  const SizedBox(height: 12),

  // Alamat
  Text(
    'Jalan Pendidikan No.4, Pekalongan Timur, Kota Pekalongan, Jawa Tengah, 51129, Indonesia',
    style: AppTextStyles.description,
  ),
],

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, size: 18),
      label: const Text('Kembali'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    );
  }

  Widget routeHistoryItem(
    String address,
    String time, {
    required bool isPrimary,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isPrimary ? Icons.check_circle : Icons.star_border,
          color: isPrimary ? Colors.green : AppColors.black,
          size: 16,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            address,
            style: isPrimary
                ? AppTextStyles.description.copyWith(color: Colors.green)
                : AppTextStyles.description,
          ),
        ),
        const SizedBox(width: 8),
        Text(time, style: AppTextStyles.description),
      ],
    );
  }
}
