import 'package:flutter_app/models/workspace.dart';

const List<String> images = [
  "https://firebasestorage.googleapis.com/v0/b/greemote-e86d7.appspot.com/o/images%2Fworkspace-01.jpg?alt=media&token=885d5eec-b386-48eb-8301-0a15f184aeee",
  "https://firebasestorage.googleapis.com/v0/b/greemote-e86d7.appspot.com/o/images%2Fworkspace-02.jpg?alt=media&token=294626c3-2569-4149-9f51-9b5af8ec35c0",
  "https://firebasestorage.googleapis.com/v0/b/greemote-e86d7.appspot.com/o/images%2Fworkspace-03.jpg?alt=media&token=271bb4aa-d71f-4802-bf53-5b3458737450",
  "https://firebasestorage.googleapis.com/v0/b/greemote-e86d7.appspot.com/o/images%2Fworkspace-04.jpg?alt=media&token=529071bd-aa54-4e5c-97af-b3a9d8706fda",
  "https://firebasestorage.googleapis.com/v0/b/greemote-e86d7.appspot.com/o/images%2Fworkspace-05.jpg?alt=media&token=0a75de6f-d2dd-4012-a82d-43bb2c865e30"
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
