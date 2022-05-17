import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({ Key? key, this.iconData, this.title, this.page }) : super(key: key);

  final IconData? iconData;
  final String? title;
  final int? page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        debugPrint('toquei aqui  $page',);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:32),// espaçamentos entre itens do drawer
              child: Icon(
                iconData,
                size: 32,
                color: Colors.grey[700],
              ),
            ),
            Text(
              title!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              )
      
            )
          ],
        ),
      ),
    );
  }
}