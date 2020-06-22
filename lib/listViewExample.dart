import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:listView_part3_images/flower.dart';
import 'data.dart';
import 'flower.dart';

class listViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return listViewExampleState();
  }
}

class listViewExampleState extends State<listViewExample> {
  var selectedFlower = new Flower();

  List<GestureDetector> _buildListItemsFromFlowers() {
    int index = 0;
    return flowers.map((flower) {
      var boxDecoration = index % 2 == 0
          ? new BoxDecoration(color: const Color(0xFFb0e0e6))
          : new BoxDecoration(color: const Color(0xFF7ec0ee));

      if (selectedFlower == flower) {
        boxDecoration = new BoxDecoration(color: Colors.deepOrangeAccent);
      }
      var container = Container(
        decoration: boxDecoration,
        child: new Row(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                imageUrl: flower.imageURL,
                width: 70.0,
                height: 70.0,
                fit: BoxFit.cover,
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    flower.flowerName,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.red),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    flower.description,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 8.0,
                        color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      );
      index = index + 1;
      final gestureDetector = GestureDetector(
        child: container,
        onTap: () {
          print('You tapped to ${flower.flowerName}');
          setState(() {
            selectedFlower = flower;
          });
        },
      );

      return gestureDetector;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: _buildListItemsFromFlowers(),
      ),
    );
  }
}
