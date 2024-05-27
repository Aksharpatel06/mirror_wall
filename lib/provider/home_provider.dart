import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/modal/bookmark_modal.dart';
import 'package:mirror_wall/utils/global_variable.dart';

class HomeProvider extends ChangeNotifier{
  String searchText = '';
  double progress = 0;
  List<BookMarkmodal> bookmarkList = [];
  List<BookMarkmodal> historyList =[];
  String? currentUrl;
  String? title;

  bool isGoBack = false;
  bool isGoForwad = false;
  BookMarkmodal? bookMarkmodal;
  WebUri uri= WebUri('https://www.google.com');

  void onChangeProgress(int progress){
    this.progress = progress / 100;
    notifyListeners();
  }

  void onChangesearch(String searchText){
    this.searchText = searchText;
    notifyListeners();
  }

  Future<void> setCurrentUrl(url)  async {
    currentUrl =  url.toString();
    title =await inAppWebViewController.getTitle();
    bookMarkmodal = BookMarkmodal(title: title!, url:currentUrl!);
    historyList.add(bookMarkmodal!);
    notifyListeners();
  }

  void addToBookMark(){
    bookmarkList.add(bookMarkmodal!);
    notifyListeners();
  }

  void removeHistory(int index)
  {
    historyList.removeAt(index);
    notifyListeners();
  }

  void removeBookMark(int index)
  {
    bookmarkList.removeAt(index);
    notifyListeners();
  }

  void openWebsite(url)
  {
    currentUrl = url;
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: WebUri(currentUrl!)));
    notifyListeners();
  }

  void Changewebview(value)
  {
    uri = WebUri(value);
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: uri));
    notifyListeners();
  }

  Future<void> goBack() async {
    await inAppWebViewController.goBack();
    notifyListeners();
  }

  // Future<void> browerGoBack()
  // async {
  //   isGoBack= await inAppWebViewController.canGoBack();
  //   notifyListeners();
  // }

  Future<void> goForward()
  async {
    await inAppWebViewController.goForward();
    notifyListeners();
  }

  // Future<void> browerGoForwad()
  // async {
  //   isGoBack= await inAppWebViewController.canGoForward();
  //   notifyListeners();
  // }

  Future<void> checkIfShouldGoBack() async {
    if (uri.toString() == 'https://www.google.com/' ||
        uri.toString() == 'https://in.search.yahoo.com/?fr2=inr' ||
        uri.toString() == 'https://www.bing.com/' ||
        uri.toString() == 'https://duckduckgo.com/') {
      isGoBack = false;
      isGoForwad = false;
      notifyListeners();
    } else {
      isGoBack = await inAppWebViewController.canGoBack();
      isGoForwad = await inAppWebViewController.canGoForward();
      notifyListeners();
    }
  }
}