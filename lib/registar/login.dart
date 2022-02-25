import 'package:KurdTour/home_main/home_bottom.dart';
import 'package:KurdTour/home_main/home_screen_main.dart';
import 'package:KurdTour/registar/Signup.dart';
import 'package:flutter/material.dart';

import '../services/authentication.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            SizedBox(height: 80),
            // logo
            Column(
              children: [
                Image.asset(
                  'assets/images/01.jpg',
                  height: 200,
                ),
                SizedBox(height: 50),
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),

            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),

            SizedBox(height: 20),

            Row(
              children: <Widget>[
                SizedBox(width: 30),
                Text('New here ? ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/signup');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text('Get Registered Now!!',
                      style: TextStyle(fontSize: 20, color: Colors.amber[600])),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(10),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      final String giniraluser = email.toString();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeMain()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
