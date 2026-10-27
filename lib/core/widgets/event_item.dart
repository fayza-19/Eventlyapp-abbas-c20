import 'package:flutter/material.dart';
import '../../features/event_details/details_screen.dart';
import '../../firebase_services/firebaseservices.dart';
import '../../models/event_model.dart';
import '../colors_manager.dart';
import '../extensions/date_time_ex.dart';

class EventItem extends StatefulWidget {
  EventItem({super.key, required this.event, required this.markAsFavourite});
  EventModel event;
  bool markAsFavourite;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool favourite = widget.markAsFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(event: widget.event),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 193,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.event.category.image)),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorsManager.grey, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.event.dateTime.showMonthWeekDay,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
              Spacer(),
              Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(widget.event.title ?? "",
                              style: Theme.of(context).textTheme.titleMedium)),
                      IconButton(
                          onPressed: _markEventAsFavourite,
                          icon: Icon(favourite
                              ? Icons.favorite
                              : Icons.favorite_border))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _markEventAsFavourite() async {
    if (favourite) {
      await FirebaseServices.removeEventFromFavourite(widget.event);
    } else {
      await FirebaseServices.addEventToFavourite(widget.event);
    }
    setState(() {
      favourite = !favourite;
    });
  }
}