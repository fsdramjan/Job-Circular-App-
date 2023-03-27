import 'package:flutter/material.dart';

import '../../components/drawer/sidebarComponent.dart';
import '../appBar/cAppBar.dart';

class CustomViewImage extends StatelessWidget {
  final String? imageUrl;
  final String? title;

  CustomViewImage({
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: title),
      body: Container(
        child: Image.network(
          imageUrl.toString(),
        ),
      ),
    );
  }
}
