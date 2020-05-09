import 'package:cloneshopping/cart/bloc/cart_bloc.dart';
import 'package:cloneshopping/cart/bloc/cart_event.dart';
import 'package:cloneshopping/catalog/bloc/catalog_bloc.dart';
import 'package:cloneshopping/catalog/bloc/catalog_event.dart';
import 'package:cloneshopping/simple_bloc_delegate.dart';
import 'package:cloneshopping/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/my_cart.dart';
import 'catalog/bloc/catalog_bloc.dart';
import 'catalog/bloc/catalog_bloc.dart';
import 'catalog/bloc/catalog_bloc.dart';
import 'catalog/my_catalog.dart';

void main(){
  String test = "Test";
  String test1 = "Test2";
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers: [

        BlocProvider<CatalogBloc>(
          create: (context) => CatalogBloc()..add(LoadCatalog()),
        ),

        BlocProvider<CartBloc>(
          create: (context) => CartBloc(BlocProvider.of<CatalogBloc>(context))..add(LoadCart()),
        )
      ],
      child: MaterialApp(
        title: 'Shopping',

        routes: {
          '/cart': (context) => MyCart(),
          '/MyCatalog1': (context) => MyCatalog1(),
        },
        home: MyHome()
      ),
    );
  }
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){

              })
        ],
      ),
      body: Text('MyHome'),
      drawer: AppDrawer(),
    );
  }
}
