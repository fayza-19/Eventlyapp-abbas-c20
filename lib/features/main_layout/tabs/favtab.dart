import 'package:evently/core/widgets/custometext.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/event_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/categorymodel.dart';
import '../../../models/event_model.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Custometext(hinttext:  AppLocalizations.of(context)!.search_for_event, sufixicon:  Icon(Icons.search)),
            Expanded(child: ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (context,index)=>EventItem(event: EventModel(id: 1, category: CategoryModel.getCategories(context)[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", date: DateTime.now(), time: TimeOfDay.now()),),
                separatorBuilder: (context, index)=>SizedBox(height: 8,),
                itemCount: 20))
          ],
        ),
      ),
    );
  }
}