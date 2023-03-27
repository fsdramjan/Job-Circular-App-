import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:job_circular_app/model/wishlist/wishlistModel.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';

class WishlistController extends GetxController {
  final wishlist = Hive.box<WishlistModel>('wishlist');

  addWishlist(WishlistModel item) {
    try {
      final data = WishlistModel(
        id: item.id,
        name: item.name,
        deadline: item.deadline,
        description: item.description,
        numberOfPost: item.numberOfPost,
        wishItemType: item.wishItemType,
      );

      if (data.id != null || data.id != '') {
        if (wishlist.containsKey(item.id)) {
          wishlist.delete(item.id);
          snackbar('Item updated to wishlist!!');
          wishlist.put(item.id, data);
        } else {
          if (data.id != null || data.id != '') {
            snackbar('Item added to wishlist!!');
            wishlist.put(item.id, data);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  var wishItemType =  {};
}
