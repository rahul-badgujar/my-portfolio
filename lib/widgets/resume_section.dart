import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../data.dart';

class ResumeSection extends StatelessWidget {
  final pdfController = PdfController(
    document: PdfDocument.openAsset(data["resume"]),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PdfView(
        controller: pdfController,
      ),
    );
  }
}
