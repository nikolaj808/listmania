import 'package:listmania/src/models/create_item_input.model.dart';
import 'package:listmania/src/models/item.model.dart';
import 'package:listmania/src/models/update_item_input.model.dart';

class ItemsRepository {
  Future<List<Item>> getItems() async {
    await Future.delayed(Duration(milliseconds: 1000));

    throw Exception('Failed to load items');
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
