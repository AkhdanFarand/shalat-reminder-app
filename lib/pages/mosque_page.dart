import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MosquePage extends StatefulWidget {
  const MosquePage({super.key});

  @override
  State<MosquePage> createState() => _MosquePageState();
}

class _MosquePageState extends State<MosquePage> {

  int? hoverIndex;

  Future<void> openMaps(String query) async {
    final Uri url =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F9),

      /// 🔝 APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Nearby Mosques",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// 🗺️ MAP CARD (CLICKABLE)
              GestureDetector(
                onTap: () => openMaps("masjid terdekat"),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [

                      const Center(
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.green,
                        ),
                      ),

                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "View Map",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// 📍 LIST MASJID
              mosqueCard(0,
                  name: "Istiqlal Mosque",
                  address: "Jl. Taman Wijaya Kusuma",
                  distance: "0,5 Km"),

              mosqueCard(1,
                  name: "Al-Azhar Mosque",
                  address: "Jl. Sisingamangaraja",
                  distance: "1,2 Km"),

              mosqueCard(2,
                  name: "Sunda Kelapa Mosque",
                  address: "Jl. Lada, Pinangsia",
                  distance: "2,1 Km"),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 CARD MASJID + HOVER EFFECT
  Widget mosqueCard(int index,
      {required String name,
      required String address,
      required String distance}) {

    bool isHover = hoverIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [

          /// HEADER
          Row(
            children: [

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffDCFCE7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.mosque,
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold)),
                    Text(address,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              Text(distance,
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 14),

          /// 🔘 BUTTON HOVER
          MouseRegion(
            onEnter: (_) {
              setState(() {
                hoverIndex = index;
              });
            },
            onExit: (_) {
              setState(() {
                hoverIndex = null;
              });
            },
            child: GestureDetector(
              onTap: () => openMaps(name),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isHover ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border:
                      isHover ? null : Border.all(color: Colors.green),
                ),
                child: Center(
                  child: Text(
                    "Open in Google Maps",
                    style: TextStyle(
                      color: isHover ? Colors.white : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}