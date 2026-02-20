import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_c17_fri/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  Function onCategoryClicked;

  CategoriesView({super.key, required this.onCategoryClicked});

  var categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onCategoryClicked(categories[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      alignment: index.isOdd
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(categories[index].image),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 12,
                            right: 12,
                            left: 12,
                          ),
                          padding: EdgeInsets.only(
                            left: index.isOdd ? 0 : 8,
                            right: index.isEven ? 0 : 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                visible: index.isOdd,
                                child: Image.asset(
                                  "assets/images/arrow_back.png",
                                ),
                              ),

                              Text(
                                "View All",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Visibility(
                                visible: index.isEven,
                                child: Image.asset("assets/images/arrow.png"),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 112,

                          right: index.isOdd ? null : 28,
                          left: index.isEven ? null : 28,
                          child: Text(
                            categories[index].label,
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: categories.length,
            ),
          ],
        ),
      ),
    );
  }
}
