import 'package:hive/hive.dart';
part 'wishlistModel.g.dart';

@HiveType(typeId: 1)
class WishlistModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? deadline;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? id;
  @HiveField(4)
  String? numberOfPost;
  @HiveField(5)
  String? wishItemType;

  WishlistModel({
    this.id,
    this.name,
    this.deadline,
    this.description,
    this.numberOfPost,
    this.wishItemType,
  });
}
