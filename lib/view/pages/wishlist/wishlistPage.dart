import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';
import 'package:job_circular_app/view/pages/job/jobDetailsPage.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../../service/datetime/datetimeFormat.dart';
import '../../components/drawer/sidebarComponent.dart';
import '../../widgets/appBar/cAppBar.dart';
import '../../widgets/text/kText.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> with AllController {
  var addCoupon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Favorite'),
      body: ValueListenableBuilder(
        valueListenable: wishlistC.wishlist.listenable(),
        builder: ((context, value, child) {
          return wishlistC.wishlist.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KText(
                        text: 'No Favorite Found!!',
                      ),
                      TextButton(
                        onPressed: () => Get.offAll(
                          HomePage(),
                        ),
                        child: Padding(
                          padding: paddingH10V5,
                          child: KText(
                            text: 'Go to Home',
                            fontSize: 12,
                            color: green,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: paddingH10,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      sizeH10,
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: wishlistC.wishlist.length,
                          itemBuilder: (c, i) {
                            final item = wishlistC.wishlist.getAt(i);
                            return Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: customCard(
                                onTap: () => Get.to(
                                  JobDetailsPage(
                                    id: item.id,
                                  ),
                                ),
                                borderRadiusC: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: KText(
                                              text: item!.name.toString(),
                                            ),
                                          ),
                                          iconButton(
                                            onTap: () => wishlistC.wishlist
                                                .delete(item.id),
                                            icons: Icons.delete,
                                            iconSize: 15,
                                            iconColor: red,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                      sizeH5,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: KText(
                                              text: item.deadline == null
                                                  ? item.description
                                                  : 'Deadline: ${datetimeFormat(item.deadline)}',
                                              color: red,
                                              fontSize: 12,
                                              maxLines: 1,
                                              fontStyle: item.deadline == null
                                                  ? null
                                                  : FontStyle.italic,
                                            ),
                                          ),
                                          sizeW10,
                                          KText(
                                            text: item.numberOfPost == null
                                                ? ''
                                                : 'পদ সংখ্যা: ${item.numberOfPost}',
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
