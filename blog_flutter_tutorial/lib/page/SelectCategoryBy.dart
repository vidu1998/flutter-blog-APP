import 'package:blog_flutter_tutorial/page/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectCategoryBy extends StatefulWidget {
  final categoryName;
  const SelectCategoryBy({super.key, this.categoryName});

  @override
  State<SelectCategoryBy> createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {
  List categoryByPost = [];
  Future categoyByData() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/categoryByPost.php";
    var response =
        await http.post(Uri.parse(url), body: {'name': widget.categoryName});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      setState(() {
        categoryByPost = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoyByData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Container(child: ListView.builder(
        itemCount: categoryByPost.length,
        itemBuilder: (context, index) {
          return NewPostItem(
            author: categoryByPost[index]['author'],
              title: categoryByPost[index]['title'],
              body: categoryByPost[index]['body'],
              categoryName: categoryByPost[index]['category_name'],
              comments: categoryByPost[index]['comments'],
              image:
                  'http://192.168.1.158/blog_flutter/uploads/${categoryByPost[index]['image']}',
              post_date: categoryByPost[index]['post_date'],
              total_like: categoryByPost[index]['total_like'],
              create_date: categoryByPost[index]['create_date'],
          );
        },
      )),
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