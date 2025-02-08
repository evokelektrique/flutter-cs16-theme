import 'package:flutter/material.dart';

/// A Counter-Strike 1.6 inspired button with a pixelated retro look.
///
/// The button supports:
/// - Dynamic color changes when pressed.
/// - Customizable fonts, sizes, and borders.
/// - A low-resolution aesthetic matching CS16's UI design.
///
/// Example usage:
/// ```dart
/// CS16Button(
///   text: "Start Game",
///   onPressed: () {
///     print("Game started!");
///   },
/// );
/// ```
class CS16Button extends StatefulWidget {
  /// The text displayed inside the button.
  final String text;

  /// Font size of the button text.
  final double fontSize;

  /// Font family used for the text.
  final String fontFamily;

  /// Background color when the button is not pressed.
  final Color backgroundColor;

  /// Background color when the button is pressed.
  final Color pressedBackgroundColor;

  /// Text color when the button is not pressed.
  final Color textColor;

  /// Text color when the button is pressed.
  final Color pressedTextColor;

  /// Border color of the button.
  final Color borderColor;

  /// Border width of the button.
  final double borderWidth;

  /// Padding inside the button.
  final EdgeInsets padding;

  /// Function to execute when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a CS16-themed button with customizable properties.
  const CS16Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 12.0,
    this.fontFamily = "ArialPixel", // Retro font style
    this.backgroundColor = const Color(0xFF4A5942), // Green default background
    this.pressedBackgroundColor =
        const Color(0xFF4A5942), // Darker green when pressed
    this.textColor = const Color(0xFFDEDFD6), // Light grey text
    this.pressedTextColor =
        const Color(0xFF958831), // Yellowish text when pressed
    this.borderColor = const Color(0xFF8C9284), // Default border color
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
  });

  @override
  _CS16ButtonState createState() => _CS16ButtonState();
}

class _CS16ButtonState extends State<CS16Button> {
  /// Tracks whether the button is currently pressed.
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detect when the button is pressed down
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      // Detect when the button is released
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      // Handle if the tap is canceled (finger slides away)
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.pressedBackgroundColor
              : widget.backgroundColor, // Change color when pressed
          border: Border(
            // Top and left borders reverse when pressed for 3D effect
            top: BorderSide(
              color: _isPressed ? const Color(0xFF292C21) : widget.borderColor,
              width: widget.borderWidth,
            ),
            left: BorderSide(
              color: _isPressed ? const Color(0xFF292C21) : widget.borderColor,
              width: widget.borderWidth,
            ),
            // Right and bottom borders reverse when pressed
            right: BorderSide(
              color: _isPressed ? widget.borderColor : const Color(0xFF292C21),
              width: widget.borderWidth,
            ),
            bottom: BorderSide(
              color: _isPressed ? widget.borderColor : const Color(0xFF292C21),
              width: widget.borderWidth,
            ),
          ),
        ),
        padding: widget.padding,
        child: Center(
          child: Text(
            widget.text.toUpperCase(), // Convert to uppercase for classic look
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily, // Apply retro font
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
