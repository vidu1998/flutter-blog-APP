import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddEditCategory extends StatefulWidget {
  final categoryList;
  final index;
  const AddEditCategory({super.key, this.categoryList, this.index});

  @override
  State<AddEditCategory> createState() => _AddEditCategoryState();
}

class _AddEditCategoryState extends State<AddEditCategory> {
  TextEditingController categoryNameController = TextEditingController();
  bool editMode = false;

  Future addEditCategory() async {
    if (categoryNameController.text != "") {
      if (editMode) {
        var url =
            "http://192.168.1.158/blog_flutter/uploads/updateCategory.php";
        var response = await http.post(Uri.parse(url), body: {
          "id": widget.categoryList[widget.index]['id'],
          "name": categoryNameController.text
        });
        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Message"),
              content: Text("Category Updated successfully"),
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
      } else {
        var url = "http://192.168.1.158/blog_flutter/uploads/addCategory.php";
        var response = await http.post(Uri.parse(url), body: {
        
          "name": categoryNameController.text
        });
        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Message"),
              content: Text("Category Added successfully"),
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
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      editMode = true;
      categoryNameController.text = widget.categoryList[widget.index]['name'];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Update' : 'Add'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: categoryNameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
          ),
          MaterialButton(
            color: Colors.purple,
            child: Text(
              editMode ? 'update' : 'save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              addEditCategory();
            },
          )
        ],
      ),
    );
  }
}
