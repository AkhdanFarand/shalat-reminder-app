import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {
  bool prayerReminder = true;
  bool adzanSound = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(
                    16),
          ),

          child: Column(
            children: [

              /// Prayer Reminder
              switchTile(
                title:
                    "Prayer Reminder",
                value:
                    prayerReminder,
                onChanged: (v) {
                  setState(() {
                    prayerReminder =
                        v;
                  });
                },
              ),

              divider(),

              /// Adzan Sound
              switchTile(
                title:
                    "Adzan Sound",
                value: adzanSound,
                onChanged: (v) {
                  setState(() {
                    adzanSound = v;
                  });
                },
              ),

              divider(),

              /// Reminder Before
              ListTile(
                title: const Text(
                  "Reminder Before",
                ),
                trailing: const Text(
                  "10 minutes",
                  style: TextStyle(
                    color: Color(
                        0xff64748B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchTile({
    required String title,
    required bool value,
    required ValueChanged<bool>
        onChanged,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        activeColor:
            const Color(
                0xff22C55E),
        onChanged: onChanged,
      ),
    );
  }

  Widget divider() {
    return const Divider(
      height: 1,
      color: Color(0xffE5E7EB),
    );
  }
}