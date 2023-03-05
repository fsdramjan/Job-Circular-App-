import 'package:get/get.dart';
import 'package:job_circular_app/controller/category/categoryController.dart';

import '../controller/jobs/jobsController.dart';

class AllController {
  final categoryC = Get.put(CategoryController());
  final jobC = Get.put(JobsController());
}
