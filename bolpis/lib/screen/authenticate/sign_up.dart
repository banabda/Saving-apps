import 'package:bolpis/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final Function toogleView;
  SignUp({ this.toogleView });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
//      appBar: AppBar(
//        backgroundColor: Colors.amber[400],
//        elevation: 0.0,
//        title: Text("Sign Up to Nabil Bolpis"),
//      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? "Enter password more than 6 characters" : null,
                onChanged: (val){
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sign Up"),
                  SizedBox(width: 3.0),
                  GestureDetector(
                    onTap: (){
                      widget.toogleView();
                    },
                    child: Text(
                        "Here",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.greenAccent[200],
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    dynamic result = await _auth.SignUpEmailPass(email, password);
                    if (result==null){
                      setState(() => error = 'please supply a vaalid email');
                    }
                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
