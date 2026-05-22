import 'package:flutter/material.dart';
import 'package:clase_flutter/Screens/login_screen.dart';
import 'package:clase_flutter/Screens/register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A3F6B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoyTitle(),
          SizedBox(height: 6),
          Image.asset('assets/images/iconosoy.png', height: 180),
          SizedBox(height: 6),
          Slogan(),
          SizedBox(height: 10),
          AuthorSlogan(),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                SignButton(
                  buttonName: 'Ingresar',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 4),
                SignButton(
                  buttonName: 'Registrar',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorSlogan extends StatelessWidget {
  const AuthorSlogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '- Avicii, The Nights',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFFB39DDB),
      ),
    );
  }
}

class Slogan extends StatelessWidget {
  const Slogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '"Live a life you will remember"',
      style: TextStyle(
        fontSize: 22,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
    );
  }
}

class SoyTitle extends StatelessWidget {
  const SoyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'SOY',
      style: TextStyle(
        fontSize: 90,
        fontFamily: 'cursive',
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class SocialNetworkIcon extends StatelessWidget {
  const SocialNetworkIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class SignButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;

  const SignButton({super.key, required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
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