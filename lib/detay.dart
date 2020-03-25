import 'package:flutter/material.dart';

class HaberDetay extends StatelessWidget {
  String description;
  String image;
  String name;
  String source;

  HaberDetay(
    this.description,
    this.image,
    this.name,
    this.source,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(source),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(36))),
            child: ListView(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Image(
                    image: NetworkImage(image.toString()),
                  ),
                ),
                Divider(),
                Text(
                  description,
                  style: TextStyle(fontSize: 18),
                ),
                Divider(
                  height: 50,
                ),
                Text(
                  "Kaynak: " + source,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),Divider(
                  height: 70,
                ),
                Center(
                  child: Text("Onur AKDOĞAN",style: TextStyle(color:Colors.grey),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
