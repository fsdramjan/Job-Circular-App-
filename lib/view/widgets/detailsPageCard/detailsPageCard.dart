import 'package:flutter/material.dart';
import 'package:job_circular_app/service/controllerService.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../card/customCard.dart';
import '../text/kText.dart';

Widget  detailsPageCard() {
  final _ = AllController();
  return StreamBuilder(
    stream: _.settingsC.getSettingsInfo(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return customCard(
          elevation: 0,
          color: white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: paddingAll10,
              child: KText(
                text: snapshot.data!.docs.first['details_page_ads'],
              ),
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}
