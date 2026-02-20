import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_c17_fri/core/api_manager.dart';
import 'package:news_c17_fri/screens/bloc/cubit.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: bloc.articles.isEmpty
          ? Center(child: Text("No Data"))
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        bloc.articles[index].urlToImage ?? "",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        bloc.articles[index].title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bloc.articles[index].description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bloc.articles[index].author?.split(" ").first ?? "",

                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            bloc.articles[index].publishedAt?.substring(
                                  0,
                                  10,
                                ) ??
                                "",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: bloc.articles.length,
            ),
    );
  }
}
