// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/pages/job/applyJobs/myAppliedJobsPage.dart';
import 'package:job_circular_app/view/pages/job/search/searchJobPage.dart';
import 'package:job_circular_app/view/pages/profile/jobProfile/jobProfilePage.dart';
import 'package:job_circular_app/view/pages/profile/profilePage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../service/configs/appColors.dart';
import '../../pages/wishlist/wishlistPage.dart';
import '../button/iconButton.dart';
import '../popupMenu/cPopupMenuButton.dart';
import '../text/kText.dart';

PreferredSizeWidget cAppBar({
  required String? title,
}) {
  return AppBar(
    // title: KText(
    //   text: title,
    //   fontSize: 16,
    //   color: white,
    // ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(20),
      child: Padding(
        padding: paddingAll10,
        child: Align(
          alignment: Alignment.centerLeft,
          child: KText(
            text: title,
            fontSize: 16,
            color: white,
          ),
        ),
      ),
    ),
    actions: [
      iconButton(
        onTap: () => Get.to(WishlistPage()),
        icons: Icons.bookmark_outline,
        iconSize: 20,
      ),
      iconButton(
        onTap: () => Get.to(SearchJobPage()),
        icons: Icons.search,
        iconSize: 20,
      ),
      iconButton(
        onTap: () async {
          var url = 'https://m.me/ramjan.flutter.dev';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        icons: Icons.messenger,
        child: Image.asset(
          'assets/icons/messenger.png',
          height: 18,
          color: white,
        ),
      ),
      iconButton(
        onTap: () async {},
        icons: Icons.whatshot,
        child: Image.asset(
          'assets/icons/whatsapp.png',
          height: 18,
          color: white,
        ),
      ),
      iconButton(
        onTap: () async {},
        icons: Icons.call_outlined,
        child: Image.asset(
          'assets/icons/telephone.png',
          height: 16,
          color: white,
        ),
        iconSize: 20,
      ),
      _popupMenu(),

      // iconButton(
      //   onTap: () => ,
      //   icons: Icons.more_vert_rounded,
      // ),
    ],
  );
}

_popupMenu() {
  final _ = AllController();
  return CPopupMenuButton(
    items: [
      PopupMenuItem(
        value: 5,
        child: Row(
          children: [
            KText(text: 'My Account'),
            Spacer(),
            Icon(
              Icons.person,
              size: 20,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 9,
        child: Row(
          children: [
            KText(text: 'Job Profile'),
            Spacer(),
            Icon(
              Icons.account_box,
              size: 20,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 6,
        child: Row(
          children: [
            KText(text: 'My Applied Jobs'),
            Spacer(),
            Icon(
              Icons.business_center_rounded,
              size: 20,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 7,
        child: Row(
          children: [
            KText(text: 'Logout'),
            Spacer(),
            Icon(
              Icons.logout,
              size: 15,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 8,
        child: KText(text: 'Exit'),
      ),
    ],
    onSelected: (int value) {
      print('You selected $value');

      if (value == 5) {
        Get.to(ProfilePage());
      }
      if (value == 6) {
        Get.to(MyAppliedJobsPage());
      }

      if (value == 7) {
        _.authC.signout();
      }

      if (value == 8) {
        SystemNavigator.pop();
      }
      if (value == 9) {
        Get.to(JobProfilePage());
      }
    },
  );
}
