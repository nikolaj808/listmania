import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listmania/src/models/create_item_input.model.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/models/update_item_input.model.dart';
import 'package:listmania/src/repositories/firebase_repository.dart';

class ItemsRepository
    implements FirebaseRepository<Item, CreateItemInput, UpdateItemInput> {
  @override
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('items');

  @override
  Future<Item> create(CreateItemInput createInput) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Item> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Item> get(String id) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Item>> getAll() async {
    final itemsData = await collection.get();

    return itemsData.docs.map((doc) => Item.fromSnapshot(doc)).toList();
  }

  @override
  Stream<List<Item>> getStream() {
    return collection.snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Item.fromSnapshot(doc)).toList(),
        );
  }

  @override
  Future<Item> update(UpdateItemInput updateInput) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
