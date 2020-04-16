import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/models/ItemModel.dart';
import 'package:bvsik/models/ListItems.dart';
import 'package:bvsik/models/user.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  File _image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _fdpController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  Future<void> getImage(ImgSource source) async {
    final File image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ),
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              header(),
              addPhotos(),
              title(),
              desc(),
              state(),
              price(),
              sendButton(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(child: const BackButton()),
          const Center(
            child: Text(
              'Vendez votre produit',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget addPhotos() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  onPressed: () => getImage(ImgSource.Both),
                  color: primaryColor,
                  child: Text(
                    'Ajouter une photo'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (_image != null) Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        child: Image.file(_image),
                        constraints: const BoxConstraints(maxWidth: 200),
                      ),
                    ) else Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      child: TextField(
        controller: _titleController,
        cursorColor: primaryColor,
        decoration: const InputDecoration(
          hintText: 'Titre',
          labelText: 'Titre',
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }

  Widget desc() {
    return Container(
      child: TextField(
        controller: _descController,
        cursorColor: primaryColor,
        decoration: const InputDecoration(
          hintText: 'Description',
          labelText: 'Description',
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }

  Widget state() {
    return Container(
      child: TextField(
        controller: _stateController,
        cursorColor: primaryColor,
        decoration: const InputDecoration(
          hintText: 'Ex: neuf, comme neuf, bon état, en l\'état...',
          labelText: 'Etat',
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }

  Widget price() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child: TextField(
            controller: _priceController,
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              hintText: 'Prix',
              labelText: 'Prix',
              labelStyle: TextStyle(color: primaryColor),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Container(
          child: TextField(
            controller: _fdpController,
            cursorColor: primaryColor,
            decoration: const InputDecoration(
              hintText: 'Frais de port',
              labelText: 'Frais de port',
              labelStyle: TextStyle(color: primaryColor),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget sendButton(User user) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: RaisedButton(
          onPressed: () => isReady() ? sellThing(user) : null,
          color: isReady() ? primaryColor : Colors.grey,
          child: Text(
            'Mettre en vente'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  bool isReady() {
    if (_titleController.text.isNotEmpty &&
        _descController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _stateController.text.isNotEmpty &&
        _fdpController.text.isNotEmpty &&
        _image != null)
      return true;
    else
      return false;
  }

  void sellThing(User user) {
    final ItemModel newItem = ItemModel(
        imagePath: _image,
        name: _titleController.text,
        description: _descController.text,
        price: _priceController.text,
        shippingFees: _fdpController.text,
        state: _stateController.text,
    author: user.name ?? 'Jack Leborgne');
    it.insert(0, newItem);
    Navigator.pop(context);
  }
}
