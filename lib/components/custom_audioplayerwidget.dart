import 'package:flutter/material.dart';

class CustomAudioPlayerWidget extends StatelessWidget {
  final String voiceNotePath;

  const CustomAudioPlayerWidget({required this.voiceNotePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.mic, color: Colors.grey, size: 20),
          const SizedBox(width: 8),
          const Text(
            'Catatan Audio',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const Spacer(),
          const Text(
            '0:45',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              // TODO: play audio dari voiceNotePath
            },
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFF2E7D32),
              child: Icon(Icons.play_arrow, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}