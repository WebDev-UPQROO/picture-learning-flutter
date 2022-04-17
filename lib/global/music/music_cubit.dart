import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/services/index.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  LocalService localService;

  MusicCubit(this.localService)
      : super(MusicState(
          backgroundMusic: AudioPlayer(),
          effects: AudioPlayer(),
        ));

  void playMusic(String url) async {
    final isActive = await localService.getBackgroundMusic();
    if (isActive) {
      AudioPlayer music = state.backgroundMusic;

      await music.setReleaseMode(ReleaseMode.LOOP);
      await music.stop();
      await music.setUrl(url);
      await music.resume();
    }
  }

  void stopMusic() async {
    AudioPlayer music = state.backgroundMusic;
    await music.stop();
  }

  void playeffect(String url) async {
    final isActive = await localService.getSoundEffects();
    if (isActive) {
      AudioPlayer effects = state.effects;
      effects.stop();
      effects.setUrl(url);
      effects.resume();
    }
  }
}
