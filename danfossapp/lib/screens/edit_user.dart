import 'dart:convert';

import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  final TextEditingController _oldPassword = TextEditingController();

  FocusNode _focus = FocusNode();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _obscureOldPassword = true;
  bool _isLoading = false;
  bool _isChangePasswordLoading = false;

  Future<void> _updateUser(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    String firstName = _firstname.text;
    String lastName = _lastname.text;
    String email = _email.text;

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    const String url =
        'https://djangodanfoss-production.up.railway.app/account/api/me/update_profile/';
    try {
      final response = await http.patch(Uri.parse(url),
          headers: headers,
          body: jsonEncode({
            'first_name': firstName,
            'last_name': lastName,
            'email': email.toLowerCase()
          }));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User Updated Successfully')));
        await Future.delayed(Duration(milliseconds: 400));
        _firstname.clear();
        _lastname.clear();
        _email.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something went wrong! Please try Again')));
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load Data');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _changePassword(BuildContext context) async {
    setState(() {
      _isChangePasswordLoading = true;
    });
    const String url =
        'https://djangodanfoss-production.up.railway.app/account/api/me/change_password/';
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.patch(Uri.parse(url),
          headers: headers,
          body: jsonEncode({
            'old_password': _oldPassword.text,
            'password': _password.text,
            'password2': _password2.text
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Changed Successfully')));
        await Future.delayed(Duration(milliseconds: 400));
        _oldPassword.clear();
        _password.clear();
        _password2.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went Wrong!, Please Try again later')));
      }
    } catch (e) {
      throw Exception('Something went Wrong');
    } finally {
      setState(() {
        _isChangePasswordLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit User'),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.person),
                  ),
                  border: OutlineInputBorder(),
                ),
                controller: _firstname,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.email),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
                controller: _email,
              ),
              SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: _isLoading
                        ? Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Update Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  ),
                  onPressed: () => _updateUser(context),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: _obscureOldPassword,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureOldPassword = !_obscureOldPassword;
                          });
                        },
                        child: Icon(_obscureOldPassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Old Password'),
                controller: _oldPassword,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Password'),
                controller: _password,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _password2,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      child: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.lock),
                    ),
                    labelText: 'Confirm Password'),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                    onPressed: () => _changePassword(context),
                    child: _isChangePasswordLoading
                        ? Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Change Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
