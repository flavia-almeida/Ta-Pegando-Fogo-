import 'package:ta_pegando_fogo/models/Device.dart';

import 'Device.dart';

class Measurement {
  String Id;
  Device dispositivo;
  double probability;
  bool is_fogo_bicho;
  String Date;

  Measurement(
      {required this.Id,
      required this.dispositivo,
      required this.probability,
      required this.is_fogo_bicho,
      required this.Date});

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
      Id: json['Id'],
      dispositivo: Device.fromJson(json['device']),
      probability: json['image_Fire_Probability'],
      Date: json['date'],
      is_fogo_bicho: json['is_fogo_bicho']);
}
