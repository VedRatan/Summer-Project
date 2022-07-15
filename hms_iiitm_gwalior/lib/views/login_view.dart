

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hms_iiitm_gwalior/Views/social_login.dart';
import 'package:hms_iiitm_gwalior/auth_controller.dart';
import 'package:hms_iiitm_gwalior/views/sign_up.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = new GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Container(
                    alignment: Alignment.center,
                    height: 120,

                    // child: Text('Logo',
                    // style: TextStyle(color: Colors.indigo[900],
                    //   fontSize: 35,
                    //   fontWeight: FontWeight.bold,
                    //
                    // ),),
                    child: Image.asset('assets/images/iiitm.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 35,),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('Login to your account',
                          style: TextStyle(color: Colors.indigo[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(top: 3, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if ((value == null || value.isEmpty)) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter a Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 20,),

                      //password input
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(top: 3, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if ((value == null || value.isEmpty)) {
                              return 'Please Enter a Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          if(_formkey.currentState!.validate())
                          {
                            AuthController.instance.signin(emailController.text.trim(),
                                passwordController.text.trim());
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.indigo[700],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SocialLogin()
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
      ),
      bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have a account?"),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                },
                child: Text( "  Create one."
                  , style: TextStyle(
                    color: Colors.indigo[500],
                    fontWeight: FontWeight.w600,
                  ),),
              )
            ],
          )
      ),
    );
  }


  }
