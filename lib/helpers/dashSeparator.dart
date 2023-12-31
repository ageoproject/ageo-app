import 'package:flutter/material.dart';

class DashSeparator extends StatelessWidget {
  const DashSeparator({Key? key, this.height = 1, this.color = Colors.black,this.direction=Axis.horizontal})
      : super(key: key);
  final double height;
  final Color color;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    // this is class to create dashSeparator line on screen
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
          children:  List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}