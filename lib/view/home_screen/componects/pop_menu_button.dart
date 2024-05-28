import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../provider/home_provider.dart';
import '../../bookmarkscreen/bookmark_screen.dart';
import '../../historyscreen/history_screen.dart';

PopupMenuButton<dynamic> popMenuCreated(
    HomeProvider providertrue, HomeProvider providerfalse) {
  return PopupMenuButton(
    itemBuilder: (context) {
      return [
        PopupMenuItem(
            child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BookMarkScreen(),
                  ));
                },
                child: const Text('BookMark'))),
        PopupMenuItem(
            child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoeryScreen(),
                  ));
                },
                child: const Text('History'))),
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
                            title: const Text('Google'),
                          ),
                          RadioListTile(
                            value: 'https://in.search.yahoo.com/',
                            groupValue: providertrue.uri.toString(),
                            onChanged: (value) {
                              providerfalse.Changewebview(value);
                              Navigator.of(context).pop();
                            },
                            title: const Text('Yahoo'),
                          ),
                          RadioListTile(
                            value: 'https://duckduckgo.com/',
                            groupValue: providertrue.uri.toString(),
                            onChanged: (value) {
                              providerfalse.Changewebview(value);
                              Navigator.of(context).pop();
                            },
                            title: const Text('Duck Duck Go'),
                          ),
                          RadioListTile(
                            value: 'https://www.bing.com/',
                            groupValue: providertrue.uri.toString(),
                            onChanged: (value) {
                              providerfalse.Changewebview(value);
                              Navigator.of(context).pop();
                            },
                            title: const Text('Bing'),
                          ),
                        ]),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel')),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Search  Engine'))),
      ];
    },
  );
}
