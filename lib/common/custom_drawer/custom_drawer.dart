// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          DrawerTile(iconData: Icons.home, title: 'inicio', page: 0),
          DrawerTile(iconData: Icons.list, title: 'produtos', page: 1),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus pedidos' , page: 2),
          DrawerTile(iconData: Icons.location_on, title: 'lojas' , page: 3),
        ],
      )
    );
  }
}
