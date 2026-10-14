import 'package:evently/core/assets_manager.dart';
import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/widgets/custom_elevated_buttom.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/onboarding_model.dart';
import 'package:evently/providers/lang_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'toggle_switch.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  static const Duration _duration = Duration(milliseconds: 400);
  static const Curve _curve = Curves.easeInOut;

  bool get isFirst => currentIndex == 0;
  AppLocalizations get l10n => AppLocalizations.of(context)!;
  List<OnboardingModel> get pages => OnboardingModel.pages(l10n);

  bool get isLast => currentIndex == pages.length - 1;

  String get buttonTitle {
    if (isFirst) return l10n.obLetsStart;
    if (isLast) return l10n.obGetStarted;
    return l10n.obNext;
  }

  void onMainButtonPressed() {
    if (isLast) {
      finishOnboarding();
    } else {
      controller.nextPage(duration: _duration, curve: _curve);
    }
  }

  void onBackPressed() {
    controller.previousPage(duration: _duration, curve: _curve);
  }

  void finishOnboarding() {
    Navigator.pushReplacementNamed(context, RoutesManager.loginscreen);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 56,
                      child: isFirst
                          ? null
                          : Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: IconButton(
                          onPressed: onBackPressed,
                          icon: const Icon(Icons.arrow_back_ios_new,
                              size: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        isDark ? ImageAssets.logoDark : ImageAssets.logo,
                        height: screenSize.height * 0.06,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 56,
                      child: isFirst
                          ? null
                          : TextButton(
                        onPressed: finishOnboarding,
                        child: Text(l10n.obSkip),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (index) =>
                      setState(() => currentIndex = index),
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Image.asset(page.imageFor(isDark), fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          flex: 5,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(page.title, style: textTheme.titleMedium),
                                const SizedBox(height: 8),
                                Text(
                                  page.description,
                                  style: textTheme.displayMedium,
                                ),
                                if (index == 0) ...[
                                  const SizedBox(height: 16),
                                  _buildPersonalizeOptions(context),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              if (!isFirst)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pages.length - 1, (i) {
                      final active = currentIndex - 1 == i;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 6,
                        width: active ? 20 : 6,
                        decoration: BoxDecoration(
                          color: active
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                )
              else
                const SizedBox(height: 12),

              CustomElevatedButtom(
                title: buttonTitle,
                onpress: onMainButtonPressed,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalizeOptions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeProvider = context.watch<ThemeProvider>();
    final langProvider = context.watch<LangProvider>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                l10n.obLanguage,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            ToggleSwitch(
              firstChild: Text(l10n.obEnglish),
              secondChild: Text(l10n.obArabic),
              isFirstSelected: langProvider.isEnglish,
              onChanged: (first) =>
                  langProvider.changeAppLang(first ? 'en' : 'ar'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                l10n.obTheme,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            ToggleSwitch(
              firstChild: const Icon(Icons.light_mode, size: 18),
              secondChild: const Icon(Icons.dark_mode_outlined, size: 18),
              isFirstSelected: !themeProvider.isDark,
              onChanged: (first) => themeProvider.changeAppTheme(
                  first ? ThemeMode.light : ThemeMode.dark),
            ),
          ],
        ),
      ],
    );
  }
}

