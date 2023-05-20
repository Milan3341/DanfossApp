import 'package:danfossapp/components/Chiller/mainchiller_file.dart';
import 'package:danfossapp/components/Hydro/main_hydro.dart';
import 'package:danfossapp/components/Valuetool/valuetool.dart';
import 'package:danfossapp/screens/home_screens.dart';
import 'package:flutter/material.dart';

class MyCustomroutes {
  static const homeRoute = '/';
  static const chillerRoute = '/chiller';
  static const hydroRoute = '/hydro';
  static const valueRoute = '/value';
  static const feedbackRoute = '/feedback';
  static const settingRoute = '/settings';
  static const aboutRoute = '/aboutus';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case chillerRoute:
        return MaterialPageRoute(builder: (_) => const Chiller());
      case hydroRoute:
        return MaterialPageRoute(builder: (_) => const HydroPage());
      case valueRoute:
        return MaterialPageRoute(builder: (_) => ValueTools());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
