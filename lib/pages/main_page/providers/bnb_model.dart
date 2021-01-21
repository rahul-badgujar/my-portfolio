import 'package:flutter/cupertino.dart';

class BnbModel extends ChangeNotifier {
  int _currentSelectedItemIndex = 0;
  int get currentSelectedItemIndex {
    return _currentSelectedItemIndex;
  }

  set currentSelectedItemIndex(int index) {
    _currentSelectedItemIndex = index;
    notifyListeners();
  }
}
