import 'package:flutter/material.dart';
import 'package:listmania/src/constants.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: Hero(
        tag: 'BottomBarFab',
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, value) {
              return Transform.rotate(
                angle: animation.value * 1.75,
                child: toHeroContext.widget,
              );
            },
          );
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            customBorder: CircleBorder(),
            child: Ink(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryIconTheme.color,
                  size: 48 * .6,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Hero(
        tag: 'BottomBar',
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Lists',
              icon: Icon(Icons.shopping_cart_rounded),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Hello, Create Item!'),
        ),
      ),
    );
  }
}
