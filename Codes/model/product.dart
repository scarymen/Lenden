import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  static const NAME = "name";
  static const PRICE = "price";
  static const BRAND = "brand";
  static const QUANTINTY = "quantity";
  static const SIZES = "sizes";
  static const IMAGE_URL = "images";
  static const ID = "id";
  static const CATEGORY = "category";
  static const DESCRIP = 'desc';

  String _brand;
  String _name;
  String _images;
  double _price;
  int _quantity;
  List _sizes;
  String _id;
  String _category;
  String _desc;




  //getters
  String get brand => _brand;
  String get name => _name;
  String get images => _images;
  double get price => _price;
  int get quantity => _quantity;
  List get sizes =>_sizes;
  String get id => _id;
  String get category => _category;
  String get desc => _desc;
  //Structs
  ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    _brand = snapshot.data()[BRAND];
    _name = snapshot.data()[NAME];
    _images = snapshot.data()[IMAGE_URL];
    _quantity = snapshot.data()[QUANTINTY];
    _sizes = snapshot.data()[SIZES];
    _id = snapshot.data()[ID];
    _category = snapshot.data()[CATEGORY];
    _price = snapshot.data()[PRICE];
    _desc = snapshot.data()[DESCRIP];

  }

}