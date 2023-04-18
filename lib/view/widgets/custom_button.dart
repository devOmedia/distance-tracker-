import 'package:flutter/material.dart';
import 'package:walkmate/model/constants/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.size,
    required this.onPressed,
    required this.title,
  });

  final Size size;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.08,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Kconstants.of(context)!.green,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Kconstants.of(context)!.offWhite,
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}
