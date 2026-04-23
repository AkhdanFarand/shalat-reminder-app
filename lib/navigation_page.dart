import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/prayer_page.dart';
import 'pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() =>
      _NavigationPageState();
}

class _NavigationPageState
    extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    PrayerPage(),
    ProfilePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: SafeArea(
        minimum:
            const EdgeInsets.only(
                bottom: 8),

        child: Container(
          margin:
              const EdgeInsets.fromLTRB(
            18,
            0,
            18,
            24,
          ),

          padding:
              const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(
                    28),

            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.08),
                blurRadius: 24,
                offset:
                    const Offset(
                        0, 10),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,

            children: [
              navItem(
                icon: Icons.home,
                label: "Home",
                index: 0,
              ),

              navItem(
                icon:
                    Icons.access_time,
                label: "Prayer",
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
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool active =
        _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),

      child: AnimatedContainer(
        duration:
            const Duration(
                milliseconds:
                    250),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: active
              ? const Color(
                  0xffDCFCE7)
              : Colors
                  .transparent,

          borderRadius:
              BorderRadius.circular(
                  18),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: active
                  ? const Color(
                      0xff16A34A)
                  : Colors.grey,
            ),

            if (active) ...[
              const SizedBox(
                  width: 8),

              Text(
                label,
                style:
                    const TextStyle(
                  color: Color(
                      0xff16A34A),
                  fontWeight:
                      FontWeight
                          .w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}