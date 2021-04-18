import 'package:flutter_app/models/workspace.dart';

const List<String> images = [
  "https://unsplash.com/photos/VWcPlbHglYc/download?force=true&w=640",
  "https://unsplash.com/photos/FV3GConVSss/download?force=true&w=640",
  "https://unsplash.com/photos/DyFjxmHt3Es/download?force=true&w=640",
  "https://unsplash.com/photos/wawEfYdpkag/download?force=true&w=640"
];

const List<Workspace> Workspaces = [
  Workspace(
      name: "Greemote 1",
      images: images,
      adresse: "Paris, 43, place Gilles Jourdan",
      lat: 48.84846689807847,
      lng: 2.3461735325288307),
  Workspace(
      name: "Greemote 2",
      images: images,
      adresse: "Paris, 6, chemin Perrin",
      lat: 48.86145587051776,
      lng: 2.336732156782322),
  Workspace(
      name: "Greemote 3",
      images: images,
      adresse: "Paris, 28, boulevard Chauveau",
      lat: 48.851064962280255,
      lng: 2.3715794163317256),
  Workspace(
      name: "Greemote 4",
      images: images,
      adresse: "Paris, 13, rue de Roger",
      lat: 48.87647369712068,
      lng: 2.363339670225682),
  Workspace(
      name: "Greemote 5",
      images: images,
      adresse: "Paris, 88, rue de Leconte",
      lat: 48.87365114145786,
      lng: 2.3310673313441517),
];
