import 'package:flutter/material.dart';

class SurahDetailPage extends StatelessWidget {
  final String surahName;

  const SurahDetailPage({
    super.key,
    required this.surahName,
  });

  List<Map<String, String>> getVerses() {
    if (surahName == "Al-Fatihah") {
      return [
        {
          "arab":
              "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
          "arti":
              "Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang."
        },
        {
          "arab":
              "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
          "arti":
              "Segala puji bagi Allah, Tuhan semesta alam."
        },
        {
          "arab":
              "الرَّحْمَٰنِ الرَّحِيمِ",
          "arti":
              "Yang Maha Pengasih lagi Maha Penyayang."
        },
        {
          "arab":
              "مَالِكِ يَوْمِ الدِّينِ",
          "arti":
              "Pemilik hari Pembalasan."
        },
        {
          "arab":
              "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
          "arti":
              "Hanya kepada Engkaulah kami menyembah dan hanya kepada Engkaulah kami mohon pertolongan."
        },
        {
          "arab":
              "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
          "arti":
              "Tunjukilah kami jalan yang lurus."
        },
        {
          "arab":
              "صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ",
          "arti":
              "Jalan orang-orang yang telah Engkau beri nikmat."
        },
      ];
    }

    if (surahName == "Al-Ikhlas") {
      return [
        {
          "arab":
              "قُلْ هُوَ اللَّهُ أَحَدٌ",
          "arti":
              "Katakanlah: Dialah Allah Yang Maha Esa."
        },
        {
          "arab":
              "اللَّهُ الصَّمَدُ",
          "arti":
              "Allah tempat meminta segala sesuatu."
        },
        {
          "arab":
              "لَمْ يَلِدْ وَلَمْ يُولَدْ",
          "arti":
              "Dia tidak beranak dan tidak diperanakkan."
        },
        {
          "arab":
              "وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ",
          "arti":
              "Dan tidak ada sesuatu yang setara dengan-Nya."
        },
      ];
    }

    if (surahName == "Al-Kafirun") {
      return [
        {
          "arab":
              "قُلْ يَا أَيُّهَا الْكَافِرُونَ",
          "arti":
              "Katakanlah: Wahai orang-orang kafir."
        },
        {
          "arab":
              "لَا أَعْبُدُ مَا تَعْبُدُونَ",
          "arti":
              "Aku tidak akan menyembah apa yang kamu sembah."
        },
        {
          "arab":
              "وَلَا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ",
          "arti":
              "Dan kamu bukan penyembah apa yang aku sembah."
        },
        {
          "arab":
              "لَكُمْ دِينُكُمْ وَلِيَ دِينِ",
          "arti":
              "Untukmu agamamu dan untukku agamaku."
        },
      ];
    }

    return [
      {
        "arab":
            "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
        "arti":
            "Ini adalah contoh isi dummy premium untuk $surahName."
      },
      {
        "arab":
            "اللَّهُ أَكْبَرُ",
        "arti":
            "Surah ini dapat diisi lengkap nanti."
      },
      {
        "arab":
            "لَا إِلٰهَ إِلَّا اللَّهُ",
        "arti":
            "Saat ini menggunakan data demo interaktif."
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final verses = getVerses();

    return Scaffold(
      backgroundColor:
          const Color(0xffF5EEDF),

      appBar: AppBar(
        backgroundColor:
            const Color(
                0xffF5EEDF),
        elevation: 0,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          surahName,
          style:
              const TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: ListView(
        padding:
            const EdgeInsets.all(
                20),
        children: [

          Container(
            padding:
                const EdgeInsets.symmetric(
              vertical: 18,
            ),
            decoration:
                BoxDecoration(
              border: Border.all(
                color:
                    Colors.black12,
              ),
              borderRadius:
                  BorderRadius.circular(
                      18),
            ),
            child: Center(
              child: Text(
                surahName,
                style:
                    const TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(
              height: 28),

          ...List.generate(
            verses.length,
            (index) {
              final item =
                  verses[index];

              return Container(
                margin:
                    const EdgeInsets.only(
                        bottom:
                            22),

                padding:
                    const EdgeInsets.all(
                        18),

                decoration:
                    BoxDecoration(
                  color:
                      Colors.white,
                  borderRadius:
                      BorderRadius.circular(
                          18),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          const Color(
                              0xffDCFCE7),
                      child: Text(
                        "${index + 1}",
                        style:
                            const TextStyle(
                          color: Color(
                              0xff16A34A),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height:
                            16),

                    Text(
                      item["arab"]!,
                      textAlign:
                          TextAlign
                              .right,
                      style:
                          const TextStyle(
                        fontSize:
                            28,
                        height:
                            1.8,
                      ),
                    ),

                    const SizedBox(
                        height:
                            14),

                    Text(
                      item["arti"]!,
                      style:
                          const TextStyle(
                        fontSize:
                            16,
                        color: Colors
                            .black54,
                        height:
                            1.5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}