import 'dart:io';
import 'package:http/http.dart' as http;

import 'base_client.dart';

/// Web Service for User microservice
class UsersWebService extends BaseClient {
  /// instatiate a UserWebService object.
  /// [bool enableSecurity] indicates is the client will work with http or https
  ///
  /// [bool devMode] modify the service URL to operates in dev mode. In development
  /// mode, Open liberty modifies the service URL eliminating When we are the application
  /// name orion-user-service
  ///
  /// [String tockenChannel] indicates the token a channel (optional)
  UsersWebService(bool enableSecurity, bool devMode, [String tokenChannel])
      : super(enableSecurity, devMode) {
    // sets the tocken of a channel
    token = tokenChannel;
  }

  /// Web Service: login the Orion Users microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> login(String email, String password) {
    var url = wsURL + 'login';
    return http.post(url, body: {'email': email, 'password': password});
  }

  /// Web Serive: creates a user in the Orion User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> createUser(String name, String email, String password) {
    var url = wsURL + 'create';
    return http
        .post(url, body: {'name': name, 'email': email, 'password': password});
  }

  /// Web Serive: Orion User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> autoConfirm(String email) {
    var url = wsURL + 'autoConfirm';
    return http.post(url, body: {'email': email});
  }

  /// Web Serive: Orion User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> forgotPass(String email) {
    var url = wsURL + 'forgotPass';
    return http.post(url, body: {'email': email});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> updateUser(
      String id, String name, String email, String password, String jwt) {
    var url = wsURL + 'update';
    return http.post(url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer ' + jwt},
        body: {'id': id, 'name': name, 'email': email, 'password': password});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> deleteUser(String id, String jwt) {
    var url = wsURL + 'delete';
    return http.post(url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer ' + jwt},
        body: {'id': id});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> listUser(String id, String jwt) {
    var url = wsURL + 'list' + '/' + id;
    print(url);
    return http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer ' + jwt});
  }
}