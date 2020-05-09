import 'dart:async';

import 'package:cloneshopping/cart/bloc/cart_event.dart';
import 'package:cloneshopping/cart/bloc/cart_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloneshopping/catalog/bloc/catalog_bloc.dart';
import 'package:cloneshopping/catalog/bloc/catalog_event.dart';
import 'package:cloneshopping/catalog/bloc/catalog_state.dart';
import 'package:cloneshopping/catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  final CatalogBloc catalogBloc;
  StreamSubscription otherBlocSubscription;
  Catalog catalog;
  int countItems;

  CartBloc(this.catalogBloc) {
    otherBlocSubscription = catalogBloc.listen((state) {
      if(state is CatalogLoaded){
        countItems = state.catalog.count();
      }
      // React to state changes here.
      // Add events here to trigger changes in MyBloc.
    });
  }

  @override
  // TODO: implement initialState
  CartState get initialState => CartLoading();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    // TODO: implement mapEventToState
    if(event is LoadCart){
      yield* _mapLoadCartToState();
    }else if(event is AddItem){
      yield* _mapAddItemToState(event);
    }else if(event is DeleteItem){
      yield* _mapDeleteItemToState(event);
    }
  }

  Stream<CartState> _mapLoadCartToState() async* {
    yield CartLoading();
    try{
      await Future.delayed(Duration(seconds: 1));
      yield CartLoaded(items: []);
    }catch(_){
      yield CartError();
    }
  }

  Stream<CartState> _mapAddItemToState(AddItem event) async* {
    final currentState = state;
    if(currentState is CartLoaded){
      try{
        yield CartLoaded(
          items: List.from(currentState.items)..add(event.item)
        );
      }catch(_){
        yield CartError();
      }
    }
  }

  Stream<CartState> _mapDeleteItemToState(DeleteItem event) async* {
    final currentState = state;
    if(currentState is CartLoaded){
      try{
        await Future.delayed(Duration(seconds: 1));
        yield CartLoaded(
            items: List.from(currentState.items)..remove(event.item)
        );
      }catch(_){
        yield CartError();
      }
    }
  }

  @override
  Future<void> close() {
    otherBlocSubscription.cancel();
    return super.close();
  }

}