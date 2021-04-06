class Place {
  final String name;
  final double lat;
  final double lng;

  const Place({this.name, this.lat, this.lng});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        name: json['name'] as String,
        lat: json['lat'] as double,
        lng: json['lng'] as double);
  }
}
