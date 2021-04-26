import 'package:orion_client/orion_client.dart';

class ChatData {


  Future<void> createChannel() async {
    final url = new TalkWebService(false, true);

    final response = await url.createChannel();
    return response;
  }

  Future<Object> sendMessage(String message) async {
    final url = new TalkWebService(false, true);

    final response = await url.sendTextMessage(message);
    return response;
  }

  Future<Object> loadMessages(String token) async {
    final url = new TalkWebService(false, true);

    final response = await url.loadMessages(token);
    return response;
  }
}
