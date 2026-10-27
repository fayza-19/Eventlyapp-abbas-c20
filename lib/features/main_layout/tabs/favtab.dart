
import 'package:evently/core/widgets/custometext.dart';
import 'package:evently/firebase_services/firebaseservices.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/event_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/event_model.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            Custometext(hinttext: appLocalizations.search_for_event , sufixicon: Icon(Icons.search),),
            SizedBox(height: 16,),
            FutureBuilder(future: FirebaseServices.getFavouriteEvents(context),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }
                  List<EventModel> favouriteEvents = snapshot.data!;
                  return  Expanded(
                    child: ListView.separated(

                      itemBuilder: (context, index) => EventItem(
                        event: favouriteEvents[index],
                        markAsFavourite: true,
                      ),

                      separatorBuilder: (context, index)=>SizedBox(height: 16,),
                      itemCount: favouriteEvents.length,
                    ),
                  );
                })


          ],
        ),
      ),
    );
  }


}