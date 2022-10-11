import 'package:flutter/material.dart';
import 'dart:async';

class delayedanimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const delayedanimation({required this.delay,required this.child});

  @override
  State<delayedanimation> createState() => _delayedanimationState();
}

class _delayedanimationState extends State<delayedanimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animeoffset;

  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,
    duration: Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.decelerate,
    );

    _animeoffset= Tween<Offset>(
      begin: Offset(0.0,-0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });

  }

  Widget build(BuildContext context) {
    return FadeTransition(opacity: _controller,
      child: SlideTransition(
        position:_animeoffset ,
        child: widget.child,
      ),
    );
  }
}
