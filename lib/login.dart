import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            TextField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
            TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
