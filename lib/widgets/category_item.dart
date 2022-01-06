import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.5),
            color,
          ],
          center: Alignment.center,
          focal: Alignment.bottomCenter,

          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
        
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
