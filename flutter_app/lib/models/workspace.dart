import 'package:flutter_app/models/place.dart';

class Workspace extends Place {
  final String adresse;
  final List<String> images;

  const Workspace({name, lat, lng, this.adresse, this.images})
      : super(name: name, lat: lat, lng: lng);
}
