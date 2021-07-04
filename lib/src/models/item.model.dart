import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final DateTime createdAt;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, quantity];
}
