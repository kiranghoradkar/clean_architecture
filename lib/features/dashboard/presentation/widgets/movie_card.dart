import 'package:flutter/material.dart';
import 'package:netflixy/core/utilities/ui_colors.dart';

class MovieCard extends StatelessWidget {
  final double? imageContainerHeight;
  final double imageContainerWidth;
  final double? movieNameContainerHeight;
  final double? movieNameContainerWidth;
  final double outerLeftPadding;
  final double outerTopPadding;
  final double outerBottomPadding;
  final double outerRightPadding;
  final double movieNameVerticalPadding;
  final double movieNameHorizontalPadding;
  final double? movieNameHeight;
  final double? movieNameWidth;
  final String imageUrl;
  final String type;
  final String movieName;

  final Function()? onTap;

  const MovieCard(
      {Key? key,
      required this.imageContainerHeight,
      required this.imageContainerWidth,
      this.movieNameContainerHeight,
      this.movieNameContainerWidth,
      required this.outerLeftPadding,
      required this.outerTopPadding,
      required this.movieNameVerticalPadding,
      required this.movieNameHorizontalPadding,
      this.movieNameHeight,
      this.movieNameWidth,
      required this.outerBottomPadding,
      required this.outerRightPadding,
      required this.imageUrl,
      required this.type,
      required this.movieName,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(outerLeftPadding, outerTopPadding,
          outerRightPadding, outerBottomPadding),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              if (onTap != null) onTap!();
            },
            child: Container(
              height: imageContainerHeight,
              width: imageContainerWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: type == 'network'
                        ? NetworkImage(imageUrl)
                        : AssetImage(imageUrl) as ImageProvider,
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: movieNameVerticalPadding,
                    horizontal: movieNameHorizontalPadding),
                height: movieNameHeight,
                width: movieNameWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: UIColors.container_background_colour,
                ),
                child: Text(
                  movieName,
                  style: const TextStyle(
                    color: UIColors.container_text_colour,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
