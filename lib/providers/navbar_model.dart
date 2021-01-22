import 'package:flutter/cupertino.dart';

class NavBarModel extends ChangeNotifier {
  int _selectedItemIndex = 0;
  int get selectedItemIndex {
    return _selectedItemIndex;
  }

  set selectedItemIndex(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}
