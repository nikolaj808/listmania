import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/cubits/auth/auth_cubit.dart';
import 'package:listmania/src/cubits/items/items_cubit.dart';
import 'package:listmania/src/cubits/shoppinglists/shoppinglists_cubit.dart';
import 'package:listmania/src/repositories/auth_repository.dart';
import 'package:listmania/src/repositories/items_repository.dart';
import 'package:listmania/src/repositories/shoppinglists_repository.dart';
import 'package:listmania/src/screens/splash/splash.screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authRepository = AuthRepository();
    final _shoppinglistsRepository = ShoppinglistsRepository();
    final _itemsRepository = ItemsRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            authRepository: _authRepository,
          )..initialize(),
        ),
        BlocProvider(
          create: (_) => ShoppinglistsCubit(
            shoppinglistsRepository: _shoppinglistsRepository,
          )..getShoppinglists(),
        ),
        BlocProvider(
          create: (_) => ItemsCubit(
            itemsRepository: _itemsRepository,
          )..getItems(),
        ),
      ],
      child: MaterialApp(
        title: 'Listmania',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Rubik',
          brightness: Brightness.light,
          accentColor: Color(0xFFF96E46),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
