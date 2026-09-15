import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/assets_manager.dart';

class CategoryModel{
  String id;
  String name;
  IconData icon;
  String image;
  CategoryModel({required this.id, required this.name, required this.icon , required this.image});


  // static List<CategoryModel> categoriesWithAll = [
  //
  //    CategoryModel(id: "1", name: "All", icon: Icons.all_inclusive, image: ImageAssets.meeting),
  //    CategoryModel(id: "2", name: "Sports", icon: Icons.sports_football,image: ImageAssets.meeting),
  //    CategoryModel(id: "3", name: "Book Club", icon: Icons.bookmark_add_rounded,image: ImageAssets.meeting),
  //    CategoryModel(id: "4", name: "Birthday", icon: Icons.cake_outlined,image: ImageAssets.meeting),
  //    CategoryModel(id: "5", name: "Meeting", icon: Icons.laptop_chromebook,image: ImageAssets.meeting),
  //    CategoryModel(id: "6", name: "Exhibition", icon: Icons.water_drop_rounded,image: ImageAssets.meeting),
  //
  //  ];
  static List<CategoryModel> categories = [

    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_basketball_rounded,image: ImageAssets.Sport),
    CategoryModel(id: "2", name: "Book Club", icon: Icons.bookmark,image: ImageAssets.BookClub),
    CategoryModel(id: "3", name: "Birthday", icon: Icons.cake_rounded,image: ImageAssets.Birthday),
    CategoryModel(id: "4", name: "Meeting", icon: Icons.laptop_chromebook,image: ImageAssets.Meeting),
    CategoryModel(id: "5", name: "Exhibition", icon: Icons.water_drop_rounded,image: ImageAssets.Birthday),

  ];
}