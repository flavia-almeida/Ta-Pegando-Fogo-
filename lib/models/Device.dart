class Device {
  final String Id;
  final String user_Id;
  final double latitude;
  final double longitude;
  final String Name;

  Device(
      {required this.Id,
      required this.user_Id,
      required this.latitude,
      required this.longitude,
      required this.Name});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
      Id: json['id'],
      user_Id: json['user_Id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      Name: json['name']);
}
