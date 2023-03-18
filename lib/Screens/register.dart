import 'dart:ffi';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/Screens/add_note_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';





class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override

  var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  register() async {
    var formadate = formstate.currentState;
    if (formadate?.validate() != null) {
      formadate?.save();
      try {
        UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              headerAnimationLoop: false,
              context: context,
              title: "Error",
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "the passpword is too weak ",
                  style: TextStyle(),
                ),
              ))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              headerAnimationLoop: false,
              context: context,
              title: "Error",
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The account already exists, please enter another email",
                  style: TextStyle(),
                ),
              ))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(15.0) + EdgeInsets.only(top: 7),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 17, bottom: 18),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                              color: Colors.black,
                              fontFamily: ''),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [

                          TextFormField(
                            onSaved: (val) {
                              myemail = val;
                            },
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your Email';
                              } else if (value != null && value.length > 2)
                                return null;
                              else {
                                return 'Email can not be less than 3 letter';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.message_rounded),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:
                                      1),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value != null && value.length < 2) {

                                return 'please enter your password';
                              } else if (value != null && value.length > 2)
                              { return null;}
                              else {
                                return 'password can not be less than 3 letter';
                              }
                            },
                            onSaved: (val) {
                              mypassword = val;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              hintText: 'password',
                              prefixIcon: Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              UserCredential response = await register();
                              print(response.user?.email);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NotePage()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ))
              ],
            )));
  }
}