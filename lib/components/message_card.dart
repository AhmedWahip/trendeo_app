import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trendeo/core/color_app.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    this.e,
  });
  final dynamic e;
  @override
  Widget build(BuildContext context) {
    BoxDecoration messageMy() {
      return BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: ColorApp.moodApp
            ? ColorApp.darkDelicateColor
            : ColorApp.lightDelicateColor,
      );
    }

    BoxDecoration messageYou() {
      return BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: ColorApp.moodApp
            ? ColorApp.darkPrimaryColor
            : ColorApp.lightPrimaryColor,
      );
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: e['senderEmail'] == FirebaseAuth.instance.currentUser!.email
          ? messageYou()
          : messageMy(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            e['text'],
            style: TextStyle(
              color: ColorApp.moodApp
                  ? ColorApp.darkBackgroundColor
                  : ColorApp.lightBackgroundColor,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "5:23",
              style: TextStyle(
                color: ColorApp.moodApp
                    ? ColorApp.darkBackgroundColor
                    : ColorApp.lightBackgroundColor,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}