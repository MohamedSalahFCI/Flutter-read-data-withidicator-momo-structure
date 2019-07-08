import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_data_with_indicator_with_momo_structure/starwar.dart';

class StarWarsWidget extends StatefulWidget {
  @override
  _StarWarsWidgetState createState() => _StarWarsWidgetState();
}

class _StarWarsWidgetState extends State<StarWarsWidget> {


  final String _url = "https://swapi.co/api/starships";
  List _data;

  Future<StarWar> getData() async {
    var res = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    final _resBody = json.decode(res.body);
    return new StarWar.fromJson(_resBody);
  }

  Widget _listView(_data) => new ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                    child: new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Container(
                      child: Text(_data[index].name,
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.black54))),
                )),
                new Card(
                  child: new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Container(
                        child: Text(_data[index].model,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.redAccent)),
                      )),
                )
              ],
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Star Wars Ship momo structure'),
          backgroundColor: Colors.amberAccent,
        ),
        body: FutureBuilder<StarWar>(
            future: getData(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return _listView(snapShot.data.results);
              } else if (snapShot.hasError) {
                return new Text("${snapShot.error}");
              }
              return new Center(child: new CircularProgressIndicator());
            }));
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}
