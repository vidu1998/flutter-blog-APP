// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'dart:convert';

import 'package:blog_flutter_tutorial/page/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopPostCard extends StatefulWidget {
  const TopPostCard({super.key});

  @override
  State<TopPostCard> createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List postData = [];

  Future showAllPost() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/postAll.php";
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAllPost();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 200,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amber,
      child: ListView.builder(
          // ignore: prefer_if_null_operators
          itemCount: postData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return NewPostItem(
              author: postData[index]['author'],
              title: postData[index]['title'],
              body: postData[index]['body'],
              categoryName: postData[index]['category_name'],
              comments: postData[index]['comments'],
              image:
                  'http://192.168.1.158/blog_flutter/uploads/${postData[index]['image']}',
              post_date: postData[index]['post_date'],
              total_like: postData[index]['total_like'],
              create_date: postData[index]['create_date'],
            );
          }),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final image;
  final author;
  final post_date;
  final comments;
  final total_like;
  final title;
  final body;
  final categoryName;
  final create_date;
  const NewPostItem(
      {super.key,
      this.image,
      this.author,
      this.post_date,
      this.comments,
      this.total_like,
      this.title,
      this.body,
      this.categoryName,
      this.create_date});

  @override
  State<NewPostItem> createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.amber, Colors.pink])),
        // color:Colors.amber,
      ),
      Positioned(
        top: 30,
        left: 30,
        child: CircleAvatar(
          radius: 20,
          // child: Icon(Icons.person),
          backgroundImage: NetworkImage(widget.image),
        ),
      ),
      Positioned(
        top: 30,
        left: 80,
        child: Text(
          widget.author,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas'),
        ),
      ),
      Positioned(
        top: 30,
        left: 150,
        child: Text(
          widget.post_date,
          style: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas'),
        ),
      ),
      Positioned(
          top: 50, left: 100, child: Icon(Icons.comment, color: Colors.white)),
      Positioned(
        top: 50,
        left: 130,
        child: Text(
          widget.comments,
          style: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas'),
        ),
      ),
      Positioned(
          top: 50, left: 170, child: Icon(Icons.label, color: Colors.white)),
      Positioned(
        top: 50,
        left: 200,
        child: Text(
          widget.total_like,
          style: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas'),
        ),
      ),
      Positioned(
        top: 80,
        left: 30,
        child: Text(
          widget.title,
          style: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.bold,
              fontSize: 28,
              fontFamily: 'Bebas'),
        ),
      ),
      Positioned(
          top: 127,
          left: 30,
          child: Icon(Icons.arrow_back, color: Colors.white)),
      Positioned(
        top: 130,
        left: 60,
        child: InkWell(
          child: Text("Read More",
              style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bebas')),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => postDetails(
                  title: widget.title,
                  image: widget.image,
                  author:widget.author,
                  body:widget.body,
                  postDate: widget.post_date,
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
