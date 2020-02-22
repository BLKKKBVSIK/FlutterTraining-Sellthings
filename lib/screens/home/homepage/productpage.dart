import 'package:bvsik/config/app_config.dart';
import 'package:bvsik/models/item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProduitPage extends StatefulWidget {
  final ItemModel item;

  ProduitPage({@required this.item});

  @override
  State<StatefulWidget> createState() => new _ProduitPage();
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _ProduitPage extends State<ProduitPage> {
  int _currentImage = 0;
  List child;

  @override
  void initState() {
    print('item = ${widget.item.description}');
    child = map<Widget>(
      _getImages(),
      (index, i) {
        return Container(
          margin: EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(children: <Widget>[
              Image.network(i, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ]),
          ),
        );
      },
    ).toList();
  }

  List<String> _getImages() {
    return widget.item.images;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            carouselWidget(),
            authorWidget(),
            itemHeaderWidget(),
            buyButtonWidget()
          ],
        ),
      ),
    );
  }

  buyButtonWidget() {
    return Container(
      color: darkKnighMode ? menuDarkTheme : Colors.white,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: RaisedButton(
                child: Text(
                  'ACHETER',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {
                  // _loginPressed(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemHeaderWidget() {
    return Container(
      color: darkKnighMode ? menuDarkTheme : Colors.white,
      padding: const EdgeInsets.only(left: 20.0, top: 15),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Text(widget.item.nom,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: darkKnighMode ? Colors.white : Colors.black)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
            child: Text('Bon état',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.item.description,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: darkKnighMode ? Colors.white : Colors.black)),
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(
                    text: '${widget.item.prix.toString()} €',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: darkKnighMode ? Colors.white : Colors.black)),
                TextSpan(
                    text:
                        ' + ${widget.item.fraisDePort.toString()} € de frais de port',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 12))
              ])),
        ],
      ),
    );
  }

  carouselWidget() {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          height: MediaQuery.of(context).size.height * 0.5,
          autoPlay: false,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          onPageChanged: (index) {
            setState(() {
              _currentImage = index;
            });
          },
          items: _getImages().map(
            (url) {
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  child: Hero(
                    tag: 'plout0',
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        Container(child: BackButton()),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 20,
          left: MediaQuery.of(context).size.width * 0.5 -
              (12 * widget.item.images.length / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              child,
              (index, url) {
                return Container(
                  width: 12.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentImage == index ? Colors.white : Colors.grey),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  authorWidget() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Rokaka',
                          style: TextStyle(fontWeight: FontWeight.bold, color: darkKnighMode ? textDarkTheme : Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: '13',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: ' annonces en cours', style: TextStyle(color: darkKnighMode ? textDarkTheme : Colors.black))
                      ]))
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: darkKnighMode ? menuDarkTheme : Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: darkKnighMode ? veryDarkTheme : Colors.grey),
          ),
        ));
  }
}
