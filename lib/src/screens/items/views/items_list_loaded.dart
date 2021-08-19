import 'package:flutter/material.dart';
import 'package:listmania/src/constants.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/widgets/home/current_shoppinglist_header.dart';
import 'package:listmania/src/widgets/home/items_list.dart';

class ItemsListLoaded extends StatelessWidget {
  final List<Item> items;

  const ItemsListLoaded({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: kDefaultVerticalPadding),
        CurrentShoppinglistHeader(shoppinglistName: 'Bøllehatten 9'),
        SizedBox(height: kDefaultVerticalPadding),
        Expanded(child: ItemsList(items: items)),
      ],
    );
  }
}
