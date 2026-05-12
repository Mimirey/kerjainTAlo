import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:projectquranmu_application/controllers/base_audio_controller.dart';

class CustomAudioInput extends StatelessWidget {
  final BaseAudioController controller;
  final Function(String path)? onRecorded;

  const CustomAudioInput({
    super.key,
    required this.controller,
    required this.onRecorded,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isRec = controller.isRecording.value;
      final path = controller.audioPath.value;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.teal),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                if (isRec) {
                  await controller.stop();

                  if (controller.audioPath.value != null) {
                    onRecorded?.call(controller.audioPath.value!);
                  }
                } else {
                  await controller.start();
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(
                  isRec ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: isRec
                  ? AudioWaveforms(
                      size: const Size(double.infinity, 40),
                      recorderController: controller.recorderController,
                      waveStyle: const WaveStyle(
                        waveColor: Colors.teal,
                        extendWaveform: true,
                        showMiddleLine: false,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          final pos =
                              controller.position.value.inSeconds.toDouble();

                          final dur =
                              controller.durationAudio.value.inSeconds
                                  .toDouble();

                          return Slider(
                            min: 0,
                            max: dur > 0 ? dur : 1,
                            value: pos.clamp(0, dur > 0 ? dur : 1),
                            onChanged: controller.audioPath.value == null
                                ? null
                                : (value) {
                                    controller.seekAudio(value);
                                  },
                          );
                        }),

                        Obx(
                          () => Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.formatDuration(
                                  controller.position.value,
                                ),
                              ),
                              Text(
                                controller.formatDuration(
                                  controller.durationAudio.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),

            if (isRec)
              Text(controller.formatTime(controller.duration.value)),

            if (!isRec && path != null) ...[
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: controller.playAudio,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: controller.reset,
              ),
            ],
          ],
        ),
      );
    });
  }
}