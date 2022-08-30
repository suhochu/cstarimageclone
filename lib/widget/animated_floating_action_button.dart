import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton(
      {Key? key,
        required this.opacity,
        required this.function,
      })
      : super(key: key);
  final double opacity;
  final GestureTapCallback function;

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.function,
      child: AnimatedOpacity(
        opacity: widget.opacity,
        duration: const Duration(milliseconds: 300),
        child: const PhysicalModel(
          color: Colors.black,
          elevation: 15.0,
          shape: BoxShape.circle,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black54,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}