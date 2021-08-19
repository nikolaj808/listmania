import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/cubits/shoppinglists/shoppinglists_cubit.dart';
import 'package:listmania/src/screens/shoppinglists/views/shoppinglists_empty.dart';
import 'package:listmania/src/screens/shoppinglists/views/shoppinglists_error.dart';
import 'package:listmania/src/screens/shoppinglists/views/shoppinglists_loaded.dart';
import 'package:listmania/src/screens/shoppinglists/views/shoppinglists_loading.dart';

class ShoppinglistsScreen extends StatelessWidget {
  const ShoppinglistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Shoppinglists',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: BlocBuilder<ShoppinglistsCubit, ShoppinglistsState>(
            builder: (context, state) {
              if (state.status == ShoppinglistsStatus.loading) {
                return ShoppinglistsLoading();
              } else if (state.status == ShoppinglistsStatus.empty) {
                return ShoppinglistsEmpty();
              } else if (state.status == ShoppinglistsStatus.loadError) {
                return ShoppinglistsError();
              }

              final shoppinglists = state.shoppinglists;

              return ShoppinglistsLoaded(shoppinglists: shoppinglists);
            },
          ),
        ),
      ],
    );
  }
}
