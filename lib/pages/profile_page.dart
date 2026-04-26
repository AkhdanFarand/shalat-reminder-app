import 'package:flutter/material.dart';

import 'login_page.dart';
import 'language_page.dart';
import 'notification_page.dart';
import 'favourites_page.dart';
import 'rate_us_page.dart';
import 'support_us_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void go(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  /// UPDATED LOGOUT ONLY
  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
        title: const Text(
          "Logout",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: const Text(
          "Are you sure want to logout?",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(
                  child:
                      CircularProgressIndicator(
                    color: Color(
                        0xff16A34A),
                  ),
                ),
              );

              await Future.delayed(
                const Duration(
                    seconds: 1),
              );

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const LoginPage(),
                ),
                (route) => false,
              );
            },
            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(
                      0xffEF4444),
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF3F4F6),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.fromLTRB(
            16,
            12,
            16,
            24,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              /// TOP PROFILE
              InkWell(
                borderRadius:
                    BorderRadius.circular(
                        22),
                onTap: () {
                  go(
                    context,
                    const LoginPage(),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.all(
                          16),
                  decoration:
                      BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius
                            .circular(
                                22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(
                                0.04),
                        blurRadius: 10,
                        offset:
                            const Offset(
                                0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration:
                            const BoxDecoration(
                          color: Color(
                              0xff16A34A),
                          shape:
                              BoxShape
                                  .circle,
                        ),
                        child: const Icon(
                          Icons
                              .person_outline,
                          color: Colors
                              .white,
                          size: 34,
                        ),
                      ),

                      const SizedBox(
                          width: 14),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              "Salaam",
                              style:
                                  TextStyle(
                                fontSize:
                                    18,
                                fontWeight:
                                    FontWeight
                                        .w700,
                              ),
                            ),
                            SizedBox(
                                height:
                                    4),
                            Text(
                              "tap to Log in",
                              style:
                                  TextStyle(
                                fontSize:
                                    14,
                                color:
                                    Color(
                                        0xff64748B),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons
                            .chevron_right,
                        color: Color(
                            0xff94A3B8),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              /// PREMIUM CARD
              InkWell(
                borderRadius:
                    BorderRadius.circular(
                        22),
                onTap: () {
                  ScaffoldMessenger.of(
                          context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Premium feature coming soon",
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(
                          22),
                  decoration:
                      BoxDecoration(
                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(
                            0xff16A34A),
                        Color(
                            0xff22C55E),
                      ],
                    ),
                    borderRadius:
                        BorderRadius
                            .circular(
                                22),
                  ),
                  child: const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        "Enhance your experience",
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontSize: 18,
                          fontWeight:
                              FontWeight
                                  .w700,
                        ),
                      ),
                      SizedBox(
                          height: 6),
                      Text(
                        "Unlock more features →",
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "SETTINGS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w700,
                  color:
                      Color(0xff94A3B8),
                ),
              ),

              const SizedBox(height: 14),

              menuCard(
                context,
                icon: Icons.language,
                title: "Language",
                subtitle: "English",
                onTap: () {
                  go(
                    context,
                    const LanguagePage(),
                  );
                },
              ),

              const SizedBox(height: 12),

              menuCard(
                context,
                icon:
                    Icons.notifications_none,
                title:
                    "Notifications",
                onTap: () {
                  go(
                    context,
                    const NotificationPage(),
                  );
                },
              ),

              const SizedBox(height: 12),

              menuCard(
                context,
                icon:
                    Icons.favorite_border,
                title: "Favourites",
                onTap: () {
                  go(
                    context,
                    const FavouritesPage(),
                  );
                },
              ),

              const SizedBox(height: 24),

              const Text(
                "GENERAL",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w700,
                  color:
                      Color(0xff94A3B8),
                ),
              ),

              const SizedBox(height: 14),

              menuCard(
                context,
                icon: Icons.star_border,
                title: "Rate Us",
                onTap: () {
                  go(
                    context,
                    const RateUsPage(),
                  );
                },
              ),

              const SizedBox(height: 12),

              menuCard(
                context,
                icon:
                    Icons.volunteer_activism_outlined,
                title:
                    "Support Us",
                onTap: () {
                  go(
                    context,
                    const SupportUsPage(),
                  );
                },
              ),

              const SizedBox(height: 30),

              /// LOGOUT BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    logout(context);
                  },
                  style:
                      ElevatedButton
                          .styleFrom(
                    backgroundColor:
                        const Color(
                            0xffEF4444),
                    elevation: 0,
                    padding:
                        const EdgeInsets
                            .symmetric(
                      vertical: 16,
                    ),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  18),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w700,
                      color:
                          Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    color: Color(
                        0xff94A3B8),
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
                  18),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.04),
              blurRadius: 8,
              offset:
                  const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration:
                  BoxDecoration(
                color: const Color(
                    0xffDCFCE7),
                borderRadius:
                    BorderRadius
                        .circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(
                    0xff16A34A),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),

            if (subtitle != null)
              Text(
                subtitle,
                style:
                    const TextStyle(
                  color: Color(
                      0xff64748B),
                  fontSize: 14,
                ),
              ),

            const SizedBox(width: 6),

            const Icon(
              Icons.chevron_right,
              color:
                  Color(0xff94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}