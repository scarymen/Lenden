import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Pages/ChatPage.dart';
import 'package:flutter_app/Pages/product_details.dart';

//Self imports
import 'package:flutter_app/components/horizontal_listview.dart';
import 'package:flutter_app/components/product.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/Pages/admin.dart';
import 'package:flutter_app/provider/product.dart';
import 'package:flutter_app/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/common/common.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/g1.jpg'),
          AssetImage('images/w1.jpg'),
          AssetImage('images/e1.png'),
          AssetImage('images/ac1.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.5,
        dotColor: Colors.black,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Center(child: Text("lenden",)),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.white,),onPressed: null,),
          new IconButton(icon: Icon(Icons.shopping_cart,color:Colors.white,),onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> new Cart()));
          }),
          new IconButton(icon: Icon(Icons.account_circle,color:Colors.white,),onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> new Admin()));
          },)
        ],

      ),
      drawer: new Drawer(
        child: new ListView(
          children:<Widget> [
            new UserAccountsDrawerHeader(accountName: Text("Nayan"),
              accountEmail: Text("nayant1797@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Home Page') ,
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Orders') ,
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('refer coins') ,
                leading: Icon(Icons.monetization_on),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title:Text('Cart') ,
                leading: Icon(Icons.shopping_cart),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Favourites') ,
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: (){changeScreen(context, ChatPage());},
              child: ListTile(
                title:Text('Chats') ,
                leading: Icon(Icons.chat),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('Settings') ,
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title:Text('About us') ,
                leading: Icon(Icons.info),
              ),
            ),

          ],

        ),

      ),
      body: new ListView(
        children: [
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),),
          //Horizontal List
          HorizontalList(),

          Padding(padding: const EdgeInsets.all(12.0),
            child: new Text('Recent'),),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Recent products')),
              ),
            ],
          ),

          Column(
            children: productProvider.products
                .map((item) => GestureDetector(
              child: FeaturedCard(
                product: item,
              ),
            ))
                .toList(),
          )
          ]
      ),


      );





  }
}