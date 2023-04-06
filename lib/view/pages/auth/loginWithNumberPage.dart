// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:job_circular_app/service/configs/appColors.dart';
// import 'package:job_circular_app/service/snackbar/snackbar.dart';
// import 'package:flutter_countdown_timer/current_remaining_time.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

// class VerifyPhoneNumberScreen extends StatefulWidget {
//   @override
//   _VerifyPhoneNumberScreenState createState() =>
//       _VerifyPhoneNumberScreenState();
// }

// class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phone Authentication')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     "I didn't receive code ",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//                 if (endTime != null)
//                   CountdownTimer(
//                     endTime: endTime,
//                     widgetBuilder: (_, CurrentRemainingTime? time) {
//                       if (time == null) {
//                         return TextButton(
//                           onPressed: () {
//                             _submitPhoneNumber();
//                           },
//                           child: Container(
//                             child: Text(
//                               "Resend Code",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }
//                       return Text(
//                         '${time.min == null ? 0 : time.min}:${time.sec == null ? 0 : time.sec}',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitPhoneNumber,
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _codeController,
//               decoration: InputDecoration(labelText: 'Verification Code'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitVerificationCode,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
