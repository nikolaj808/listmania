import 'package:flutter/material.dart';

class ShoppinglistsLoading extends StatelessWidget {
  const ShoppinglistsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
