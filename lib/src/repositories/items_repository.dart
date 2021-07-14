import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listmania/src/models/create_item_input.model.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/models/update_item_input.model.dart';

class ItemsRepository {
  final _itemsCollection = FirebaseFirestore.instance.collection('items');

  Stream<List<Item>> getItemsStream() {
    return _itemsCollection.snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Item.fromSnapshot(doc)).toList(),
        );
  }

  Future<List<Item>> getItems() async {
    final itemsData = await _itemsCollection.get();

    return itemsData.docs.map((doc) => Item.fromSnapshot(doc)).toList();
  }

  Future<Item> createItem(CreateItemInput item) async {
    await Future.delayed(Duration(milliseconds: 1000));

    throw Exception();
  }

  Future<Item> updateItem(UpdateItemInput item) async {
    await Future.delayed(Duration(milliseconds: 1000));

    throw Exception();
  }

  Future<Item> deleteItem() async {
    await Future.delayed(Duration(milliseconds: 1000));

    throw Exception();
  }
}
