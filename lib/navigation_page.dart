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

  int currentIndex = 0;

  final pages = const [
    HomePage(),
    PrayerPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF8FAFC),

      body: pages[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
                  24),

          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.06),
              blurRadius: 18,
              offset:
                  const Offset(0, 8),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceAround,

          children: [

            navItem(
              Icons.home,
              "Home",
              0,
            ),

            navItem(
              Icons.access_time,
              "Prayer",
              1,
            ),

            navItem(
              Icons.person,
              "Me",
              2,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(
    IconData icon,
    String label,
    int index,
  ) {
    bool active =
        currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },

      child: AnimatedContainer(
        duration:
            const Duration(
                milliseconds: 250),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: active
              ? const Color(
                  0xffDCFCE7)
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(
                  18),
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color: active
                  ? const Color(
                      0xff16A34A)
                  : Colors.grey,
            ),

            if (active)
              Padding(
                padding:
                    const EdgeInsets.only(
                        left: 8),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(
                        0xff16A34A),
                    fontWeight:
                        FontWeight
                            .w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}