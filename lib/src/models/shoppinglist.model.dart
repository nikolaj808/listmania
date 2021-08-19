import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Shoppinglist extends Equatable {
  final String id;
  final String name;
  final String ownerId;
  final List<String> memberIds;
  final DateTime createdAt;

  Shoppinglist({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.memberIds,
    required this.createdAt,
  });

  Shoppinglist copyWith({
    String? id,
    String? name,
    String? ownerId,
    List<String>? memberIds,
    DateTime? createdAt,
  }) {
    return Shoppinglist(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Shoppinglist.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return Shoppinglist(
      id: snapshot.id,
      name: data['name'],
      ownerId: data['ownerId'],
      memberIds: (data['memberIds'] as List<dynamic>).cast<String>(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['createdAt']),
    );
  }

  factory Shoppinglist.fromJson(
    String id,
    Map<String, dynamic> json,
  ) {
    return Shoppinglist(
      id: id,
      name: json['name'],
      ownerId: json['ownerId'],
      memberIds: (json['memberIds'] as List<dynamic>).cast<String>(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
    );
  }

  @override
  List<Object?> get props => [id, name, ownerId, ...memberIds, createdAt];
}
