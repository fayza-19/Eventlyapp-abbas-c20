import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'categorymodel.dart';

class EventModel{
  String ownerId;
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({required this.ownerId,required this.id,required this.category, required this.title, required this.description, required this.dateTime,});

  EventModel.fromFireStore(Map<String, dynamic> json) :this(
    ownerId: json['ownerId'],
    id:json['id'] ,
    title: json['title'],
    description: json['description'],
    dateTime: (json['dateTime'] as Timestamp).toDate(),
    category:CategoryModel.getById(json['categoryId']),
  );

  Map<String, dynamic> toJson(){
    return {
      'ownerId':ownerId,
      'id':id,
      'title':title,
      'description': description,
      'dateTime':dateTime,
      'categoryId':category.id,
    };
  }

}