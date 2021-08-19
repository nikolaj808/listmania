import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:listmania/src/cubits/auth/auth_cubit.dart';
import 'package:listmania/src/screens/create_shoppinglist/create_shoppinglist.screen.dart';
import 'package:listmania/src/screens/login/login.screen.dart';
import 'package:listmania/src/screens/profile/profile.screen.dart';
import 'package:listmania/src/screens/shoppinglists/shoppinglists.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Duration _kPageAnimationDuration = const Duration(milliseconds: 300);

  late PageController _pageController;

  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _currentIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _currentIndex == 0
          ? OpenContainer(
              closedElevation: 0,
              closedColor: Colors.transparent,
              closedBuilder: (context, action) => FloatingActionButton.extended(
                onPressed: null,
                elevation: 0,
                label: Text('Create new list'),
                icon: Icon(Icons.add_rounded),
                backgroundColor: Theme.of(context).accentColor,
              ),
              openElevation: 0,
              openBuilder: (context, action) => CreateShoppinglistScreen(),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                context.read<AuthCubit>().signOut();

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              elevation: 0,
              label: Text('Logout'),
              icon: Icon(Icons.logout_rounded),
              backgroundColor: Theme.of(context).accentColor,
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() => _currentIndex = index);

          _pageController.animateToPage(
            index,
            duration: _kPageAnimationDuration,
            curve: Curves.ease,
          );
        },
        selectedIconTheme: IconThemeData(size: 26),
        elevation: 0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.list),
            label: '',
            tooltip: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: '',
            tooltip: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) => setState(() => _currentIndex = index),
          controller: _pageController,
          children: [
            ShoppinglistsScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
