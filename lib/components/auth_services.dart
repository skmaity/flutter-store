import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Authservices {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if(gUser !=null){
final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    
  }
  
  signInWithFacebook() async {
    final LoginResult loginresult = await FacebookAuth.instance.login();
    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginresult.accessToken!.token);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
