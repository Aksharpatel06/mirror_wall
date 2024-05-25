import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/global_variable.dart';

Row bottomNaviagation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(onPressed: (){
        inAppWebViewController.goBack();
      }, icon: const Icon(CupertinoIcons.left_chevron)),
      IconButton(onPressed: () {
        inAppWebViewController.goForward();
      }, icon: const Icon(CupertinoIcons.right_chevron)),
      IconButton(onPressed: () {
        inAppWebViewController.reload();
      }, icon: const Icon(CupertinoIcons.refresh_thick)),
      IconButton(onPressed: () {

      }, icon: const Icon(Icons.add_box_outlined)),
      IconButton(onPressed: () {

      }, icon: const Icon(CupertinoIcons.home)),
    ],
  );
}
