import 'package:audioplayers/audioplayers.dart';
import 'package:material_ui/material_ui.dart';

class RadioManagerProvider extends ChangeNotifier {
  final player = AudioPlayer();
  String? currentPlayingUrl;
  bool isPlaying = false;
  double currentVolume = 1.0;
  bool isVolumeUp = true;

  RadioManagerProvider() {
    player.onPlayerComplete.listen((event) {
      isPlaying = false;
      currentPlayingUrl = null;
      currentVolume = 1.0;
      isVolumeUp = true;
      notifyListeners();
    });
  }

  /// play
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      currentVolume = 1.0;
      isVolumeUp = true;
      await player.setVolume(currentVolume);
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
      notifyListeners();
    }
  }

  /// stop
  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    currentVolume = 1.0;
    isVolumeUp = true;
    await player.setVolume(currentVolume);
    notifyListeners();
  }

  /// mute / unmute
  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    isVolumeUp = volume > 0;
    await player.setVolume(volume);
    notifyListeners();
  }

  Future<void> toggleVolume() async {
    if (isVolumeUp) {
      await setVolume(0.0);
    } else {
      await setVolume(1.0);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
