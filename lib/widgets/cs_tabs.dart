import 'package:flutter/material.dart';

class CSTabs extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  final double fontSize;
  final Color unselectedLabelColor;
  final Color selectedLabelColor;
  final Color tabBarBackgroundColor;
  final Color borderColor;
  final double tabBarHeight;
  final Color panelBackgroundColor;
  final EdgeInsets panelPadding;

  const CSTabs({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.fontSize = 16,
    this.unselectedLabelColor = Colors.white,
    this.selectedLabelColor = const Color(0xFFC4B550),
    this.tabBarBackgroundColor = const Color(0xFF4A5942),
    this.borderColor = const Color(0xFF8C9284),
    this.tabBarHeight = 27,
    this.panelBackgroundColor = const Color(0xFF4A5942),
    this.panelPadding = const EdgeInsets.all(16),
  }) : assert(tabs.length == tabViews.length,
            "Tabs and TabViews must have the same length");

  @override
  CSTabsState createState() => CSTabsState(); // <- Now it's public
}

class CSTabsState extends State<CSTabs> { // <- Now it's public
  int _selectedIndex = 0;

  // Method to switch tabs programmatically
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
            child: widget.tabViews[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
