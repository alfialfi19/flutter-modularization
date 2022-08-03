import 'package:flutter/material.dart';

import '../../commons/commons.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool useIcon;
  final IconData? icon;
  final Color? color;
  final VoidCallback? action;

  const SocialMediaButton({
    Key? key,
    required this.title,
    this.titleColor,
    this.useIcon = true,
    this.icon,
    this.color,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action != null ? action!.call() : null,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
          color: color ?? Palette.white,
        ),
        child: useIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon ?? Icons.mail_outline,
                    color: Palette.black,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    title,
                    style: FontHelper.h6Bold(
                      color: titleColor ?? Palette.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                title,
                style: FontHelper.h6Bold(
                  color: titleColor ?? Palette.black,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
