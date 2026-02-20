import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_c17_fri/core/api_manager.dart';
import 'package:news_c17_fri/core/theming/bloc/cubit.dart';
import 'package:news_c17_fri/models/category_model.dart';
import 'package:news_c17_fri/screens/news_screen.dart';
import 'package:news_c17_fri/screens/views/sources_view.dart';
import 'package:news_c17_fri/screens/views/categories_view.dart';
import 'package:news_c17_fri/screens/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeCubit.get(context).colors.primary,
      drawer: AppDrawer(onDrawerClicked:onDrawerClicked ,),
      appBar: AppBar(title: Text("Home"), centerTitle: true,),

      body: selectedCategory != null ? SourcesView(
        catID: selectedCategory!.id,

      ) : CategoriesView(
        onCategoryClicked:onCategoryClicked,),
    );
  }

  CategoryModel? selectedCategory;

  onDrawerClicked(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
  onCategoryClicked(CategoryModel category) {
    selectedCategory = category;
    setState(() {

    });
  }
}
