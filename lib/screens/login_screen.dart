import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:cev06_flutter/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '', password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const IconData facebook = IconData(0xe255, fontFamily: 'MaterialIcons');

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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelStyle: TextStyle(color: Colors.white70),
                        fillColor: Colors.white,
                        labelText: "Enter Email"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelStyle: TextStyle(color: Colors.white70),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.greenAccent)),
                        fillColor: Colors.white,
                        labelText: "Password"),
                    obscureText: true,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: true,
                          onChanged: (value) {},
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Remember password',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )),
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
                    child: const Text('GET STARTED',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterSocialButton(
                          onTap: () {},
                          mini: true,
                          buttonType: ButtonType.facebook,
                        ),
                        FlutterSocialButton(
                          onTap: () {},
                          mini: true,
                          buttonType: ButtonType.twitter,
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    'Forgot password'.toUpperCase(),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        //https://stackoverflow.com/questions/54366982/transparent-bottom-navigation-bar-in-flutter
        color: const Color.fromRGBO(38, 38, 38, 0.2),
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Done have account ? '.toUpperCase(),
              style: const TextStyle(color: Colors.deepOrange),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 14, decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const SignUpScreen()));
              },
              child: const Text('SIGN UP'),
            )
          ],
        ),
      ),
    );
  }
}
