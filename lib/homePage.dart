import 'package:flutter/material.dart';
import 'package:tugas2/MenuPage.dart';

class HomePage extends StatefulWidget {
  @override _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State < HomePage > {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String username = "fulan";
  String Password = "fulan";

  void login() {
    if (usernameController.text == username && passwordController.text == Password) {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username atau password salah!"), ), );
    }
  }


@override Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(title: Text("Home"), ),
    body: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flutter_dash_outlined, // Ikon Flutter bawaan
            size: 100,
            color: Colors.blue, // Warna sesuai tema Flutter
          ),
          TextField(controller: usernameController,
            decoration: InputDecoration(labelText: "Username"),
          ),
          TextField(controller: passwordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: login,
            child: Text("Login"))
        ], ), ),
  );
}
}