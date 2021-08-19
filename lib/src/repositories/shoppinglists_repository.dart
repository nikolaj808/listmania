import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listmania/src/models/create_shoppinglist_input.model.dart';
import 'package:listmania/src/models/shoppinglist.model.dart';
import 'package:listmania/src/models/update_shoppinglist_input.model.dart';
import 'package:listmania/src/repositories/firebase_repository.dart';

class ShoppinglistsRepository
    implements
        FirebaseRepository<Shoppinglist, CreateShoppinglistInput,
            UpdateShoppinglistInput> {
  @override
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('shoppinglists');

  @override
  Future<Shoppinglist> create(CreateShoppinglistInput createInput) async {
    final newShoppinglistDocument = await collection.add(
      createInput.toDocument(),
    );

    final newShoppinglistData = await newShoppinglistDocument.get();

    return Shoppinglist.fromJson(
      newShoppinglistData.id,
      newShoppinglistData.data()!,
    );
  }

  @override
  Future<Shoppinglist> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Shoppinglist> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Shoppinglist>> getAll() async {
    final shoppinglistsData = await collection.get();

    return shoppinglistsData.docs
        .map((doc) => Shoppinglist.fromSnapshot(doc))
        .toList();
  }

  @override
  Stream<List<Shoppinglist>> getStream() {
    // TODO: implement getStream
    throw UnimplementedError();
  }

  @override
  Future<Shoppinglist> update(UpdateShoppinglistInput updateInput) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
