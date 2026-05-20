import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A3F6B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SOY',
            style: TextStyle(
              fontSize: 90,
              fontFamily: 'cursive',
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 6),
          Image.asset('assets/images/iconosoy.png', height: 180),
          SizedBox(height: 6),
          Text(
            '"Live a life you will remember"',
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Avicii, The Nights',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFB39DDB),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                SignButton(buttonName: 'Ingresar'),
                SizedBox(height: 4),
                SignButton(buttonName: 'Registrar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignButton extends StatelessWidget {
  final String buttonName;

  const SignButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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