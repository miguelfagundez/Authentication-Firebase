import 'package:authentication_firebase/config/routes/route_model.dart';
import 'package:authentication_firebase/features/account/presentation/pages/home_page.dart';
import 'package:authentication_firebase/features/user/presentation/pages/auth_page.dart';
import 'package:authentication_firebase/features/user/presentation/pages/forgot_password_page.dart';
import 'package:authentication_firebase/features/user/presentation/pages/login_page.dart';
import 'package:authentication_firebase/features/user/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  // Initial screen
  static const initialRoute = 'auth';

  // Route models - App routes
  static final menuRoutes = <RouteModel>[
    RouteModel(
      name: 'Auth',
      route: 'auth',
      screen: AuthPage(),
      icon: Icons.lock,
    ),
    RouteModel(
      name: 'Login',
      route: 'login',
      screen: LoginPage(),
      icon: Icons.login,
    ),
    RouteModel(
      name: 'Register',
      route: 'register',
      screen: RegisterPage(),
      icon: Icons.app_registration,
    ),
    RouteModel(
      name: 'Forgot',
      route: 'forgot',
      screen: ForgotPasswordPage(),
      icon: Icons.send,
    ),
    RouteModel(
      name: 'Home',
      route: 'home',
      screen: HomePage(),
      icon: Icons.home,
    ),
  ];

  // Get App routes
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> getAppRoutes = {};

    for (final route in menuRoutes) {
      getAppRoutes.addAll({
        route.route: (BuildContext context) => route.screen,
      });
    }

    return getAppRoutes;
  }

  // Login is the default route
  static Route<dynamic>? onGenerateDefaultRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
