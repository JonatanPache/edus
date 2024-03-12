import 'package:edus/src/pages/cursos/cursos_page.dart';
import 'package:edus/src/pages/login/login_page.dart';
import 'package:edus/src/pages/signup/signup.dart';
import 'package:edus/src/pages/signup/signup_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: LoginPage()),
  '/signup': (route) => const MaterialPage(child: SignUp()),
  '/signupConf': (route) => const MaterialPage(child: SignUpConfirmation()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: CursosPage()),
});

