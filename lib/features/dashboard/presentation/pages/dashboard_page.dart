import 'package:flutter/material.dart';
import 'package:netflixy/core/utilities/constants.dart';
import 'package:netflixy/core/utilities/ui_colors.dart';
import 'package:netflixy/features/dashboard/presentation/viewmodels/dashboard_viewmodel.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/custom_drawer.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/custom_shimmer.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/custombutton_list.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/header_list.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/horizontal_list.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> buttonTextList = [
    'All',
    'Top 250 Movies',
    'Most Popular',
    'In Theater'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: UIColors.appbar_background,
        iconTheme: const IconThemeData(color: UIColors.appbar_icon),
        centerTitle: true,
        title: const Text(
          'Netflixy',
          style: TextStyle(color: UIColors.appbar_title),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: UIColors.appbar_icon,
              ))
        ],
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: SingleChildScrollView(
        child: Consumer<DashboardViewModel>(
          builder: (BuildContext context, dashboardViewModel, Widget? child) {
            return Column(
              children: [
                const MovieCard(
                  imageContainerWidth: double.infinity,
                  imageContainerHeight: 300,
                  movieNameContainerHeight: 42,
                  movieNameContainerWidth: 374,
                  outerLeftPadding: 20,
                  outerTopPadding: 20,
                  outerBottomPadding: 20,
                  outerRightPadding: 16,
                  movieNameVerticalPadding: 8,
                  movieNameHorizontalPadding: 6,
                  movieNameHeight: 42,
                  movieNameWidth: 374,
                  imageUrl: 'assets/banner.jpeg',
                  type: 'assets',
                  movieName: 'Fear the walking dead',
                ),
                CustomButtonList(
                  buttonTextList: buttonTextList,
                  onTap: (int index) {
                    dashboardViewModel.manageVisibility(index);
                  },
                ),
                Visibility(
                  visible: dashboardViewModel.top250Visible,
                  child: dashboardViewModel.top250movieList == null
                      ? const CustomShimmer()
                      : Column(
                          children: [
                            HeaderList(
                                movieCategory: StringConstant.top250Movies,
                                movies:
                                    dashboardViewModel.top250movieList ?? []),
                            HorizontalList(
                                movies:
                                    dashboardViewModel.top250movieList ?? []),
                          ],
                        ),
                ),
                Visibility(
                  visible: dashboardViewModel.mostPopularVisible,
                  child: dashboardViewModel.mostPopularMovieList == null
                      ? const CustomShimmer()
                      : Column(
                          children: [
                            HeaderList(
                              movieCategory: StringConstant.mostPopular,
                              movies:
                                  dashboardViewModel.mostPopularMovieList ?? [],
                            ),
                            HorizontalList(
                                movies:
                                    dashboardViewModel.mostPopularMovieList ??
                                        []),
                          ],
                        ),
                ),
                Visibility(
                  visible: dashboardViewModel.inTheaterVisible,
                  child: dashboardViewModel.inTheaterMovieList == null
                      ? const CustomShimmer()
                      : Column(
                          children: [
                            HeaderList(
                              movieCategory: StringConstant.inTheater,
                              movies:
                                  dashboardViewModel.inTheaterMovieList ?? [],
                            ),
                            HorizontalList(
                                movies: dashboardViewModel.inTheaterMovieList ??
                                    []),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
