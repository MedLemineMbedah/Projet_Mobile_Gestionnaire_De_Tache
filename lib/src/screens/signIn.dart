import 'package:flutter/material.dart';

import 'package:projects3/src/app.dart';
import 'package:projects3/src/daos/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email ='', _password='';
 // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print("d5el");
    return Scaffold(  
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(  
                hintText: 'Email'
              ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            ElevatedButton(
            //  color: Theme.of(context).accentColor,
              child: Text('Signin'),
              onPressed: (){
                  Auth.signIn(_email, _password);
                  
            }),
           
          ])
        ],),
    );
  }
}