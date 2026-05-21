import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A3F6B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iconosoy.png', height: 180),
              SoyTitle(),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                InputField(label: 'Usuario', hint: 'Usuario'),
                SizedBox(height: 20),
                InputField(label: 'Contraseña', hint: 'Contraseña', obscure: true),
                SizedBox(height: 40),
                SignButton(buttonName: 'Ingresar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SoyTitle extends StatelessWidget {
  const SoyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'SOY',
      style: TextStyle(
        fontSize: 50,
        fontFamily: 'cursive',
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;

  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(height: 6),
        TextField(
          obscureText: obscure,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xFFB39DDB)),
            filled: true,
            fillColor: Color(0xFF5D5080),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class SignButton extends StatelessWidget {
  final String buttonName;

  const SignButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white),
          backgroundColor: Color(0xFF8E24AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}