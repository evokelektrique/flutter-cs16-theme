import 'package:flutter/material.dart';

class CS16Divider extends StatelessWidget {
  const CS16Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      height: 2, // Height of the divider
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Color(0xFF292C21), width: 1), // Top border (dark)
          bottom: BorderSide(
              color: Color(0xFF8C9284), width: 1), // Bottom border (light)
        ),
      ),
    );
  }
}
