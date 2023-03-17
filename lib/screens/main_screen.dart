import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_list/generated/l10n.dart';
import 'package:test_list/resourses/colors.dart';
import 'package:test_list/resourses/fonts.dart';
import 'package:test_list/resourses/icons.dart';
import 'package:test_list/resourses/lists.dart';
import 'package:test_list/widgets/dialog_windows/dialog_window.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        centerTitle: true,
        title: Text(
          S.of(context).fruits,
          style: const TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      backgroundColor: AppColors.back,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        itemCount: AppLists.fruits.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Dismissible(
                onDismissed: (direction) {
                  setState(
                    () {
                      AppLists.fruits.removeAt(index);
                      AppLists.fruitsInfo.removeAt(index);
                    },
                  );
                },
                background: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.buttonDialog,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        AppIcons.delete,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.delete,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                key: UniqueKey(),
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(
                        side: BorderSide(
                          width: 2.0,
                        ),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      Size(h, w / 5),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.list,
                    ),
                  ),
                  onPressed: () {
                    infoAboutFruits(
                      context: context,
                      index: index,
                    );
                  },
                  child: Text(
                    AppLists.fruits[index],
                    style: const TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.regular,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
