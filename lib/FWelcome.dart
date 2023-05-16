import 'package:flutter/material.dart';
import 'package:wwelcome/authentication.dart';
import 'package:wwelcome/wback.dart';
import 'dart:async';
class fwelcome extends StatefulWidget {
  const fwelcome({Key? key}) : super(key: key);

  @override
  State<fwelcome> createState() => _fwelcomeState();
}

class _fwelcomeState extends State<fwelcome> {
  bool? check2 = false;
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
      children: [
          CircleAvatar(
            backgroundImage: AssetImage('pic/fi.jpg'),radius:40,
          ),
          SizedBox(height: 30,),
          Text('!Welcome',style:TextStyle(color:Colors.black,),textDirection: TextDirection.rtl,),
          SizedBox(height:30),
          TextField(controller: email,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 30),
          TextField(controller: password,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Password',
            ),
          ),
          SizedBox(height: 30),
          TextField(obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Confirm Password',
            ),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.contact_mail_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Full name',
            ),
          ),
          SizedBox(height: 30),
          CheckboxListTile(
            //checkbox positioned at right
            value: check2,
            onChanged: (bool? value) {
              setState(() {
                check2 = value;
              });
            },
            title: Text(
                "By creating account,I agree to terms & condiions and Privacy Policy."),
          ),
          SizedBox(height: 40),
          TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
              onPressed: () {
                AuthenticationHelper().signUp(
                    email: email.text, password: password.text)
                    .then((result) {
                  if (result == null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => back()));
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(result, style: TextStyle(fontSize: 16),
                        )
                    ));
                  }
                });
              },
              child: Center(child: Text('sign up'))),
          Row(
            children: [
              Text('Already here?'),
    Text('Get Logged in Now!',style: TextStyle(color:Colors.lightBlue),),
    ],
          ),
      ],
    ),
        ));
  }
}
