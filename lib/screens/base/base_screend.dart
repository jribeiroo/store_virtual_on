import 'package:flutter/material.dart';

import '../../common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          drawer: CustomDrawer() ,
          appBar:  AppBar(
            title: const Text('home'),
          ),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow),
        Container(color: Colors.blue),
      ],
    );
  }
}