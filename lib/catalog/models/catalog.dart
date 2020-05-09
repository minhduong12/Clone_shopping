import 'package:equatable/equatable.dart';

import 'item.dart';



class Catalog extends Equatable{
  List _itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  Item getByPosition(int position) => getById(position);

  int count() => _itemNames.length;

  void deleteItems (Item item)=> _itemNames.remove(item.name);

  @override
  List<Object> get props => [_itemNames];
}