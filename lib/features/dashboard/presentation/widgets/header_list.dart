import 'package:flutter/material.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/presentation/widgets/gride_viewlist.dart';

class HeaderList extends StatelessWidget {
  final String movieCategory;
  final List<MovieDetails> movies;

  const HeaderList(
      {Key? key, required this.movieCategory, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            movieCategory,
            style: const TextStyle(fontSize: 20),
          ),
          InkWell(
            child: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GridViewList(
                          movies: movies, movieCategory: movieCategory,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
