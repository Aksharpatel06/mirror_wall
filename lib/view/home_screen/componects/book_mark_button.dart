import 'package:flutter/material.dart';

import '../../../provider/home_provider.dart';

IconButton bookmarkButton(HomeProvider providerfalse) {
  return IconButton(
      onPressed: () {
        providerfalse.addToBookMark();
      },
      icon: const Icon(Icons.bookmark_add_outlined));
}
