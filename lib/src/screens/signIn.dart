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
  var key = GlobalKey();
   TextEditingController _email = TextEditingController(text: ''), _password = TextEditingController(text: '');

 // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print("d5el");
    return Scaffold(  
     
      appBar: AppBar(title: Text('Login'),),
      body: Form(
         key: key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(  
                  hintText: 'Email'
                ),
                controller: _email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                controller: _password,
              ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              ElevatedButton(
              //  color: Theme.of(context).accentColor,
                child: Text('Signin'),
                onPressed: (){
                    Auth.signIn(_email.text, _password.text);
                    
              }),
             
            ])
          ],),
      ),
    );
  }
}