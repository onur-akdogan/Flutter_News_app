import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'detay.dart';
import 'dart:convert';
import 'model/newsVeri.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidData veri;
  Future<CovidData> _covidDataGetir() async {
    var response = await http.get(
        "https://api.collectapi.com/news/getNews?country=tr&tag=general",
        headers: {
          "authorization":
              "apikey 7FrvLeAY9CVUKXWgBOwG2S:1tKmCvZ86bs2sSCR3wx5Oj",
        });

    if (response.statusCode == 200) {
      return CovidData.fromMap(json.decode(response.body));
    } else {
      throw Exception("Bağlantı Hatası${response.statusCode}");
    }
  }

  initState() {
    super.initState();
    _covidDataGetir().then((okunanVeri) {
      setState(() {
        veri = okunanVeri;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HABERLER"),
          centerTitle: true,
        ),
        body: veri != null
            ? Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      child: Card(
                        elevation: 24,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(55))),
                          child: ListTile(
                              title: Text(
                                veri.result[index].name,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Detay..."),
                              trailing: Icon(Icons.arrow_forward_ios),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(veri.result[index].image)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HaberDetay(
                                          veri.result[index].description,
                                          veri.result[index].image,
                                          veri.result[index].name,
                                          veri.result[index].source),
                                    ));
                              }),
                        ),
                      ),
                    );
                  },
                  itemCount: 8,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
