import 'dart:convert';

import 'package:danfossapp/config/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  Future<void> _register(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    // Perform registration logic here
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    const String url = 'http://127.0.0.1:8000/account/api/register/';
    final Map<String, String> headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode({
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password,
            'password2': confirmPassword
          }));
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration Successful. Please go to login Page')));
        _firstNameController.clear();
        _lastNameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseBody['errors'].toString())));
      }
    } catch (e) {
      setState(() {});
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    // Example validation
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
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _firstNameController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'First Name',
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
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _lastNameController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'Last Name',
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
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _emailController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'Email',
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
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: TextField(
                    controller: _confirmPasswordController,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      hintText: 'Confirm Password',
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
                      primary: Theme.of(context).primaryColor,
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
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    ),
                    onPressed: () => _register(context),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, MyCustomroutes.loginRoute);
                    });
                  },
                  child: Text(
                    'Already have an account?  Login',
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
