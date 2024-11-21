import 'package:flutter/material.dart';
import 'package:lgoin_flutter/navbar_bottom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController namaController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4e8b9d), 
      body: login_page(), 
    );
  }

  Widget login_page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          icon(), 
          const SizedBox(height: 10), 
          header(), 
          const SizedBox(height: 30),
          textField("Username", namaController),
          const SizedBox(height: 20),
          textField("Password", passwordController, isPassword: true), 
          const SizedBox(height: 30),
          btnLogin(), 
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset("images/so.png", height: 100), 
    );
  }

  Widget header() {
    return Container(
      child: const Column(
        children: [
          Text(
            "Suhadah Official",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Welcome To App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget textField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.black),
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF333333)),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget btnLogin() {
    return ElevatedButton(
      onPressed: () {
        if (namaController.text.isNotEmpty && passwordController.text.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavbarBottom(
                nama: namaController.text,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Tolong masukan username dan password")),
          );
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF333333), fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFf7f7f7),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
