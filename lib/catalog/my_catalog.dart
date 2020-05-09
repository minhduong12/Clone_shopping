import 'package:cloneshopping/cart/bloc/cart_bloc.dart';
import 'package:cloneshopping/cart/bloc/cart_event.dart';
import 'package:cloneshopping/cart/bloc/cart_state.dart';
import 'package:cloneshopping/catalog/bloc/catalog_bloc.dart';
import 'package:cloneshopping/catalog/bloc/catalog_state.dart';
import 'package:cloneshopping/catalog/models/item.dart';
import 'package:cloneshopping/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/catalog_event.dart';

class MyCatalog1 extends StatefulWidget{
  static const String routeName = '/MyCatalog1';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCatalogState();
  }
}

class MyCatalogState extends State<MyCatalog1>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCatalog2();
  }

}

class MyCatalog2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(

      builder: (context, state) {
        return new MaterialApp(
          home: Scaffold(
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
            body: _buildBody(state),
            drawer: AppDrawer(),
          ),
        );
//        return new Scaffold(
//
//            body:
//            _buildBody(state),
//             drawer: AppDrawer()
//        );

      },
    );
  }

  Widget _buildBody(CatalogState state){
    if (state is CatalogLoading) {
      return CircularProgressIndicator();
    }
    if (state is CatalogLoaded) {
      return ListView.builder(
          itemCount: state.catalog.count(),
          itemBuilder: (context, index){
            return _MyListItem(state.catalog.getByPosition(index));
          });
    }
    return Text('Something went wrong!');
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;

  const _MyListItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.title;
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction){
        BlocProvider.of<CartBloc>(context)..add(DeleteItem(item));
        BlocProvider.of<CatalogBloc>(context)..add(DeleteCatalog(item));
      },
      background: Container(color: Colors.red),
      child: SizedBox(
        height: 110,
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(item.name, style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(
                  Icons.category,
                  color: Colors.blue[500],
                ),
                trailing: _AddButton(item: item),
              )
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    return null;
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return FlatButton(
            onPressed: state.items.contains(item)
                ? null
                : () => BlocProvider.of<CartBloc>(context).add(AddItem(item)),
            splashColor: Theme.of(context).primaryColor,
            child: state.items.contains(item)
                ? Icon(Icons.check, semanticLabel: 'ADDED')
                : Text('ADD'),
          );
        }
        return Text('Something went wrong!');
      },
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      title: Text('Catalog'),
      floating: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: null)
      ],
    );
  }
}

