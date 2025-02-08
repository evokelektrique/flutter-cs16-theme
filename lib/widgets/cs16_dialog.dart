import 'package:flutter/material.dart';
import 'package:flutter_cs16_theme/flutter_cs16_theme.dart';

class CS16Dialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CS16Dialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF4A5942), // Dialog background color
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFF8C9284), // Border color
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dialog Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'ArialPixel',
                color: Color(0xFFDEDFD6),
              ),
            ),
            const SizedBox(height: 16),
            // Dialog Content
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'ArialPixel',
                color: Color(0xFFDEDFD6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cancel Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CS16Button(
                      text: cancelText,
                      onPressed: onCancel,
                    ),
                  ),
                ),
                // Confirm Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: CS16Button(
                      text: confirmText,
                      onPressed: onConfirm,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
