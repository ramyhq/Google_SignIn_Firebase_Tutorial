
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../firebase/auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
   LoginScreen({Key? key}) : super(key: key);
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/onboarding.jpg'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SignInButton(
                Buttons.Google,
                onPressed: () async {
                  bool result = await _authMethods.signInWithGoogle();
                    if(result){
                   Navigator.of(context).pushNamed(HomeScreen.id);
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
