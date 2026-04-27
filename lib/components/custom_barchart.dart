import 'package:flutter/material.dart';
import 'package:projectquranmu_application/models/chartdata_model.dart';

class CustomBarchart extends StatelessWidget {
  const CustomBarchart({
    super.key, 
    required this.data, 
    this.barColor = const Color(0xff5F9F9F),
    this.maxHeight = 120
  });

  final List<ChartData> data;
  final Color barColor;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final maxValue = data.isEmpty
        ? 1
        : data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: Column(
        children: [
          const Text(
            "Data Siswa",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 124, 124, 124)
            ),
          ),
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: data.map((item) {
              final barHeight =
                  maxValue == 0
                      ? 0
                      : ((item.value / maxValue) * maxHeight).clamp(8, maxHeight);

              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // BAR
                    Container(
                      height: barHeight.toDouble(),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: barColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    const SizedBox(height: 6),

                    // VALUE
                    Text(item.value.toString(), style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff58A0A0)
                    ),),

                    // LABEL
                    Text(
                      item.label,
                      style: const TextStyle(
                        fontSize: 12,),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}