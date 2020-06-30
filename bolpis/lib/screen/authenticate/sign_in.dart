import 'package:bolpis/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toogleView;
  SignIn({ this.toogleView }); // widget.toogleView
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // text field state
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.amber[400],
//        elevation: 0.0,
//        title: Text("Sign In to Nabil Bolpis"),
//      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 70.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                              "Welcome",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                          Text(
                            "Bolpis Report",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0,10),
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            validator: (val) => val.isEmpty ? "Enter the email" : null,
                            onChanged: (val){
                              setState(() => email = val);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[100]))
                          ),
                          child: TextFormField(
                            validator: (val) => val.isEmpty ? "Enter the password" : null,
                            onChanged: (val){
                              setState(() => password = val);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
//              TextFormField(
//                validator: (val) => val.length < 6 ? "Enter the password" : null,
//                onChanged: (val){
//                  setState(() => password = val);
//                },
//                decoration: InputDecoration(
//                  border: InputBorder.none,
//                  hintText: "password",
//                  hintStyle: TextStyle(color: Colors.grey[400]),
//                ),
//                obscureText: true,
//              ),
                  SizedBox(height: 40.0),
//                  GestureDetector(
//                    onTap: (){
//                      widget.toogleView();
//                    },
//                    child: Text("Sign Up Here"),
//                  ),
//                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.amber,
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        dynamic result = await _auth.SignInEmailPass(email, password);
                        if (result==null){
                          setState(() => error = 'Wrong email or password');
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
          ],
        ),
      ),
    );
  }
}
