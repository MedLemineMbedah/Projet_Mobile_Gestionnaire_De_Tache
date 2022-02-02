import 'package:flutter/material.dart';
import 'package:projects3/src/models/user.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
import 'package:projects3/src/screens/controllers/resource_controller.dart';
import 'package:provider/provider.dart';

class UserController extends StatelessWidget {
  const UserController({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserMadel?>(
      
      builder: (context, user,_) {
        if(user == null){
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        }
        else if( user.isAdmin){
          return AdminController();
        }
        else{
          return ResourceController();
        }
        
      }
    );
  }
}