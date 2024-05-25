import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class HistoeryScreen extends StatelessWidget {
  const HistoeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providertrue = Provider.of<HomeProvider>(context);
    final providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('History Lists'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(providertrue.historyList.length, (index) => ListTile(
              onTap: () {
                providerfalse.openWebsite(providertrue.historyList[index].url);
                Navigator.pop(context);
              },
              title: Text(providertrue.historyList[index].title),
              subtitle: Text(providertrue.historyList[index].url,overflow: TextOverflow.ellipsis,),
              trailing: CupertinoButton(
                onPressed: () {
                  providerfalse.removeHistory(index);
                },
                child: Icon(Icons.cancel),
              ),
            ))
        ),
      ),
    );
  }
}
