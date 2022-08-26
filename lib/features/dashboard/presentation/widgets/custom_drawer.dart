import 'package:flutter/material.dart';
import 'package:netflixy/core/utilities/constants.dart';
import 'package:netflixy/core/utilities/ui_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          color: UIColors.container_background_colour,
          child:  const Padding(
            padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            child: Text(
              StringConstant.userName,
              style: TextStyle(color: UIColors.container_text_colour),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(StringConstant.top250Movies),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(StringConstant.inTheater),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(StringConstant.mostPopular),
        ),
      ],
    );
  }
}
