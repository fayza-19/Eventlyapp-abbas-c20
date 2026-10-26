
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors_manager.dart';
import '../../../core/widgets/custometabbar.dart';
import '../../../core/widgets/event_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/categorymodel.dart';
import '../../../models/event_model.dart';
import '../../../models/user_model.dart';
import '../../../providers/lang_provider.dart';
import '../../../providers/theme_provider.dart';

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
    LangProvider langProvider =Provider.of<LangProvider>(context);
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
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
                        AppLocalizations.of(context)!.welcome_back,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        UserModel.loggedInUser!.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    themeProvider.changeAppTheme(themeProvider.isDark ? ThemeMode.light : ThemeMode.dark);
                  }, icon:  Icon(themeProvider.isDark ? Icons.light_mode : Icons.dark_mode_outlined)),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: (){

                      langProvider.changeAppLang(langProvider.isEnglish?'ar':'en');

                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        child: Text(
                            langProvider.isEnglish ?  "Ar" : "En",
                            style: Theme.of(context).textTheme.bodyLarge
                        ),
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
              // StreamBuilder(
              //   stream: FirebaseService.getEventsFromFireStoreRealTime(context,selectedCategory),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //     if (snapshot.hasError) {
              //       return Center(child: Text(snapshot.error.toString()));
              //     }
              //
              //     List<EventModel> events = snapshot.data!;
              //     return Expanded(
              //       child: ListView.separated(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 16,
              //           vertical: 24,
              //         ),
              //         itemBuilder: (context, index) =>
              //             EventItem(event: events[index], markAsFavourite: UserModel.currentUser!.favouriteEventsIds.contains(events[index].id),),
              //
              //         separatorBuilder: (context, index) =>
              //             SizedBox(height: 16.h),
              //         itemCount: events.length,
              //       ),
              //     );
              //   },
              // ),
              // Expanded(child: ListView.separated(
              //     padding: EdgeInsets.only(top: 16),
              //     itemBuilder: (context,index)=>EventItem(event: EventModel(id: 1, category: CategoryModel.Categories[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", dateTime: DateTime.now(), ),),
              //     separatorBuilder: (context, index)=>SizedBox(height: 8,),
              //     itemCount: 20))
            ],
          ),
        ),
      ),
    );
  }
}