import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? image;
  String? time;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.password,
    this.time,
  });

  ProfileModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    image = doc['image'];
    password = doc['password'];
    time = doc['time'];
  }
}
