import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ListmaniaUser extends Equatable {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;
  final DateTime createdAt;

  ListmaniaUser({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.createdAt,
  });

  ListmaniaUser copyWith({
    String? id,
    String? displayName,
    String? email,
    String? photoUrl,
    DateTime? createdAt,
  }) {
    return ListmaniaUser(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ListmaniaUser.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    return ListmaniaUser(
      id: snapshot.id,
      displayName: data['displayName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['createdAt']),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  @override
  List<Object?> get props => [id, displayName, email, photoUrl, createdAt];
}
