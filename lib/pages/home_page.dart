import 'dart:async';
import 'package:flutter/material.dart';
import 'quran_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  DateTime now = DateTime.now();

  final prayers = {
    "Subuh": "04:58",
    "Dzuhur": "12:23",
    "Ashar": "15:41",
    "Maghrib": "18:17",
    "Isya": "19:28",
  };

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          now = DateTime.now();
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String two(int n) => n.toString().padLeft(2, '0');

  String formatNow() {
    return "${two(now.hour)}:${two(now.minute)}:${two(now.second)}";
  }

  MapEntry<String, String> nextPrayer() {
    for (var item in prayers.entries) {
      final split = item.value.split(":");

      DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(split[0]),
        int.parse(split[1]),
      );

      if (now.isBefore(prayerTime)) {
        return item;
      }
    }

    return prayers.entries.first;
  }

  String remainingTime() {
    final next = nextPrayer();
    final split = next.value.split(":");

    DateTime target = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(split[0]),
      int.parse(split[1]),
    );

    if (now.isAfter(target)) {
      target = target.add(const Duration(days: 1));
    }

    final diff = target.difference(now);

    return "${two(diff.inHours)}:${two(diff.inMinutes.remainder(60))}:${two(diff.inSeconds.remainder(60))}";
  }

  void openMenu(String title) {
    if (title == "Quran") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const QuranPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$title page coming soon"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final next = nextPrayer();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Good Afternoon",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748B),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Denpasar",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff16A34A),
                      Color(0xff22C55E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.20),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Next Prayer",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      next.key,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      next.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Now : ${formatNow()}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      "Remaining : ${remainingTime()}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Today's Prayer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),

              prayerList(),

              const SizedBox(height: 28),

              const Text(
                "Quick Access",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.25,
                children: [

                  QuickBox(
                    icon: Icons.menu_book,
                    title: "Quran",
                    onTap: () => openMenu("Quran"),
                  ),

                  QuickBox(
                    icon: Icons.bar_chart,
                    title: "Tracker",
                    onTap: () => openMenu("Tracker"),
                  ),

                  QuickBox(
                    icon: Icons.explore,
                    title: "Qibla",
                    onTap: () => openMenu("Qibla"),
                  ),

                  QuickBox(
                    icon: Icons.location_on,
                    title: "Mosques",
                    onTap: () => openMenu("Mosques"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget prayerList() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: prayers.entries.map((e) {

          bool active = e.key == nextPrayer().key;

          IconData icon =
              (e.key == "Maghrib" || e.key == "Isya")
                  ? Icons.nightlight_round
                  : Icons.wb_sunny;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: active
                  ? const Color(0xffDCFCE7)
                  : const Color(0xffF8FAFC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [

                Icon(
                  icon,
                  size: 20,
                  color: const Color(0xff16A34A),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    e.key,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Text(e.value),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class QuickBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const QuickBox({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xffDCFCE7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 28,
                color: const Color(0xff16A34A),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}