import 'dart:io';

class ItemModel {
  ItemModel(
      {this.images,
      this.imagePath,
      this.name,
      this.price,
      this.description,
      this.date,
      this.shippingFees,
      this.author,
      this.state});

  List<String> images;
  File imagePath;
  String name;
  String price;
  String description;
  String date;
  String shippingFees;
  String author;
  String state;
}
