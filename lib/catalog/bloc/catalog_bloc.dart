import 'dart:async';

import 'package:cloneshopping/cart/bloc/cart_bloc.dart';
import 'package:cloneshopping/catalog/bloc/catalog_event.dart';
import 'package:cloneshopping/catalog/bloc/catalog_state.dart';
import 'package:cloneshopping/catalog/models/catalog.dart';
import 'package:bloc/bloc.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState>{


  @override
  // TODO: implement initialState
  CatalogState get initialState => CatalogLoading();

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    CatalogState currentState = state;
    // TODO: implement mapEventToState
    if(event is LoadCatalog){
      yield* _mapLoadCatalogState();
    }
    if(event is DeleteCatalog && state is CatalogLoaded){
      yield CatalogLoaded(catalog: (currentState as CatalogLoaded).catalog..deleteItems(event.item));
    }
  }

  Stream<CatalogState> _mapLoadCatalogState() async* {
    CatalogState currentState = state;

    yield CatalogLoading();
    try{
//      await Future.delayed(Duration(milliseconds: 500));
      yield CatalogLoaded(catalog: Catalog());
    }catch(_){
      yield CatalogError();
    }
  }

}