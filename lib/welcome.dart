import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/navigate.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _welcomeState();
}

class _welcomeState extends State<Welcome> {

  @override
  void initState (){
    super.initState();

    Timer(
        const Duration(seconds: 2) ,
            () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=> const Navigate()), (route) => false);
            });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/wlco.jpg',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height
      ) ,

    );
  }
}
