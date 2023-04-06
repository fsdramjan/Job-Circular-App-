import 'package:flutter/material.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../components/drawer/sidebarComponent.dart';
import '../../widgets/card/customCard.dart';
import '../../widgets/text/kText.dart';

class TermsConditionsPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Terms & Conditions'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            StreamBuilder(
              stream: settingsC.getSettingsInfo(),
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
                          text: snapshot.data!.docs.first['termsConditions'],
                          color: black54,
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
            ),
          ],
        ),
      ),
    );
  }
}
