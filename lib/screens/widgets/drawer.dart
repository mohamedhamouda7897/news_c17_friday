import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_c17_fri/core/theming/bloc/cubit.dart';
import 'package:news_c17_fri/core/theming/dark_colors.dart';
import 'package:news_c17_fri/core/theming/light_colors.dart';

class AppDrawer extends StatelessWidget {
  Function onDrawerClicked;

  AppDrawer({super.key, required this.onDrawerClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .70,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 210,
            color: ThemeCubit.get(context).colors.secondary,
            child: Center(
              child: Text(
                "News",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: ThemeCubit.get(context).colors.primary,
                ),
              ),
            ),
          ),

          SizedBox(height: 12),
          InkWell(
            onTap: () {
              onDrawerClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 12),
                  Text(
                    "Go To Home",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: ThemeCubit.get(context).colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Light Theme",
          //       style: GoogleFonts.poppins(
          //         fontSize: 24,
          //         color: ThemeCubit.get(context).colors.secondary,
          //       ),
          //     ),
          //     Switch(
          //       value: ThemeCubit.get(context).colors is LightColors,
          //       onChanged: (value) {
          //         ThemeCubit.get(context).changeTheme();
          //       },
          //     ),
          //   ],
          // ),

          Container(
            width: double.infinity,
            child: DropdownMenu(
              hintText: "Theme",
              onSelected: (value) {
                if (value == "Dark") {
                  ThemeCubit.get(context).changeTheme(DarkColors());
                }else{
                  ThemeCubit.get(context).changeTheme(LightColors());
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Dark", label: "Dark"),
                DropdownMenuEntry(value: "Light", label: "Light"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
