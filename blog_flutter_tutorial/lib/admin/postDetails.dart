import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List post = [];
  Future getAllPost() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/postAll.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        post = jsonData;
      });
    }
    print(post);
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostDetails'),
      ),
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            title: Text(post[index]['title']),
          );
        }),
      ),
    );
  }
}
