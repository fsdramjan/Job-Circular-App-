// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class NotificationsController extends GetxController {
//   Future<bool> sendNotification(
//       String body, String title, UserModel user) async {
//     String id = _firestore.collection("notification").doc().id;
//     try {
//       await _firestore.collection('notification').doc(id).set({
//         'id': id,
//         'title': title,
//         'body': body,
//         'userId': user.id,
//         'time': FieldValue.serverTimestamp()
//       });

//       sendPushNotification(body, title, user);

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<String> sendPushNotification(
//       String notificationBody, String notificationTitle, UserModel user) async {
 

//     String authKey =
//         'AAAA-mPlcVM:APA91bGKbU4hAQ_yKP3a0NMK4mypn9o7_4JDFu-_l9mwcpFz0sDRB0D8vWvDPS5fYiYxNrOubX9Vg2GQs5C1Bguq_09PmqHhFTRW868PgbAAWfSj08KbRF7Iqy6W2-IYwxQe53375xqU';

//     Map<String, dynamic> body = {
//       "to": user == null ? "/topics/quick_pharma" : "/${user.token}",
//       "notification": {"body": notificationBody, "title": notificationTitle},
//       "data": {
//         "click_action": "FLUTTER_NOTIFICATION_CLICK",
//         "sound": "default",
//         "status": "done",
//         "screen": "ListPostsScreen"
//       },
//       "content_available": true,
//       "priority": "high"
//     };

//     final response = await http.post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: {
//           'Authorization': 'key=$authKey',
//           'Content-Type': 'application/json'
//         },
//         body: json.encode(body),
//         encoding: Encoding.getByName("utf-8"));

//     print(response.body);

//     return response.body;
//   }
// }