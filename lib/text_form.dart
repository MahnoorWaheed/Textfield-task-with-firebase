import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfieldtask/current_user.dart';

class TextForm extends StatelessWidget {
  String? email;
  String? password;

  final GlobalKey <FormState> _formkey = GlobalKey();

  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (val){
                // ignore: unrelated_type_equality_checks
                if(!emailRegex.hasMatch(val!)){
                  return "value incorrect";
                }
                
        
              },
              onSaved: (val) {
                    print(val);
                    email = val;
                  },
                decoration:   InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.deepOrange
                  ),
                  prefixIcon:const Icon(Icons.email, 
                  color: Colors.orange,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  focusedBorder:const  OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.orange,
                    )
                  )
                ),
            ),
            TextFormField(
              validator: (val){
                
                // ignore: unrelated_type_equality_checks
                if(val!.length <  6){
                  return "value incorrect";
                }
                
        
              },
              onSaved: (val) {
                    print(val);
                    password = val;
                  },
                decoration:   InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.deepOrange
                  ),
                  prefixIcon:const Icon(Icons.email, 
                  color: Colors.orange,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  focusedBorder:const  OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.orange,
                    )
                  )
                ),
            ),
            ElevatedButton(
              onPressed: () async{
                //  _formkey.currentState!.save();
                // _formkey.currentState!.validate();
                if(_formkey.currentState!.validate()){
                  _formkey.currentState!.save();

                  final UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                   email: email!, 
                   password: password!);
                   log(userCredential.user!.toString());
                }
              }, 
              child: const Text("Save Data"),
              ),
              ElevatedButton(
              onPressed: () {
                //  _formkey.currentState!.save();
                // _formkey.currentState!.validate();
               FirebaseAuth.instance.signOut();
               log("User is Signing out");
                },
              
              child: const Text("Signout"),
              ),
              ElevatedButton(
              onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CurrentUser()));
              }, 
              child: const Text("Curr User"),
              ),
          ],
        ),
      ),
    );
  }
}