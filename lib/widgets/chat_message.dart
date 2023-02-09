import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {
  
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key, 
    required this.texto, 
    required this.uid, 
    required this.animationController
  });

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut ),
        child: Container(
          child: uid == authService.usuario!.uid
          ? _myMessage()
          : _notMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 5,
          bottom: 5,
          left: 50
        ),
        child: Text( this.texto, style: TextStyle(color: Colors.white), ),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 50,
          bottom: 5,
          left: 5
        ),
        child: Text( this.texto, style: TextStyle(color: Colors.black87), ),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}