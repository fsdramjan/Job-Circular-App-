import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String? categoryName;
  Timestamp? createdAt;

  CategoryModel({
    this.id,
    this.categoryName,
    this.createdAt,
  });

  CategoryModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    categoryName = doc['categoryName'];
    createdAt = doc['createdAt'];
  }
}
