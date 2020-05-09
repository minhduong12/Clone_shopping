import 'package:cloneshopping/catalog/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CartEvent extends Equatable{
  CartEvent();
}

class LoadCart extends CartEvent{
  @override
  // TODO: implement props
  List get props => super.props;
}

class AddItem extends CartEvent{
  final Item item;

  AddItem(this.item);

  @override
  // TODO: implement props
  List get props => [item];
}

class DeleteItem extends CartEvent{
  final Item item;

  DeleteItem(this.item);

  @override
  // TODO: implement props
  List get props => [item];
}