import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddSafeZoneScreen extends StatefulWidget {
  const AddSafeZoneScreen({super.key});

  @override
  State<AddSafeZoneScreen> createState() => _AddSafeZoneScreenState();
}

class _AddSafeZoneScreenState extends State<AddSafeZoneScreen> {
  GoogleMapController? _controller;
  LatLng _center = const LatLng(-6.8898, 109.6753);
  double _radius = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
            circles: {
              Circle(
                circleId: const CircleId("radiusZona"),
                center: _center,
                radius: _radius,
                fillColor: Colors.green.withOpacity(0.3),
                strokeWidth: 0,
              ),
            },
            myLocationEnabled: false,
            zoomControlsEnabled: false,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  label: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.3,
            maxChildSize: 0.5,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Tambahkan Zona Aman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Lokasi"),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/loc_icon.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "Pilih lokasi",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const Text(
                              "Ganti",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("100m"), Text("1000m")],
                      ),
                      Slider(
                        min: 100,
                        max: 1000,
                        value: _radius,
                        divisions: 9,
                        label: "${_radius.toInt()}m",
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            _radius = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Simpan"),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Batal",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
