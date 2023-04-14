import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/font_manager.dart';
import 'package:fit_track/utils/resources/image_path_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomNotFoundCard extends StatelessWidget {
  const CustomNotFoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            ImagePathManager.instance.notFoundPath,
            fit: BoxFit.cover,
          ),
          Text(
            StringManager.instance.notFoundTitle,
            style: getSemiBoldStyle(
                color: ColorManager.instance.black, fontSize: FontSize.s24),
          ),
        ],
      ),
    );
  }
}
