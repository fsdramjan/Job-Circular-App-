import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

//current user UUID
// final uid = getStorage.read(userId);

final formKey = GlobalKey<FormState>();
final getStorage = GetStorage();
final phoneNumberL = 'phoneNumber';
// final userUid = 'userUid';

final paddingZero = EdgeInsets.zero;
final paddingAll5 = EdgeInsets.all(5);
final paddingAll10 = EdgeInsets.all(10);
final paddingAll20 = EdgeInsets.all(20);

final paddingH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
final paddingH10V10 = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
final paddingH5 = EdgeInsets.symmetric(horizontal: 5);
final paddingH10 = EdgeInsets.symmetric(horizontal: 10);
final paddingH15 = EdgeInsets.symmetric(horizontal: 15);
final paddingH20 = EdgeInsets.symmetric(horizontal: 20);
final paddingH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 5);
final paddingH10V20 = EdgeInsets.symmetric(
  horizontal: 10,
  vertical: 20,
);
final paddingH30V10 = EdgeInsets.symmetric(horizontal: 30, vertical: 5);

final paddingV5 = EdgeInsets.symmetric(vertical: 5);
final paddingV10 = EdgeInsets.symmetric(vertical: 10);
final paddingV20 = EdgeInsets.symmetric(vertical: 20);

//sizedbox --> Height
final sizeH5 = SizedBox(height: 5);
final sizeH10 = SizedBox(height: 10);
final sizeH20 = SizedBox(height: 20);
final sizeH40 = SizedBox(height: 40);

//sizedbox --> Width
final sizeW5 = SizedBox(width: 5);
final sizeW10 = SizedBox(width: 10);
final sizeW20 = SizedBox(width: 20);
