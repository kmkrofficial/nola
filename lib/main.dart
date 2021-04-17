import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Starting Point of the Application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                "assets/logo.png",
                scale: 6,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/background.png",
                  scale: 15,
                ),
              ),
              Container(
                width: 250,
                height: 50,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        scale: 15,
                      ),
                      Text(
                        "Login using Google",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {},
            child: Text("If you already have an account, Sign in."),
          )
        ],
      ),
    );
  }
}
