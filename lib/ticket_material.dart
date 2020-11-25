import 'package:flutter/material.dart';
import 'package:ticket_material/mask_ticket_painter.dart';

class TicketMaterial extends StatelessWidget {
  final int flexLefSize;
  final int flexMaskSize;
  final int flexRightSize;
  final Color colorBackground;
  final Color colorShadow;
  final double shadowSize;
  final double radiusCircle;
  final double radiusBorder;
  final double marginBetweenCircles;
  final double height;
  final Widget leftChild;
  final Widget rightChild;

  const TicketMaterial(
      {this.flexLefSize = 70,
      this.flexMaskSize = 5,
      this.flexRightSize = 20,
      this.radiusCircle = 4,
      this.marginBetweenCircles = 3,
      @required this.height,
      @required this.leftChild,
      @required this.rightChild,
      @required this.colorBackground,
      this.colorShadow = Colors.grey,
      this.shadowSize = 1.5,
      this.radiusBorder = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
            flex: flexLefSize,
            child: Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colorBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radiusBorder),
                    bottomLeft: Radius.circular(radiusBorder),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorShadow,
                      blurRadius: 0.5,
                      offset: Offset(-0.5, shadowSize),
                    ),
                  ]),
              child: leftChild,
            )),
        Flexible(
          flex: flexMaskSize,
          child: Container(
            height: height,
            color: Colors.transparent,
            width: double.infinity,
            child: CustomPaint(
              painter: MaskTicketPainter(
                  radiusCircle: radiusCircle,
                  marginBetweenCircles: marginBetweenCircles,
                  colorBg: colorBackground,
                  colorShadow: colorShadow,
                  shadowSize: shadowSize),
            ),
          ),
        ),
        Flexible(
            flex: flexRightSize,
            child: Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colorBackground,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(radiusBorder),
                    topRight: Radius.circular(radiusBorder),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: colorShadow,
                        blurRadius: 0.5,
                        offset: Offset(0.5, shadowSize)),
                  ]),
              child: rightChild,
            ))
      ],
    );
  }
}
