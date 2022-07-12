

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mvvm_project/provider/CategoryProvider.dart';
import 'package:student_mvvm_project/resources/string_resources.dart';
import 'package:student_mvvm_project/ui/AddCategory.dart';
import 'package:student_mvvm_project/ui/UpdateCategory.dart';

class Display_category extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => Display_categoryState();
}
class Display_categoryState extends State<Display_category>
{

  CategoryProvider catprovider;
  // getdata()
  // {
  //   http
  // }

  @override
  Widget build(BuildContext context) {
    catprovider = Provider.of<CategoryProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.Display_category,style: TextStyle(color: Colors.blue),),
      ),
      body: catprovider.categoryLoading
          ?
      Center(child: CircularProgressIndicator())
          : (catprovider.categoryIsData)
        ? ListView.builder(
        itemCount: catprovider.categoryData.length,
        itemBuilder: (context,position)
        {
          return ListTile(
            onTap: (){
              var id= catprovider.categoryData[position].category_id;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateCategory(id),
                ),
              );
            },
            title: Text(catprovider.categoryData[position].category_name),
            trailing: IconButton(
              onPressed: () async{
                var id= catprovider.categoryData[position].category_id;
                await catprovider.RemoveCategory(context: context ,category_id: id);
                // Navigator.of(context).pushNamed("AddCategory");
                catprovider.GetCategory();
              },
              icon: Icon(Icons.close,color:Colors.red),
              ),
          );
        },
      )
          :
          Center(
            child: Text("No Data Found"),
          )
    );
  }

}