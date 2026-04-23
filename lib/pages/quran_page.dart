import 'package:flutter/material.dart';
import 'surah_detail_page.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> surahList = [
    {
      "no": "1",
      "name": "Al-Fatihah",
      "type": "Meccan",
      "ayah": "7 Ayahs"
    },
    {
      "no": "2",
      "name": "Al-Baqarah",
      "type": "Medinan",
      "ayah": "286 Ayahs"
    },
    {
      "no": "3",
      "name": "Ali 'Imran",
      "type": "Medinan",
      "ayah": "200 Ayahs"
    },
    {
      "no": "4",
      "name": "An-Nisa",
      "type": "Medinan",
      "ayah": "176 Ayahs"
    },
    {
      "no": "5",
      "name": "Al-Ma'idah",
      "type": "Medinan",
      "ayah": "120 Ayahs"
    },
    {
      "no": "6",
      "name": "Al-An'am",
      "type": "Meccan",
      "ayah": "165 Ayahs"
    },
  ];

  final List<Map<String, String>> juzList = [
    {
      "no": "1",
      "title": "Juz 1",
      "desc": "Al-Fatihah - Al-Baqarah"
    },
    {
      "no": "2",
      "title": "Juz 2",
      "desc": "Al-Baqarah"
    },
    {
      "no": "3",
      "title": "Juz 3",
      "desc": "Al-Baqarah - Ali Imran"
    },
    {
      "no": "4",
      "title": "Juz 4",
      "desc": "Ali Imran - An-Nisa"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildCircleNumber(String no) {
    return Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
        color: Color(0xffE8F5EC),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          no,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff16A34A),
          ),
        ),
      ),
    );
  }

  Widget surahItem(
      BuildContext context,
      Map<String, String> item) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                SurahDetailPage(
              surahName:
                  item["name"]!,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 2,
        ),
        leading:
            buildCircleNumber(item["no"]!),
        title: Text(
          item["name"]!,
          style: const TextStyle(
            fontWeight:
                FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "${item["type"]} • ${item["ayah"]}",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget juzItem(
      BuildContext context,
      Map<String, String> item) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                SurahDetailPage(
              surahName:
                  item["title"]!,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        leading:
            buildCircleNumber(item["no"]!),
        title: Text(
          item["title"]!,
          style: const TextStyle(
            fontWeight:
                FontWeight.w600,
          ),
        ),
        subtitle: Text(
          item["desc"]!,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget favouriteEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 12),
          Text(
            "No favourites yet",
            style: TextStyle(
              fontWeight:
                  FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Save verses to see them here",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void openSearch() {
    showSearch(
      context: context,
      delegate:
          QuranSearchDelegate(
        surahList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quran",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: openSearch,
            icon:
                const Icon(Icons.search),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor:
              const Color(0xff16A34A),
          unselectedLabelColor:
              Colors.grey,
          indicatorColor:
              const Color(0xff16A34A),
          tabs: const [
            Tab(text: "Surah"),
            Tab(text: "Juz"),
            Tab(text: "Favourites"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [

          /// SURAH
          Padding(
            padding:
                const EdgeInsets.all(
                    16),
            child: ListView(
              children: [

                Container(
                  padding:
                      const EdgeInsets
                          .all(16),
                  decoration:
                      BoxDecoration(
                    color:
                        Colors.white,
                    borderRadius:
                        BorderRadius
                            .circular(
                                18),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            "Continue Reading",
                            style:
                                TextStyle(
                              fontWeight:
                                  FontWeight
                                      .w600,
                            ),
                          ),
                          SizedBox(
                              height: 6),
                          Text(
                            "Al-Baqarah • Ayah 2",
                            style:
                                TextStyle(
                              color:
                                  Colors
                                      .grey,
                              fontSize:
                                  12,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons
                            .menu_book,
                        color: Color(
                            0xff16A34A),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                    height: 18),

                ...surahList.map(
                  (e) => surahItem(
                    context,
                    e,
                  ),
                ),
              ],
            ),
          ),

          /// JUZ
          Padding(
            padding:
                const EdgeInsets.all(
                    16),
            child: ListView(
              children: juzList.map(
                (e) => juzItem(
                  context,
                  e,
                ),
              ).toList(),
            ),
          ),

          /// FAV
          favouriteEmpty(),
        ],
      ),
    );
  }
}

class QuranSearchDelegate
    extends SearchDelegate {
  final List<Map<String, String>>
      surahList;

  QuranSearchDelegate(
      this.surahList);

  @override
  List<Widget>? buildActions(
      BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
            Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(
      BuildContext context) {
    return IconButton(
      icon:
          const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(
      BuildContext context) {
    final results = surahList
        .where(
          (item) => item["name"]!
              .toLowerCase()
              .contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView(
      children: results.map((item) {
        return ListTile(
          title:
              Text(item["name"]!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    SurahDetailPage(
                  surahName:
                      item["name"]!,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(
      BuildContext context) {
    return buildResults(context);
  }
}