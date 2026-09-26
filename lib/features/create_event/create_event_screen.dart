import 'package:evently/core/widgets/custom_elevated_buttom.dart';
import 'package:evently/core/widgets/custometext.dart';
import 'package:flutter/material.dart';

import '../../core/assets_manager.dart';
import '../../core/colors_manager.dart';
import '../../core/extensions/date_time_ex.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/custometabbar.dart';
import '../../models/categorymodel.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  DateTime currentDateTime = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  late CategoryModel selectedCategory = CategoryModel.categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Event")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorsManager.grey, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(selectedCategory.image),
              ),
            ),
            SizedBox(height: 16),
            CustomTabBar(
              categories: CategoryModel.categories,
              selectedBgColor: ColorsManager.darkBlue,
              selectedFgColor: ColorsManager.white,
              unSelectedBgColor: ColorsManager.white,
              unSelectedFgColor: ColorsManager.black,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            SizedBox(height: 16),
            Text("Title", style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: 8),
            Custometext(hinttext: "Event title"),
            SizedBox(height: 16),
            Text(
              "Description",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 8),
            Custometext(hinttext: "Event Description...", lines: 4),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.date_range_outlined),
                SizedBox(width: 8),
                Text(
                  currentDateTime.toFormattedDate,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(),
                CustomTextButton(text: "Choose Date", ontap: _chooseEventDate),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.date_range_outlined),
                SizedBox(width: 8),
                Text(
                  currentDateTime.toFormattedTime,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacer(),
                CustomTextButton(text: "Choose Time", ontap: _chooseEventTime),
              ],
            ),

            Spacer(),
            CustomElevatedButtom(title: "Add Event", onpress: () {}),
          ],
        ),
      ),
    );
  }

  void _chooseEventDate() async {
    currentDateTime =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
          initialDate: DateTime.now(),
        ) ??
            currentDateTime;

    currentDateTime = currentDateTime.copyWith(
      hour: currentTime.hour,
      minute: currentTime.minute,
    );
    setState(() {});
  }

  void _chooseEventTime() async {
    currentTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            currentTime;

    currentDateTime = currentDateTime.copyWith(
      hour: currentTime.hour,
      minute: currentTime.minute,
    );
    setState(() {});
  }
}