import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/PizzaApp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login-Panel",
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
            Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Email can not be blank";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "abc@xyz.com",
                            labelText: "Enter Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Password can not be blank";
                          } else if (val.length < 6) {
                            return "Password should be atleast 6 character";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "********",
                            labelText: "Enter Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () async {
                  validateFields();

                  // Authenticate the user that is already on Firebase user

                  var user = await _auth.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text);

                  if (user != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PizzaApp();
                    }));
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text("User not Exist"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void validateFields() {
    if (_formkey.currentState.validate()) {
      print("Everything fine");
    } else {
      print("Something wrong");
    }
  }
}
