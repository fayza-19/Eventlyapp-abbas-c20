import 'package:flutter/material.dart';

import '../../models/categorymodel.dart';
import 'customeTabitems.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.onCategorySelected,
  });

  List<CategoryModel> categories;
  Color selectedBgColor;
  Color unSelectedBgColor;
  Color selectedFgColor;
  Color unSelectedFgColor;
  final ValueChanged<CategoryModel> onCategorySelected; // جديد

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
          widget.onCategorySelected(widget.categories[newIndex]); // جديد
        },
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabs: widget.categories
            .map(
              (category) => CustomTabItem(
            category: category,
            selectedBgColor: widget.selectedBgColor,
            selectedFgColor: widget.selectedFgColor,
            unSelectedBgColor: widget.unSelectedBgColor,
            unSelectedFgColor: widget.unSelectedFgColor,
            isSelected: widget.categories.indexOf(category) == selectedIndex,
          ),
        )
            .toList(),
      ),
    );
  }
}