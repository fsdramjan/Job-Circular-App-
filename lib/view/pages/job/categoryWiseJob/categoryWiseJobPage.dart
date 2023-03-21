import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import '../../../components/category/categoryWiseJobComponent.dart';
import '../../../components/drawer/sidebarComponent.dart';

class CategoryWiseJobPage extends StatelessWidget {
  final String? title;
  final String? categoryId;
  CategoryWiseJobPage({
    required this.title,
      this.categoryId,
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
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CategorywiseJobComponent(
                categoryId: categoryId.toString(),
              ),
            ),
            sizeH10,
          ],
        ),
      ),
    );
  }
}
