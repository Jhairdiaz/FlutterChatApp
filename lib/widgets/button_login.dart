// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {  

  final String text;
  final Function() onPressed;

  const ButtonLogin({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      child:  SizedBox(
        width: double.infinity,
        height: 50,
        child:  Center(
          child: Text(text, style: const TextStyle( color: Colors.white, fontSize: 17))
        ),
      ),
      onPressed: onPressed, 
    );
  }
}