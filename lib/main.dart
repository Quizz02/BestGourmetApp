import 'package:best_gourmet/ui/category_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:best_gourmet/models/category_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CategoryList()
    );
  }
}

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var categoriesurl = "https://www.themealdb.com/api/json/v2/9973533/categories.php";
  List data = [];
  Future<String> getCategoryData() async {
    var response = await http.get(Uri.parse(categoriesurl),
        headers: {'Accept': 'aplication/json'});

    setState(() {
      var extractData = json.decode(response.body);
      data = extractData["categories"];
    });

    // print(data);
    return response.body;
  }

  @override
  void initState() {
    this.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(data[index]["strCategory"]),
              leading: Image.network(data[index]["strCategoryThumb"]),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CategoryDetails(data[index]["strCategory"]),
                  ),
                );
              },
            );
          }),
    );
  }
}


