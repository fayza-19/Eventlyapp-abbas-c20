import 'package:flutter/material.dart';
import '../../models/event_model.dart';
import '../colors_manager.dart';
import '../extensions/date_time_ex.dart';
class EventItem extends StatelessWidget {
  EventItem({super.key, required this.event});
  EventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 193,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(event.category.image)),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.grey, width: 1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(event.dateTime.showMonthWeekDay, style:Theme.of(context).textTheme.headlineSmall),
              ),
            ),
            Spacer(),
            Card(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(event.title, style: Theme
                          .of(context)
                          .textTheme.headlineSmall),
                    ),
                    Icon(Icons.favorite_border),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }




}