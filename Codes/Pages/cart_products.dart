import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_details.dart';

class Cart_Product extends StatefulWidget {
  @override
  _Cart_ProductState createState() => _Cart_ProductState();
}

class _Cart_ProductState extends State<Cart_Product> {
  var Products_in_cart=[ {
    "name": "Blazer",
    "picture": "images/Products/blazer.jpg",
    "price": 85,
    "size":"K",
    "color":"RED",
    "quantity":1,
  },



  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount:Products_in_cart.length,
             itemBuilder:(context,index){
      return SingleCartProduct(
        cart_prod_name:Products_in_cart[index]["name"] ,
        cart_prod_pricture:Products_in_cart[index]["picture"],
        cart_prod_price: Products_in_cart[index]["price"],
        cart_prod_size: Products_in_cart[index]["size"],
        cart_prod_color: Products_in_cart[index]["color"],
        cart_prod_quantity: Products_in_cart[index]["quantity"],
      );});
  }
}
class SingleCartProduct extends StatelessWidget{
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_quantity;

  SingleCartProduct({
  this.cart_prod_name,this.cart_prod_pricture,this.cart_prod_price,this.cart_prod_size,
  this.cart_prod_color,this.cart_prod_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(

      child:new ListTile(
        leading: new Image.asset(cart_prod_pricture,width:80.0,height: 80.0,),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                    padding:const EdgeInsets.all(0.0),
                    child:new Text("Size"),
                ),
                Padding(
                  padding:const EdgeInsets.all(4.0),
                  child:new Text(cart_prod_size,style: TextStyle(color:Colors.red),),
                ),
                new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                child: new Text("Color:"),),
                Padding(padding: const EdgeInsets.all(4.0),
                child: new Text(cart_prod_color,style: TextStyle(color:Colors.red),),),
               ]
            ),

               new Container(
                 alignment: Alignment.topLeft,
                 child: new Text("\$${cart_prod_price}",
                 style: TextStyle(
                   fontSize: 17.0,
                   fontWeight: FontWeight.bold,
                   color: Colors.red,
                 ),),
               )
              ],
            ),
        // trailing: new Column(
        //   children:<Widget>[
        //     new IconButton(icon:Icon(Icons.arrow_drop_up),onPressed: (){},),
        //   new Text("$cart_prod_quantity"),
        //   new IconButton(icon:Icon(Icons.arrow_drop_down),onPressed: (){})
        //
        // ]
        // ),
      ),
    );
  }
}
