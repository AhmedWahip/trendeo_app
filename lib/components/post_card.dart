import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendeo/core/color_app.dart';
import 'package:trendeo/core/size_app.dart';
import 'package:trendeo/themes/theme_description.dart';
import 'package:trendeo/themes/theme_icon.dart';
import 'package:trendeo/themes/theme_titel.dart';
import 'package:trendeo/widgets/comment_button.dart';
import 'package:trendeo/widgets/favorite_button.dart';

bool showVanBar = true;

class PostCard extends StatefulWidget {
  const PostCard(
      {super.key,
      required this.titlePost,
      required this.isFavorite,
      required this.userName,
      required this.onPressed,
      required this.userImage,
      required this.image,
      required this.authorIsUser,
      required this.deletePost,
      required this.likesCount});
  final String titlePost;
  final Widget image;
  final VoidCallback onPressed;
  final VoidCallback deletePost;
  final bool isFavorite;
  final String userName;
  final String userImage;
  final int likesCount;
  final bool authorIsUser;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      width: SizeApp.screenWidth! * 1,
      height: SizeApp.screenHeight! * 0.5 + 100,
      decoration: BoxDecoration(
        color: ColorApp.moodApp
            ? ColorApp.darkBackgroundColor
            : ColorApp.lightBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ColorApp.moodApp ? Colors.white12 : Colors.black12,
            offset: const Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: ThemeTitel(
                textAlign: TextAlign.start,
                text: widget.userName,
                size: 18,
              ),
              trailing: widget.authorIsUser
                  ? PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton(
                            onPressed: widget.deletePost,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Delete"),
                                SizedBox(width: 10),
                                Icon(Icons.delete),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.userImage),
                backgroundColor: ColorApp.moodApp
                    ? ColorApp.darkDelicateColor
                    : ColorApp.lightDelicateColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ThemeDescription(text: widget.titlePost),
          ),
          widget.image,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FavoriteButton(
                  onPressed: widget.onPressed,
                  isFavorite: widget.isFavorite,
                  count: widget.likesCount,
                ),
                SizedBox(width: 20.w),
                CommentButton(
                  onPressed: () {
                    setState(() {
                      showVanBar = false;
                    });
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          height: SizeApp.screenHeight! - 120,
                          width: SizeApp.screenWidth! - 20,
                          decoration: BoxDecoration(
                            color: ColorApp.moodApp
                                ? ColorApp.darkBackgroundColor
                                : ColorApp.lightBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorApp.moodApp
                                    ? Colors.white12
                                    : Colors.black12,
                                offset: const Offset(0, 3),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeIcon(
                                iconData: Icons.close,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  isComment: true,
                  count: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
