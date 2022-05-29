// To parse this JSON data, do
//
//     final lessonModel = lessonModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

LessonModel lessonModelFromJson(String str) => LessonModel.fromJson(json.decode(str));

String lessonModelToJson(LessonModel data) => json.encode(data.toJson());

class LessonModel {
    LessonModel({
        this.body,
        this.title
    });
    String? title;
    String? body;
    factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        body: json["body"],
        title: json["title"]
    );
    static LessonModel fromSnapshot(DocumentSnapshot snap){
      LessonModel lessonModel = LessonModel(
        body: snap['body'],
        title: snap ['title']
      );
      return lessonModel;
    }
    Map<String, dynamic> toJson() => {
        "body": body,
    };

}
