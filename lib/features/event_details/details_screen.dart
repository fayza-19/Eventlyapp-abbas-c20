import 'package:evently/firebase_services/firebaseservices.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';
import '../../models/event_model.dart';
import '../../models/user_model.dart';
import '../edit_event/edit_event.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    bool isOwner = event.ownerId == UserModel.currentUser!.id;
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // box colors follow the current theme
    Color boxColor = isDark ? ColorsManager.dark : ColorsManager.white;
    Color boxBorder = isDark ? ColorsManager.darkBlue : ColorsManager.lightgray;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.event_details),
        actions: [
          if (isOwner)
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditEventScreen(event: event),
                  ),
                );
              },
            ),
          if (isOwner)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                showDeleteDialog(context);
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(event.category.image),
            ),
            const SizedBox(height: 16),
            Text(event.title, style: textTheme.titleMedium),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: boxBorder),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}",
                        style: textTheme.displaySmall,
                      ),
                      Text(
                        TimeOfDay.fromDateTime(event.dateTime).format(context),
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.event_description,
              style: textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: boxBorder),
              ),
              child: Text(event.description, style: textTheme.displaySmall),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(AppLocalizations.of(dialogContext)!.delete_event),
          content: Text(
            AppLocalizations.of(dialogContext)!.delete_event_confirmation,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text(AppLocalizations.of(dialogContext)!.cancel),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseServices.deleteEvent(event.id);
                if (!dialogContext.mounted) return;
                Navigator.pop(dialogContext); // close dialog
                if (!context.mounted) return;
                Navigator.pop(context); // back to home
              },
              child: Text(
                AppLocalizations.of(dialogContext)!.delete,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}