import 'package:flutter/material.dart';

/// A Counter-Strike 1.6 themed segmented progress bar.
///
/// This progress bar mimics the segmented health and ammo bars seen in CS16.
/// It features a dark background with amber-colored active segments.
///
/// Example usage:
/// ```dart
/// CS16ProgressBar(
///   progress: 0.75, // 75% progress
/// );
/// ```
class CS16ProgressBar extends StatelessWidget {
  /// The progress level, represented as a value between 0.0 and 1.0.
  final double progress;

  /// The total width of the progress bar.
  final double width;

  /// The total height of the progress bar.
  final double height;

  /// The number of segments in the progress bar.
  final int segments;

  /// Creates a CS16-styled progress bar.
  const CS16ProgressBar({
    super.key,
    required this.progress,
    this.width = 260.0, // Default width
    this.height = 24.0, // Default height
    this.segments = 20, // Default number of segments
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the width of each segment
    final double segmentWidth = (width - (segments - 1)) / segments;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(3), // Padding around the progress bar
      decoration: const BoxDecoration(
        color: Color(0xFF3E4637), // Background color
        border: Border(
          // Dark borders for a pixelated look
          top: BorderSide(color: Color(0xFF292C21)),
          left: BorderSide(color: Color(0xFF292C21)),
          right: BorderSide(color: Color(0xFF8C9284)),
          bottom: BorderSide(color: Color(0xFF8C9284)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(segments, (index) {
          // Determine if the current segment is active (filled)
          final bool isActive = index < (progress * segments).floor();

          return Container(
            width: segmentWidth,
            height: double.infinity,
            decoration: BoxDecoration(
              // Active segments use the CS16 accent color
              color: isActive
                  ? const Color(0xFFC4B550) // Amber accent color
                  : Colors.transparent, // Inactive segments are transparent
              gradient: isActive
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFC4B550), // Main accent color
                        Colors.transparent, // Fading effect on the right
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.8, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null, // No gradient for inactive segments
            ),
          );
        }),
      ),
    );
  }
}
