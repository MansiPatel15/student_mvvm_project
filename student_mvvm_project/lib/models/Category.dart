class Category
{
  String category_id,category_name;

  Category(this.category_id,this.category_name);


  Category.fromJson(Map<String, dynamic> json) {
    category_id = json["category_id"];
    category_name =json["category_name"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data[category_id] = this.category_id;
  //   data[category_name] = this.category_name;
  //   return data;
  // }
}