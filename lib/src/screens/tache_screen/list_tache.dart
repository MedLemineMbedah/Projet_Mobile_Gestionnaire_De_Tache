import 'package:flutter/material.dart';

class ListTache extends StatelessWidget {
  Function changeScreen;
   ListTache({ Key? key ,required this.changeScreen }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text('les taches') ,
        leading: IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){changeScreen(selectedScreen: 'listProject');},),
        ),
      body: Center(
        child: Text('ListTache'),
      ),
      
    );
  }
}