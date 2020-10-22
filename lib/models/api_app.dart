import 'package:flutter/material.dart';

class ApiApp {
  final Icon icon;
  final String name;
  final String apiName;
  final String route;
  final Color color;

  ApiApp(
      {Key key,
      @required this.icon,
      @required this.name,
      @required this.apiName,
      @required this.route,
      @required this.color});
}

final List<ApiApp> apiApps = [
  new ApiApp(
      icon: Icon(Icons.remove_red_eye),
      name: "Detect text in an image",
      apiName: "Vison API",
      route: "/detectText",
      color: Color(0xff457EF6)),
  new ApiApp(
      icon: Icon(Icons.remove_red_eye),
      name: "Get labels for an image",
      apiName: "Vison API",
      route: "/labelImage",
      color: Color(0xffF69A45)),
  new ApiApp(
      icon: Icon(Icons.remove_red_eye),
      name: "Detect emotions in a face",
      apiName: "Vison API",
      route: "/detectEmotion",
      color: Color(0xffF64545)),
];

final List<ApiApp> controlApps = [
  new ApiApp(
      icon: Icon(Icons.power_settings_new),
      name: "Start VM",
      apiName: "Compute Engine",
      route: "/startVM",
      color: Color(0xff8845F6))
];
