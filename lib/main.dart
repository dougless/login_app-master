import 'package:flutter/material.dart';
import 'package:censo/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Principal());

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Censo",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(accentColor: Colors.white70),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    validarUsuario();
  }

  validarUsuario() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("resultado") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Censo", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 16.0,
            ),
            label: Text('Cerrar sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
          )
        ],
      ),
      body: Center(child: Text("Página principal")),
      drawer: Drawer(),
    );
  }
}
