// import 'dart:convert';

// import 'package:danfossapp/widgets/custom_appbar.dart';
// import 'package:danfossapp/widgets/custom_bottomnavbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;

// class FeedbackItem {
//   final String name;
//   final String title;
//   final String message;
//   final List<String> replies;

//   FeedbackItem({
//     required this.title,
//     required this.name,
//     required this.message,
//     required this.replies,
//   });
// }

// class FeedBack extends StatefulWidget {
//   const FeedBack({super.key});

//   @override
//   State<FeedBack> createState() => _FeedBackState();
// }

// final _feedbacks = <FeedbackItem>[];
// String _name = '';
// String _email = '';
// String _message = '';

// class _FeedBackState extends State<FeedBack> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _feedbackController = TextEditingController();
//   TextEditingController _feedbackEditorController = TextEditingController();
//   TextEditingController _replyController = TextEditingController();
//   String firstname = '';

//   @override
//   void initState() {
//     super.initState();

//     getUserInfo();
//   }

//   Future<void> getUserInfo() async {
//     const storage = FlutterSecureStorage();
//     String? token = await storage.read(key: 'authToken');
//     final Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token",
//     };
//     const String url =
//         'https://djangodanfoss-production.up.railway.app/account/api/me/';
//     try {
//       final response = await http.get(Uri.parse(url), headers: headers);
//       try {
//         if (response.statusCode == 200) {
//           final json = jsonDecode(response.body);
//           firstname = json['first_name'].toString();
//         }
//       } catch (e) {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Something went wrong');
//     }
//   }

//   void editComment(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Comment'),
//           content: TextField(
//             controller: _feedbackEditorController,
//           ),
//           actions: [
//             TextButton(
//               child: Text('Save'),
//               onPressed: () {
//                 setState(() {});
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('feedback page'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: FeedbackForm(
//                 formKey: _formKey,
//                 onFormSubmitted: _submitForm,
//                 onNameChanged: (value) {
//                   setState(() {
//                     _name = value;
//                   });
//                 },
//                 onEmailChanged: (value) {
//                   setState(() {
//                     _email = value;
//                   });
//                 },
//                 onMessageChanged: (value) {
//                   setState(() {
//                     _message = value;
//                   });
//                 },
//               ),
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'Previous Feedbacks',
//               style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 getUserInfo();
//               },
//               child: Text('refresh')),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _feedbacks.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final feedback = _feedbacks[index];
//                 return FeedbackItemWidget(
//                   feedback: feedback,
//                   onReply: (reply) {
//                     setState(() {
//                       feedback.replies.add(reply);
//                     });
//                   },
//                   onEdit: () {
//                     setState(() {
//                       _name = feedback.name;
//                       _message = feedback.message;
//                       _feedbacks.removeAt(index);
//                     });
//                   },
//                   onDelete: () {
//                     setState(() {
//                       _feedbacks.removeAt(index);
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       // Create a new feedback item
//       final feedback = FeedbackItem(
//         name: _name,
//         message: _message,
//         replies: [],
//       );

//       // Add the feedback to the list
//       setState(() {
//         _feedbacks.add(feedback);
//         _name = '';
//         _email = '';
//         _message = '';
//       });

//       // Show a confirmation dialog
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Feedback Submitted'),
//             content: Text('Thank you for your feedback!'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('Close'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }

// class FeedbackForm extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final VoidCallback onFormSubmitted;
//   final ValueChanged<String> onNameChanged;
//   final ValueChanged<String> onEmailChanged;
//   final ValueChanged<String> onMessageChanged;

//   FeedbackForm({
//     required this.formKey,
//     required this.onFormSubmitted,
//     required this.onNameChanged,
//     required this.onEmailChanged,
//     required this.onMessageChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Message'),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter your message.';
//               }
//               return null;
//             },
//             maxLines: 4,
//             onChanged: onMessageChanged,
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: onFormSubmitted,
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FeedbackItemWidget extends StatelessWidget {
//   final FeedbackItem feedback;
//   final ValueChanged<String> onReply;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;

//   FeedbackItemWidget({
//     required this.feedback,
//     required this.onReply,
//     required this.onEdit,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'From: (${feedback.name})',
//               style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               feedback.message,
//               style: TextStyle(fontSize: 14.0, color: Colors.black),
//             ),
//             SizedBox(height: 16.0),
//             if (feedback.replies.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Replies:',
//                     style: TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   SizedBox(height: 8.0),
//                   for (var reply in feedback.replies)
//                     Text(
//                       reply,
//                       style: TextStyle(fontSize: 14.0, color: Colors.black),
//                     ),
//                   SizedBox(height: 16.0),
//                 ],
//               ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () => _showReplyDialog(context),
//                   child: Text('Reply'),
//                 ),
//                 TextButton(
//                   onPressed: onEdit,
//                   child: Text('Edit'),
//                 ),
//                 TextButton(
//                   onPressed: onDelete,
//                   child: Text('Delete'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showReplyDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String reply = '';

//         return AlertDialog(
//           title: Text('Reply to Feedback'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Reply'),
//                 onChanged: (value) {
//                   reply = value;
//                 },
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Send'),
//               onPressed: () {
//                 onReply(reply);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
