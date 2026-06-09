import 'package:flutter/material.dart';

import 'home_page.dart';
import 'tracker_page.dart';
import 'profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() =>
      _BottomNavPageState();
}

class _BottomNavPageState
    extends State<BottomNavPage> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const TrackerPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),

      body: pages[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            navItem(
              icon: Icons.home,
              label: "Home",
              index: 0,
            ),

            navItem(
              icon: Icons.access_time,
              label: "Tracker",
              index: 1,
            ),

            navItem(
              icon: Icons.person,
              label: "Profile",
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool active = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xffDCFCE7)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: active
                  ? const Color(0xff16A34A)
                  : Colors.grey,
            ),

            if (active) ...[
              const SizedBox(width: 8),

              Text(
                label,
                style: const TextStyle(
                  color: Color(0xff16A34A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}