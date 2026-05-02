import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaPage extends StatefulWidget {
  const QiblaPage({super.key});

  @override
  State<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  double? qiblaDirection;

  final double kaabaLat = 21.4225;
  final double kaabaLng = 39.8262;

  @override
  void initState() {
    super.initState();
    initQibla();
  }

  Future<void> initQibla() async {
    await Geolocator.requestPermission();
    Position pos = await Geolocator.getCurrentPosition();

    double lat = pos.latitude;
    double lng = pos.longitude;

    double dLon = (kaabaLng - lng) * pi / 180;

    lat = lat * pi / 180;
    double kaabaLatRad = kaabaLat * pi / 180;

    double y = sin(dLon);
    double x = cos(lat) * tan(kaabaLatRad) - sin(lat) * cos(dLon);

    double bearing = atan2(y, x);
    qiblaDirection = (bearing * 180 / pi + 360) % 360;

    setState(() {});
  }

  String getDirectionText(double degree) {
    if (degree >= 315 || degree < 45) return "North";
    if (degree >= 45 && degree < 135) return "East";
    if (degree >= 135 && degree < 225) return "South";
    return "West";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E8F3A),
      body: SafeArea(
        child: Column(
          children: [

            /// 🔝 HEADER
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Qibla Direction",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: Colors.white),
                        SizedBox(width: 6),
                        Text(
                          "Denpasar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 📦 CARD PUTIH
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: StreamBuilder<CompassEvent>(
                  stream: FlutterCompass.events,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || qiblaDirection == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    double heading = snapshot.data!.heading ?? 0;
                    double rotation = (qiblaDirection! - heading);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        /// 🧭 COMPASS
                        Transform.rotate(
                          angle: rotation * (pi / 180),
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green,
                                width: 4,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [

                                /// Arah
                                const Positioned(
                                    top: 10,
                                    child: Text("N")),
                                const Positioned(
                                    bottom: 10,
                                    child: Text("S")),
                                const Positioned(
                                    left: 10,
                                    child: Text("W")),
                                const Positioned(
                                    right: 10,
                                    child: Text("E")),

                                /// Jarum
                                Container(
                                  width: 20,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                ),

                                /// Tengah
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.mosque,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// DEGREE
                        Text(
                          "${qiblaDirection!.toStringAsFixed(0)}°",
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        /// ARAH TEXT
                        Text(
                          getDirectionText(qiblaDirection!),
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        /// DISTANCE (dummy dulu)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Distance to mecca:",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "7,834 Km",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}