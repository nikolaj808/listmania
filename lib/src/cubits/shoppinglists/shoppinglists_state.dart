part of 'shoppinglists_cubit.dart';

enum ShoppinglistsStatus {
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

class ShoppinglistsState extends Equatable {
  final List<Shoppinglist> shoppinglists;
  final ShoppinglistsStatus status;

  const ShoppinglistsState({
    this.shoppinglists = const [],
    this.status = ShoppinglistsStatus.initial,
  });

  ShoppinglistsState copyWith({
    List<Shoppinglist>? shoppinglists,
    ShoppinglistsStatus? status,
  }) {
    return ShoppinglistsState(
      shoppinglists: shoppinglists ?? this.shoppinglists,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [shoppinglists, status];
}
