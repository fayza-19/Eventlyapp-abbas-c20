import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       children: [
    //         CustomTextFormField(hintText: appLocalizations.search_for_event, suffixIcon: Icon(Icons.search),),
    //         Expanded(child: ListView.separated(
    //           padding: EdgeInsets.only(top: 16),
    //             itemBuilder: (context,index)=>EventItem(event: EventModel(id: "", category: CategoryModel.categories[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", dateTime: DateTime.now()),),
    //             separatorBuilder: (context, index)=>SizedBox(height: 8,),
    //             itemCount: 20))
    //       ],
    //     ),
    //   ),
    // );
    return Container();
  }
}