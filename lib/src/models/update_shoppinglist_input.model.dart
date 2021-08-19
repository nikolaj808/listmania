import 'package:equatable/equatable.dart';

class UpdateShoppinglistInput extends Equatable {
  final String id;
  final String name;

  UpdateShoppinglistInput({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
