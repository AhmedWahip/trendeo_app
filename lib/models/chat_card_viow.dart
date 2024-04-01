import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendeo/core/color_app.dart';
import 'package:trendeo/themes/theme_description.dart';
import 'package:trendeo/themes/theme_titel.dart';

class ChatCardViow extends StatelessWidget {
  const ChatCardViow({
    super.key,
    required this.titel,
    required this.image,
    required this.onTap,
  });
  final String titel;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: ThemeTitel(
        text: titel,
        size: 15,
      ),
      subtitle: const ThemeDescription(text: "message"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorApp.moodApp
              ? ColorApp.darkPrimaryColor
              : ColorApp.lightPrimaryColor,
        ),
        child: Center(
          child: Text(
            "1",
            style: TextStyle(
              color: ColorApp.moodApp
                  ? ColorApp.darkBackgroundColor
                  : ColorApp.lightBackgroundColor,
              // fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
