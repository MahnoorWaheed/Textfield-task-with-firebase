import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({ Key? key }) : super(key: key);

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {

final user= FirebaseAuth.instance.currentUser;
// Widget getuserdata() {
// final user= FirebaseAuth.instance.currentUser;

// // final username = user;

// return Text(user!.email.toString());

// }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Text("Welcome"),
          // Text("User "),
          
          Container(
           

// final username = user;

       child: Text(user!.email.toString())
          ),

      
        ],
      ),
    );
  }
}