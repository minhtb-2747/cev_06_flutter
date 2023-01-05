import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFF8A65),
                  Color(0xFFC62828),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/connexion.png',
                      height: 130,
                      width: 130,
                      // color: Color.fromARGB(255, 15, 147, 59),
                      opacity: const AlwaysStoppedAnimation<double>(0.5)),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'conn'.toUpperCase(),
                      style: const TextStyle(color: Colors.pink, fontSize: 32),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'exion'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 32)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                  ),
                  width: 200,
                  child: const Text(
                    'Find and Meet people around you to find LOVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.09),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.deepOrange))),
                          child: Image.asset('assets/images/ic_fb.png',
                              height: 35,
                              width: 35,
                              // color: Color.fromARGB(255, 15, 147, 59),
                              opacity:
                                  const AlwaysStoppedAnimation<double>(0.5)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text('Sign in with Facebook',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.deepOrange))),
                          child: Image.asset('assets/images/ic_tw.png',
                              width: 35,
                              height: 35,
                              // color: Colors.pink[800],
                              opacity:
                                  const AlwaysStoppedAnimation<double>(0.5)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text('Sign in with Facebook',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'ALREADY REGISTERED? SIGN IN'.toUpperCase(),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
