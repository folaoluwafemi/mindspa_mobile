import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmartResuableCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;
  final Function() onTap;
  const SmartResuableCard({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: color),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 13,
                      ),
                ),
                SizedBox(
                  child: SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
