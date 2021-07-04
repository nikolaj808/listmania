import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/cubits/items/items_cubit.dart';
import 'package:listmania/src/repositories/items_repository.dart';
import 'package:listmania/src/screens/home/home.screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemsRepository _itemsRepository = ItemsRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ItemsCubit(_itemsRepository)..getItems()),
      ],
      child: MaterialApp(
        title: 'Listmania',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Rubik',
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          primarySwatch: Colors.blueGrey,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
