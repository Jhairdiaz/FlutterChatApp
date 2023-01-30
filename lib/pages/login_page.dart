// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

import '../widgets/button_login.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import '../widgets/term_condic.dart';
import 'package:chat/helpers/mostrar_alerta.dart';

class LoginPage extends StatelessWidget {   
      
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 242, 242, 242),
      body: SafeArea(        
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo( titulo: 'FrisbyChat',),
                  
                _Form(),
                  
                const Labels( 
                  ruta: 'register', 
                  label1: '¿No tienes cuenta?', 
                  label2: 'Crear cuenta'
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

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService  = Provider.of<AuthService>(context);

    return Container(        
      padding: EdgeInsets.symmetric(horizontal: 50),      
      child: Column(
        children: <Widget> [
    
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
            onPressed: authService.autenticando 
              ? null 
              : () async {            
              
                FocusScope.of(context).unfocus();

                final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text );

                if( loginOk ) {

                  //Navegar al home
                  Navigator.pushReplacementNamed(context, 'usuarios');

                }else {
                  // Mostrar Alerta
                  mostrarAlerta(
                    context, 
                    'Login incorrecto', 
                    'Revise sus credenciales nuevamente'
                  );                  

                }
            },
          )
         
        ],
      ),
    );
  }
}


