import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> play(String url) async {
    await player.setUrl(url);
    await player.play();
  }

  static Future<void> pause() async {
    await player.pause();
  }

  static Future<void> stop() async {
    await player.stop();
  }

  static Future<void> dispose() async {
    await player.dispose();
  }

  static bool get isPlaying =>
      player.playing;
}