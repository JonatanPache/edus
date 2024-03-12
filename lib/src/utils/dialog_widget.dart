import 'package:flutter/material.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._singleton;


  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hola...",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text("Por favor inicia session antes de empezar")
          ],
        ),
        actions: [
          TextButton(
              onPressed: onTap,
              child: const Text("Confirmar")
          )
        ]
    );
  }
}