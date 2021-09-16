import 'package:flutter/material.dart';

import 'package:flutter_app/pages/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Center(child: Text("Your Cart",)),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.white,),onPressed: null,),
          new IconButton(icon: Icon(Icons.account_circle,color:Colors.white,),onPressed: null,)
        ],

      ),
      body: new Cart_Product() ,
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: new ListTile(
              title: new Text("Total:") ,
              subtitle: new Text("\$230"),
            )),
            Expanded(child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out",style: TextStyle(color: Colors.white) ),
              color: Colors.red),
            )

          ],
        ),
      ),
    );
  }
}
