import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> willPopScope({
  required Widget routeName,
  bool? isOffAll,
  bool? isBackEnable = true,
}) async {
  final completer = Completer<bool>();
  isOffAll == true ? Get.offAll(routeName) : Get.to(routeName);
  completer.complete(isBackEnable);
  return completer.future;
}
