import 'package:flutter/material.dart';
import 'package:netflixy/core/utilities/ui_colors.dart';

class CustomButtonList extends StatelessWidget {
  final List<String> buttonTextList;
  final Function onTap;

  const CustomButtonList(
      {Key? key, required this.buttonTextList, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        itemCount: buttonTextList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onTap(index),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset:
                            const Offset(3, 2), // changes position of shadow
                        // offset: Offset(0, 3),
                      ),
                    ],
                    color: UIColors.button_colour,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  buttonTextList[index],
                  style: const TextStyle(
                      color: UIColors.text_colour, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
