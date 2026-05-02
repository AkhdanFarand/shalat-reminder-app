import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {

  int selectedTab = 0;

  List<String> tabs = ["Today", "Weekly", "Monthly"];

  List<bool> prayers = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F9),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Tracker",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),

      body: Column(
        children: [

          const SizedBox(height: 12),

          /// 🔘 TAB SWITCH
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (index) {
                bool active = selectedTab == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color:
                            active ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color:
                                active ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          /// 📄 CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: buildContent(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildContent() {
    if (selectedTab == 0) return todayTab();
    if (selectedTab == 1) return weeklyTab();
    return monthlyTab();
  }

  /// ================= TODAY =================
  Widget todayTab() {
    int completed =
        prayers.where((element) => element).length;

    double percent = completed / 5;

    List<String> names = [
      "Fajr",
      "Dhuhr",
      "Asr",
      "Maghrib",
      "Isha"
    ];

    List<String> times = [
      "04:36 AM",
      "12:19 PM",
      "03:40 PM",
      "06:16 PM",
      "07:26 PM"
    ];

    return Column(
      children: [

        CircularPercentIndicator(
          radius: 100,
          lineWidth: 14,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.black,
          backgroundColor: Colors.grey.shade300,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${(percent * 100).toInt()}%",
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              Text("$completed of 5 prayers"),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// LIST
        ...List.generate(5, (i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [

                GestureDetector(
                  onTap: () {
                    setState(() {
                      prayers[i] = !prayers[i];
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: prayers[i]
                          ? Colors.green
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: prayers[i]
                        ? const Icon(Icons.check,
                            color: Colors.white, size: 18)
                        : null,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(child: Text(names[i])),

                Text(times[i]),
              ],
            ),
          );
        })
      ],
    );
  }

  /// ================= WEEKLY =================
  Widget weeklyTab() {
    return SingleChildScrollView(
      child: Column(
        children: [

          /// CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text("This Week"),

                const SizedBox(height: 8),

                const Text("80%",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    return Container(
                      width: 18,
                      height: 80 + (index * 10).toDouble(),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(6),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                const Text("Prayer Breakdown",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                breakdown("Fajr", 0.8),
                breakdown("Dhuhr", 1),
                breakdown("Asr", 0.7),
                breakdown("Maghrib", 0.6),
                breakdown("Isha", 0.5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget breakdown(String title, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [

          SizedBox(width: 70, child: Text(title)),

          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Text("${(value * 7).toInt()}/7"),
        ],
      ),
    );
  }

  /// ================= MONTHLY =================
  Widget monthlyTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// HEADER
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text("April 2026"),
              Text("82%",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text("Calendar",
            style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 10),

        /// GRID CALENDAR
        Expanded(
          child: GridView.builder(
            itemCount: 30,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green
                      .withOpacity((index % 5 + 1) / 5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text("${index + 1}")),
              );
            },
          ),
        )
      ],
    );
  }
}