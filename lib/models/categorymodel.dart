import 'package:flutter/material.dart';

import '../core/assets_manager.dart';
import '../l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.image,
  });

  static List<CategoryModel> getCategories(BuildContext context) {
    return [
      CategoryModel(
        id: "1",
        name: AppLocalizations.of(context)!.sports,
        icon: Icons.sports_basketball_rounded,
        image: ImageAssets.Sport,
      ),
      CategoryModel(
        id: "2",
        name: AppLocalizations.of(context)!.book_club,
        icon: Icons.bookmark,
        image: ImageAssets.BookClub,
      ),
      CategoryModel(
        id: "3",
        name: AppLocalizations.of(context)!.birthday,
        icon: Icons.cake_rounded,
        image: ImageAssets.Birthday,
      ),
      CategoryModel(
        id: "4",
        name: AppLocalizations.of(context)!.meeting,
        icon: Icons.laptop_chromebook,
        image: ImageAssets.Meeting,
      ),
      CategoryModel(
        id: "5",
        name: AppLocalizations.of(context)!.exhibition,
        icon: Icons.water_drop_rounded,
        image: ImageAssets.Exhibition,
      ),
    ];
  }
}