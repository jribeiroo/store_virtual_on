import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/page_maneger.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController) , //cria o objeto do provider passar o PageController
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer() ,
            appBar:  AppBar(
              title: const Text('home'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar:  AppBar(
              title: const Text('home2'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar:  AppBar(
              title: const Text('home3'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer() ,
            appBar:  AppBar(
              title: const Text('home4'),
            ),
          ),
          // Container(color: Colors.red,),
          // Container(color: Colors.yellow),
          // Container(color: Colors.blue),
        ],
      ),
    );
  }
}