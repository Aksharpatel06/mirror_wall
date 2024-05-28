import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/global_variable.dart';
import '../../../provider/home_provider.dart';

class BottomNaviagation extends StatelessWidget {
  const BottomNaviagation({super.key});

  @override
  Widget build(BuildContext context) {
    final providertrue = Provider.of<HomeProvider>(context);
    final providerfalse = Provider.of<HomeProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: providertrue.isGoBack?(){
           providerfalse.goBack();
        }:null, icon: const Icon(CupertinoIcons.left_chevron)),
        IconButton(onPressed: providertrue.isGoForwad?() {
          providerfalse.goForward();
        }:null, icon: const Icon(CupertinoIcons.right_chevron)),
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
}
