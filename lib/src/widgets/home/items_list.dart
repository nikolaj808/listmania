import 'package:flutter/material.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/widgets/home/item_tile.dart';

class ItemsList extends StatelessWidget {
  final List<Item> items;

  const ItemsList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items.elementAt(index);

        return ItemTile(item: item);
      },
    );
  }
}
