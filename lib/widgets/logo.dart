import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({
    super.key, 
    required this.titulo
  });
    
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 150,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget> [
              Image(image: AssetImage('assets/logo-frisby.png')),
              SizedBox(height: 20,),
              Text(titulo, style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 83, 4), fontWeight: FontWeight.w500))
            ],
          ),
          
        ),
      ),
    );
  }
}