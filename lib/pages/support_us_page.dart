import 'package:flutter/material.dart';

class SupportUsPage extends StatelessWidget {
  const SupportUsPage({super.key});

  Widget supportButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style:
            ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding:
              const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                    18),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight:
                    FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF3F4F6),

      appBar: AppBar(
        backgroundColor:
            Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Support Us",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.favorite,
              size: 54,
              color:
                  Color(0xffEF4444),
            ),

            const SizedBox(
                height: 18),

            const Text(
              "Help us grow better",
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            const SizedBox(
                height: 8),

            const Text(
              "Your support means a lot for future updates.",
              textAlign:
                  TextAlign.center,
              style: TextStyle(
                color:
                    Color(0xff64748B),
              ),
            ),

            const SizedBox(
                height: 30),

            supportButton(
              icon: Icons
                  .volunteer_activism,
              title: "Donate",
              color: const Color(
                  0xff16A34A),
              onTap: () {
                ScaffoldMessenger.of(
                        context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Donation feature coming soon",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(
                height: 14),

            supportButton(
              icon: Icons.share,
              title: "Share App",
              color: const Color(
                  0xff2563EB),
              onTap: () {
                ScaffoldMessenger.of(
                        context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Share feature coming soon",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}