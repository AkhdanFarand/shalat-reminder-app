import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/verse_model.dart';
import 'package:flutter_application_1/services/quran_service.dart';
import 'package:just_audio/just_audio.dart';

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

  final AudioPlayer player = AudioPlayer();

  bool isPlaying = false;

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  bool hasStarted = false;

  String getAudioUrl(int surah) {
    String no = surah.toString().padLeft(3, '0');

    return "https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/$no.mp3";
  }

  Future<void> playSurah() async {
    if (!hasStarted) {
      await player.setUrl(
        getAudioUrl(widget.surahNumber),
      );

      hasStarted = true;
    }

    await player.play();
  }

  Future<void> pauseSurah() async {
    await player.pause();
  }

  Future<void> stopSurah() async {
    await player.stop();

    hasStarted = false;

    setState(() {
      position = Duration.zero;
    });
  }

  @override
  void initState() {
    super.initState();

    player.playerStateStream.listen((state) {
      if (!mounted) return;

      setState(() {
        isPlaying = state.playing;

        if (state.processingState == ProcessingState.completed) {
          hasStarted = false;
          position = Duration.zero;
        }
      });
    });

    player.positionStream.listen((p) {
      if (!mounted) return;

      setState(() {
        position = p;
      });
    });

    player.durationStream.listen((d) {
      if (!mounted) return;

      setState(() {
        duration = d ?? Duration.zero;
      });
    });

    futureVerses = QuranService.getVerses(
      widget.surahNumber,
    );
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  String format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');

    return "${two(d.inMinutes)}:${two(d.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5EEDF),

      appBar: AppBar(
        backgroundColor: const Color(0xffF5EEDF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      Text(
                        widget.surahName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Slider(
                        value: position.inSeconds.toDouble(),
                        max: duration.inSeconds == 0
                            ? 1
                            : duration.inSeconds.toDouble(),
                        onChanged: hasStarted
                          ? (value) async {
                              await player.seek(
                                Duration(seconds: value.toInt()),
                              );
                            }
                          : null,
                      ),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(format(position)),
                          Text(format(duration)),
                        ],
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton.icon(
                        onPressed: () async {
                          if (!hasStarted) {
                            await playSurah();
                          } else if (isPlaying) {
                            pauseSurah();
                          } else {
                            playSurah();
                          }
                        },

                        icon: Icon(
                          !hasStarted
                              ? Icons.play_arrow
                              : isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                        ),

                        label: Text(
                          !hasStarted
                              ? "Play Full Surah"
                              : isPlaying
                                  ? "Pause"
                                  : "Resume",
                        ),
                      ),
                    ],
                  ),
                ),
              ),   // <-- JANGAN LUPA koma ini
              
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