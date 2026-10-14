import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;
  final bool isFirstSelected;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    required this.firstChild,
    required this.secondChild,
    required this.isFirstSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    Widget item(Widget child, bool selected, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: selected ? Colors.white : primary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            child: IconTheme(
              data: IconThemeData(color: selected ? Colors.white : primary),
              child: child,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          item(firstChild, isFirstSelected, () => onChanged(true)),
          item(secondChild, !isFirstSelected, () => onChanged(false)),
        ],
      ),
    );
  }
}