import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryDetails extends StatefulWidget {
  final String category;
  CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState(this.category);
}

class _CategoryDetailsState extends State<CategoryDetails> {

  String url = "https://www.themealdb.com/api/json/v2/9973533/filter.php?c=";
  List categoryData = [];

  final String category;
  _CategoryDetailsState(this.category);

  @override
  Widget build(BuildContext context) {

    Future<String> getCategoryDetailData(String idcategory) async {
      url += idcategory.toString();
      var response = await http.get(Uri.parse(url),
      headers: {'Accept': 'aplication/json'});

      setState(() {
        var extractData = json.decode(response.body);
        categoryData = extractData["meals"];
      });

      print(categoryData[0]["strMeal"]);
      return response.body;
    }
    getCategoryDetailData(this.category);

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details - ' + category),
      ),
      body: ListView.builder(
          itemCount: categoryData == null ? 0 : categoryData.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(categoryData[index]["strMeal"]),
              subtitle: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(categoryData[index]["idMeal"]),
                    ],
                  ),
                ],
              ),
              leading: Image.network(categoryData[index]["strMealThumb"]),
            );
          }),
    );
  }

}
