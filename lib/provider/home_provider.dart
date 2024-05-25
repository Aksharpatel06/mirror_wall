import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  String searchText = '';
  double progress = 0;
  List<String> bookmarkList = [];
  String? currentUrl;

  void onChangeProgress(int progress){
    this.progress = progress / 100;
    notifyListeners();
  }

  void onChangesearch(String searchText){
    this.searchText = searchText;
    notifyListeners();
  }

  void setCurrentUrl(String url){
    currentUrl = url;
    notifyListeners();
  }

  void addToBookMark(){
    bookmarkList.add(currentUrl!);
    notifyListeners();
  }
}