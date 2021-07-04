import 'package:flutter/material.dart';
import 'package:listmania/src/constants.dart';
import 'package:listmania/src/models/item.model.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultVerticalPadding,
        horizontal: kDefaultHorizontalPadding / 2,
      ),
      child: ListTile(
        title: Text('Test'),
        trailing: Text('x21', style: Theme.of(context).textTheme.subtitle2),
        leading: Icon(Icons.delete_rounded),
        tileColor: kListTileColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(12, 20),
            topLeft: Radius.elliptical(28, 36),
            bottomRight: Radius.elliptical(36, 28),
            topRight: Radius.elliptical(20, 12),
          ),
        ),
      ),
    );
  }
}
