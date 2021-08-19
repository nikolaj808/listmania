import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseRepository<T, CreateInput, UpdateInput> {
  late CollectionReference<Map<String, dynamic>> collection;

  Stream<List<T>> getStream();

  Future<List<T>> getAll();

  Future<T> get(String id);

  Future<T> create(CreateInput createInput);

  Future<T> update(UpdateInput updateInput);

  Future<T> delete(String id);
}
