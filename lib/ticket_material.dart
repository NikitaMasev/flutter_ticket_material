import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:ticket_material/mask_ticket_painter.dart';

class TicketMaterial extends StatefulWidget {
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
  final Function() tapHandler;
  final bool useAnimationScaleOnTap;
  final double lowerBoundAnimation;

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
      this.radiusBorder = 0,
      this.tapHandler,
      this.useAnimationScaleOnTap = true,
      this.lowerBoundAnimation = 0.95});

  @override
  _TicketMaterialState createState() => _TicketMaterialState(height);
}

class _TicketMaterialState extends State<TicketMaterial>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var _height = double.infinity;
  var _width = double.infinity;

  _TicketMaterialState(this._height);

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        lowerBound: widget.lowerBoundAnimation,
        upperBound: 1,
        vsync: this);
    _controller.forward();
    super.initState();
  }

  void _tapDown(TapDownDetails details) {
    if (widget.useAnimationScaleOnTap) {
      _controller.reverse();
    }

    if (widget.tapHandler != null) {
      widget.tapHandler();
    }
  }

  void _tapUp(TapUpDetails details) {
    if (widget.useAnimationScaleOnTap) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _tapUp,
      onTapDown: _tapDown,
      child: ScaleTransition(
        scale: _controller,
        child: SizedBox(
          width: _width,
          height: _height,
          child: Row(
            children: <Widget>[
              Flexible(
                  flex: widget.flexLefSize,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widget.colorBackground,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(widget.radiusBorder),
                          bottomLeft: Radius.circular(widget.radiusBorder),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: widget.colorShadow,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, widget.shadowSize),
                          ),
                        ]),
                    child: widget.leftChild,
                  )),
              Flexible(
                flex: widget.flexMaskSize,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: CustomPaint(
                    painter: MaskTicketPainter(
                        radiusCircle: widget.radiusCircle,
                        marginBetweenCircles: widget.marginBetweenCircles,
                        colorBg: widget.colorBackground,
                        colorShadow: widget.colorShadow,
                        shadowSize: widget.shadowSize),
                  ),
                ),
              ),
              Flexible(
                  flex: widget.flexRightSize,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: widget.colorBackground,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(widget.radiusBorder),
                          topRight: Radius.circular(widget.radiusBorder),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: widget.colorShadow,
                              blurRadius: 0.5,
                              offset: Offset(0.5, widget.shadowSize)),
                        ]),
                    child: widget.rightChild,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
