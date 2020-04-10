import 'package:bvsik/config/app_config.dart';
import 'package:bvsik/models/item.dart';
import 'package:bvsik/screens/home/homepage/productpage.dart';
import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  List<int> _data = [];
  List<ItemModel> _listItem = [
    ItemModel(
        images: [
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        ],
        nom: 'Voyage',
        prix: 49.99,
        description:
            "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
        date: '2020-02-13T09:00:00Z',
        fraisDePort: 3.24),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _tileItem(int index) {
    return Container(
      color: darkKnighMode ? menuDarkTheme : Colors.white,
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(_listItem[0].images[0]),
                  radius: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'yuuhuuh',
                    style: TextStyle(fontWeight: FontWeight.w300,
                    color: darkKnighMode ? Colors.white : Colors.black ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Hero(
              tag: 'plout' + index.toString(),
              child: Image.network(
                _listItem[0].images[index],
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ProduitPage(
                  item: _listItem[0],
                );
              }));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Text('42,00€', style: TextStyle(fontWeight: FontWeight.w700, color: darkKnighMode ? Colors.white : Colors.black)),
                Text('Mon lavomatic',
                    style: TextStyle(fontWeight: FontWeight.w400, color: darkKnighMode ? textDarkTheme : Colors.black)),
                Text('Bon état',
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
        itemBuilder: (context, index) {
          return _tileItem(index);
        },
        itemCount: _data.length,
        hasNext: _data.length < 200,
        nextData: this.loadNextData,
      ),
    );
  }

  void loadNextData() {
    final initialIndex = _data.length;
    final finalIndex = _data.length + 10;
    print('load data from ${_data.length}');

    Future.delayed(Duration(seconds: 0), () {
      for (var i = initialIndex; i < finalIndex; ++i) {
        _data.add(i);
      }
      print('${_data.length} data now');
      setState(() {});
    });
  }
}