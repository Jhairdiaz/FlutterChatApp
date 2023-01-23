import 'package:flutter/material.dart';

class Labels extends StatelessWidget {  

  final String ruta;
  final String label1;
  final String label2;

  const Labels({
    super.key,
    required this.ruta, 
    required this.label1, 
    required this.label2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Column(
        children: <Widget> [
          Text(label1, style: TextStyle( color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
            child: Text(label2, style: TextStyle(color: Color.fromARGB(255, 255, 83, 4), fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
          )
        ],
      ),
    );
  }
}