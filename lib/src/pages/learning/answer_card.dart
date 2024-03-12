import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard(
      {super.key,
        required this.answer,
        this.isSelected = false,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected? Colors.redAccent : Theme.of(context).cardColor,
            border: Border.all(
                color: isSelected ? Colors.red.shade50 : Colors.black
            )
        ),
        child: Text(
          answer,
          style: TextStyle(
              color: isSelected ? Colors.white : null
          ),
        ),
      ),

    );
  }
}
