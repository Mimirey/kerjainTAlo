import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

abstract class BaseAudioController extends GetxController {
  RxBool get isRecording;
  RxnString get audioPath;
  Rx<Duration> get duration;
  Rx<Duration> get position;
  Rx<Duration> get durationAudio;

  RecorderController get recorderController;

  Future<void> start();
  Future<void> stop();
  Future<void> playAudio();
  Future<void> reset();
  Future<void> seekAudio(double value);

  String formatTime(Duration duration);
  String formatDuration(Duration duration);
}