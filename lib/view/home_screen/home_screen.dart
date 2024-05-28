import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/home_provider.dart';
import 'package:mirror_wall/view/bookmarkscreen/bookmark_screen.dart';
import 'package:mirror_wall/view/historyscreen/history_screen.dart';
import 'package:mirror_wall/view/home_screen/componects/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../utils/global_variable.dart';
import 'componects/book_mark_button.dart';
import 'componects/pop_menu_button.dart';
import 'componects/search_bar_textFiled.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providertrue = Provider.of<HomeProvider>(context);
    final providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        //Text filed
        title: searchBar(providerfalse),
        actions: [
          //Book Mark Button
          bookmarkButton(providerfalse),
          //Pop Menu Button
          popMenuCreated(providertrue, providerfalse),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('https://www.google.com'),
            ),
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            onProgressChanged: (controller, progresss) {
              providerfalse.onChangeProgress(progresss);
            },
            onLoadStart: (controller, url) {
              providerfalse.checkIfShouldGoBack();
            },
            onLoadStop: (controller, url) {
              providerfalse.setCurrentUrl(url);
              pullToRefreshController.endRefreshing();
            },
            pullToRefreshController: pullToRefreshController,
          ),
          (providertrue.progress < 1)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(value: providertrue.progress))
              : Container(),
        ],
      ),
      bottomNavigationBar: const bottomNaviagation(),
    );
  }
}