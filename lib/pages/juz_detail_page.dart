import 'package:flutter/material.dart';

class JuzDetailPage extends StatelessWidget {
  final String juzNumber;
  final String title;
  final String desc;

  const JuzDetailPage({
    super.key,
    required this.juzNumber,
    required this.title,
    required this.desc,
  });

  List<Map<String, String>> getDummyVerses() {
    return List.generate(
      15,
      (index) => {
        "arab":
            "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",
        "latin":
            "Bismillahirrahmanirrahim",
        "arti":
            "Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang.",
        "no": "${index + 1}",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final verses = getDummyVerses();

    return Scaffold(
      backgroundColor:
          const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w700,
          ),
        ),
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Column(
        children: [

          /// HEADER
          Container(
            margin:
                const EdgeInsets.all(16),
            width: double.infinity,
            padding:
                const EdgeInsets.all(22),

            decoration: BoxDecoration(
              gradient:
                  const LinearGradient(
                colors: [
                  Color(0xff16A34A),
                  Color(0xff22C55E),
                ],
              ),
              borderRadius:
                  BorderRadius.circular(
                      24),
            ),

            child: Column(
              children: [

                Text(
                  "Juz $juzNumber",
                  style:
                      const TextStyle(
                    color:
                        Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight
                            .bold,
                  ),
                ),

                const SizedBox(
                    height: 8),

                Text(
                  desc,
                  style:
                      const TextStyle(
                    color:
                        Colors.white70,
                  ),
                ),

                const SizedBox(
                    height: 14),

                Container(
                  width: 80,
                  height: 1,
                  color: Colors.white30,
                ),

                const SizedBox(
                    height: 14),

                const Text(
                  "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",
                  style:
                      TextStyle(
                    color:
                        Colors.white,
                    fontSize: 24,
                  ),
                  textAlign:
                      TextAlign.center,
                ),
              ],
            ),
          ),

          /// AYAT
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets
                      .symmetric(
                horizontal: 16,
              ),
              itemCount:
                  verses.length,
              itemBuilder:
                  (context, index) {
                final item =
                    verses[index];

                return Container(
                  margin:
                      const EdgeInsets
                          .only(
                    bottom: 14,
                  ),
                  padding:
                      const EdgeInsets
                          .all(18),

                  decoration:
                      BoxDecoration(
                    color:
                        Colors.white,
                    borderRadius:
                        BorderRadius
                            .circular(
                                22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors
                            .black
                            .withOpacity(
                                0.04),
                        blurRadius:
                            10,
                        offset:
                            const Offset(
                                0,
                                6),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [

                      Row(
                        children: [

                          Container(
                            width: 34,
                            height: 34,
                            decoration:
                                const BoxDecoration(
                              color: Color(
                                  0xffDCFCE7),
                              shape: BoxShape
                                  .circle,
                            ),
                            child: Center(
                              child: Text(
                                item["no"]!,
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
                          ),

                          const Spacer(),

                          const Icon(
                            Icons
                                .favorite_border,
                            color: Colors
                                .grey,
                          ),

                          const SizedBox(
                              width:
                                  14),

                          const Icon(
                            Icons.play_arrow,
                            color: Color(
                                0xff16A34A),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 18),

                      Text(
                        item["arab"]!,
                        textAlign:
                            TextAlign
                                .right,
                        style:
                            const TextStyle(
                          fontSize: 28,
                          height: 1.8,
                          fontWeight:
                              FontWeight
                                  .w500,
                        ),
                      ),

                      const SizedBox(
                          height: 14),

                      Text(
                        item["latin"]!,
                        style:
                            const TextStyle(
                          fontStyle:
                              FontStyle
                                  .italic,
                          color: Colors
                              .grey,
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      Text(
                        item["arti"]!,
                        style:
                            const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}