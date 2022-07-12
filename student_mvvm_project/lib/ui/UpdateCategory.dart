

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mvvm_project/provider/CategoryProvider.dart';
import 'package:student_mvvm_project/resources/string_resources.dart';

class UpdateCategory extends StatefulWidget
{
  String catid="";
  UpdateCategory(this.catid);

  @override
  UpdateCategoryState createState() => UpdateCategoryState();
}

class UpdateCategoryState extends State<UpdateCategory>
{


  CategoryProvider _categoryProvider;

  var _formkey= GlobalKey<FormState>();
  TextEditingController _categoryname = TextEditingController();

  _loaddata() async{

    await _categoryProvider.GetSingleCategory(widget.catid);
    for(var item in _categoryProvider.categoryData)
    {
      setState(() {
        _categoryname.text = item.category_name;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    _loaddata();
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.Update_Category,style: TextStyle(color: Colors.blue),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Form(
                  key:_formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _categoryname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          labelText: "Name",
                          hintText: "Enter Full Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // Divider(height: 2,color: Colors.black38),
                      InkWell(
                        onTap: () async{
                          var name= _categoryname.text.toString();
                          await _categoryProvider.UpdateCategory(context: context,category_id:widget.catid ,category_name: name);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("Update Category",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("DisplayCategory");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("Display category",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}