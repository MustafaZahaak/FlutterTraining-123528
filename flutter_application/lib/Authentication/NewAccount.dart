import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Account"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register-Panel",
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
                  // First Validate Credentials
                  validateFields();

                  // create new User for Firebase
                  var newUser = await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text);

                  if (newUser != null) {
                    // Create Notification
                    SnackBar snackBar = SnackBar(
                      content: Text("User Register Successfully"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    // Redirecting to Login Page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  }
                },
                child: Text("Register"))
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
