import 'dart:convert';

import 'package:danfossapp/config/routing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  Future<void> _resetPassword(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    String email = _emailController.text;

    const String url =
        "https://djangodanfoss-production.up.railway.app/account/api/send-reset-password-email/";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode({'email': email}));
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Instruction has been sent to your ${email}. Please follow the instruction.')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text(responseBody['errors']['non_field_errors'].toString())));
      }
    } catch (e) {
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
                SizedBox(height: 30),
                Icon(
                  Icons.vpn_key,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                SizedBox(height: 30),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    ),
                    onPressed: () => _resetPassword(context),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  child: Text(
                    'Back to Login',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, MyCustomroutes.loginRoute);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
