import 'package:equatable/equatable.dart';

class CreateItemInput extends Equatable {
  final String name;
  final int quantity;

  CreateItemInput({
    required this.name,
    required this.quantity,
  });

  @override
  List<Object?> get props => [name, quantity];
}
