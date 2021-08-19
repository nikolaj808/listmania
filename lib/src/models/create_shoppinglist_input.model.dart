import 'package:equatable/equatable.dart';

class CreateShoppinglistInput extends Equatable {
  final String name;
  final String ownerId;
  final List<String> memberIds;
  final DateTime createdAt;

  CreateShoppinglistInput({
    required this.name,
    required this.ownerId,
    required this.memberIds,
    required this.createdAt,
  });

  CreateShoppinglistInput copyWith({
    String? name,
    String? ownerId,
    List<String>? memberIds,
    DateTime? createdAt,
  }) {
    return CreateShoppinglistInput(
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'name': name,
      'ownerId': ownerId,
      'memberIds': memberIds.toList(),
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  @override
  List<Object?> get props => [name, ownerId, ...memberIds, createdAt];
}
