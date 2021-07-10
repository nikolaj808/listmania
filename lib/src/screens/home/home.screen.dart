import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/constants.dart';
import 'package:listmania/src/cubits/items/items_cubit.dart';
import 'package:listmania/src/screens/home/views/items_list_empty.dart';
import 'package:listmania/src/screens/home/views/items_list_error.dart';
import 'package:listmania/src/screens/home/views/items_list_loaded.dart';
import 'package:listmania/src/screens/home/views/items_list_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
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
      body: SafeArea(
        child: BlocBuilder<ItemsCubit, ItemsState>(
          builder: (context, state) {
            if (state.status == ItemsStatus.loading) {
              return ItemsListLoading();
            } else if (state.status == ItemsStatus.empty) {
              return ItemsListEmpty();
            } else if (state.status == ItemsStatus.loadError) {
              return ItemsListError();
            }

            final items = state.items;

            return ItemsListLoaded(items: items);
          },
        ),
      ),
    );
  }
}
