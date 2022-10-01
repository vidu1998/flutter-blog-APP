import 'package:blog_flutter_tutorial/page/SelectCategoryBy.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryListItem extends StatefulWidget {
  
  const CategoryListItem({super.key});

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List categories = [];

  Future getAllCategory() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/CategoryAll.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              categoryName: categories[index]['name'],
            );
          }),
    );
  }
}

class CategoryItem extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryName;

  const CategoryItem({super.key, this.categoryName});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            widget.categoryName,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectCategoryBy(
                  categoryName: widget.categoryName,
                ),
              ),
            );
            debugPrint(widget.categoryName);
          },
        ),
      ),
    );
  }
}
