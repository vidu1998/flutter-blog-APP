import 'package:blog_flutter_tutorial/page/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecentPostItem extends StatefulWidget {
  const RecentPostItem({super.key});

  @override
  State<RecentPostItem> createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {
  List recentPost = [];

  Future RecentPostData() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/postAll.php";
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        recentPost = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RecentPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: recentPost.length,
        itemBuilder: ((context, index) {
          return Recentitem(
            title: recentPost[index]['title'],
            author: recentPost[index]['author'],
            date: recentPost[index]['create_date'],
            body:recentPost[index]['body'],
            image:
                'http://192.168.1.158/blog_flutter/uploads/${recentPost[index]['image']}',
          );
        }),
      ),
    );
  }
}

class Recentitem extends StatefulWidget {
  final id;
  final title;
  final image;
  final author;
  final date;
  final body;
  const Recentitem(
      {super.key, this.id, this.title, this.image, this.author, this.date,this.body});

  @override
  State<Recentitem> createState() => _RecentitemState();
}

class _RecentitemState extends State<Recentitem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => postDetails(
                        image: widget.image,
                        author: widget.author,
                        title: widget.title,
                        postDate: widget.date,
                        body: widget.body,
                      ),
                    ),
                  );
                  debugPrint(widget.title);
                },
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'by :'+widget.author,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'posted on :'+widget.date,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Image.network(
            widget.image,
            height: 70,
            width: 70,
          ),
        ),
      ],
    );
  }
}
