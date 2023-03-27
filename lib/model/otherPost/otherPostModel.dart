import 'package:cloud_firestore/cloud_firestore.dart';

class OtherPostModel {
  String? id;
  String? name;
  String? time;
  String? deadline;
  String? description;
  String? examDate;
  List<dynamic>? images;
  List<dynamic>? search;
  String? otherCategoryName;
  String? otherCategoryId;

  OtherPostModel({
    this.id,
    this.name,
    this.time,
    this.deadline,
    this.description,
    this.examDate,
    this.images,
    this.search,
    this.otherCategoryName,
    this.otherCategoryId,
  });

  OtherPostModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    time = doc['time'];
    deadline = doc['deadline'];
    description = doc['description'];
    examDate = doc['examDate'];
    images = doc['images'];
    search = doc['search'];
    otherCategoryName = doc['categoryName'];
    otherCategoryId = doc['categoryId'];
  }
}
