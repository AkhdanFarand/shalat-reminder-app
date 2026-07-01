import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/verse_model.dart';
import 'package:flutter_application_1/services/quran_service.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<SurahDetailPage> createState() =>
      _SurahDetailPageState();
}

class _SurahDetailPageState
    extends State<SurahDetailPage> {

  late Future<List<VerseModel>> futureVerses;

  @override
  void initState() {
    super.initState();

    futureVerses = QuranService.getVerses(
      widget.surahNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5EEDF),

      appBar: AppBar(
        backgroundColor: const Color(0xffF5EEDF),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          widget.surahName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: FutureBuilder<List<VerseModel>>(
        future: futureVerses,
        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final verses = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius:
                      BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    widget.surahName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              ...List.generate(
                verses.length,
                (index) {

                  final item = verses[index];

                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 22,
                    ),

                    padding: const EdgeInsets.all(
                      18,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                              const Color(
                                  0xffDCFCE7),
                          child: Text(
                            item.number.toString(),
                            style:
                                const TextStyle(
                              color: Color(
                                  0xff16A34A),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        Text(
                          item.arab,
                          textAlign:
                              TextAlign.right,
                          style:
                              const TextStyle(
                            fontSize: 28,
                            height: 1.8,
                          ),
                        ),

                        const SizedBox(
                          height: 14,
                        ),

                        Text(
                          item.translation,
                          style:
                              const TextStyle(
                            fontSize: 16,
                            color:
                                Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}