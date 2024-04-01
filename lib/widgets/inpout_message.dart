import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendeo/core/color_app.dart';

class InpoutMessage extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  const InpoutMessage({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: TextFormField(
        onChanged: onChanged,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        controller: controller,
        style: TextStyle(
          color: ColorApp.moodApp
              ? ColorApp.darkTextColor
              : ColorApp.lightTextColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Message ...",
          hintStyle: TextStyle(
            fontSize: 17.sp,
            color: ColorApp.moodApp
                ? ColorApp.darkDescriptionColor
                : ColorApp.lightDescriptionColor,
          ),
        ),
      ),
    );
  }
}