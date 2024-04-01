import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendeo/components/user_image_viow.dart';
import 'package:trendeo/core/color_app.dart';
import 'package:trendeo/themes/theme_button.dart';
import 'package:trendeo/themes/theme_icon.dart';
import 'package:trendeo/themes/theme_titel.dart';
import 'package:trendeo/widgets/inpout_edit_data.dart';

TextEditingController editingNameController = TextEditingController();
TextEditingController editingFaecBookController = TextEditingController();
TextEditingController editingInstagramController = TextEditingController();
TextEditingController editingPhoneController = TextEditingController();
TextEditingController editingDescriptionController = TextEditingController();

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.moodApp
          ? ColorApp.darkBackgroundColor
          : ColorApp.lightBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: ThemeIcon(
                  iconData: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: ThemeTitel(
                  text: "Edit my account",
                  size: 30,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Edit user image
                      Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Stack(
                          children: [
                            const UserImageViow(),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: ThemeIcon(
                                iconData: Icons.camera_alt_outlined,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Edit user name
                      InputUserEditData(
                        controller: editingNameController,
                        hintText: "Fill Name",
                        icon: Icons.person_outline,
                        onChanged: (p0) {},
                      ),

                      // Edit user feacBook link
                      InputUserEditData(
                        controller: editingFaecBookController,
                        hintText: "FaecBook link",
                        icon: Icons.link_outlined,
                        onChanged: (p0) {},
                      ),

                      // Edit user instagram link
                      InputUserEditData(
                        controller: editingInstagramController,
                        hintText: "Instagram link",
                        icon: Icons.link_outlined,
                        onChanged: (p0) {},
                      ),

                      // Edit user phome nampuer
                      InputUserEditData(
                        controller: editingPhoneController,
                        hintText: "Phone nampur",
                        icon: Icons.phone,
                        onChanged: (p0) {},
                        keyboardType: TextInputType.phone,
                      ),

                      // Edit Description box
                      InputUserEditData(
                        controller: editingDescriptionController,
                        hintText: "describe your self",
                        icon: Icons.psychology_outlined,
                        onChanged: (p0) {},
                        maxLines: null,
                      ),
                      ThemeButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        icon: Icons.verified_outlined,
                        text: "Save",
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
  }
}
