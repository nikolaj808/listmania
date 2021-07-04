import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shoppinglists_state.dart';

class ShoppinglistsCubit extends Cubit<ShoppinglistsState> {
  ShoppinglistsCubit() : super(ShoppinglistsInitial());
}
