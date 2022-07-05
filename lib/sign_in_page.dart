import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Center(child: Text("Alphabets Application")),), body: buildContent());
  }

  Widget buildContent() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset(
            "images/a-logo.png",
            scale: 10,
          ),
          const SizedBox(height: 20),
          buildEmailCard(),
          const SizedBox(height: 20),
          buildPasswordCard(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
            ),
            child: const Text("Sign In"),
          )
        ],
      ),
    ));
  }

  Card buildEmailCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  Card buildPasswordCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
          ),
          obscureText: true,
        ),
      ),
    );
  }
}
