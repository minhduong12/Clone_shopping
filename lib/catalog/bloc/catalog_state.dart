import 'package:cloneshopping/catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class CatalogState extends Equatable{
  CatalogState();
}

class CatalogLoading extends CatalogState{
  @override
  // TODO: implement props
  List get props => [];
}

class CatalogLoaded extends CatalogState{
  final Catalog catalog;

  CatalogLoaded({this.catalog});

  @override
  // TODO: implement props
  List get props => [catalog];

  CatalogLoaded copyWith({
    Catalog catalog,
  }) {
    return CatalogLoaded(
      catalog: catalog ?? this.catalog,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Catalog Loaded";
  }
}

class CatalogError extends CatalogState{
  @override
  // TODO: implement props
  List get props => [];
}