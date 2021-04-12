import 'package:flutter_app/models/place.dart';

class Workspace extends Place {
  final String adresse;

  const Workspace({name, lat, lng, this.adresse})
      : super(name: name, lat: lat, lng: lng);
}
