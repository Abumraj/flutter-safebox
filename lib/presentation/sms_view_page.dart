import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/models/sms_model.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class SmsMessageView extends StatefulWidget {
  final String title;
  final List<SmsMessageModel> messages;
  const SmsMessageView(
      {super.key, required this.title, required this.messages});

  @override
  State<SmsMessageView> createState() => _SmsMessageViewState();
}

class _SmsMessageViewState extends State<SmsMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.messages.length,
            itemBuilder: (context, index) {
              SmsMessageModel messages = widget.messages[index];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: DateChip(
                          date: DateTime.fromMicrosecondsSinceEpoch(
                              messages.date! * 1000)),
                    ),
                  ),
                  BubbleSpecialOne(
                    text: messages.body.toString(),
                    isSender: false,
                    tail: false,
                    color: appTheme.blue100,
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                ],
              );
            }));
  }

// Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//
//               ],
//             ),
//           )
//         ],
//       ),
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 54.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
          onTap: () {
            Get.back();
          }),
      title:
          AppbarTitle(text: widget.title, margin: EdgeInsets.only(left: 11.h)),
    );
  }
}
