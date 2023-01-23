import 'package:flutter/material.dart';

import '../widgets/button_login.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import '../widgets/term_condic.dart';

class RegisterPage extends StatelessWidget {     
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 242, 242, 242),
      body: SafeArea(        
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Logo(titulo: 'Registro'),
                  
                _Form(),
                  
                const Labels( 
                 ruta: 'login',
                 label1: '¿Ya tienes una cuenta?', 
                 label2: 'Ingresa ahora!'
                ),
                  
                TextTerCondiciones()  
              ],
            ),
          ),
        ),
      )
    );
  }

}

class _Form extends StatefulWidget {  

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(        
      padding: const EdgeInsets.symmetric(horizontal: 50),      
      child: Column(
        children: <Widget> [
    
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
    
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',            
            textController: passCtrl,
            isPassword: true,
          ),
          
          ButtonLogin(
            text: 'Ingrese',
            onPressed: () { 
              print(emailCtrl.text);
              print(passCtrl);
            },
          )
         
        ],
      ),
    );
  }
}


