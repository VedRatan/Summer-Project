
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hms_iiitm_gwalior/Views/login_view.dart';
import 'package:hms_iiitm_gwalior/views/home_page.dart';

class AuthController extends GetxController
{
  //AuthController Instance
  static AuthController instance  = Get.find();
  //email, password, name....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady()
  {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    //our user will be notified on any changes like: login, logout, change password etc.
    _user.bindStream(auth.userChanges());
   ever(_user, _initialScreen);
  }

  _initialScreen(User? user)
  {
    if(user == null)
      {
        Get.offAll(()=>LoginView());
      }
    else
      {
        Get.offAll(()=>HomePage());
      }
  }

  void register(String email, password) async
  {
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About User", "User message",
      snackPosition: SnackPosition.BOTTOM,
        titleText: Column(
          children: const <Widget>[
            Text('Unable to create account',
            style: TextStyle(color: Colors.white))
          ],
        ),
         messageText: Column(
          children:  <Widget>[
          Text(e.toString(),
          style: const TextStyle(color: Colors.white))
    ],
    )
     );
    }
  }

  void signin(String email, String password) async
  {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      Get.snackbar("About User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Column(
            children: const <Widget>[
              Text('Unable to login',
                  style: TextStyle(color: Colors.white))
            ],
          ),
          messageText: Column(
            children:  <Widget>[
              Text(e.toString(),
                  style: const TextStyle(color: Colors.white))
            ],
          )
      );
    }
  }
  void logout() async
  {
    await auth.signOut();
  }

  // Future<void> signInWithGoogle() async{
  //   //trigger authentication flow
  //   final GoogleSignInAccount? googleUser = new GoogleSignIn(
  //       scopes: <String>["email"]).signIn() as GoogleSignInAccount?;
  //
  //   //obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  //
  //   //create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
          await auth.signInWithCredential(credential);

          // if you want to do specific task like storing information in firestore
          // only for new users using google sign in (since there are no two options
          // for google sign in and google sign up, only one as of now),
          // do the following:

          // if (userCredential.user != null) {
          //   if (userCredential.additionalUserInfo!.isNewUser) {}
          // }
        }
      }
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
    }
  }
}