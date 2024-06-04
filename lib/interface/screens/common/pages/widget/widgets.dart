import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.h,
    required this.text,
    this.onTap,
  });

  final double h;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: h * 0.05),
        ),
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.size, required this.tap, required this.isPlus, required this.color});
  final double size;
  final VoidCallback tap;
  final bool isPlus;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: tap,
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: UTILSConstants.grey2,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            isPlus ? AppLocalizations.current.plus : AppLocalizations.current.minus,
            style: TextStyle(fontSize: h * 0.04, color: color),
          ),
        ),
      ),
    );
  }
}
