import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 8),

              const Text(
                "Me",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:
                      FontWeight.bold,
                  color: Color(0xff0F172A),
                ),
              ),

              const SizedBox(height: 24),

              // PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                          28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.05),
                      blurRadius: 16,
                      offset:
                          const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    const CircleAvatar(
                      radius: 42,
                      backgroundColor:
                          Color(0xffDCFCE7),
                      child: Icon(
                        Icons.person,
                        size: 42,
                        color:
                            Color(0xff16A34A),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Farand",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "farand@email.com",
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            Color(0xff64748B),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(
                            0xffDCFCE7),
                        borderRadius:
                            BorderRadius.circular(
                                30),
                      ),

                      child: const Text(
                        "Premium Member",
                        style: TextStyle(
                          color: Color(
                              0xff16A34A),
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),

              sectionCard([
                item(Icons.workspace_premium,
                    "Membership"),
                item(Icons.account_balance_wallet,
                    "Wallet"),
                item(Icons.language,
                    "Language"),
              ]),

              const SizedBox(height: 24),

              const Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),

              sectionCard([
                item(Icons.notifications,
                    "Notifications"),
                item(Icons.access_time,
                    "Prayer Settings"),
                item(Icons.dark_mode,
                    "Theme"),
              ]),

              const SizedBox(height: 24),

              const Text(
                "Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),

              sectionCard([
                item(Icons.help_outline,
                    "Help Center"),
                item(Icons.star_outline,
                    "Rate App"),
                item(Icons.info_outline,
                    "About"),
              ]),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(
                            0xff16A34A),

                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 16,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              18),
                    ),
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(children: children),
    );
  }

  Widget item(
      IconData icon,
      String title,
      ) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 10),

      padding:
          const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),

      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius:
            BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color:
                const Color(0xff16A34A),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}