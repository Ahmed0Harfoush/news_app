import 'package:flutter/material.dart';

import 'Matches.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MatchesBoard()),
            );
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            decoration: BoxDecoration(
              color: _isPressed ? Colors.blue[700] : (_isHovered ? Colors.blue[400] : Colors.blue),
              borderRadius: BorderRadius.circular(8),
              boxShadow: _isPressed
                  ? []
                  : [
                if (_isHovered)
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.6),
                    spreadRadius: 4,
                    blurRadius: 8,
                  ),
              ],
            ),
            child: Text(
              'Match Schedule',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
