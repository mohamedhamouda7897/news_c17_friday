import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_c17_fri/di.dart';
import 'package:news_c17_fri/repository/local/home_local_repo_impl.dart';
import 'package:news_c17_fri/repository/remote/home_remote_repo_impl.dart';
import 'package:news_c17_fri/screens/bloc/cubit.dart';
import 'package:news_c17_fri/screens/bloc/states.dart';
import 'package:news_c17_fri/screens/news_screen.dart';

import '../../core/api_manager.dart';

class SourcesView extends StatelessWidget {
  String catID;

  SourcesView({super.key, required this.catID});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<HomeCubit>()..getSources(catID),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is GetSourcesLoadingState ||
                state is GetNewsDataLoadingState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                DefaultTabController(
                  length: bloc.sources.length,
                  initialIndex: bloc.selectedIndex,
                  child: TabBar(
                    isScrollable: true,
                    onTap: (value) {
                      bloc.changeSelectedSource(value);
                    },
                    indicatorColor: Colors.black,
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    tabs: bloc.sources
                        .map((e) => Tab(child: Text(e.name ?? "")))
                        .toList(),
                  ),
                ),
                Expanded(child: NewsScreen()),
              ],
            );
          },
        ),
      ),
    );
  }
}
