import 'package:get/get.dart';
import 'package:job_circular_app/controller/auth/authController.dart';
import 'package:job_circular_app/controller/category/categoryController.dart';
import 'package:job_circular_app/controller/saveDocument/saveDocumentController.dart';
import 'package:job_circular_app/service/fileUpload/fileUploadFirebase.dart';
import 'package:job_circular_app/view/pages/profile/controller/jobProfileController.dart';

import '../controller/jobs/jobsController.dart';
import '../controller/settings/settingsController.dart';
import '../controller/wishlist/wishlistController.dart';
import 'hive/hiveService.dart';

class AllController {
  final categoryC = Get.put(CategoryController());
  final jobC = Get.put(JobsController());
  final hiveC = Get.put(HiveService());
  final wishlistC = Get.put(WishlistController());
  final authC = Get.put(AuthController());
  final fileUploadC = Get.put(FirebaseFileUploadController());
  final saveDocumentC = Get.put(SaveDocumentController());
  final settingsC = Get.put(SettingsController());
  final jobProfileC = Get.put(JobProfileController());
}
