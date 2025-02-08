import 'package:flutter/material.dart';

/// A Counter-Strike 1.6 styled divider for separating UI sections.
///
/// This divider mimics the classic CS16 menu dividers using a **dual-tone border**
/// with a **dark top border and a light bottom border**.
///
/// Example usage:
/// ```dart
/// Column(
///   children: [
///     Text("Game Settings"),
///     CS16Divider(),
///     Text("Audio Options"),
///   ],
/// )
/// ```
class CS16Divider extends StatelessWidget {
  /// Creates a CS16-styled divider with classic pixelated border contrast.
  const CS16Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Stretches across the full width
      height: 2, // Standard divider thickness
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF292C21), // Dark top border
            width: 1,
          ),
          bottom: BorderSide(
            color: Color(0xFF8C9284), // Lighter bottom border
            width: 1,
          ),
        ),
      ),
    );
  }
}
