import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/controllers/base_audio_controller.dart';
import 'package:projectquranmu_application/models/bukuprestasi_model.dart';
import 'package:projectquranmu_application/services/inputharian_service.dart';
import 'package:projectquranmu_application/utils/dialog_helper.dart';
import 'package:record/record.dart';

class InputHarianController extends BaseAudioController {
  String mapStatus(String value) {
    switch (value) {
      case "Lancar":
        return "LANCAR";

      case "Cukup Lancar":
        return "CUKUP_LANCAR";

      case "Kurang Lancar":
        return "KURANG_LANCAR";

      default:
        return "LANCAR";
    }
  }

  late BukuPrestasi student;
  final InputharianService inputHarianService = InputharianService();

  final halamanController = TextEditingController();
  final catatanController = TextEditingController();
  // state
  var status = ''.obs;
  var tajwid = 0.obs;
  var makhraj = 0.obs;
  var selectedDate = Rxn<DateTime>();
  bool _isBusy = false;

  final player = AudioPlayer();
  bool get hasAudio => audioPath.value != null;
  Timer? _timer;

  var isPlaying = false.obs;

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

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  // setter
  void setStatus(String value) {
    status.value = value;
  }

  void setTajwid(int value) {
    tajwid.value = value;
  }

  void setMakhraj(int value) {
    makhraj.value = value;
  }

  // reset (optional)
  void resetForm() {
    status.value = '';
    tajwid.value = 0;
    makhraj.value = 0;
  }

  // validasi (biar ga kosong pas submit)
  bool isValid() {
    return status.value.isNotEmpty && tajwid.value > 0 && makhraj.value > 0;
  }

  Future<void> start() async {
    if (isRecording.value || _isBusy) return;

    _isBusy = true;

    try {
      if (await recorderController.checkPermission()) {
        final dir = await getApplicationDocumentsDirectory();

        final path =
            '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await recorderController.record(path: path);

        isRecording.value = true;

        duration.value = Duration.zero;

        _timer?.cancel();

        _timer = Timer.periodic(const Duration(seconds: 1), (t) {
          duration.value += const Duration(seconds: 1);
        });
      }
    } finally {
      _isBusy = false;
    }
  }

  Future<void> stop() async {
    if (!isRecording.value || _isBusy) return;

    _isBusy = true;

    try {
      final path = await recorderController.stop();

      _timer?.cancel();

      isRecording.value = false;

      if (path != null) {
        audioPath.value = path;
      }

      // penting buat native release
      await Future.delayed(const Duration(milliseconds: 300));
    } finally {
      _isBusy = false;
    }
  }

  Future<void> playAudio() async {
    if (audioPath.value == null) return;

    try {
      await player.stop();

      await player.setFilePath(audioPath.value!);

      await player.play();
    } catch (e) {
      debugPrint(e.toString());
    }
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

  Future<void> submit() async {
    if (!isValid()) {
      Get.snackbar("Error", "Semua field wajib diisi");
      return;
    }

    if (halamanController.text.isEmpty) {
      Get.snackbar("Error", "Halaman belum diisi");
      return;
    }

    if (isRecording.value) {
      Get.snackbar("Warning", "Hentikan rekaman terlebih dahulu");
      return;
    }

    try {
      await inputHarianService.createNilai(
        muridId: student.id,
        jilid: student.jilidSekarang,
        halaman: int.parse(halamanController.text),

        nilaiBacaan: mapStatus(status.value),

        tajwid: tajwid.value,

        makhraj: makhraj.value,

        catatan: catatanController.text,

        audioPath: audioPath.value,
      );

      await DialogHelper.showSuccess(
        title: "Berhasil menambahkan!",
        subtitle: "Perkembangan Harian\n${student.murid}",
        route: AppRoutes.attachmentPage,
      );
    } catch (e) {
      print(e);

      Get.snackbar("Error", "Gagal mengirim nilai");
    }
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

    student = Get.arguments as BukuPrestasi;
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
  void onClose() async {
    _timer?.cancel();

    try {
      if (isRecording.value) {
        await recorderController.stop();
      }
    } catch (e) {
      debugPrint("Error stopping recorder: $e");
    }

    recorderController.dispose();

    await player.dispose();

    super.onClose();
  }
}
