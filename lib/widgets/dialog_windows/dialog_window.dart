import 'package:flutter/material.dart';
import 'package:test_list/resourses/fonts.dart';
import 'package:test_list/resourses/lists.dart';
import 'package:test_list/widgets/buttons/back_button.dart';

Future infoAboutFruits({
  required BuildContext context,
  required int index,
}) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      final h = MediaQuery.of(context).size.height;
      return AlertDialog(
        title: Text(
          AppLists.fruits[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: AppFonts.regular,
            fontFamily: AppFonts.fontFamily,
            fontSize: 25.0,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsOverflowButtonSpacing: 10,
        actions: [
          SizedBox(
            height: h / 2.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    AppLists.fruitsInfo[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: AppFonts.regular,
                      fontFamily: AppFonts.fontFamily,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const BackButtonWrapper(),
        ],
      );
    },
  );
}
