import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/page_maneger.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key, this.iconData, this.title, this.page})
      : super(key: key);

  final IconData? iconData;
  final String? title;
  final int? page;

  @override
  Widget build(BuildContext context) {
    final int curPage =
        context.watch<PageManager>().page; // pega a pagina atual
    final Color primaryColor = Theme.of(context)
        .primaryColor; //pega cor primaria do app vindo da main.dart
    return InkWell(
      onTap: () {
        context
            .read<PageManager>()
            .setPage(page!); //pega o provider e seta a pagina
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 32), // espaçamentos entre itens do drawer
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(title!,
                style: TextStyle(
                  fontSize: 16,
                  color: curPage == page ? primaryColor : Colors.grey[700],
                ))
          ],
        ),
      ),
    );
  }
}
