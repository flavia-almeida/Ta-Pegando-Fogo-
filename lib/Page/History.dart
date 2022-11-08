// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ta_pegando_fogo/Provider/demo_history.dart';
import 'package:ta_pegando_fogo/Providers/providers.dart';
import 'package:ta_pegando_fogo/shared/extensions/async_value_extensions.dart';
import '../models/History_Device.dart';
import '../Provider/Globals.dart' as globals;
import '../shared/helpers/snack_bar_helper.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _History();
}

class _History extends ConsumerState<History> {
  //_History({Key? key}) : super(key: key);
  //List<Device> devices = tmp_devices.getDevicesDemoList();
  //final List <Measurement> medidas;

  _fetchHistory() {
    final userData = ref.read(authProvider);
    return ref
        .read(measurementProvider.notifier)
        .GetMeasurement(userData.value!.userId);
  }

  _buildListItem(
          Measurement measure, Color textColor, Color background_card_color) =>
      Container(
        margin: const EdgeInsets.all(20),
        height: 120,
        child: SingleChildScrollView(
          child: Material(
            color: background_card_color,
            elevation: 10,
            child: Container(
              margin: const EdgeInsets.all(30),
              color: background_card_color,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 0, top: 0),
                        child: Text(
                          "Dispositivo: " + measure.dispositivo.Name,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      const FlatButton(
                        onPressed: null,
                        child: Icon(
                          FontAwesomeIcons.locationPin,
                          size: 12,
                          color: Color.fromRGBO(228, 37, 44, 1.0),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Data: " + measure.Date,
                      style: TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "Probabilidade de incêndio: " +
                          (measure.probability * 100).toString() +
                          "%",
                      style: TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _fetchHistory());
  }

  @override
  Widget build(BuildContext context) {
    final MeasurementsList = ref.watch(measurementProvider);

    ref.listen<AsyncValue<List<Measurement>?>>(measurementProvider,
        (previous, next) => next.showSnackBarOnError(context));

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
          child: MeasurementsList.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: MeasurementsList.value?.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildListItem(MeasurementsList.value![index], textColor,
                          background_card_color),
                ),
        )
      ],
    ));
  }
}
