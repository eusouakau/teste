import 'package:flutter/material.dart';
import 'package:orion_client/orion_client.dart';
class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _form = GlobalKey();

  final Map<String, String> _authData = {
    'email': '',
    'name': '',
    'password': '',
  };

  Future<void> signup(String email, String name, String password) async {
    final url = new UsersWebService(false, true);

    final response = await url.createUser(name, email, password);
    return response;
  }

  Future<void> onSignup(Map<String, String> map) async {
   await signup(map['email'], map['name'], map['password']);
  }

  final _controllerName = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 290,
        width: 300,
        padding: EdgeInsets.all(25.0),
        child: Form(
          key: _form,
          child: Column(
            children: newMethod,
          ),
        ),
      ),
    );
  }

  List<Widget> get newMethod {
    return <Widget>[
      TextFormField(
        controller: _controllerName,
        decoration: InputDecoration(labelText: 'Nome'),
        onChanged: (value) => _authData['name'] = _controllerName.text,
      ),
      TextFormField(
        controller: _controllerEmail,
        decoration: InputDecoration(labelText: 'E-mail'),
        onChanged: (value) => _authData['email'] = _controllerEmail.text,
      ),
      TextFormField(
        controller: _controllerPassword,
        decoration: InputDecoration(labelText: 'Senha'),
        obscureText: true,
        onChanged: (value) => _authData['password'] = _controllerPassword.text,
      ),
      SizedBox(height: 10),
      RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Theme.of(context).primaryTextTheme.button.color,
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 8.0,
        ),
        child: Text('CADASTRAR'),
        onPressed: () => onSignup(_authData),
      ),
    ];
  }
}
