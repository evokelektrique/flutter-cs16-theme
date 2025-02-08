import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cs16_theme/flutter_cs16_theme.dart';

void main() {
  runApp(const CS16DemoApp());
}

class CS16DemoApp extends StatelessWidget {
  const CS16DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      theme: CS16Theme.darkTheme, // Apply the CS16 dark theme
      home: const CS16DemoScreen(),
    );
  }
}

class CS16DemoScreen extends StatefulWidget {
  const CS16DemoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CS16DemoScreenState createState() => _CS16DemoScreenState();
}

class _CS16DemoScreenState extends State<CS16DemoScreen> {
  double _progress = 0.0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _startInfiniteProgress(); // Starts infinite progress loop on launch
  }

  /// Simulates an **infinite loading bar** that resets every 5 seconds
  void _startInfiniteProgress() {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _progress += 0.05;
        if (_progress >= 1.0) {
          _progress = 0.0; // Reset progress when full
        }
      });
    });
  }

  /// Simulates a **manual loading progress with a button press**
  void _startLoading() {
    setState(() {
      _loading = true;
      _progress = 0.0;
    });

    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _progress += 0.1;
        if (_progress >= 1.0) {
          _loading = false;
          timer.cancel();
        }
      });
    });
  }

  /// Shows a **CS16-styled dialog**
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CS16Dialog(
        title: "Connection Lost",
        content: "Failed to connect to the server.",
        confirmText: "Retry",
        cancelText: "Cancel",
        onConfirm: () {
          Navigator.pop(context);
          _startLoading(); // Retry action starts loading
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CS16 Theme Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section: Buttons
            Text("CS16 Buttons", style: Theme.of(context).textTheme.titleLarge),
            
            const SizedBox(height: 20),
            const CS16Divider(),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CS16Button(
                  text: "Start",
                  onPressed: _startLoading,
                ),
                const SizedBox(width: 10),
                CS16Button(
                  text: "Show Dialog",
                  onPressed: () => _showDialog(context),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Section: Progress Bar (Manual & Infinite)
            Text("CS16 Progress Bar",
                style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 20),
            const CS16Divider(),
            const SizedBox(height: 20),

            // Infinite progress bar (auto-reset)
            CS16ProgressBar(progress: _progress),

            const SizedBox(height: 20),

            // Section: CS16 Tabs
            Text("CS16 Tabs", style: Theme.of(context).textTheme.titleLarge),
            
            const SizedBox(height: 20),
            const CS16Divider(),
            const SizedBox(height: 20),


            Expanded(
              child: CS16Tabs(
                tabs: const ["Home", "Settings"],
                tabViews: [
                  _buildHomeTab(),
                  _buildSettingsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Tab 1: Home**
  Widget _buildHomeTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Welcome to the CS16 UI Theme!",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        CS16Button(
          text: "Reload UI",
          onPressed: () {
            setState(() {}); // Triggers UI rebuild
          },
        ),
      ],
    );
  }

  /// **Tab 2: Settings**
  Widget _buildSettingsTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Settings Panel", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        CS16Button(
          text: "Toggle Theme",
          onPressed: () {
            // Placeholder for theme toggle logic
          },
        ),
      ],
    );
  }
}
