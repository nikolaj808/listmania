import 'package:flutter/material.dart';

class ItemsListLoading extends StatelessWidget {
  const ItemsListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
