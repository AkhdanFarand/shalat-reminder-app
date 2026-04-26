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
      "ayah": "7 Ayahs",
    },
    {
      "no": "2",
      "name": "Al-Baqarah",
      "type": "Medinan",
      "ayah": "286 Ayahs",
    },
    {
      "no": "3",
      "name": "Ali 'Imran",
      "type": "Medinan",
      "ayah": "200 Ayahs",
    },
    {
      "no": "4",
      "name": "An-Nisa",
      "type": "Medinan",
      "ayah": "176 Ayahs",
    },
    {
      "no": "5",
      "name": "Al-Ma'idah",
      "type": "Medinan",
      "ayah": "120 Ayahs",
    },
    {
      "no": "6",
      "name": "Al-An'am",
      "type": "Meccan",
      "ayah": "165 Ayahs",
    },
  ];

  final List<Map<String, String>> juzList = [
    {
      "no": "1",
      "title": "Juz 1",
      "desc": "Al-Fatihah - Al-Baqarah",
    },
    {
      "no": "2",
      "title": "Juz 2",
      "desc": "Al-Baqarah",
    },
    {
      "no": "3",
      "title": "Juz 3",
      "desc": "Al-Baqarah - Ali Imran",
    },
    {
      "no": "4",
      "title": "Juz 4",
      "desc": "Ali Imran - An-Nisa",
    },
  ];

  final Set<String> favouriteItems = {};

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isFavourite(String title) {
    return favouriteItems.contains(title);
  }

  void toggleFavourite(String title) {
    setState(() {
      if (isFavourite(title)) {
        favouriteItems.remove(title);
      } else {
        favouriteItems.add(title);
      }
    });
  }

  void openSearch() {
    if (_tabController.index == 0) {
      showSearch(
        context: context,
        delegate: QuranSearchDelegate(
          items: surahList,
          keyName: "name",
        ),
      );
    } else if (_tabController.index == 1) {
      showSearch(
        context: context,
        delegate: QuranSearchDelegate(
          items: juzList,
          keyName: "title",
        ),
      );
    }
  }

  Widget buildNumberCircle(String no) {
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
            fontWeight: FontWeight.bold,
            color: Color(0xff16A34A),
          ),
        ),
      ),
    );
  }

  Widget buildListItem({
    required String no,
    required String title,
    required String subtitle,
  }) {
    final fav = isFavourite(title);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SurahDetailPage(
              surahName: title,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 4,
        ),
        leading: buildNumberCircle(no),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                toggleFavourite(title);
              },
              icon: Icon(
                fav
                    ? Icons.favorite
                    : Icons.favorite_border,
                color:
                    fav ? Colors.red : Colors.grey,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFavouritePage() {
    final List<Widget> favList = [];

    for (var item in surahList) {
      if (isFavourite(item["name"]!)) {
        favList.add(
          buildListItem(
            no: item["no"]!,
            title: item["name"]!,
            subtitle:
                "${item["type"]} • ${item["ayah"]}",
          ),
        );
      }
    }

    for (var item in juzList) {
      if (isFavourite(item["title"]!)) {
        favList.add(
          buildListItem(
            no: item["no"]!,
            title: item["title"]!,
            subtitle: item["desc"]!,
          ),
        );
      }
    }

    if (favList.isEmpty) {
      return const Center(
        child: Text(
          "No favourites yet",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: favList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Quran",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme:
            const IconThemeData(color: Colors.black),

        actions: [
          if (_tabController.index != 2)
            IconButton(
              onPressed: openSearch,
              icon: const Icon(Icons.search),
            ),
        ],

        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xff16A34A),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xff16A34A),
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: surahList.map((item) {
                return buildListItem(
                  no: item["no"]!,
                  title: item["name"]!,
                  subtitle:
                      "${item["type"]} • ${item["ayah"]}",
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: juzList.map((item) {
                return buildListItem(
                  no: item["no"]!,
                  title: item["title"]!,
                  subtitle: item["desc"]!,
                );
              }).toList(),
            ),
          ),

          buildFavouritePage(),
        ],
      ),
    );
  }
}

class QuranSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> items;
  final String keyName;

  QuranSearchDelegate({
    required this.items,
    required this.keyName,
  });

  @override
  List<Widget>? buildActions(
      BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(
      BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(
      BuildContext context) {
    final results = items.where((item) {
      return item[keyName]!
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: results.map((item) {
        return ListTile(
          title: Text(item[keyName]!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SurahDetailPage(
                  surahName: item[keyName]!,
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