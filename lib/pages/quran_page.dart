import 'package:flutter/material.dart';
import 'surah_detail_page.dart';
import 'juz_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/surah_model.dart';
import '../services/quran_service.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<SurahModel> surahList = [];
  bool loading = true;

  Future<void> loadSurah() async {
    try {
      surahList = await QuranService.getSurah();

      setState(() {
        loading = false;
      });

      print("Jumlah Surah : ${surahList.length}");
    } catch (e) {
      print(e);

      setState(() {
        loading = false;
      });
    }
  }

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

  Future<void> loadFavourites() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    List<String> data =
        prefs.getStringList("favorite_items") ?? [];

    print("LOAD:");
    print(data);

    setState(() {
      favouriteItems.clear();
      favouriteItems.addAll(data);
    });
  }

  Future<void> saveFavourites() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.setStringList(
      "favorite_items",
      favouriteItems.toList(),
    );

    print("SAVE:");
    print(favouriteItems.toList());
  }

  @override
  void initState() {
    super.initState();

    loadFavourites();
    loadSurah();

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

  void toggleFavourite(String title) async {
    setState(() {
      if (isFavourite(title)) {
        favouriteItems.remove(title);
      } else {
        favouriteItems.add(title);
      }
    });

    await saveFavourites();
  }

  void openSearch() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Search akan kita update setelah API berhasil."),
      ),
    );
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
    required bool isJuz,
  }) {
    final fav = isFavourite(title);

    return InkWell(
      onTap: () {
        if (isJuz) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => JuzDetailPage(
                juzNumber: no,
                title: title,
                desc: subtitle,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SurahDetailPage(
                surahNumber: int.parse(no),
                surahName: title,
              )
            ),
          );
        }
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
      if (isFavourite(item.englishName)) {
        favList.add(
          buildListItem(
            no: item.number.toString(),
            title: item.englishName,
            subtitle: "${item.revelationType} • ${item.ayahs} Ayahs",
            isJuz: false,
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
            isJuz: true,
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
          loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: surahList.length,
                  itemBuilder: (context, index) {
                    final item = surahList[index];

                    return buildListItem(
                      no: item.number.toString(),
                      title: item.englishName,
                      subtitle: "${item.revelationType} • ${item.ayahs} Ayahs",
                      isJuz: false,
                    );
                  },
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
                  isJuz: true,
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