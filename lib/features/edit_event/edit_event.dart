import 'package:evently/firebase_services/firebaseservices.dart';
import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';
import '../../l10n/app_localizations.dart';
import '../../models/categorymodel.dart';
import '../../models/event_model.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel event;

  const EditEventScreen({super.key, required this.event});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late CategoryModel selectedCategory;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event.title);
    descriptionController =
        TextEditingController(text: widget.event.description);
    selectedCategory = widget.event.category;
    selectedDate = widget.event.dateTime;
    selectedTime = TimeOfDay.fromDateTime(widget.event.dateTime);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> updateEvent() async {
    DateTime finalDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    EventModel updatedEvent = EventModel(
      id: widget.event.id,
      ownerId: widget.event.ownerId,
      title: titleController.text,
      description: descriptionController.text,
      category: selectedCategory,
      dateTime: finalDateTime,
    );

    await FirebaseServices.updateEvent(updatedEvent);

    if (!mounted) return;
    Navigator.pop(context); // close edit
    Navigator.pop(context); // close details (it still shows the old data)
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // chip colors follow the current theme
    Color mainColor = Theme.of(context).primaryColor;
    Color unselectedBg = isDark ? ColorsManager.dark : ColorsManager.white;
    Color unselectedFg = isDark ? ColorsManager.white : ColorsManager.black;

    List<Widget> categoryChips = [];
    for (int i = 0; i < CategoryModel.categories.length; i++) {
      CategoryModel category = CategoryModel.categories[i];
      bool isSelected = category.id == selectedCategory.id;

      categoryChips.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? mainColor : unselectedBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: mainColor),
            ),
            child: Row(
              children: [
                Icon(
                  category.icon,
                  size: 18,
                  color: isSelected ? Colors.white : unselectedFg,
                ),
                const SizedBox(width: 6),
                Text(
                  category.getName(context),
                  style: TextStyle(
                    color: isSelected ? Colors.white : unselectedFg,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.edit_event)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(selectedCategory.image),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryChips),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.event_title,
              style: textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              style: textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.event_description,
              style: textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              style: textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.event_date,
                  style: textTheme.displaySmall,
                ),
                TextButton(
                  onPressed: pickDate,
                  child: Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.event_time,
                  style: textTheme.displaySmall,
                ),
                TextButton(
                  onPressed: pickTime,
                  child: Text(
                    selectedTime.format(context),
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: updateEvent,
                child: Text(AppLocalizations.of(context)!.update_event),
              ),
            ),
          ],
        ),
      ),
    );
  }
}