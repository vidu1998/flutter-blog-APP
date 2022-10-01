import 'package:flutter/material.dart';

class postDetails extends StatefulWidget {
  final title;
  final image;
  final body;
  final author;
  final postDate;

  const postDetails(
      {super.key,
      this.title,
      this.image,
      this.body,
      this.author,
      this.postDate});

  State<postDetails> createState() => _postDetailsState();
}

class _postDetailsState extends State<postDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Bebas',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.network(
                widget.image,
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.body,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Bebas',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "by " + widget.author,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Posted on " + widget.postDate,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Comments Area",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bebas'),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration:
                          InputDecoration(labelText: 'Enter Comments here'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.blue,
                        child: Text(
                          'Publish',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
