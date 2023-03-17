import 'package:flutter/material.dart';
import 'package:test_list/generated/l10n.dart';
import 'package:test_list/resourses/colors.dart';
import 'package:test_list/resourses/fonts.dart';

class BackButtonWrapper extends StatelessWidget {
  const BackButtonWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.buttonDialog,
      label: Text(
          S.of(context).back,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: AppFonts.bold,
            fontFamily: AppFonts.fontFamily,
            fontSize: 20.0,
          ),
        ),
      onPressed: () {
        Navigator.of(context).pop();
      }, 
    );
  }
}
