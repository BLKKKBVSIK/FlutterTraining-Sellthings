import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvsik/models/ItemModel.dart';
import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/models/ListItems.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({@required this.item, @required this.index});

  final ItemModel item;
  final int index;

  @override
  State<StatefulWidget> createState() => _ProductPage();
}

List<T> map<T>(List<dynamic> list, Function handler) {
  final List<T> result = <T>[];
  for (int i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _ProductPage extends State<ProductPage> {
  int _currentImage = 0;
  List<Widget> child;

  @override
  void initState() {
    super.initState();
    if (widget.item.images != null) {
      child = map<Widget>(
        _getImages(),
        (int index, String i) {
          return Container(
            margin: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(children: <Widget>[
                Image.network(i, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const <Color>[
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ]),
            ),
          );
        },
      ).toList();
    }
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
            if (widget.item.images == null) imageWidget() else carouselWidget(),
            authorWidget(),
            itemHeaderWidget(),
            buyButtonWidget()
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Stack(
      children: <Widget>[
        Hero(
          tag: 'hero' + widget.index.toString(),
          child: Image.file(
            widget.item.imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
        Container(child: const BackButton()),
      ],
    );
  }

  Widget buyButtonWidget() {
    return Column(
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
    );
  }

  Widget itemHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Text(widget.item.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
            child: Text(widget.item.state,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.item.description,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(
                    text: '${widget.item.price} €',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                TextSpan(
                    text: ' + ${widget.item.shippingFees} € de frais de port',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 12))
              ])),
        ],
      ),
    );
  }

  bool isInfiniteScroll() {
    if (widget.item.images.length > 1) return true;
    return false;
  }

  Widget carouselWidget() {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          enableInfiniteScroll: isInfiniteScroll(),
          height: MediaQuery.of(context).size.height * 0.5,
          autoPlay: false,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          onPageChanged: (int index) {
            setState(() {
              _currentImage = index;
            });
          },
          items: _getImages().map(
            (String url) {
              return Container(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  child: Hero(
                    tag: 'hero' + widget.index.toString(),
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
        Container(child: const BackButton()),
        if (widget.item.images.length > 1)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 20,
            left: MediaQuery.of(context).size.width * 0.5 -
                (12 * widget.item.images.length / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                child,
                (int index, dynamic url) {
                  return Container(
                    width: 12.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImage == index
                            ? Colors.white
                            : Colors.grey),
                  );
                },
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }

  Widget authorWidget() {
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
                        backgroundImage: getImage(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          widget.item.author,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                            text: getNbrOffers(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' annonces en cours')
                      ]))
                ],
              ),
            )
          ],
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey),
          ),
        ));
  }

  ImageProvider<dynamic> getImage() {
    if (widget.item.images == null)
      return FileImage(widget.item.imagePath);
    else
      return NetworkImage(widget.item.images[0]);
  }

  String getNbrOffers() {
    int res = 0;

    for (int i = 0; i < it.length; i++) {
      if (it[i].author == widget.item.author) res++;
    }
    return res.toString();
  }
}
