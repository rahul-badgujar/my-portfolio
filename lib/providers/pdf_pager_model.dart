import 'package:flutter/cupertino.dart';

class PdfPagerModel extends ChangeNotifier {
  int _currentPage = 0;
  int maxPages;

  PdfPagerModel({this.maxPages});

  int get currentPage {
    return _currentPage;
  }

  set currentPage(int index) {
    _currentPage = index % maxPages;
    notifyListeners();
  }
}
