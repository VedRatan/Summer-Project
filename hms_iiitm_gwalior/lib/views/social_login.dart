import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hms_iiitm_gwalior/auth_controller.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Or sign in with',
              style: TextStyle(
                color: Colors.indigo[700],
                fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.5,
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                    onTap: (){
                      AuthController.instance.signInWithGoogle(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1), blurRadius: 10)
                          ]),
                      child: Image.asset('assets/images/google.png'),
                    ),
                  )),
              SizedBox(width: 20,),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1), blurRadius: 10)
                          ]),
                      child: Icon(Icons.phone,
                        color: Colors.indigo[500],
                        size: 30,)
                  ))
            ],
          ),
        )
      ],
    );
  }
}
