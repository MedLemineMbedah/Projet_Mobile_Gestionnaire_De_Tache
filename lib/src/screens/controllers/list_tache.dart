import 'package:flutter/material.dart';

class ListTache extends StatelessWidget {
  Function changeScreen;
   ListTache({ Key? key ,required this.changeScreen }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('ListTache'),
      ),
      
    );
  }
}