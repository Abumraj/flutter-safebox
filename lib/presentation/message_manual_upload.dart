import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/image_constant.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/core/utils/size_utils.dart';
import 'package:safebox/models/sms_model.dart';
import 'package:safebox/presentation/sms_view_page.dart';
import 'package:safebox/theme/custom_text_style.dart';
import 'package:safebox/theme/theme_helper.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

// ignore: must_be_immutable
class ManualSmsMessage extends StatefulWidget {
  Function? callback;
  ManualSmsMessage({super.key, this.callback});

  @override
  State<ManualSmsMessage> createState() => _ManualSmsMessageState();
}

class _ManualSmsMessageState extends State<ManualSmsMessage> {
  final Uploadanager uploadController = Get.put(Uploadanager());
  List<SmsMessageModel> sms = [];
  List<Contact> contacts = [];
  List<SmsMessageModel> selectedContacts = [];
  bool isSelectAll = false;
  List<String> titles = [];
  @override
  void initState() {
    display();
    super.initState();
  }

  List<SmsMessageModel> conversationMessages(String? threadId) {
    List<SmsMessageModel> messages = [];

    var conversationMessages =
        sms.where((element) => element.address == threadId);
    messages.addAll(conversationMessages);
    return messages;
  }

  display() async {
    var data = await uploadController.getContactsFromPrefs();
    contacts = uploadController.convertVcardToContactList(data);
    uploadController.getSmsOnPhone(false).then((value) {
      setState(() {
        sms = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
          width: mediaQueryData.size.width,
          child: sms.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GroupedListView.list(
                  items: sms,
                  // controller: _scrollController,
                  physics: const ScrollPhysics(),
                  headerBuilder: (context, DateTime index) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.h, bottom: 10.h),
                        child: Text(
                          ProgressDialogUtils.formatDateTime(index),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    );
                  },
                  listItemBuilder: (context, int count, int itemIndex,
                      SmsMessageModel item, int index) {
                    String contactName =
                        uploadController.changeSmsAddreessToContactName(
                            contacts, item.address!);
                    bool isContactSelected = selectedContacts.contains(item);
                    return ListTile(
                      onTap: () {
                        Get.to(SmsMessageView(
                            title: contactName,
                            messages: conversationMessages(item.address)));
                      },
                      leading: CircleAvatar(
                        backgroundColor: appTheme.blue800,
                        child: const Icon(
                          Icons.person_2_outlined,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                          uploadController.changeSmsAddreessToContactName(
                              contacts, item.address!)),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.body.toString().characters.length > 50
                                ? item.body.toString().substring(0, 50)
                                : item.body.toString(),
                            maxLines: 2,
                            // style: CustomTextStyles.bodySmallBlue800,
                          ),
                          Text(
                            ProgressDialogUtils.formatDateTime(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    item.date! * 1000)),
                            style: theme.textTheme.labelMedium,
                          )
                          // DateTime.fromMicrosecondsSinceEpoch(item.date! * 1000)
                        ],
                      ),
                      trailing: Checkbox(
                        value: isContactSelected,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        checkColor: appTheme.blue800,
                        activeColor: appTheme.blue800,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.white.withOpacity(.32);
                          }
                          return Colors.white;
                        }),
                        onChanged: (value) {
                          setState(() {
                            if (value != null && value) {
                              selectedContacts.add(item);
                            } else {
                              selectedContacts.remove(item);
                            }
                          });
                        },
                      ),
                    );
                  },
                  itemGrouper: ((item) =>
                      DateTime.fromMicrosecondsSinceEpoch(item.date! * 1000)))),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: selectedContacts.isEmpty
            ? AppbarLeadingImage(
                imagePath: ImageConstant.imgArrowLeft,
                margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
                onTap: () {
                  Get.back();
                })
            : Checkbox(
                value: isSelectAll,
                visualDensity: const VisualDensity(
                  vertical: -4,
                  horizontal: -4,
                ),
                checkColor: appTheme.blue800,
                activeColor: appTheme.blue800,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.white.withOpacity(.32);
                  }
                  return Colors.white;
                }),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selectedContacts = [];
                      selectedContacts.addAll(sms);
                      isSelectAll = true;
                    } else {
                      selectedContacts = [];
                      isSelectAll = false;
                    }
                  });
                },
              ),
        centerTitle: true,
        title: selectedContacts.isEmpty
            ? AppbarTitle(
                text: 'Sms Messages', margin: EdgeInsets.only(left: 11.h))
            : Text(
                "${selectedContacts.length} Selected Messages",
                style: CustomTextStyles.titleLargeSofiaProIndigo600,
              ),
        actions: [
          if (selectedContacts.isNotEmpty)
            TextButton(
                onPressed: () {
                  if (selectedContacts.isNotEmpty) {
                    uploadController.uploadSmsMessages(selectedContacts,
                        callBack: widget.callback);
                    Get.back();
                  } else {
                    ProgressDialogUtils.showFailureToast(
                        "No Messages selected");
                  }
                },
                child: Text(
                  "Upload",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: appTheme.indigo900,
                  ),
                )),
        ]);
  }
}
