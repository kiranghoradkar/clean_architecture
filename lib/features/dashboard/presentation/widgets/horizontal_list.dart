import 'package:flutter/material.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/presentation/pages/movie_details_page.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/movie_card.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieDetails> movies;

  const HorizontalList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          primary: true,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MovieCard(
              movieNameWidth: 140,
              movieNameHeight: 80,
              imageContainerHeight: 240,
              imageContainerWidth: 140,
              movieNameHorizontalPadding: 10,
              movieNameVerticalPadding: 10,
              outerLeftPadding: 20,
              outerTopPadding: 12,
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
