import 'package:chat/models/mensajes_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/environment.dart';
import '../models/usuario.dart';
import 'auth_service.dart';



class ChatService with ChangeNotifier {

  Usuario? usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioId ) async {

    final token = await AuthService.getToken();      
    final uri = Uri.parse('${ Environment.apiUrl }/mensajes/$usuarioId');

    final resp = await http.get(uri,
      headers: {
        'Content-type': 'application/json',
        'x-token': token.toString()
      }
    );          

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;

  }

}

