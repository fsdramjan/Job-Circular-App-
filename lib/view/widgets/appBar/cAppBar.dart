import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/view/pages/job/search/searchJobPage.dart';

import '../../../service/configs/appColors.dart';
import '../button/iconButton.dart';
import '../popupMenu/cPopupMenuButton.dart';
import '../text/kText.dart';

PreferredSizeWidget cAppBar({
  required String? title,
}) {
  return AppBar(
    title: KText(
      text: title,
      fontSize: 16,
      color: white,
    ),
    actions: [
      iconButton(
        icons: Icons.bookmark_outline,
      ),
      iconButton(
        onTap: () => Get.to(SearchJobPage()),
        icons: Icons.search,
      ),
      iconButton(
        icons: Icons.messenger,
        child: Image.asset(
          'assets/icons/messenger.webp',
          height: 18,
          color: white,
        ),
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
  return CPopupMenuButton(
    items: [
      PopupMenuItem(
        value: 1,
        child: KText(text: 'অ্যাপ শেয়ার করুন'),
      ),
      PopupMenuItem(
        value: 2,
        child: KText(text: 'অ্যাপটিতে 5⭐ Star দিন'),
      ),
      PopupMenuItem(
        value: 3,
        child: KText(text: 'Career Forum/Discussion'),
      ),
      PopupMenuItem(
        value: 4,
        child: Row(
          children: [
            KText(text: 'More Options'),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 5,
        child: Row(
          children: [
            KText(text: 'Settings'),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: grey,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 6,
        child: KText(text: 'Exit'),
      ),
    ],
    onSelected: (int value) {
      print('You selected $value');
    },
  );
}
