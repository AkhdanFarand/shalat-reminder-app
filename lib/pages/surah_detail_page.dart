import 'package:flutter/material.dart';

class SurahDetailPage extends StatelessWidget {
  final String surahName;

  const SurahDetailPage({
    super.key,
    required this.surahName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor:
            Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          surahName,
          style:
              const TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding:
                EdgeInsets.only(
                    right: 14),
            child: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),

      body: ListView(
        padding:
            const EdgeInsets.all(
                16),
        children: [

          /// Header Card
          Container(
            padding:
                const EdgeInsets.all(
                    20),
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
            child: Column(
              children: [

                Text(
                  surahName,
                  style:
                      const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight
                            .bold,
                  ),
                ),

                const SizedBox(
                    height: 8),

                const Text(
                  "Makkiyah • 7 Ayat",
                  style:
                      TextStyle(
                    color:
                        Colors.white70,
                  ),
                ),

                const SizedBox(
                    height: 14),

                const Divider(
                  color:
                      Colors.white30,
                ),

                const SizedBox(
                    height: 10),

                const Text(
                  "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                  textAlign:
                      TextAlign.center,
                  style:
                      TextStyle(
                    color:
                        Colors.white,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
              height: 20),

          ayatItem(
            no: "1",
            arab:
                "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
            arti:
                "Segala puji bagi Allah, Tuhan seluruh alam.",
          ),

          ayatItem(
            no: "2",
            arab:
                "الرَّحْمَٰنِ الرَّحِيمِ",
            arti:
                "Yang Maha Pengasih, Maha Penyayang.",
          ),

          ayatItem(
            no: "3",
            arab:
                "مَالِكِ يَوْمِ الدِّينِ",
            arti:
                "Pemilik hari pembalasan.",
          ),

          ayatItem(
            no: "4",
            arab:
                "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
            arti:
                "Hanya kepada Engkaulah kami menyembah dan meminta pertolongan.",
          ),

          ayatItem(
            no: "5",
            arab:
                "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
            arti:
                "Tunjukilah kami jalan yang lurus.",
          ),
        ],
      ),
    );
  }

  Widget ayatItem({
    required String no,
    required String arab,
    required String arti,
  }) {
    return Container(
      margin:
          const EdgeInsets.only(
              bottom: 16),
      padding:
          const EdgeInsets.all(
              16),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(
                18),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment
                .start,
        children: [

          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [

              CircleAvatar(
                radius: 16,
                backgroundColor:
                    const Color(
                        0xffE8F5EC),
                child: Text(
                  no,
                  style:
                      const TextStyle(
                    color: Color(
                        0xff16A34A),
                    fontWeight:
                        FontWeight
                            .bold,
                  ),
                ),
              ),

              Row(
                children: const [

                  Icon(
                    Icons
                        .play_circle_outline,
                    color: Color(
                        0xff16A34A),
                  ),

                  SizedBox(
                      width: 12),

                  Icon(
                    Icons
                        .favorite_border,
                    color:
                        Colors.grey,
                  ),
                ],
              )
            ],
          ),

          const SizedBox(
              height: 16),

          Align(
            alignment:
                Alignment
                    .centerRight,
            child: Text(
              arab,
              textAlign:
                  TextAlign.right,
              style:
                  const TextStyle(
                fontSize: 28,
                height: 1.8,
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(
              height: 14),

          Text(
            arti,
            style:
                const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}