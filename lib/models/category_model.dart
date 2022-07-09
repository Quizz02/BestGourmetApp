class CategoryModel {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoryModel(
      this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this.idCategory;
    data['strCategory'] = this.strCategory;
    data['strCategoryThumb'] = this.strCategoryThumb;
    data['strCategoryDescription'] = this.strCategoryDescription;
    return data;
  }
}