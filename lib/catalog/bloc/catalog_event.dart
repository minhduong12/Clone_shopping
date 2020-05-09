import 'package:cloneshopping/catalog/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CatalogEvent extends Equatable{}

class LoadCatalog extends CatalogEvent{
  @override
  // TODO: implement props
  List get props => [];
}

class DeleteCatalog extends CatalogEvent{
  final Item item;

  DeleteCatalog(this.item);
  // TODO: implement props
  List get props => [];
}