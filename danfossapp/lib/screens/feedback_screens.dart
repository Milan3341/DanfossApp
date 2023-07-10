import 'dart:convert';
import 'package:danfossapp/bloc/posts_data.dart';
import 'package:danfossapp/models/comment_model.dart';
import 'package:danfossapp/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});
  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final TextEditingController _posttitleController = TextEditingController();
  final TextEditingController _postmessageController = TextEditingController();
  final TextEditingController _commentMessageController =
      TextEditingController();
  String username = '';

  @override
  void initState() {
    super.initState();
  }

  final String mainurl = "http://127.0.0.1:8000/posts/";
  // Future<void> getUserInfo() async {
  //   const storage = FlutterSecureStorage();
  //   String? token = await storage.read(key: 'authToken');
  //   final Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token",
  //   };
  //   const String url =
  //       'https://djangodanfoss-production.up.railway.app/account/api/me/';
  //   try {
  //     final response = await http.get(Uri.parse(url), headers: headers);
  //     try {
  //       if (response.statusCode == 200) {
  //         final json = jsonDecode(response.body);
  //         username = json['first_name'].toString();
  //       }
  //     } catch (e) {
  //       throw Exception('Something went wrong');
  //     }
  //   } catch (e) {
  //     throw Exception('Something went wrong');
  //   }
  // }

  void _showReplyDialog(BuildContext context, PostModelItem post) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Reply to feedback'),
            content: Column(
              children: [
                TextField(
                  controller: _commentMessageController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: Text('Send'),
                  onPressed: () => _sendReply(context, post)),
            ],
          );
        });
  }

  Future<void> _sendReply(context, post) async {
    final postBloc = BlocProvider.of<PostBloc>(context);
    const String url = "http://127.0.0.1:8000/posts/comment/";
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final comment = CommentModelItem(message: _commentMessageController.text);
    final responseBody = jsonEncode({
      'post': post.id, // Assuming the post has an 'id' property
      'message': comment.message,
    });
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: responseBody);

      if (response.statusCode == 201) {
        postBloc.fetchPost(mainurl);
        Navigator.of(context).pop();
        _commentMessageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong!, Please Try again Later')));
      }
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }

  void editComment(BuildContext context, PostModelItem post) {
    _posttitleController.text = post.title;
    _postmessageController.text = post.message;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit feedback'),
            content: Column(
              children: [
                TextField(
                  controller: _posttitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _postmessageController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Save'),
                onPressed: () {
                  _saveEditedFeedback(context, post);
                },
              ),
            ],
          );
        });
  }

  Future<void> _saveEditedFeedback(context, post) async {
    final postBloc = BlocProvider.of<PostBloc>(context);
    // Update the feedback with the edited values
    String url = "http://127.0.0.1:8000/posts/update-destroy/${post.id}/";
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final updatedFeedback = PostModelItem(
        title: _posttitleController.text,
        message: _postmessageController.text,
        id: post.id);
    try {
      final response = await http.put(Uri.parse(url),
          headers: headers, body: jsonEncode(updatedFeedback));
      if (response.statusCode == 200) {
        _posttitleController.clear();
        _postmessageController.clear();
        Navigator.of(context).pop();
        postBloc.fetchPost(mainurl);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Content update Successfully')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong!, Please try again Later')));
      }
    } catch (e) {
      throw Exception('Something went wrong');
    }
    // Close the edit dialog
  }

  @override
  Widget build(BuildContext context) {
    const String url = "http://127.0.0.1:8000/posts/";
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.fetchPost(url);

    return Scaffold(
        appBar: AppBar(
          title: Text('feedback page'),
        ),
        body: BlocBuilder<PostBloc, List<PostModelItem>>(
            builder: (context, posts) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _posttitleController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _postmessageController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () => _submitForm(),
                              child: Text('Submit Form')),
                        )
                      ],
                    )),
              ),
              Divider(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Previous Feedbacks',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    postBloc.fetchPost(url);
                  },
                  child: Text('refresh')),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];
                    return Card(
                      child: Column(
                        children: [
                          Text(
                            post.name,
                            style: TextStyle(color: Colors.indigo),
                          ),
                          Text(
                            post.title,
                            style: TextStyle(color: Colors.indigo),
                          ),
                          Text(
                            post.message,
                            style: TextStyle(color: Colors.indigo),
                          ),
                          Column(
                            children: [
                              for (var comment in post.comments)
                                Column(
                                  children: [
                                    Text(
                                      comment.message,
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                    Text(
                                      comment.name,
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  _showReplyDialog(context, post);
                                },
                                child: Text('Reply'),
                              ),
                              TextButton(
                                onPressed: () {
                                  editComment(context, post);
                                },
                                child: Text('Edit'),
                              ),
                              TextButton(
                                onPressed: () => _deletePost(context, post),
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }));
  }

  Future<void> _deletePost(context, post) async {
    final postBloc = BlocProvider.of<PostBloc>(context);
    String url = "http://127.0.0.1:8000/posts/update-destroy/${post.id}/";
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 204) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Post Successfully Deleted')));
        postBloc.fetchPost(mainurl);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Permissions not allowed')));
      }
    } catch (e) {}
  }

  Future<void> _submitForm() async {
    final postBloc = BlocProvider.of<PostBloc>(context);
    const String url = "http://127.0.0.1:8000/posts/";
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final post = PostModelItem(
        title: _posttitleController.text, message: _postmessageController.text);

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(post));

      if (response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Feedback Submitted'),
              content: const Text('Thank you for your feedback!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        postBloc.fetchPost(mainurl);
        _posttitleController.clear();
        _postmessageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong!, Please Try again Later')));
      }
    } catch (e) {
      throw Exception('something went wrong');
    }
  }
}
