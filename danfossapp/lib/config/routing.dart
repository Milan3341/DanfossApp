import 'package:danfossapp/components/Chiller/mainchiller_file.dart';
import 'package:danfossapp/components/Hydro/main_hydro.dart';
import 'package:danfossapp/components/Valuetool/valuetool.dart';

import 'package:danfossapp/screens/edit_user.dart';
import 'package:danfossapp/screens/forgot_password.dart';
import 'package:danfossapp/screens/home_screens.dart';
import 'package:danfossapp/screens/login_screens.dart';
import 'package:danfossapp/screens/register_screens.dart';
import 'package:flutter/material.dart';

class MyCustomroutes {
  static const loginRoute = '/login';
  static const homeRoute = '/home';
  static const forgotPasswordRoute = '/forgotpassword';
  static const registerRoute = '/register';
  static const chillerRoute = '/chiller';
  static const hydroRoute = '/hydro';
  static const valueRoute = '/value';
  static const feedbackRoute = '/feedback';
  static const editUserRoute = '/editUser';
  static const aboutRoute = '/aboutus';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case editUserRoute:
        return MaterialPageRoute(builder: (_) => EditUser());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
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
