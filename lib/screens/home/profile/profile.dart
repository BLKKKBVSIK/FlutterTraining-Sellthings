import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/models/ItemModel.dart';
import 'package:bvsik/models/ListItems.dart';
import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/home/profile/profile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  List<ItemModel> profileOffers = <ItemModel>[];
  User user = User();

  @override
  void initState() {
    for (int i = 0; i < it.length; i++) {
      if (it[i].author == user.name)
        profileOffers.add(it[i]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);

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
                physics: const NeverScrollableScrollPhysics(),
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
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: darkNightMode ? menuDarkTheme : Colors.white,
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
              color: darkNightMode ? textDarkTheme : Colors.black,
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
          itemCount: profileOffers.length,
          itemBuilder: (BuildContext context, int index) =>
              _offerCard(profileOffers[index])),
    );
  }

  Widget _offerCard(ItemModel item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              if (item.images != null)
                Image.network(item.images[0],
                    width: 110, height: 110, fit: BoxFit.cover)
              else
                Image.file(item.imagePath,
                    width: 110, height: 110, fit: BoxFit.cover),
            ],
          ),
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).padding.right -
                140,
            padding: const EdgeInsets.only(left: 10, top: 10),
            color: darkNightMode ? secondaryDarkTheme : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${item.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: darkNightMode ? Colors.white : Colors.black)),
                Text(
                  item.description.length > 70
                      ? '${item.description.substring(0, 70)}...'
                      : '${item.description}',
                  style: TextStyle(
                      color: darkNightMode ? textDarkTheme : Colors.black),
                ),
                // SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomLeft,
                    child: Text('${item.price}€',
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
