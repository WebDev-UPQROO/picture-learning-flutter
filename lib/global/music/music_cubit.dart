import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/utils/music.dart';
part 'music_state.dart';

// Control music and sound effects globally
class MusicCubit extends Cubit<MusicState> {
  LocalService localService;

  MusicCubit(this.localService)
      : super(MusicState(
          backgroundMusic: AudioPlayer(),
          effects: AudioPlayer(),
        ));

  // Activate the background music if the user has allowed it in settings
  void playMusic(String url, [bool active = false]) async {
    // Get controller and pause any active background music
    AudioPlayer music = state.backgroundMusic;
    await music.stop();

    // Obtain user preferences
    final isActive = await localService.getBackgroundMusic();

    if (active || isActive) {
      // If the user allows it, it gets the music from the assets and leaves it in "loop"
      final soundbytes = await assetToMusic(url);
      await music.setReleaseMode(ReleaseMode.LOOP);
      await music.playBytes(soundbytes);
    }
  }

  void stopMusic() async {
    // Get controller and pause any active background music
    AudioPlayer music = state.backgroundMusic;
    await music.stop();
  }

  void playeffect(String url) async {
    // Get controller and pause any active background music
    AudioPlayer effects = state.effects;
    effects.stop();

    final isActive = await localService.getSoundEffects();
    if (isActive) {
      // If the user allows it, play the effect
      final soundbytes = await assetToMusic(url);
      effects.playBytes(soundbytes);
    }
  }
}
