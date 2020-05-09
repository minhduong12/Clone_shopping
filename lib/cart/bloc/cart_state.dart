import 'package:cloneshopping/catalog/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CartState extends Equatable{
  CartState();
}

class CartLoading extends CartState{
  @override
  // TODO: implement props
  List get props => [];
}

class CartLoaded extends CartState{
  final List<Item> items;
  
  CartLoaded({this.items});

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  @override
  List<Object> get props => [items];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}