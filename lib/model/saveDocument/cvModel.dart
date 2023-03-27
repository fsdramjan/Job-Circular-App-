 
class CvModel {
  String? id;
  String? profilePic;
  String? userName;
  String? userId;
  String? file;
  String? fileName;
  String? time;

  CvModel({
    required this.id,
    required this.file,
    required this.fileName,
    required this.profilePic,
    required this.userId,
    required this.userName,
    required this.time,
  });
  // CvModel.fromDocumentSnapshot(DocumentSnapshot doc) {
  //   id = doc['id'];
  //   file = doc['file'];
  //   profilePic = doc['profilePic'];
  //   userId = doc['userId'];
  //   userName = doc['userName'];
  //   time = doc['time'];
  // }
}
