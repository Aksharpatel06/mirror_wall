import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/home_provider.dart';
import 'package:mirror_wall/view/bookmarkscreen/bookmark_screen.dart';
import 'package:mirror_wall/view/historyscreen/history_screen.dart';
import 'package:mirror_wall/view/home_screen/componects/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../utils/global_variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providertrue = Provider.of<HomeProvider>(context);
    final providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: txtsearch,
          decoration: InputDecoration(
              hintText: 'Search or type address',
              filled: true,
              fillColor: Colors.grey.shade300,
              suffixIcon: IconButton(
                  onPressed: () {
                    providerfalse.onChangesearch(txtsearch.text);
                    if (providerfalse.uri.toString() ==
                        'https://duckduckgo.com/') {
                      inAppWebViewController.loadUrl(
                          urlRequest: URLRequest(
                              url: WebUri(
                                  '${providerfalse.uri}/?q=${providerfalse.searchText}&sca_esv=453cf80c9d34ac6b&sca_upv=1&rlz=1C1CHBD_enIN1099IN1101&sxsrf=ADLYWILO4ZE1r6P0Ha8wvoqAglAm7r1t5A%3A1716482160781&ei=cHBPZpCsL93V1e8PtZ-C2AM&ved=0ahUKEwiQpNOrmqSGAxXdavUHHbWPADsQ4dUDCBE&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyChAjGIAEGCcYigUyChAjGIAEGCcYigUyBBAjGCcyChAAGIAEGEMYigUyCxAAGIAEGLEDGIMBMggQABiABBixAzILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIoFMgsQABiABBixAxiDATIIEAAYgAQYsQNIphZQ5wpYnRJwAngBkAEBmAGmAqABug6qAQYwLjEyLjG4AQPIAQD4AQGYAgSgAskCwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABJgDAIgGAZAGCpIHAzIuMqAHgnM&sclient=gws-wiz-serp')));
                    } else {
                      inAppWebViewController.loadUrl(
                          urlRequest: URLRequest(
                              url: WebUri(
                                  '${providerfalse.uri}/search?q=${providerfalse.searchText}&sca_esv=453cf80c9d34ac6b&sca_upv=1&rlz=1C1CHBD_enIN1099IN1101&sxsrf=ADLYWILO4ZE1r6P0Ha8wvoqAglAm7r1t5A%3A1716482160781&ei=cHBPZpCsL93V1e8PtZ-C2AM&ved=0ahUKEwiQpNOrmqSGAxXdavUHHbWPADsQ4dUDCBE&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyChAjGIAEGCcYigUyChAjGIAEGCcYigUyBBAjGCcyChAAGIAEGEMYigUyCxAAGIAEGLEDGIMBMggQABiABBixAzILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIoFMgsQABiABBixAxiDATIIEAAYgAQYsQNIphZQ5wpYnRJwAngBkAEBmAGmAqABug6qAQYwLjEyLjG4AQPIAQD4AQGYAgSgAskCwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABJgDAIgGAZAGCpIHAzIuMqAHgnM&sclient=gws-wiz-serp')));
                    }
                  },
                  icon: const Icon(Icons.search)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                providerfalse.addToBookMark();
              },
              icon: const Icon(Icons.bookmark_add_outlined)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: CupertinoButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookMarkScreen(),
                          ));
                        }, child: Text('BookMark'))),
                PopupMenuItem(
                    child: CupertinoButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HistoeryScreen(),
                          ));
                        },
                        child: Text('History'))),
                PopupMenuItem(
                    child: CupertinoButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Column(children: [
                                  RadioListTile(
                                    value: 'https://www.google.com',
                                    groupValue: providertrue.uri.toString(),
                                    onChanged: (value) {
                                      providerfalse.Changewebview(value);
                                      Navigator.of(context).pop();
                                    },
                                    title: Text('Google'),
                                  ),
                                  RadioListTile(
                                    value: 'https://in.search.yahoo.com/',
                                    groupValue: providertrue.uri.toString(),
                                    onChanged: (value) {
                                      providerfalse.Changewebview(value);
                                      Navigator.of(context).pop();
                                    },
                                    title: Text('Yahoo'),
                                  ),
                                  RadioListTile(
                                    value: 'https://duckduckgo.com/',
                                    groupValue: providertrue.uri.toString(),
                                    onChanged: (value) {
                                      providerfalse.Changewebview(value);
                                      Navigator.of(context).pop();
                                    },
                                    title: Text('Duck Duck Go'),
                                  ),
                                  RadioListTile(
                                    value: 'https://www.bing.com/',
                                    groupValue: providertrue.uri.toString(),
                                    onChanged: (value) {
                                      providerfalse.Changewebview(value);
                                      Navigator.of(context).pop();
                                    },
                                    title: Text('Bing'),
                                  ),
                                ]),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel')),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Search  Engine'))),
              ];
            },
          ),
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
            onLoadStop: (controller, url) {
              providerfalse.checkIfShouldGoBack();
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
      bottomNavigationBar: bottomNaviagation(),
    );
  }
}
