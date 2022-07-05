import 'package:alphabets_app/home_page.dart';
import 'package:alphabets_app/models/user.dart';
import 'package:alphabets_app/sign_in_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {

    //change the ! with = to see the sign in page
     if (user != null) {
      return const SignInPage();
    }
    return const HomePage();
  }
}
