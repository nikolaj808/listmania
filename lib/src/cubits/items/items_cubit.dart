import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listmania/src/models/create_item_input.model.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/models/update_item_input.model.dart';
import 'package:listmania/src/repositories/items_repository.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final ItemsRepository itemsRepository;

  ItemsCubit(this.itemsRepository) : super(ItemsState());

  Future<void> getItems() async {
    emit(state.copyWith(status: ItemsStatus.loading));

    try {
      final items = await itemsRepository.getItems();

      emit(state.copyWith(items: items, status: ItemsStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: ItemsStatus.loadError));
    }
  }

  Future<void> createItem(CreateItemInput item) async {
    emit(state.copyWith(status: ItemsStatus.creating));

    try {
      final createdItem = await itemsRepository.createItem(item);

      final currentItems = state.items;

      emit(state.copyWith(
        items: [...currentItems, createdItem],
        status: ItemsStatus.created,
      ));
    } catch (_) {
      emit(state.copyWith(status: ItemsStatus.createError));
    }
  }

  Future<void> updateItem(UpdateItemInput item) async {
    emit(state.copyWith(status: ItemsStatus.updating));

    try {
      final itemToUpdateIndex = state.items.indexWhere((i) => i.id == item.id);

      final updatedItem = await itemsRepository.updateItem(item);

      final currentItems = state.items;

      currentItems.replaceRange(
        itemToUpdateIndex,
        itemToUpdateIndex + 1,
        [updatedItem],
      );

      emit(state.copyWith(items: currentItems, status: ItemsStatus.updated));
    } catch (_) {
      emit(state.copyWith(status: ItemsStatus.updateError));
    }
  }

  Future<void> deleteItem(String id) async {
    emit(state.copyWith(status: ItemsStatus.deleting));

    try {
      final currentItems = state.items;

      currentItems.removeWhere((i) => i.id == id);

      emit(state.copyWith(items: currentItems, status: ItemsStatus.deleted));
    } catch (_) {
      emit(state.copyWith(status: ItemsStatus.deleteError));
    }
  }
}
