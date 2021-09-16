import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
        Category(
          image_loc: 'images/svgtopng/Accessories.png',
          image_cap: 'Accessories',
        ),
          Category(
            image_loc: 'images/svgtopng/Toys.png',
            image_cap: 'Toys',
          ),
          Category(
            image_loc: 'images/svgtopng/T-shirt.png',
            image_cap: 'Cloths',
          ),
          Category(
            image_loc: 'images/svgtopng/Beauty.png',
            image_cap: 'Beauty',
          ),
          Category(
            image_loc: 'images/svgtopng/Books.png',
            image_cap: 'Books',
          ),
          Category(
            image_loc: 'images/svgtopng/Camera.png',
            image_cap: 'Cameras',
          ),
          Category(
            image_loc: 'images/svgtopng/Electronics.png',
            image_cap: 'Electronics',
          ),
          Category(
            image_loc: 'images/svgtopng/Shoes.png',
            image_cap: 'Shoes',
          )

        ],

      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_loc;
  final String image_cap;
  Category({
    this.image_loc,
    this.image_cap
});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(image_loc,
          width: 60.0,
          height: 60.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(image_cap,style: new TextStyle(fontSize: 12.0),),
          )
        ),
      ),
    ),
    );
  }
}

