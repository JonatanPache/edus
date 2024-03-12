import 'package:edus/src/utils/constantes.dart';
import 'package:flutter/material.dart';

class SignUpConfirmation extends StatefulWidget {
  const SignUpConfirmation({Key? key}) : super(key: key);

  @override
  State<SignUpConfirmation> createState() => _SignUpConfirmationState();
}

class _SignUpConfirmationState extends State<SignUpConfirmation> {
  TextEditingController confirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Text('CREAR CUENTA',
                  style: TextStyle(color: titleColor,fontSize: 36),),
                const SizedBox(height: 10,),
                const Text('La cuenta email @email ha sido enviado el\ncodigo de confirmacion de la cuenta'),
                const SizedBox(height: 150,),
                _textField(confirmationController,'Introduce el codigo', TextInputType.none,false),
                const SizedBox(height: 30,),
                _buttonNext(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      const Text('00:25'),
                      const SizedBox(width: 10,),
                      Text('Volver a enviar codigo',
                        style: TextStyle(color: textRefLInk),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller,
      String hint, TextInputType keyboardType, bool hide) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        obscureText: hide,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(
              color: Colors.black45),
        ),
      ),
    );
  }

  Widget _buttonNext() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        onPressed: () {  },
        child: const Text(
          'Siguiente',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
