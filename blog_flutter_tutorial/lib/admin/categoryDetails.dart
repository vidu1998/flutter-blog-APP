import 'package:blog_flutter_tutorial/admin/addEditCategory.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List category = [];
  Future getAllCategory() async {
    var url = "http://192.168.1.158/blog_flutter/uploads/CategoryAll.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        category = jsonData;
      });
    }
    print(category);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Category Details'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditCategory(),
                  ),
                );
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditCategory(
                              categoryList: category, index: index),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  title: Text(category[index]['name']),
                  trailing: IconButton(
                    onPressed: () async {
                      var url =
                          "http://192.168.1.158/blog_flutter/uploads/deleteCategory.php";
                      var response = await http.post(Uri.parse(url),body: {
                       "id" :category[index]['id']
                      });
                      if(response.statusCode==200){
                            showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Message"),
              content: Text("Category Deleted successfully"),
              actions: [
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                )
              ],
            ),
          );
                      }
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            }));
  }
}
