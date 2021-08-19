import 'package:flutter/material.dart';
import 'package:listmania/src/models/shoppinglist.model.dart';
import 'package:listmania/src/widgets/shoppinglists/shoppinglist_tile.dart';

class ShoppinglistsLoaded extends StatelessWidget {
  final List<Shoppinglist> shoppinglists;

  const ShoppinglistsLoaded({
    Key? key,
    required this.shoppinglists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppinglists.length,
      itemBuilder: (context, index) {
        final shoppinglist = shoppinglists.elementAt(index);

        return ShoppinglistTile(shoppinglist: shoppinglist);
      },
    );
  }
}
