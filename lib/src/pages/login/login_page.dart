import 'package:edus/src/provider/auth_repository.dart';
import 'package:edus/src/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<LoginPage> {
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
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Bienvenido',
                  style: TextStyle(color: titleColor, fontSize: 36),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Ingrese su email, y contrasena \npara ingresar.'),
                const SizedBox(
                  height: 50,
                ),
                _textField(nameController, 'Username',
                    TextInputType.name, false),
                _textField(passwordController, 'Password',
                    TextInputType.visiblePassword, true),
                const SizedBox(
                  height: 30,
                ),
                _buttonNext(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Todavia no tienes cuenta?\n'),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Text(
                    'Registrate Aqui!',
                    style: TextStyle(color: textRefLInk),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
    final errorModel = await ref
        .read(authRepositoryProvider)
        .login(nameController.text, passwordController.text);
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.replace('/');
    } else {
      sMessenger.showSnackBar(SnackBar(content: Text(errorModel.error!)));
    }
  }

  Widget _textField(TextEditingController controller, String hint,
      TextInputType keyboardType, bool hide) {
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
          hintStyle: const TextStyle(color: Colors.black45),
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
        onPressed: _login,
        child: const Text(
          'Sign In',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
