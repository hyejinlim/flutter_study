// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  String title;
  String subTitle;
  IconData icon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json["title"],
        subTitle: json["subTitle"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "icon": icon,
      };
}

// Our Demo coin
List<Location> locations = [
  Location(
    title: "CineArts at the Empire",
    subTitle: "85 W Portal Ave",
    icon: Icons.theaters,
  ),
  Location(
    title: "The Castro Theater",
    subTitle: "429 Castro St",
    icon: Icons.theaters,
  ),
  Location(
    title: "Alamo Drafthouse Cinema",
    subTitle: "2550 Mission St",
    icon: Icons.theaters,
  ),
  Location(
    title: "Roxie Theater",
    subTitle: "3117 16th St",
    icon: Icons.theaters,
  ),
  Location(
    title: "United Artists Stonestown Twin",
    subTitle: "501 Buckingham Way",
    icon: Icons.theaters,
  ),
  Location(
    title: "AMC Metreon 16",
    subTitle: "135 4th St #3000",
    icon: Icons.theaters,
  ),
  Location(
    title: "K\'s Kitchen",
    subTitle: "757 Monterey Blvd",
    icon: Icons.restaurant,
  ),
  Location(
    title: "Emmy\'s Restaurant",
    subTitle: "1923 Ocean Ave",
    icon: Icons.restaurant,
  ),
  Location(
    title: "Chaiya Thai Restaurant",
    subTitle: "272 Claremont Blvd",
    icon: Icons.restaurant,
  ),
  Location(
    title: "La Ciccia",
    subTitle: "291 30th St",
    icon: Icons.restaurant,
  ),
];
