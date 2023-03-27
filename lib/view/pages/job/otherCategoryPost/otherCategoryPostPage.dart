import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/components/otherCategoryPost/otherCategoryPostComponent.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../../../service/controllerService.dart';

class OtherCategoryPostPage extends StatelessWidget with AllController {
  final String? categoryId;
  final String? categoryName;

  OtherCategoryPostPage({
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: '$categoryName',
          fontSize: 16,
          color: white,
          fontWeight: FontWeight.w600,
        ),
      ),
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
    );
  }
}
