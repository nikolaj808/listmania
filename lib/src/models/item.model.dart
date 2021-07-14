import 'package:cloud_firestore/cloud_firestore.dart';
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

  Item copyWith({
    String? id,
    String? name,
    int? quantity,
    DateTime? createdAt,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Item.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return Item(
      id: snapshot.id,
      name: data['name'],
      quantity: data['quantity'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['createdAt']),
    );
  }

  @override
  List<Object?> get props => [id, name, quantity];
}
