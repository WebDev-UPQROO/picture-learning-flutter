import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/utils/music.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  LocalService localService;

  MusicCubit(this.localService)
      : super(MusicState(
          backgroundMusic: AudioPlayer(),
          effects: AudioPlayer(),
        ));

  void playMusic(String url, [bool active = false]) async {
    AudioPlayer music = state.backgroundMusic;
    await music.stop();

    final isActive = await localService.getBackgroundMusic();
    if (active || isActive) {
      final soundbytes = await assetToMusic(url);
      await music.setReleaseMode(ReleaseMode.LOOP);
      await music.playBytes(soundbytes);
    }
  }

  void stopMusic() async {
    AudioPlayer music = state.backgroundMusic;
    await music.stop();
  }

  void playeffect(String url) async {
    AudioPlayer effects = state.effects;
    effects.stop();

    final isActive = await localService.getSoundEffects();
    if (isActive) {
      final soundbytes = await assetToMusic(url);
      effects.playBytes(soundbytes);
    }
  }
}
