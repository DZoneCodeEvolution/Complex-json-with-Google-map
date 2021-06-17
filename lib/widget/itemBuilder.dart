import 'package:flutter/material.dart';

class ItemBuilder extends StatelessWidget {
  final catelog;

  const ItemBuilder({ @required this.catelog}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(catelog.name),


                ],
              ),
            )
          ],
        ));
  }
}

