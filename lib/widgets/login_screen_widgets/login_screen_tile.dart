import 'package:flutter/material.dart';

class LoginScreenTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const LoginScreenTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<LoginScreenTile> createState()  {return _LoginScreenTileState();}
}

class _LoginScreenTileState extends State<LoginScreenTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: _isHovered
                ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0),
            alignment: Alignment.center,
            
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black, width: 3),
            //   boxShadow: _isHovered
            //       ? [
            //           const BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 10,
            //             offset: Offset(0, 4),
            //           ),
            //         ]
            //       : null,
            // ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Obraz tła
                Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
                // Nakładka dla tekstu
                Container(
                  color: Colors.black.withOpacity(0.1),
                ),
                // Tytuł wyśrodkowanyss
                Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
