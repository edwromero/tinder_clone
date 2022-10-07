import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinder_clone/pages/accountPage.dart';
import 'package:tinder_clone/pages/chatPages.dart';
import 'package:tinder_clone/pages/explorePage.dart';
import 'package:tinder_clone/pages/likesPage.dart';

import '../theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var items = [
      pageIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      pageIndex == 1
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      pageIndex == 2
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 3
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...List.generate(items.length, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  icon: SvgPicture.asset(items[index].toString()),
                );
              })
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: [
          ExplorePage(),
          LikesPage(),
          ChatPages(),
          AccountPage(),
        ],
      ),
    );
  }
}
