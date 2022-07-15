

import 'package:flutter/material.dart';
import 'package:hms_iiitm_gwalior/views/login_view.dart';

import '../auth_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = new GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 120,

                    // child: Text('Logo',
                    // style: TextStyle(color: Colors.indigo[900],
                    //   fontSize: 35,
                    //   fontWeight: FontWeight.bold,
                    //
                    // ),),
                    child: Image.asset(
                      'assets/images/iiitm.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Create a account',
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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

                      const SizedBox(
                        height: 20,
                      ),

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
                      const SizedBox(
                        height: 20,
                      ),
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
                          controller: confirmpasswordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if ((value == null || value.isEmpty)) {
                              return 'Please Enter a Password';
                            } else if (value != passwordController.text) {
                              return "Passwords doesn't match";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            if(_formkey.currentState!.validate())
                            {
                              AuthController.instance.register(emailController.text.trim(),
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
                          child: const Text('Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )
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
              Text("Already having a account?"),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginView()));
                },
                child: Text( "  Back to login page."
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
