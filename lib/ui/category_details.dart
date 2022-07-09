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

  final String category;
  _CategoryDetailsState(this.category);

  @override
  Widget build(BuildContext context) {
    String url = "https://www.themealdb.com/api/json/v2/9973533/filter.php?c=";
    List data = [];

    Future<String> getCategoryDetailData(String idcategory) async {
      url += idcategory.toString();
      // print(url);
      var response = await http.get(Uri.parse(url),
      headers: {'Accept': 'aplication/json'});

      setState(() {
        var extractData = json.decode(response.body);
        data = extractData["meals"];
      });

      // print(data[0]["strMeal"]);
      return response.body;
    }
    getCategoryDetailData(this.category);

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details - ' + category),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(data[index]["strMeal"]),
              subtitle: Row(
                children: <Widget>[
                  Text(data[0]["strMeal"]),
                  Text(data[0]["idMeal"]),
                ],
              ),
            );
          }),
    );
  }

}
