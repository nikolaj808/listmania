import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listmania/src/models/shoppinglist.model.dart';
import 'package:listmania/src/screens/items/items.screen.dart';

class ShoppinglistTile extends StatelessWidget {
  final Shoppinglist shoppinglist;

  const ShoppinglistTile({
    Key? key,
    required this.shoppinglist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedBuilder: (context, action) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            width: 40,
            height: 40,
            child: Center(
              child: Text(shoppinglist.name[0]),
            ),
          ),
          title: Text(shoppinglist.name),
          subtitle: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('items')
                .where('shoppinglistId', isEqualTo: shoppinglist.id)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              }

              if (snapshot.hasData) {
                final numberOfProducts = snapshot.data!.size;

                return Text('$numberOfProducts products');
              }

              return LinearProgressIndicator();
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 28,
                width: 28,
                child: ClipOval(
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/a/a0/Arh-avatar.jpg'),
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
        );
      },
      openElevation: 0,
      openBuilder: (context, action) {
        return ItemsScreen(shoppinglist: shoppinglist);
      },
    );
  }
}
