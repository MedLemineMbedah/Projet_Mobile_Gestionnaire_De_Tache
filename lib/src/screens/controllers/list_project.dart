import 'package:flutter/material.dart';

class ListProject extends StatelessWidget {
  Function changeScreen;
   ListProject({ Key? key,required this.changeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child: Text('ListProject'))
         );
  }
}