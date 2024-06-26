import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async{
    String res = "Some error occured";
    try{
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty  
      // || file != null
      ){
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers':[],
          'following': [],
        });

        // 
        // await _firestore.collection('users').add({

        // });

        res="success";
      }
    } catch(e){ 
      res = e.toString();
    }
    return res;
  }
}