import 'package:evently/core/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomGoogleLoginButton extends StatelessWidget {
  const CustomGoogleLoginButton({
    super.key,
    required this.title,
    required this.onpress,
  });

  final String title;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.primaryColor,
        elevation: 0,
        side: BorderSide(color: theme.primaryColor.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.google, height: 24, width: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}