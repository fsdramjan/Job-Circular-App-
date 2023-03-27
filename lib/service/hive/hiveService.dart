import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:job_circular_app/model/wishlist/wishlistModel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService extends GetxController {
  Future<void> initHive() async {
    try {
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();

      Hive..init(appDocumentDir.path);
      Hive..registerAdapter(WishlistModelAdapter());

      await Hive.openBox<WishlistModel>('wishlist');
      print('Hive initialized');
    } catch (e) {
      print(e);
    }
  }
}
