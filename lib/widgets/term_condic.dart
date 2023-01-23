import 'package:flutter/material.dart';

class TextTerCondiciones extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom:20 ),
      child: const Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
    );
  }
}