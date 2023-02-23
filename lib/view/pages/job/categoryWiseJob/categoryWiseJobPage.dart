import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';

import '../../../components/drawer/sidebarComponent.dart';
import '../../../components/job/jobListComponent.dart';

class CategoryWiseJobPage extends StatelessWidget {
  final String? title;
  CategoryWiseJobPage({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: title),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: JobListComponent(),
                  );
                }),
            sizeH10,
          ],
        ),
      ),
    );
  }
}
