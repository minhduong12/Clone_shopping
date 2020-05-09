import 'package:cloneshopping/catalog/models/catalog.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
   final Catalog _catalog;
   final List<int> _itemIds;

   Cart(this._catalog, Cart previous)
     : assert (_catalog != null),
      _itemIds = previous?._itemIds ?? [];

   @override
   List<Object> get props => [_catalog, _itemIds];
}