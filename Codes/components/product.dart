import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/product_details.dart';
import 'package:flutter_app/Services/product.dart';
import 'package:flutter_app/model/product.dart';
import 'package:flutter_app/provider/product.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 //List<ProductModel> prods = ProductProvider.products;
  List<ProductModel> product_list = ProductProvider.initialize().products;



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
          product: product_list[index],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final ProductModel product;

  Single_prod({
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(

          child: Material(
            child: InkWell(
              onTap: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context)=>new ProductDetails(
                        //here we are passing the details of the product to product_details page
                        product: product,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                          ),
                          new Text("\$${product.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                        ],
                      )
                  ),
                  // child: Image.asset(
                  //   product.images,
                  //   fit: BoxFit.cover,
                  // )),
              )
            ),
          )),
    );
  }
}