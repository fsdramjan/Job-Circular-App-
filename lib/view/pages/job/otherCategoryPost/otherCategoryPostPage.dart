import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/components/otherCategoryPost/otherCategoryPostComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import '../../../../service/controllerService.dart';
import '../../../../service/willPopScope/willPopscope.dart';
import '../../home/homePage.dart';

class OtherCategoryPostPage extends StatelessWidget with AllController {
  final String? categoryId;
  final String? categoryName;

  OtherCategoryPostPage({
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopScope(routeName: HomePage()),
      child: Scaffold(
        drawer: sidebarComponent(),
        appBar: cAppBar(title: categoryName),
        body: Padding(
          padding: paddingAll10,
          child: ListView(
            children: [
              OtherCategoryPostComponent(
                categoryId: categoryId,
                isShowLoadmore: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
