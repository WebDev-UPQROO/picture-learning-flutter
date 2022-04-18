import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:picture_learning/models/services/index.dart';

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
      ByteData bytes = await rootBundle.load(url);
      Uint8List soundbytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      );
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
      ByteData bytes = await rootBundle.load(url);
      Uint8List soundbytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      );
      effects.playBytes(soundbytes);
    }
  }
}
