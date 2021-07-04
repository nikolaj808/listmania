import 'package:flutter/material.dart';

class ItemsListEmpty extends StatelessWidget {
  const ItemsListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('There were no items to be found...'),
    );
  }
}
