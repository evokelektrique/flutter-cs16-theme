import 'package:flutter/material.dart';

class CS16ProgressBar extends StatelessWidget {
  final double progress; // Progress percentage (0.0 to 1.0)
  final double width; // Total width of the progress bar
  final double height; // Total height of the progress bar
  final int segments; // Number of segments (bars)

  const CS16ProgressBar({
    super.key,
    required this.progress,
    this.width = 260.0,
    this.height = 24.0,
    this.segments = 20, // Default number of segments
  });

  @override
  Widget build(BuildContext context) {
    final double segmentWidth = (width - (segments - 1)) / segments;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(3), // Padding around the progress bar
      decoration: const BoxDecoration(
        color: Color(0xFF3E4637), // Secondary background color
        border: Border(
          top: BorderSide(color: Color(0xFF292C21)),
          left: BorderSide(color: Color(0xFF292C21)),
          right: BorderSide(color: Color(0xFF8C9284)),
          bottom: BorderSide(color: Color(0xFF8C9284)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(segments, (index) {
          final bool isActive = index < (progress * segments).floor();

          return Container(
            width: segmentWidth,
            height: double.infinity,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFFC4B550) // Active segment color
                  : Colors.transparent, // Inactive segment color
              gradient: isActive
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFC4B550), // Accent color
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.8, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
