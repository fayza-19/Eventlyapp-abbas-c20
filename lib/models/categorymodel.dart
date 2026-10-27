import 'package:flutter/material.dart';

import '../core/assets_manager.dart';
import '../l10n/app_localizations.dart';

class CategoryModel {
  String id;
  IconData icon;
  String image;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.image,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      icon: Icons.sports_basketball_rounded,
      image: ImageAssets.Sport,
    ),
    CategoryModel(
      id: "2",
      icon: Icons.bookmark,
      image: ImageAssets.BookClub,
    ),
    CategoryModel(
      id: "3",
      icon: Icons.cake_rounded,
      image: ImageAssets.Birthday,
    ),
    CategoryModel(
      id: "4",
      icon: Icons.laptop_chromebook,
      image: ImageAssets.Meeting,
    ),
    CategoryModel(
      id: "5",
      icon: Icons.water_drop_rounded,
      image: ImageAssets.Exhibition,
    ),
  ];

  static CategoryModel getById(String id) {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].id == id) {
        return categories[i];
      }
    }
    return categories[0];
  }

  String getName(BuildContext context) {
    if (id == "0") return AppLocalizations.of(context)!.all;
    if(id == "1") return AppLocalizations.of(context)!.sports;
    if (id == "2") return AppLocalizations.of(context)!.book_club;
    if (id == "3") return AppLocalizations.of(context)!.birthday;
    if (id == "4") return AppLocalizations.of(context)!.meeting;
    return AppLocalizations.of(context)!.exhibition;
  }
  static List<CategoryModel> getCategoriesWithAll(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    List<CategoryModel> categories = [
      CategoryModel(id: "0", icon: Icons.all_inclusive_outlined, image: "")
      ,CategoryModel(
        id: "1",
        icon: Icons.sports_basketball_rounded,
        image: ImageAssets.Sport,
      ),
      CategoryModel(
        id: "2",
        icon: Icons.bookmark,
        image: ImageAssets.BookClub,
      ),
      CategoryModel(
        id: "3",
        icon: Icons.cake_rounded,
        image: ImageAssets.Birthday,
      ),
      CategoryModel(
        id: "4",
        icon: Icons.laptop_chromebook,
        image: ImageAssets.Meeting,
      ),
      CategoryModel(
        id: "5",
        icon: Icons.water_drop_rounded,
        image: ImageAssets.Exhibition,
      ),
    ];
    return categories;
  }
}