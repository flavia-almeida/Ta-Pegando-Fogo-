class Device {
  String Nome;
  String id_medicao;
  String Device_Id;
  double Probabvility;
  bool is_fogo_bicho;
  String Date;

  Device(
      {required this.Nome,
      required this.id_medicao,
      required this.Device_Id,
      required this.Probabvility,
      required this.is_fogo_bicho,
      required this.Date});
}
