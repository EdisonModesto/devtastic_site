import 'package:flutter/cupertino.dart';

class PageProvider with ChangeNotifier {
  PageController pageController = PageController();
  var isPaused = false;

  void setPage(int page) {
    pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCirc);
    notifyListeners();
  }

  void pause(){
    isPaused = true;
    notifyListeners();

  }
  void resume(){
    isPaused = false;
    notifyListeners();

  }
}