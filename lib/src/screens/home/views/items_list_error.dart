import 'package:flutter/material.dart';

class ItemsListError extends StatelessWidget {
  const ItemsListError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('An error occurred trying to load the items...'),
    );
  }
}
