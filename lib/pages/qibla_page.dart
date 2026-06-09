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

  bool isLoading = true;
  String? errorMessage;
  String cityName = "Your Location";

  final double kaabaLat = 21.4225;
  final double kaabaLng = 39.8262;

  @override
  void initState() {
    super.initState();
    initQibla();
  }

  Future<void> initQibla() async {
    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        setState(() {
          errorMessage = "GPS is disabled";
          isLoading = false;
        });
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission =
            await Geolocator.requestPermission();
      }

      if (permission ==
              LocationPermission.denied ||
          permission ==
              LocationPermission.deniedForever) {
        setState(() {
          errorMessage =
              "Location permission denied";
          isLoading = false;
        });
        return;
      }

      Position pos =
          await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double lat = pos.latitude;
      double lng = pos.longitude;

      double dLon =
          (kaabaLng - lng) * pi / 180;

      lat = lat * pi / 180;
      double kaabaLatRad =
          kaabaLat * pi / 180;

      double y = sin(dLon);

      double x =
          cos(lat) * tan(kaabaLatRad) -
              sin(lat) * cos(dLon);

      double bearing = atan2(y, x);

      qiblaDirection =
          (bearing * 180 / pi + 360) % 360;

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  String getDirectionText(double degree) {
    if (degree >= 315 || degree < 45) {
      return "North";
    }

    if (degree >= 45 && degree < 135) {
      return "East";
    }

    if (degree >= 135 && degree < 225) {
      return "South";
    }

    return "West";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF0E8F3A,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.pop(
                                context),
                        child: const Icon(
                          Icons.arrow_back,
                          color:
                              Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 20),

                  const Text(
                    "Qibla Direction",
                    style: TextStyle(
                      fontSize: 28,
                      color:
                          Colors.white,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 12),

                  Container(
                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration:
                        BoxDecoration(
                      color: Colors.white
                          .withOpacity(
                              0.2),
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons
                              .location_on,
                          size: 16,
                          color: Colors
                              .white,
                        ),
                        const SizedBox(
                            width: 6),
                        Text(
                          cityName,
                          style:
                              const TextStyle(
                            color: Colors
                                .white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Container(
                width: double.infinity,
                margin:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 20,
                ),
                padding:
                    const EdgeInsets.all(
                        20),
                decoration:
                    BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius
                          .circular(28),
                ),
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    }

                    if (errorMessage !=
                        null) {
                      return Center(
                        child: Text(
                          errorMessage!,
                          textAlign:
                              TextAlign
                                  .center,
                        ),
                      );
                    }

                    if (FlutterCompass
                            .events ==
                        null) {
                      return const Center(
                        child: Text(
                          "Compass sensor not available",
                        ),
                      );
                    }

                    return StreamBuilder<
                        CompassEvent>(
                      stream:
                          FlutterCompass
                              .events,
                      builder:
                          (context,
                              snapshot) {
                        if (!snapshot
                            .hasData) {
                          return const Center(
                            child:
                                CircularProgressIndicator(),
                          );
                        }

                        double heading =
                            snapshot
                                    .data!
                                    .heading ??
                                0;

                        double rotation =
                            qiblaDirection! -
                                heading;

                        return Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          children: [
                            Transform.rotate(
                              angle:
                                  rotation *
                                      pi /
                                      180,
                              child:
                                  Container(
                                width:
                                    250,
                                height:
                                    250,
                                decoration:
                                    BoxDecoration(
                                  shape:
                                      BoxShape.circle,
                                  border:
                                      Border.all(
                                    color:
                                        Colors.green,
                                    width:
                                        4,
                                  ),
                                ),
                                child:
                                    Stack(
                                  alignment:
                                      Alignment.center,
                                  children: [
                                    const Positioned(
                                      top:
                                          10,
                                      child:
                                          Text(
                                        "N",
                                      ),
                                    ),
                                    const Positioned(
                                      bottom:
                                          10,
                                      child:
                                          Text(
                                        "S",
                                      ),
                                    ),
                                    const Positioned(
                                      left:
                                          10,
                                      child:
                                          Text(
                                        "W",
                                      ),
                                    ),
                                    const Positioned(
                                      right:
                                          10,
                                      child:
                                          Text(
                                        "E",
                                      ),
                                    ),

                                    Container(
                                      width:
                                          20,
                                      height:
                                          120,
                                      decoration:
                                          BoxDecoration(
                                        color:
                                            Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                    ),

                                    const CircleAvatar(
                                      radius:
                                          20,
                                      backgroundColor:
                                          Colors.white,
                                      child:
                                          Icon(
                                        Icons
                                            .mosque,
                                        color:
                                            Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                                height:
                                    20),

                            Text(
                              "${qiblaDirection!.toStringAsFixed(0)}°",
                              style:
                                  const TextStyle(
                                fontSize:
                                    32,
                                fontWeight:
                                    FontWeight.bold,
                                color:
                                    Colors.green,
                              ),
                            ),

                            Text(
                              getDirectionText(
                                qiblaDirection!,
                              ),
                              style:
                                  const TextStyle(
                                color: Colors
                                    .grey,
                              ),
                            ),

                            const SizedBox(
                                height:
                                    20),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .all(
                                          16),
                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(
                                  0xffF1F5F9,
                                ),
                                borderRadius:
                                    BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child:
                                  const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Distance to Mecca:",
                                    style:
                                        TextStyle(
                                      color:
                                          Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "7,834 Km",
                                    style:
                                        TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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