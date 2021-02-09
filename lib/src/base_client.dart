class BaseClient {
  /// the host of the service
  String host;

  /// the port of the service
  String port;

  /// the name of the app
  String app;

  /// the service endpoint name
  String wsEndpoint;

  /// the socket endpoint name
  String socketEndpoint;

  /// the api version
  String api;

  /// the result url for the Web Service
  String wsURL;

  /// the result url for the Web Socket
  String socketURL;

  /// the token of a channel
  String token;

  /// [bool enableSecurity] indicates if will be used a secure protocol
  /// and [bool devMode] changes the URL of remove for development mode
  BaseClient(bool enableSecurity, bool devMode) {
    app = 'orion-users-service';
    host = 'localhost';
    port = '9080';
    wsEndpoint = 'orion-users-service/users';
    socketEndpoint = 'usersws';
    api = 'api/v1'; 

    changeServiceURL(enableSecurity, devMode, host, port);
  }

  void changeServiceURL(
      bool enableSecurity, bool devMode, String newHost, String newPort) {
    host = newHost;
    port = newPort;
    _enableSecurityProtocol(enableSecurity);
    _enableDevMode(devMode);
  }

  void _enableSecurityProtocol(bool enableSecurity) {
    if (enableSecurity) {
      wsURL = 'https://';
      socketURL = 'wss://';
    } else {
      wsURL = 'http://';
      socketURL = 'ws://';
    }
  }

  /// cuts the app name from the url to enable developer mode
  void _enableDevMode(bool devMode) {
    String urlBase;
    if (devMode) {
      urlBase = host + ':' + port;
      wsURL = wsURL + urlBase + '/' + wsEndpoint + '/' + api + '/';
      socketURL = socketURL + urlBase + '/' + socketEndpoint + '/';
    } else {
      urlBase = host + ':' + port;
      wsURL = wsURL + urlBase + '/' + app + '/' + wsEndpoint + '/' + api + '/';
      socketURL = socketURL + urlBase + '/' + app + '/' + socketEndpoint + '/';
    }
  }
}