import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appTheme.dart';
import 'package:job_circular_app/service/hive/hiveService.dart';
import 'package:job_circular_app/view/pages/splash/splashPage.dart';
import 'service/configs/appColors.dart';
 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await initAppConfig();
  // print(userUid.toString());

  runApp(App());
}

Future<void> initAppConfig() async {
  await Get.put(HiveService(), permanent: true).initHive();

  // await GetStorage.init();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      home: SplashPage(),
      smartManagement: SmartManagement.onlyBuilder,
    );
  }
}
