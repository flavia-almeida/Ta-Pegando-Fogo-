import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ta_pegando_fogo/Provider/demo_history.dart';
import '../models/Device.dart';
import '../Provider/Globals.dart' as globals;

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Device> devices = tmp_devices.getDevicesDemoList();

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromARGB(255, 0, 0, 0);
    final Color background_card_color =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(18, 18, 18, 1.0)
            : const Color.fromRGBO(246, 246, 246, 1.0);

    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: Material(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color.fromRGBO(35, 35, 35, 1.0)
                : Colors.white,
            elevation: 10,
            child: Row(
              children: [
                Container(
                  color: null,
                  margin: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: ClipOval(
                    child: Container(
                        width: 60,
                        height: 60,
                        color: globals.is_pegando_fogo
                            ? const Color.fromRGBO(65, 161, 69, 1.0)
                            : const Color.fromRGBO(180, 26, 0, 1.0),
                        child: globals.is_pegando_fogo
                            ? const Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                                size: 32,
                              )
                            : const Icon(FontAwesomeIcons.x,
                                color: Colors.white, size: 32)),
                  ),
                ),
                Container(
                    color: null,
                    margin: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      globals.is_pegando_fogo
                          ? "Não há indicios de incendio!"
                          : "Há indicios de incendio!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: textColor),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: devices.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(30),
                child: Material(
                  color: background_card_color,
                  elevation: 10,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    color: background_card_color,
                    child: Text(
                      devices[index].Nome,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
