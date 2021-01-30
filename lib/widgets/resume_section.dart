import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/pdf_pager_model.dart';
import 'package:my_portfolio/utils.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';
import 'package:provider/provider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import '../data.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class ResumeSection extends StatelessWidget {
  Future<List<PdfPageImage>> getPdfPagesAsImage() async {
    final document = await PdfDocument.openAsset(data["resume-pdf"]);
    List<PdfPageImage> pages = [];
    for (int i = 1; i <= document.pagesCount; i++) {
      final page = await document.getPage(i);
      final pageImage =
          await page.render(width: page.width * 3, height: page.height * 3);
      await page.close();
      pages.add(pageImage);
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? 760
              : 380,
        ),
        child: FutureBuilder<List<PdfPageImage>>(
          future: getPdfPagesAsImage(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            List<PdfPageImage> pages = snapshot.data;
            return ChangeNotifierProvider(
              create: (context) => PdfPagerModel(maxPages: pages.length),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      js.context.callMethod(
                        "open",
                        [data["resume-download-url"]],
                      );
                    },
                    icon: Icon(Icons.file_download),
                    label: Text("Download"),
                  ),
                  SizedBox(height: 10),
                  PdfViewer(
                    pages: pages,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final List<PdfPageImage> pages;

  const PdfViewer({
    Key key,
    this.pages,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PdfPagerModel>(
      builder: (context, model, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                model.currentPage--;
              },
            ),
            Expanded(
              child: PinchZoomImage(
                image: Image.memory(
                  pages[model.currentPage].bytes,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                model.currentPage++;
              },
            ),
          ],
        );
      },
    );
  }
}
