import 'package:flutter/material.dart';
import 'package:teste/models/auth_data.dart';
//import 'package:teste/screens/home_screen.dart';
import 'package:teste/screens/init_chat_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _form = GlobalKey();
  final AuthData _authData = AuthData();
  String userLogIn;

  final Map<String, String> _data = {
    'email': '',
    'name': '',
    'password': '',
  };

  Future<String> onLogin(Map<String, String> map) async {
    return await _authData.login(map['email'], map['password']);
  }

  Future<void> onSignup(Map<String, String> map) async {
    await _authData.signup(map['email'], map['name'], map['password']);
  }

  final _controllerName = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
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
              onPressed: () => onSignup(_data),
              /* == null
                  ? null
                  : () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => InitChatScreen(),
                        ),
                      );
                    },*/
            )
          : RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.button.color,
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 8.0,
              ),
              child: Text('ENTRAR'),
              // onPressed: () => onLogin(_data) == null
              //     ? null
              //     : () {
              //         Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(
              //             builder: (context) => HomeScreen(),
              //           ),
              //         );
              //       }),
              onPressed: () async {
                userLogIn = await onLogin(_data);
                if (userLogIn.isNotEmpty) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => InitChatScreen(),
                    ),
                  );
                } else {
                  return Text('Email ou senha incorretos');
                }
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
