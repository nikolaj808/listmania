import 'package:flutter/material.dart';
import 'package:listmania/src/constants.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Center(
          child: Text('Hello, Create Item!'),
        ),
      ),
    );
  }
}
