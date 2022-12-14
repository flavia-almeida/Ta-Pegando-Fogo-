import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/helpers/snack_bar_helper.dart';
import 'Home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Providers/providers.dart';
import '../models/auth_response.dart';

class Login extends ConsumerWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController.fromValue(
      const TextEditingValue(text: "teste@gmail.com"));
  TextEditingController passwordController =
      TextEditingController.fromValue(const TextEditingValue(text: "123456"));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    ref.listen<AsyncValue<AuthResponse?>>(authProvider, (_, state) {
      state.whenOrNull(
        loading: () {},
        data: (value) {
          if (value != null && value.userId != "") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()));
            //ref.read(userProvider.notifier).getUserById(value.userId);
          }
        },
        error: (error, _) => showErrorSnackBar(context, error),
      );
    });

    final String png =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? 'lib/Images/TPFB_white.png'
            : 'lib/Images/TPFB_dark.png';

    final Color fillColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(17, 17, 17, 1.0)
            : Colors.white70;

    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromRGBO(102, 102, 102, 1.0);

    final Color redColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromRGBO(230, 60, 66, 1.0);

    final Color TxtHintColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(246, 246, 246, 1.0)
            : const Color.fromRGBO(102, 102, 102, 1.0);
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80),
            //Logo:
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image.asset(png, width: 130)),
            //Titulo:
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'T?? Pegando Fogo?',
                  style: TextStyle(fontSize: 16, color: textColor),
                )),

            const SizedBox(height: 80),
            //Login:
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: 200,
              height: 40,
              child: TextField(
                textAlign: TextAlign.start,
                controller: nameController,
                style: TextStyle(color: TxtHintColor, fontSize: 13),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: TxtHintColor, fontSize: 13),
                    hintText: "Login",
                    fillColor: fillColor),
              ),
              //alignment: const Alignment(10.0, -1.0),
            ),
            const SizedBox(height: 25),
            //Senha:
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: 200,
              height: 40,
              child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(color: TxtHintColor, fontSize: 13),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: TxtHintColor, fontSize: 13),
                      hintText: "Senha",
                      fillColor: fillColor)),
            ),
            const SizedBox(height: 30),
            //Esqueci minha Senha
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: Text(
                'Esqueci minha senha',
                style: TextStyle(fontSize: 16, color: redColor),
              ),
            ),
            //ElevatedButton:
            Container(
                height: 40,
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: ElevatedButton(
                    child: const Text('Entrar'),
                    onPressed: () {
                      ref.read(authProvider.notifier).authenticate(
                          nameController.text, passwordController.text);

                      //login(nameController.text, passwordController.text, context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(228, 37, 44, 1.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          //side: BorderSide(color: Colors.red)
                        ))))),
            const SizedBox(height: 30),
          ],
        ));
  }
}
