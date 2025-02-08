import 'package:flutter/material.dart';

/// A custom tab navigation widget styled after Counter-Strike 1.6 UI.
///
/// This widget allows users to switch between different content panels
/// by clicking on tab headers. It supports full customization for
/// colors, fonts, padding, and borders.
///
/// Example usage:
/// ```dart
/// CSTabs(
///   tabs: ["Tab 1", "Tab 2"],
///   tabViews: [
///     Text("Content for Tab 1"),
///     Text("Content for Tab 2"),
///   ],
/// )
/// ```
class CS16Tabs extends StatefulWidget {
  /// List of tab titles displayed in the tab bar.
  final List<String> tabs;

  /// Corresponding views for each tab.
  final List<Widget> tabViews;

  /// Font size for the tab labels.
  final double fontSize;

  /// Color of unselected tab labels.
  final Color unselectedLabelColor;

  /// Color of the selected tab label.
  final Color selectedLabelColor;

  /// Background color of the tab bar.
  final Color tabBarBackgroundColor;

  /// Color of the tab borders.
  final Color borderColor;

  /// Height of the tab bar.
  final double tabBarHeight;

  /// Background color of the tab content panel.
  final Color panelBackgroundColor;

  /// Padding inside the tab content panel.
  final EdgeInsets panelPadding;

  /// Creates a CS16-styled tab navigation widget.
  ///
  /// Ensures that [tabs] and [tabViews] have the same length.
  const CS16Tabs({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.fontSize = 16,
    this.unselectedLabelColor = Colors.white,
    this.selectedLabelColor = const Color(0xFFC4B550), // Amber-like color
    this.tabBarBackgroundColor = const Color(0xFF4A5942), // Dark green
    this.borderColor = const Color(0xFF8C9284), // Light grey-green
    this.tabBarHeight = 27,
    this.panelBackgroundColor = const Color(0xFF4A5942), // Dark green
    this.panelPadding = const EdgeInsets.all(16),
  }) : assert(
          tabs.length == tabViews.length,
          "Tabs and TabViews must have the same length",
        );

  @override
  CS16TabsState createState() => CS16TabsState();
}

class CS16TabsState extends State<CS16Tabs> {
  /// Index of the currently selected tab.
  int _selectedIndex = 0;

  /// Switches the active tab programmatically.
  ///
  /// This method updates the `_selectedIndex` and rebuilds the widget.
  void switchTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          // Tab Bar
          Container(
            color: widget.tabBarBackgroundColor,
            child: Row(
              children: List.generate(widget.tabs.length, (index) {
                final isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: widget.tabBarHeight,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.tabBarBackgroundColor
                          : Colors.transparent,
                      border: Border(
                        top: BorderSide(color: widget.borderColor, width: 1),
                        left: BorderSide(color: widget.borderColor, width: 1),
                        right: const BorderSide(
                            color: Color(0xFF292C21), width: 1),
                        bottom: BorderSide(
                          color: isSelected
                              ? widget.tabBarBackgroundColor
                              : widget.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.tabs[index],
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        color: isSelected
                            ? widget.selectedLabelColor
                            : widget.unselectedLabelColor,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Tab Content Panel
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: widget.borderColor, width: 1),
                left: BorderSide(color: widget.borderColor, width: 1),
                right: const BorderSide(color: Color(0xFF292C21), width: 1),
                bottom: const BorderSide(color: Color(0xFF292C21), width: 1),
              ),
              color: widget.panelBackgroundColor,
            ),
            padding: widget.panelPadding,
            child: widget
                .tabViews[_selectedIndex], // Displays the active tab's content.
          ),
        ],
      ),
    );
  }
}
