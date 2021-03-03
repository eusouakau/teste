import 'package:flutter/material.dart';
import 'package:orion_client/orion_client.dart';
import 'package:teste/models/auth_data.dart';
import 'package:teste/screens/home_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _form = GlobalKey();
  final AuthData _authData = AuthData();

  final Map<String, String> _data = {
    'email': '',
    'name': '',
    'password': '',
  };

  Future<void> signup(String email, String name, String password) async {
    final url = new UsersWebService(false, true);

    final response = await url.createUser(name, email, password);
    return response;
  }

  Future<void> login(String email, String password) async {
    final url = new UsersWebService(false, true);

    final response = await url.login(email, password);
    return response;
  }

  Future<void> onLogin(Map<String, String> map) async {
    await login(map['email'], map['password']);
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
        height: _authData.isSignup ? 350 : 290,
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
      if (_authData.isSignup)
        TextFormField(
          controller: _controllerName,
          decoration: InputDecoration(labelText: 'Nome'),
          onChanged: (value) => _data['name'] = _controllerName.text,
        ),
      TextFormField(
        controller: _controllerEmail,
        decoration: InputDecoration(labelText: 'E-mail'),
        onChanged: (value) => _data['email'] = _controllerEmail.text,
      ),
      TextFormField(
        controller: _controllerPassword,
        decoration: InputDecoration(labelText: 'Senha'),
        obscureText: true,
        onChanged: (value) => _data['password'] = _controllerPassword.text,
      ),
      SizedBox(height: 20),
      _authData.isSignup
          ? RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.button.color,
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 8.0,
              ),
              child: Text('CADASTRAR'),
              onPressed: () => onSignup(_data) == null
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
            )
          : RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.button.color,
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 8.0,
              ),
              child: Text('ENTRAR'),
              onPressed: () => onLogin(_data) == null
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
            ),
      FlatButton(
        textColor: Theme.of(context).primaryColor,
        child: Text(
          _authData.isLogin ? 'Criar uma nova conta?' : 'Já possui uma conta?',
        ),
        onPressed: () {
          setState(() {
            _authData.toggleMode();
          });
        },
      ),
    ];
  }
}
