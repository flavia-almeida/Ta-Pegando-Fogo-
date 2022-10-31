import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:dio/dio.dart';

class Carregando extends StatefulWidget {
  const Carregando({Key? key}) : super(key: key);

  @override
  _Carregando createState() => _Carregando();
}

class _Carregando extends State<Carregando> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Carregando',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(102, 102, 102, 1.0)),
                )),
          ],
        ));
  }
}
