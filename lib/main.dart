import 'package:flutter/material.dart';
import 'Provider/theme_provider.dart';
import 'Page/Login.dart';
import 'Provider/Globals.dart' as globals;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Tá Pegando Fogo?',
    themeMode: ThemeMode.system,
    theme: MyThemes.lightTheme,
    darkTheme: MyThemes.darkTheme,
    home:  Scaffold(
      appBar: globals.HideAppBar ? null :
      AppBar(
          title: const Text(_title),
          backgroundColor: const Color.fromRGBO(230, 60, 66, 1.0)),
      body: const Login(),
    ),
  );
}

