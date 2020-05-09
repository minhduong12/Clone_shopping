import 'package:cloneshopping/cart/bloc/cart_bloc.dart';
import 'package:cloneshopping/cart/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: _CartList(),))
          ],
        ),
      ),
    );
  }

}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemNameStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state){
        if(state is CartLoading){
          return CircularProgressIndicator();
        }
        if(state is CartLoaded){
          return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Icon(Icons.done),
                  title: Text(
                    state.items[index].name,
                    style: itemNameStyle,
                  ),
                );
              });
        }
        return Text('Something went wrong!');
      },
    );
  }
}