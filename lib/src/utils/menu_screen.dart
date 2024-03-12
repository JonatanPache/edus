import 'package:edus/src/pages/payments/payment_page.dart';
import 'package:edus/src/utils/drawer_menu_item.dart';
import 'package:edus/src/utils/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final MyZoomDrawerController controller;
  const MenuScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orangeAccent,
                Colors.red,
                Colors.redAccent
              ],
              begin: Alignment.topLeft, //begin of the gradient color
              end: Alignment.bottomRight, //end of the gradient color
              stops: [0, 0.2, 0.5, 0.8] //stops for individual color
            //set the stops number equal to numbers of color
          )),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.white))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  children: [
                    //name del usuario
                    DrawerMenuItem(
                        icon: Icons.person, label: 'Perfil', onPressed: () {}),
                    DrawerMenuItem(
                        icon: Icons.home_filled, label: 'Ir a mis cursos', onPressed: () {}),
                    DrawerMenuItem(
                        icon: Icons.payment, label: 'Suscripcion', onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
