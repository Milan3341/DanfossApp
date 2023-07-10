import 'dart:convert';

import 'package:danfossapp/config/routing.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loggedIn = false;
  bool isLoading = false;
  String errorMessage = "";
  final storage = new FlutterSecureStorage();

  Future<void> _login(BuildContext context) async {
    final loginContext = context;
    setState(() {
      isLoading = true;
    });
    // const String url =
    //     'https://djangodanfoss-production.up.railway.app/account/api/token/';

    const String url = "http://127.0.0.1:8000/account/api/token/";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final String email = _emailController.text;
    final String password = _passwordController.text;
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode({'password': password, 'email': email}));
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String token = data['access'];

        await storage.write(key: 'authToken', value: token);
        setState(() {
          _loggedIn =
              true; // Update _loggedIn variable to trigger cross-fade animation
        });
        await Future.delayed(Duration(milliseconds: 500)); // Ad
        Navigator.pushReplacementNamed(context, MyCustomroutes.homeRoute);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseBody['detail']),
          ),
        );
      }
    } catch (error) {
      setState(() {});
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/Danfoss.svg.png',
                  width: 220,
                ),
                const SizedBox(height: 30),
                AnimatedCrossFade(
                  duration: Duration(milliseconds: 400),
                  firstChild: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                  secondChild: Icon(
                    Icons.lock_open,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                  crossFadeState: _loggedIn || isLoading
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _emailController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _passwordController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: isLoading
                          ? Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    ),
                    onPressed: () => _login(context),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(
                          context, MyCustomroutes.registerRoute);
                    });
                  },
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(
                          context, MyCustomroutes.forgotPasswordRoute);
                    });
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
