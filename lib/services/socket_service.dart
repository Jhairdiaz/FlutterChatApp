import 'package:chat/global/environment.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';


enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  Socket get socket => _socket;


  void connect() async {

    final token = await AuthService.getToken();

    // Dart client   
    _socket = io(Environment.socketUrl, 
    OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .enableAutoConnect() // disable auto-connection      
      .enableForceNew() 
      .setExtraHeaders({
        'x-token': token
      }) // Forzar cierre nuevo
      .build()
    );

    _socket.onConnect((_) {      
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });        

  }

  void disconnect() {
    _socket.disconnect();
  }
  

}