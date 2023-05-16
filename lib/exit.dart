import 'package:flutter/material.dart';
import 'package:wwelcome/authentication.dart';
class exit extends StatefulWidget {
  const exit({Key? key}) : super(key: key);

  @override
  State<exit> createState() => _exitState();
}

class _exitState extends State<exit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('WELCOME'),
          SizedBox(height: 50,),
          TextButton(onPressed: (){AuthenticationHelper().signOut();}, child: Text('Signout')),

        ],
      )
    );
  }
}
