import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectquranmu_application/controllers/base_audio_controller.dart';

class InputjilidController extends BaseAudioController {
  // state
  var selectedJilid = "Yanbua 3".obs;
  var status = 0.obs;
  var tajwid = 0.obs;
  var makhraj = 0.obs;
  var selectedDate = Rxn<DateTime>();

  @override
  final isRecording = false.obs;

  @override
  final audioPath = RxnString();

  @override
  final duration = Duration.zero.obs;

  @override
  final position = Duration.zero.obs;

  @override
  final durationAudio = Duration.zero.obs;

  @override
  final recorderController = RecorderController();
  final player = AudioPlayer();
  bool get hasAudio => audioPath.value != null;
  Timer? _timer;

  var isPlaying = false.obs;

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void setTajwid(int value) {
    tajwid.value = value;
  }

  void setMakhraj(int value) {
    makhraj.value = value;
  }
  void setStatus(int value) {
    status.value = value;
  }

  // reset (optional)
  void resetForm() {
    tajwid.value = 0;
    makhraj.value = 0;
  }

  // // validasi (biar ga kosong pas submit)
  bool isValid() {
    return tajwid.value > 0 && makhraj.value > 0;
  }

  Future<void> start() async {
    if (isRecording.value) return;

    if (await recorderController.checkPermission()) {
      final dir = await getApplicationDocumentsDirectory();
      final path =
          '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await recorderController.record(path: path);

      isRecording.value = true;
      duration.value = Duration.zero;

      _timer = Timer.periodic(Duration(seconds: 1), (t) {
        duration.value += const Duration(seconds: 1);
      });
    }
  }

  Future<void> stop() async {
    if (!isRecording.value) return;

    final path = await recorderController.stop();
    isRecording.value = false;
    _timer?.cancel();

    if (path != null) {
      audioPath.value = path;
    }
  }

  Future<void> playAudio() async {
    if (audioPath.value == null) return;

    await player.setFilePath(audioPath.value!);
    player.play();
  }

  Future<void> reset() async {
    audioPath.value = null;
    duration.value = Duration.zero;

    // reset player
    await player.stop();
    await player.seek(Duration.zero);

    // reset state UI
    position.value = Duration.zero;
    durationAudio.value = Duration.zero;

    // optional: unload audio
    await player.stop();
  }

  @override
  String formatTime(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  void setAudio(String path) {
    audioPath.value = path;
  }

  void clearAudio() {
    audioPath.value = null;
  }

  // submit (dummy dulu)
  void submit() {
    if (!isValid()) {
      Get.snackbar("Error", "Semua field harus diisi");
      return;
    }
    if (isRecording.value) {
      Get.snackbar("Warning", "Hentikan rekaman dulu");
      return;
    }

    final data = {
      "tajwid": tajwid.value,
      "makhraj": makhraj.value,
      "audioPath": audioPath.value,
    };

    print("DATA DIKIRIM: $data");

    // nanti ganti ini ke API
    // await ApiService.submitHarian(data);
  }

  @override
  void onInit() {
    super.onInit();

    player.positionStream.listen((pos) {
      position.value = pos;
    });

    player.durationStream.listen((dur) {
      if (dur != null) durationAudio.value = dur;
    });

    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  Future<void> togglePlay() async {
    if (audioPath.value == null) return;

    if (isPlaying.value) {
      await player.pause();
    } else {
      if (player.processingState == ProcessingState.idle) {
        await player.setFilePath(audioPath.value!);
      }
      await player.play();
    }
  }

  Future<void> seekAudio(double value) async {
    final newPosition = Duration(seconds: value.toInt());
    await player.seek(newPosition);
  }

  String formatDuration(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  void onClose() {
    _timer?.cancel();
    recorderController.dispose();
    player.dispose();
    super.onClose();
  }
}
