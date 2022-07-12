import 'package:flutter/material.dart';
import 'package:student_mvvm_project/models/Category.dart';
import 'package:student_mvvm_project/resources/url_resources.dart';
import 'package:student_mvvm_project/ui/AddCategory.dart';
import 'package:student_mvvm_project/utils/ApiHandler.dart';
import 'package:student_mvvm_project/utils/error_handler.dart';


class CategoryProvider with ChangeNotifier
{
  List<Category> categoryData;

  bool categoryLoading=false;
  bool categoryIsData=false;
  String catmessage;

  bool isLoading=false;

  CategoryProvider()
  {
    GetCategory();
  }

  GetCategory() async {
    categoryLoading = true;
    try {
      await ApiHandler.post(UrlResources.CATEGORY_LIST).then((
          dynamic value) async {
        categoryLoading = false;
        if (value["status"] == "success")
        {
          print("In If");
          final items = value["categorydata"].cast<Map<String, dynamic>>();
          List<Category> listofcategory = items.map<Category>((json) {
            return Category.fromJson(json);
          }).toList();
          print(listofcategory);
          this.categoryData = listofcategory;
          notifyListeners();
          categoryLoading = false;
          categoryIsData = true;
          catmessage="Found";
        }
        else
          {
            print("In Else");
            categoryLoading = false;
            categoryIsData = false;
            catmessage="No data found!";
        }
      });
    } on ErrorHandler catch (ex) {
      print(ex.getMessage());
      categoryLoading = false;
      categoryIsData = false;
      catmessage=ex.getMessage();
    }
  }

  GetSingleCategory(catid) async {
    categoryLoading = true;
    try {

      await ApiHandler.post(UrlResources.CATEGORY_SINGLE,body:{"catid":catid}).then((
          dynamic value) async {
        categoryLoading = false;
        if (value["status"] == "success")
        {
          print("In If");
          final items = value["categorydata"].cast<Map<String, dynamic>>();
          List<Category> listofcategory = items.map<Category>((json) {
            return Category.fromJson(json);
          }).toList();
          print(listofcategory);
          this.categoryData = listofcategory;
          notifyListeners();
          categoryLoading = false;
          categoryIsData = true;
          catmessage="Found";
        }
        else
        {
          print("In Else");
          categoryLoading = false;
          categoryIsData = false;
          catmessage="No data found!";
        }
      });
    } on ErrorHandler catch (ex) {
      print(ex.getMessage());
      categoryLoading = false;
      categoryIsData = false;
      catmessage=ex.getMessage();
    }
  }

  Future<Null> AddCategory({
    category_name,context,
  }) async {
    isLoading = true;
    try {
      await ApiHandler.post(UrlResources.ADD_CATEGORY,
        body: {
          "category_name": category_name,
        },
      ).then((dynamic value) async
      {
        isLoading = false;
        if (value["status"] == "success") {
          catmessage = "insert";
        }
        else {
          catmessage = "not insert";
        }
      });
    } on ErrorHandler catch (ex) {
      isLoading = false;
    }
  }

  Future<Null> RemoveCategory({
    context,category_id
  }) async {
    try {
      await ApiHandler.post(UrlResources.REMOVE_CATEGORY, body: {
        "category_id":category_id,
      }).then((dynamic value) async {
        if(value["status"]=="success")
        {
          catmessage = "remove";
        }
        else {
          catmessage = "error";
        }
      });
    } on ErrorHandler catch (ex) {
      print(ex.message);
    }
  }

  Future<Null> UpdateCategory({
    category_id,category_name,context,
  }) async {
    isLoading = true;
    try {
      await ApiHandler.post(UrlResources.UPDATE_CATEGORY,
        body: {
          "category_id": category_id,
          "category_name": category_name,
        },
      ).then((dynamic value) async
      {
        isLoading = false;
        if (value["status"] == "success") {
          catmessage = "insert";
        }
        else {
          catmessage = "not insert";
        }
      });
    } on ErrorHandler catch (ex) {
      isLoading = false;
    }
  }

}