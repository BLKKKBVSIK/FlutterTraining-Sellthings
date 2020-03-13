import 'package:bvsik/config/app_config.dart';
import 'package:bvsik/models/item.dart';
import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/home/profile/profile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProfilPage();
}

List<ItemModel> offers = [
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Voyage',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Iphone 11',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Macbook pro',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Voyage',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Voyage',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
  ItemModel(
      images: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      ],
      nom: 'Voyage',
      prix: 49.99,
      description:
          "Un super voyage en amoureux à Calais. Profitez de ce cadre mythique en la présence de Tit le majesteux.",
      date: '2020-02-13T09:00:00Z',
      fraisDePort: 3.24),
];

class _ProfilPage extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        endDrawer: MainDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: primaryColor,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(user.pictureUrl),
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                        child: Text(
                      user.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    )),
                  ),
                  //DEBUGING UID

                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Center(
                        child: Text(
                      user.uid,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: darkKnighMode ? menuDarkTheme : Colors.white,
                  child: Column(
                    children: <Widget>[_titleOffersWidget(), _myOffersWidget()],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _titleOffersWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10),
      child: RichText(
        text: TextSpan(
          text: 'Mes annonces',
          style: TextStyle(
              color: darkKnighMode ? textDarkTheme : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
    );
  }

  Widget _myOffersWidget() {
    return Container(
      height: (MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.60,
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: offers.length,
          itemBuilder: (BuildContext ctxt, int index) =>
              _offerCard(offers[index])),
    );
  }

  Widget _offerCard(ItemModel item) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(item.images[0],
                  width: 110, height: 110, fit: BoxFit.cover),
            ],
          ),
          Container(
            height: 110,
            width: (MediaQuery.of(context).size.width -
                MediaQuery.of(context).padding.right -
                140),
            padding: EdgeInsets.only(left: 10, top: 10),
            color: darkKnighMode ? secondaryDarkTheme : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${item.nom}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: darkKnighMode ? Colors.white : Colors.black)),
                Text(
                  '${item.description.substring(0, 70)}...',
                  style: TextStyle(
                      color: darkKnighMode ? textDarkTheme : Colors.black),
                ),
                // SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text('${item.prix}€',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
