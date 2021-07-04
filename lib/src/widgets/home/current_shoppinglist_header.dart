import 'package:flutter/material.dart';
import 'package:listmania/src/constants.dart';

class CurrentShoppinglistHeader extends StatelessWidget {
  final String shoppinglistName;

  const CurrentShoppinglistHeader({
    Key? key,
    required this.shoppinglistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultHorizontalPadding),
      child: Text(
        shoppinglistName,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
