import 'dart:convert';
import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';


class AuthService with ChangeNotifier {

  Usuario? usuario;
  bool _autenticando = false;

  // Crear storage
  final _storage = FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando( bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  // Getters del token de forma estatica
  static Future<String?> getToken() async {
    final _storage =  FlutterSecureStorage();
    final token = await _storage.read( key: 'token' );
    return token;
  }

   // borrar el token
  static Future<void> deleteToken() async {
    final _storage =  FlutterSecureStorage();
    await _storage.delete( key: 'token' );    
  }


  
  
  Future<bool> login( String email, String password ) async {

    autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${ Environment.apiUrl }/login');

    final resp = await http.post(uri, 
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json'
      }
    
    );
       
    autenticando = false;

    if( resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson( resp.body );
      usuario = loginResponse.usuario;

      //Guardar token en lugar seguro
      await _guardarToken(loginResponse.token);

      return true;
    }else {

      return false;
    }    
  }

  Future<bool> register( String nombre, String email, String password ) async {
    
    autenticando = true;

    final data = {
      'nombre': nombre,
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${ Environment.apiUrl }/login/new');

    final resp = await http.post(uri, 
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json' }
    
    );
       
    autenticando = false;

    if( resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson( resp.body );
      usuario = loginResponse.usuario;

      //Guardar token en lugar seguro
      await _guardarToken(loginResponse.token);

      return true;
    }else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }    
  }

  Future<bool> isLoggedIn() async {

    final token = await _storage.read(key: 'token') ?? '';    
    final uri = Uri.parse('${ Environment.apiUrl }/login/renew');

    final resp = await http.get(uri,       
      headers: {
        'Content-type': 'application/json',
        'x-token': token
      }
    
    );
          

    if( resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson( resp.body );
      usuario = loginResponse.usuario;

      //Guardar token en lugar seguro
      await _guardarToken(loginResponse.token);

      return true;
    }else {
      logout();
      return false;
    }    
  }

  // Guardar store
  Future _guardarToken( String token) async {    
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {

    // Delete value
    await _storage.delete(key: 'token');
  }

}