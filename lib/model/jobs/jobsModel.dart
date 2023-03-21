import 'package:cloud_firestore/cloud_firestore.dart';

class JobsModel {
  String? id;
  String? name;
  String? time;
  String? applylink;
  String? deadline;
  String? description;
  String? examDate;
  List<dynamic>? images;
  List<dynamic>? search;
  String? numberOfpost;
  String? isJobCircular;
  String? isJobPreparation;
  String? categoryName;
  String? categoryId;

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
    this.isJobCircular,
    this.isJobPreparation,
    this.categoryName,
    this.categoryId,
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
    isJobPreparation = doc['isJobPreparation'];
    isJobCircular = doc['isJobCircular'];
    categoryName = doc['categoryName'];
    categoryId = doc['categoryId'];
  }
}
