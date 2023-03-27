import 'package:flutter/material.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../appBar/cAppBar.dart';

class CustomPdfViewer extends StatelessWidget {
  final String? pdfViewUrl;
  final String? fileName;

  CustomPdfViewer({
    required this.fileName,
    required this.pdfViewUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: fileName),
      body: Container(
        child: SfPdfViewer.network(
          pdfViewUrl.toString(),
        ),
      ),
    );
  }
}
