class StringResources{
  static const String home = "Home";
  static const String events = "Upcoming Events";
  static const String my_ads = "My Ads";
  static const String ads = "Ads";
  static const String my_account = "My Account";
  static const String account = "Account";
  static const String help = "Help";
  static const String terms_of_service = "Terms Of Service";
  static const String logout = "Logout";
  static const String favourites = "Favourites";
  static const String my_favourites = "My Favourites";


  static const String Display_category = "Category";
  static const String Add_Category = "AddCategory";
  static const String Update_Category = "UpdateCategory";

  static const String addcatheading = "Add Category";
}


class Patterns {
  static const Pattern name = r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]';
  static const Pattern email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const Pattern phonePattern = r'^(?:[+0]9)?[0-9]{9}$';
  static const Pattern moneyPattern = r'^\d*(\.\d{1,2})?$';
  static const Pattern weightKmPattern = r'^\d*(\.\d{1,3})?$';
}