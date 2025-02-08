import 'package:flutter/material.dart';

/// A customizable button widget inspired by Counter-Strike 1.6.
///
/// The [CS16Button] allows configuration for text, font size, padding, colors,
/// and border thickness while preserving the retro-inspired style.
///
/// ## Example:
/// ```dart
/// CS16Button(
///   text: "Start Game",
///   fontSize: 14,
///   onPressed: () {
///     print("Game started!");
///   },
/// );
/// ```
class CS16Button extends StatefulWidget {
  final String fontFamily;

  final String text;

  /// The font size of the button text.
  final double fontSize;

  /// The color of the button background.
  final Color backgroundColor;

  /// The color of the button background when pressed.
  final Color pressedBackgroundColor;

  /// The color of the button text.
  final Color textColor;

  /// The color of the button text when pressed.
  final Color pressedTextColor;

  /// The border color of the button.
  final Color borderColor;

  /// The border width of the button.
  final double borderWidth;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// The callback function triggered when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a CS16-themed button.
  const CS16Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 12.0,
    this.backgroundColor = const Color(0xFF4A5942), // Default green background
    this.pressedBackgroundColor =
        const Color(0xFF4A5942), // Darker green when pressed
    this.textColor = const Color(0xFFDEDFD6), // Default text color
    this.pressedTextColor =
        const Color(0xFF958831), // Yellowish text when pressed
    this.borderColor = const Color(0xFF8C9284), // Default border color
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
    this.fontFamily = "ArialPixel",
  });

  @override
  _CS16ButtonState createState() => _CS16ButtonState();
}

class _CS16ButtonState extends State<CS16Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.pressedBackgroundColor
              : widget.backgroundColor,
          border: Border(
            top: BorderSide(
                color: _isPressed
                    ? const Color(0xFF292C21) // Reverse border color
                    : const Color(0xFF8C9284),
                width: widget.borderWidth),
            left: BorderSide(
                color: _isPressed
                    ? const Color(0xFF292C21)
                    : const Color(0xFF8C9284),
                width: widget.borderWidth),
            right: BorderSide(
                color: _isPressed
                    ? const Color(0xFF8C9284) // Reverse opposite side
                    : const Color(0xFF292C21),
                width: widget.borderWidth),
            bottom: BorderSide(
                color: _isPressed
                    ? const Color(0xFF8C9284)
                    : const Color(0xFF292C21),
                width: widget.borderWidth),
          ),
        ),
        padding: widget.padding,
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily, // Retro font family
              color: _isPressed
                  ? widget.pressedTextColor
                  : widget.textColor, // Change text color when pressed
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
