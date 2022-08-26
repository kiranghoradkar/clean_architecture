import 'package:flutter/material.dart';
import 'package:netflixy/core/utilities/ui_colors.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/presentation/pages/movie_details_page.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/movie_card.dart';

class GridViewList extends StatelessWidget {
  final List<MovieDetails> movies;
  final String movieCategory;

  const GridViewList({
    Key? key,
    required this.movies,
    required this.movieCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieCategory,
          style: const TextStyle(color: UIColors.container_background_colour),
        ),
        backgroundColor: UIColors.appbar_background,
        iconTheme: const IconThemeData(color: UIColors.appbar_icon),
        elevation: 0,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          primary: true,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MovieCard(
              movieNameWidth: 120,
              movieNameHeight: 80,
              imageContainerHeight: 240,
              imageContainerWidth: 120,
              movieNameHorizontalPadding: 10,
              movieNameVerticalPadding: 10,
              outerLeftPadding: 40,
              outerTopPadding: 20,
              outerRightPadding: 4,
              outerBottomPadding: 12,
              imageUrl: movies[index].image!,
              movieName: movies[index].title!,
              type: 'network',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailPage(movieDetails: movies[index]),
                  ),
                );
              },
            );
          }),
    );
  }
}
