import 'package:cloud_firestore/cloud_firestore.dart';

class JobsModel {
  String? id;
  String? name;
  Timestamp? time;
  String? applylink;
  Timestamp? deadline;
  String? description;
  Timestamp? examDate;
  List<String>? images;
  List<String>? search;
  String? numberOfpost;

  JobsModel({
    this.id,
    this.name,
    this.time,
    this.applylink,
    this.deadline,
    this.description,
    this.examDate,
    this.images,
    this.numberOfpost,
    this.search,
  });

  JobsModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    time = doc['time'];
    applylink = doc['applylink'];
    deadline = doc['deadline'];
    description = doc['description'];
    examDate = doc['examDate'];
    images = doc['images'];
    numberOfpost = doc['numberOfpost'];
    search = doc['search'];
  }
}
