import 'package:flutter/material.dart';

import 'categorymodel.dart';

class EventModel{
  int id;
  CategoryModel category;
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  EventModel({required this.id,required this.category, required this.title, required this.description, required this.date, required this.time});

}