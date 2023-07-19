import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Detailscree..dart';
import 'package:flutter_application_1/pages/Splash.dart';
import 'package:flutter_application_1/pages/World.dart';
import 'package:flutter_application_1/pages/countreislistscreen.dart';

class RouteName {
  static const String splashscreen = "Splashscreen";
  static const String worldscreen = 'WorldstatePage';
  static const String countryscreen = 'CountrieslistScreen';
  static const String detailscreen = 'DetailScreen';
}

class Routes {
  static Route<dynamic> generateroutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteName.worldscreen:
        return MaterialPageRoute(builder: (context) => WorldStatePage());
      case RouteName.countryscreen:
        return MaterialPageRoute(builder: (context) => CountriesListScreen());
      case RouteName.detailscreen:
        return MaterialPageRoute(
            builder: (context) => DetailScreen(data: settings.arguments as Map
                ));
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No routes Available"),
            ),
          );
        });
    }
  }
}
