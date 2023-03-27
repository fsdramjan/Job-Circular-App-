import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/model/otherPost/otherPostModel.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../../model/wishlist/wishItemType.dart';
import '../../../model/wishlist/wishlistModel.dart';
import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../../service/datetime/datetimeFormat.dart';
import '../../pages/job/otherCategoryPost/otherCategoryPostDetailsPage.dart';
import '../../widgets/button/loadmoreButton.dart';
import '../../widgets/card/customCard.dart';

class OtherCategoryPostComponent extends StatelessWidget with AllController {
  final String? categoryId;

  final bool? isShowLoadmore;
  OtherCategoryPostComponent({
    required this.categoryId,
    this.isShowLoadmore,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StreamBuilder(
          stream: jobC.otherCategoryWisePost(categoryId),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            // if (!snapshot.hasData) {
            //   return Center(
            //     child: KText(text: 'There is no data!!'),
            //   );
            // }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentSnapshot> dataList = snapshot.data!.docs;
            if (dataList.length < jobC.otherategoryWisePerPage.value) {
              jobC.hasMoreData = false;
            }
            print(snapshot.connectionState);
            print(dataList.length);
            return dataList.length == 0
                ? Padding(
                    padding: EdgeInsets.only(top: Get.height / 2.5),
                    child: Center(
                      child: KText(
                        text: 'There is no data!!',
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount:
                              dataList.length + (jobC.hasMoreData ? 1 : 0),
                          // itemCount: snapshot.data!.size,
                          itemBuilder: (c, i) {
                            if (i == dataList.length) {
                              return Center(
                                  // child: CircularProgressIndicator(),
                                  );
                            }

                            DocumentSnapshot item = dataList[i];
                            // final item = snapshot.data!.docs[i];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: customCard(
                                onTap: () => Get.to(
                                  OtherCategoryPostDetailsPage(
                                    item: OtherPostModel(
                                      id: item['id'],
                                      name: item['name'],
                                      time: item['time'],
                                      deadline: item['deadline'],
                                      description: item['description'],
                                      examDate: item['examDate'],
                                      images: item['images'],
                                      search: item['search'],
                                      otherCategoryName: item['categoryName'],
                                      otherCategoryId: item['categoryId'],
                                    ),
                                  ),
                                ),
                                borderRadiusC: 5,
                                child: Padding(
                                  padding: paddingAll10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: KText(
                                              text: item['name'],
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // sizeW10,
                                          iconButton(
                                            onTap: () => wishlistC
                                                .addWishlist(WishlistModel(
                                              id: item['id'],
                                              name: item['name'] ?? '',
                                              description:
                                                  item['description'] ?? '',
                                              numberOfPost: null,
                                              deadline: null,
                                              wishItemType:
                                                  WishItemType.otherCategory,
                                            )),
                                            icons: Icons.bookmark_outline,
                                            iconSize: 15,
                                            height: 30,
                                            iconColor: green,
                                          ),
                                        ],
                                      ),
                                      item['deadline'] == '' ||
                                              item['deadline'] == null
                                          ? sizeW10
                                          : sizeH5,
                                      item['deadline'] == '' ||
                                              item['deadline'] == null
                                          ? sizeW10
                                          : KText(
                                              text:
                                                  'Deadline: ${datetimeFormat(item['deadline'])}',
                                              color: red,
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      dataList.length == 0
                          ? Container()
                          : isShowLoadmore == true
                              ? loadmoreButton(
                                  onTap: () {
                                    jobC.getMoreOtherCategoryWisePost();
                                  },
                                )
                              : Container(),
                    ],
                  );
          }),
    );
  }
}
