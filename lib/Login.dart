import 'package:flutter/material.dart';
import 'package:flutter_cheveaux/RoundedIcon.dart';
import 'package:flutter_cheveaux/rounded_input_filed.dart';
import 'package:flutter_cheveaux/rounded_password_field.dart';
import 'RoundedIcon.dart';
import 'package:flutter_cheveaux/RoundedButton.dart';
import 'package:flutter_cheveaux/RoundedIcon.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String _email = "";
  String _password = "";
  final String _displayName = "";
  bool _loading = false;
  bool _autoValidate = false;
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('.idea/img/7.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Ou bien utiliser compte Gmail",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                  controller: emailController,
                                  hintText: "Email",
                                  icon: Icons.email),
                              RoundedPasswordField(controller: passController),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/forg');
                                },
                                child: Text(
                                  'mot de passe oubliée',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await Firebase.initializeApp(
                                    options:
                                        DefaultFirebaseOptions.currentPlatform,
                                  );
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passController.text);
                                    Navigator.pushNamed(context, '/home');
                                  } on FirebaseAuthException catch (e) {
                                    String msg = "";
                                    if (e.code == 'user-not-found') {
                                      msg = 'Mail introuvable';
                                    } else if (e.code == 'wrong-password') {
                                      msg = 'Mot de passe incorrect';
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(e.code),
                                          );
                                        });
                                  }
                                },
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  print('No user found for that email.');
                                  // Navigator.pushNamed(context, '/Signup');
                                },
                                child: Text(
                                  'S\'insecrire',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      // RoundedIcon(imageUrl: "img/img102.jpg"),
      SizedBox(
        width: 20,
      ),
      //RoundedIcon(Icon(icon.lock)),
      SizedBox(
        width: 20,
      ),
    ],
  );
}
