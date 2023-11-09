import 'package:flutter/material.dart';
import 'package:prova_flutter_login/pages/home_page.dart';
import 'package:prova_flutter_login/shared/utils/validations.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  bool isobscureText = true;

  void showMsgError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  bool validatelogin(text) {
    switch (Validation.validateLogin(text)) {
      case ValidationResultLogin.endsWithSpace:
        showMsgError('O login não pode terminar com o caractere de espaço');
        return true;
      case ValidationResultLogin.empty:
        showMsgError('O campo senha não pode ser vazio');
        return true;
      case ValidationResultLogin.valid:
        return false;
    }
  }

  bool validatepassword(text) {
    switch (Validation.validatePassword(text)) {
      case ValidationResultPassword.empty:
        showMsgError('O campo senha não pode ser vazio');
        return true;
      case ValidationResultPassword.endsWithSpace:
        showMsgError('O senha não pode terminar com o caractere de espaço');
        return true;
      case ValidationResultPassword.hasSpecialCharacters:
        showMsgError('A senha não pode ter caracteres especiais');
        return true;
      case ValidationResultPassword.tooShort:
        showMsgError('O campo senha não pode ter menos que dois caracteres');
        return true;
      case ValidationResultPassword.valid:
        showMsgError('O campo senha não pode ter menos que dois caracteres');
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1b4e66),
                Color(0xFF2c958f),
              ],
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  child: const Text(
                    "Usuario",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 40,
                  alignment: Alignment.center,
                  child: TextField(
                    maxLength: 20,
                    controller: loginController,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      counterText: '',
                    ),
                    onChanged: (text) {
                      validatelogin(text);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  child: const Text(
                    "Senha",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 40,
                  alignment: Alignment.center,
                  child: TextField(
                    maxLength: 20,
                    controller: passwordController,
                    obscureText: isobscureText,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      counterText: '',
                    ),
                    onChanged: (text) {
                      validatepassword(text);
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      // margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (loginController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              var senha = passwordController.text;
                              var login = loginController.text;

                              if (!validatelogin(login) &&
                                  !validatepassword(senha)) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homepage()));
                              }
                            } else {
                              showMsgError(
                                  'preenchar os campos de Login e Senha ');
                            }
                            // if (_loginValid && _passwordValid) {
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: const Color(0xFF45bd6f),
                          ),
                          child: const Text('Entrar'),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse('https://google.com.br'));
                      },
                      child: const Text(
                        "Politica de Privacidade",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
