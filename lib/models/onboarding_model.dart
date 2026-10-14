import 'package:evently/core/assets_manager.dart';
import 'package:evently/l10n/app_localizations.dart';

class OnboardingModel {
  final String image;
  final String darkImage;
  final String title;
  final String description;

  const OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
    required this.darkImage,
  });

  String imageFor(bool isDark) => isDark ? darkImage : image;

  static List<OnboardingModel> pages(AppLocalizations l10n) => [
    OnboardingModel(
      title: l10n.obTitle1,
      description: l10n.obDesc1,
      image: ImageAssets.obscreenone,
      darkImage: ImageAssets.obscreenoneDark,
    ),
    OnboardingModel(
      title: l10n.obTitle2,
      description: l10n.obDesc2,
      image: ImageAssets.obscreentwo,
      darkImage: ImageAssets.obscreentwoDark,
    ),
    OnboardingModel(
      title: l10n.obTitle3,
      description: l10n.obDesc3,
      image: ImageAssets.obscreenthree,
      darkImage: ImageAssets.obscreenthreeDark,
    ),
    OnboardingModel(
      title: l10n.obTitle4,
      description: l10n.obDesc4,
      image: ImageAssets.obscreenfour,
      darkImage: ImageAssets.obscreenfourDark,
    ),
  ];
}