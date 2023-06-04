import 'package:edus/src/pages/signup/signup.dart';
import 'package:edus/src/pages/signup/signup_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/signup': (route) => const MaterialPage(child: SignUp()),
  '/signupConf': (route) => const MaterialPage(child: SignUpConfirmation()),
});

final loggedInRoute = RouteMap(routes: {

});
