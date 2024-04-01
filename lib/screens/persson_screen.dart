import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendeo/bloc/social_bloc/social_cubit.dart';
import 'package:trendeo/bloc/social_bloc/social_states.dart';
import 'package:trendeo/components/user_image_viow.dart';
import 'package:trendeo/core/color_app.dart';
import 'package:trendeo/screens/edit_account_screen.dart';
import 'package:trendeo/themes/theme_description.dart';
import 'package:trendeo/themes/theme_titel.dart';

class PerssonScreen extends StatelessWidget {
  const PerssonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        state is SocialSuccessState
            ? SocialCubit.get(context).hasPostImage
            : null;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorApp.moodApp
              ? ColorApp.darkBackgroundColor
              : ColorApp.lightBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: ThemeTitel(
                      text: "User Profile",
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: UserImageViow(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ThemeTitel(text: "user name", size: 20),
                          ),
                          const ThemeDescription(text: "userEmil@gmail.com"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AccontButton(
                                  onPressed: () {},
                                  srcImage: "assets/icons/facebook-icon.png",
                                ),
                                AccontButton(
                                  onPressed: () {},
                                  srcImage: "assets/icons/instagram-icon.png",
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ThemeDescription(
                              text: editingDescriptionController.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ThemeDescription(
                              text:
                                  "the phone is : ${editingPhoneController.text}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AccontButton extends StatelessWidget {
  final String srcImage;
  final VoidCallback onPressed;
  const AccontButton({
    super.key,
    required this.srcImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(2),
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorApp.moodApp
                ? ColorApp.darkPrimaryColor
                : ColorApp.lightPrimaryColor,
          ),
        ),
        child: Image.asset(
          srcImage,
        ),
      ),
    );
  }
}
