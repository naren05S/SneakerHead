
import 'package:flutter/material.dart';
import 'package:sneakers_app/constanst.dart';

import 'package:sneakers_app/screens/navigator.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: Color(0xFFfafafa),
              width: double.infinity,
              child: Column(
                children: [
                  _logo(),
                  _logoText(),
                  _inputField(Icon(Icons.person_outline,size: 30,color: Color(0xffA6B0BD)),
                      "Username",
                      false
                  ),
                  _inputField(Icon(Icons.lock_outline,size: 30,color: Color(0xffA6B0BD)),
                      "Password",
                      true
                  ),
                  _loginBtn(),
                  _dontHaveAcnt(),
                  _signUp(),
                  _terms(),
                ],
              ),
            ),
          )
      ),
    );
  }
  Widget _terms() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 18),
      child: FlatButton(
        onPressed: () => {print("Terms pressed.")},
        child: Text(
          "Terms & Conditions",
        ),
      ),
    );
  }

  Widget _signUp() {
    return FlatButton(
      onPressed: () => {print("Sign up pressed.")},
      child: Text(
        "SIGN UP NOW",

      ),
    );
  }

  Widget _dontHaveAcnt() {
    return const Text(
      "Don't have an account?",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.only(top: 20, bottom: 50),
      decoration:const BoxDecoration(
          color: Color(0xff008FFF),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color(0x60008FFF),
              blurRadius: 10,
              offset: Offset(0,5),
              spreadRadius: 0,
            ), ]

      ),
      child: FlatButton(
        onPressed: ()  {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MainNavigator(),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: const Text(
          "SIGN IN",

        ),
      ),
    );
  }

  Widget _inputField(Icon prefixIcon, String hintText, bool isPassword) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0,5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder:const  OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _logoText() {
    return Container(
        margin: EdgeInsets.only(top:10,bottom: 50),
        child: Text(
          "Sneaker Head", style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        )
    );
  }

  Widget _logo() {
    return Container(
        margin: EdgeInsets.only(top: 50),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan,
                  ),
                )
            ),
            Positioned(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff008FFF),
                  ),
                )
            ),
            Positioned(
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00227E),
                  ),
                )
            )
          ],
        )
    );
  }
}
