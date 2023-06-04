import 'package:edus/src/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                SizedBox(height: 50,),
                Text('CREAR CUENTA',
                  style: TextStyle(color: titleColor,fontSize: 36),),
                SizedBox(height: 10,),
                Text('Ingresa tu nombre completo, email, y contrasena \npara registrarte.'),
                SizedBox(height: 50,),
                _textField(nameController,'Full name', TextInputType.name, false),
                _textField(emailController,'Email Address', TextInputType.emailAddress, false),
                _textField(passwordController,'Password', TextInputType.visiblePassword,true),
                SizedBox(height: 30,),
                _buttonNext(),
                SizedBox(height: 20,),
                Text('Al registrarte aceptas todo nuestros\nterminos de condicion y politicas.'),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Text('ya tienes cuenta?',
                  style: TextStyle(color: textRefLInk),),)
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
        onPressed: () {
          Routemaster.of(context).push('/signupConf');
        },
        child: const Text(
          'SIGN UP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
