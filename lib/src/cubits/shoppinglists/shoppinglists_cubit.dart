import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listmania/src/models/create_shoppinglist_input.model.dart';
import 'package:listmania/src/models/shoppinglist.model.dart';
import 'package:listmania/src/repositories/shoppinglists_repository.dart';

part 'shoppinglists_state.dart';

class ShoppinglistsCubit extends Cubit<ShoppinglistsState> {
  final ShoppinglistsRepository shoppinglistsRepository;

  ShoppinglistsCubit({
    required this.shoppinglistsRepository,
  }) : super(ShoppinglistsState());

  Future<void> getShoppinglists() async {
    emit(state.copyWith(status: ShoppinglistsStatus.loading));

    try {
      final shoppinglists = await shoppinglistsRepository.getAll();

      _resetState(shoppinglists: shoppinglists);
    } catch (e) {
      emit(state.copyWith(status: ShoppinglistsStatus.loadError));
    }
  }

  Future<void> createShoppinglist(
      CreateShoppinglistInput createShoppinglistInput) async {
    emit(state.copyWith(status: ShoppinglistsStatus.creating));

    try {
      final newShoppinglist =
          await shoppinglistsRepository.create(createShoppinglistInput);

      emit(state.copyWith(
        shoppinglists: [
          ...state.shoppinglists,
          newShoppinglist,
        ],
        status: ShoppinglistsStatus.created,
      ));

      _resetState();
    } catch (e) {
      emit(state.copyWith(status: ShoppinglistsStatus.createError));

      _resetState();
    }
  }

  void _resetState({List<Shoppinglist>? shoppinglists}) {
    if (shoppinglists == null) {
      final currentShoppinglists = state.shoppinglists;

      emit(state.copyWith(
        shoppinglists: state.shoppinglists,
        status: currentShoppinglists.length <= 0
            ? ShoppinglistsStatus.empty
            : ShoppinglistsStatus.loaded,
      ));
    } else {
      emit(state.copyWith(
        shoppinglists: shoppinglists,
        status: shoppinglists.length <= 0
            ? ShoppinglistsStatus.empty
            : ShoppinglistsStatus.loaded,
      ));
    }
  }
}
