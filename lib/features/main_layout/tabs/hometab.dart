
import 'package:flutter/material.dart';

import '../../../core/colors_manager.dart';
import '../../../core/widgets/custometabbar.dart';
import '../../../core/widgets/event_item.dart';
import '../../../models/categorymodel.dart';
import '../../../models/event_model.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HomeState();
}

class _HomeState extends State<Hometab> {
  int selectedIndex = 0;
  late CategoryModel selectedCategory = CategoryModel.categories.first;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Welcome Back ✨",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Muhammed Saad",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.light_mode_rounded),
                  SizedBox(width: 8,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      child: Text(
                          "En",
                          style: Theme.of(context).textTheme.bodyLarge
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12,),
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
              Expanded(child: ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (context,index)=>EventItem(event: EventModel(id: 1, category: CategoryModel.categories[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", date: DateTime.now(), time: TimeOfDay.now()),),
                  separatorBuilder: (context, index)=>SizedBox(height: 8,),
                  itemCount: 20))
            ],
          ),
        ),
      ),
    );
  }
}