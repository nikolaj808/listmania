part of 'items_cubit.dart';

enum ItemsStatus {
  initial,
  loading,
  empty,
  creating,
  updating,
  deleting,
  loaded,
  created,
  updated,
  deleted,
  loadError,
  createError,
  updateError,
  deleteError,
}

class ItemsState extends Equatable {
  final List<Item> items;
  final ItemsStatus status;

  const ItemsState({
    this.items = const [],
    this.status = ItemsStatus.initial,
  });

  ItemsState copyWith({
    List<Item>? items,
    ItemsStatus? status,
  }) {
    return ItemsState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [items, status];
}
