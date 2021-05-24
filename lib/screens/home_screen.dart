import 'package:flutter/material.dart';
import 'package:teste/models/chat_data.dart';
import 'package:teste/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _channel;
    String _createChannel;
    final ChatData _create = ChatData();
    Future createChannel(String channel) async {
      return await _create.createChannel(channel);
    }

    return Card(
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            textStyle: TextStyle(
                color: Theme.of(context).primaryTextTheme.button.color),
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 8.0,
            ),
            elevation: 20,
          ),
          child: Text('Criar canal'),
          onPressed: () async {
                _createChannel = await createChannel(_channel);
                if (_createChannel.isNotEmpty) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                } else {
                  return null;
                }
              },
        ),
      ),
    );
  }
}
