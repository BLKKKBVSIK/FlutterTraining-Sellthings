import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/models/ItemModel.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:bvsik/screens/product/ProductPage.dart';
import 'package:bvsik/screens/product/AddProduct.dart';
import 'package:bvsik/models/ListItems.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int nbrItems = 0;
  final List<ItemModel> _listItem = <ItemModel>[];

  @override
  void initState() {
    addItems();
    super.initState();
  }

  void addItems() {
    int i = 0;

    while (nbrItems < it.length && i < 8) {
      setState(() {
        _listItem.add(it[nbrItems++]);
        i++;
      });
    }
    if (nbrItems >= it.length) nbrItems = 0;
  }

  ImageProvider<dynamic> getImage(int index) {
    if (_listItem[index].images == null)
      return FileImage(_listItem[index].imagePath);
    else
      return NetworkImage(_listItem[index].images[0]);
  }

  Widget _tileItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: getImage(index),
                  radius: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    _listItem[index].author,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Hero(
              tag: 'hero' + index.toString(),
              child: _listItem[index].images == null
                  ? Image.file(
                      _listItem[index].imagePath,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                    )
                  : Image.network(
                      _listItem[index].images[0],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(builder: (_) {
                return ProductPage(
                  item: _listItem[index],
                  index: index,
                );
              }));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Text(_listItem[index].price + '€',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                Text(_listItem[index].name,
                    style: TextStyle(fontWeight: FontWeight.w400)),
                Text(_listItem[index].state,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfiniteGridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.4,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _tileItem(index);
        },
        itemCount: _listItem.length,
        hasNext: _listItem.length < 200,
        nextData: loadNextData,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(builder: (_) {
            return AddProduct();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }

  void loadNextData() {
    addItems();
  }
}
