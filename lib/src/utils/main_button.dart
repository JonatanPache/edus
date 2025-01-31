import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;
  const MainButton(
      {super.key,
        this.title = '',
        required this.onTap,
        this.enabled = true,
        this.child,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color ?? Theme.of(context).cardColor
            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ?? Center(
                child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
