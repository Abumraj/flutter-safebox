import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/sms_model.dart';
import 'package:safebox/presentation/message_manual_upload.dart';
import 'package:safebox/presentation/sms_view_page.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_floating_button.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

class SmsMessages extends StatefulWidget {
  const SmsMessages({super.key});

  @override
  State<SmsMessages> createState() => _SmsMessagesState();
}

class _SmsMessagesState extends State<SmsMessages> {
  final Uploadanager uploadController = Get.put(Uploadanager());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<SmsMessageModel> sms = [];
  List<SmsMessageModel> selectedSms = [];
  List<Contact> contacts = [];
  bool isSelectAll = false;
  bool isLoading = false;
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
    setState(() {
      isLoading = true;
    });
    var data = await uploadController.getContactsFromPrefs();
    contacts = uploadController.convertVcardToContactList(data);
    await uploadController.readSmsFromFile().then((value) {
      setState(() {
        uploadController.saveSmsMeassagesCountToPrefs(value.length.toString());
        sms = value;
        isLoading = false;
      });
    });
  }

  Future<List<SmsMessageModel>> getEncodedMessagesFromPrefs() async {
    String? encodedMessages = await uploadController
        .getUploadedSmsMessagesFromPrefs(); // Implement this method
    if (encodedMessages != null) {
      List<dynamic> jsonList = json.decode(encodedMessages);
      return jsonList.map((json) => SmsMessageModel.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      // endDrawer: Drawer(
      //   // width: MediaQuery.of(context).size.width - 20,
      //   // height: MediaQuery.of(context).size.width,
      //   elevation: 10,
      //   child: NavigationPageScreen(),
      // ),
      appBar: _buildAppBar(),
      body: SizedBox(
          width: mediaQueryData.size.width,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : sms.isEmpty
                  ? Center(
                      child: SizedBox(
                          width: 220.h,
                          child: Text(
                              "You have not backed Up any Sms message".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleSmallGray900)),
                    )
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
                        bool isContactSelected = selectedSms.contains(item);
                        return ListTile(
                          onTap: () {
                            Get.to(SmsMessageView(
                                title: contactName,
                                messages: conversationMessages(item.address)));
                          },
                          leading: CircleAvatar(
                            backgroundColor: appTheme.blue800,
                            // child: Text(
                            //   searchContact.displayName.characters.first.toUpperCase() +
                            //       (searchContact.displayName.characters.length > 1
                            //           ? searchContact.displayName.characters
                            //               .elementAt(1)
                            //               .toUpperCase()
                            //           : ''),
                            //   style: const TextStyle(color: Colors.white),
                            // ),
                          ),
                          title: Text(contactName),
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
                              ),

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
                                  selectedSms.add(item);
                                } else {
                                  selectedSms.remove(item);
                                }
                              });
                            },
                          ),
                        );
                      },
                      itemGrouper: ((item) =>
                          DateTime.fromMicrosecondsSinceEpoch(
                              item.date! * 1000)))),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return CustomFloatingButton(
        onTap: () {
          Get.to(ManualSmsMessage(
            callback: display,
          ));
        },
        height: 64,
        width: 64,
        backgroundColor: appTheme.blue800,
        child: CustomImageView(
            imagePath: ImageConstant.imgAntDesignPlusOutlined,
            height: 32.0.v,
            width: 32.0.h));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 54.h,
      leading: selectedSms.isEmpty
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
                    selectedSms = [];
                    selectedSms.addAll(sms);
                    isSelectAll = true;
                  } else {
                    selectedSms = [];
                    isSelectAll = false;
                  }
                });
              },
            ),
      centerTitle: true,
      title: selectedSms.isEmpty
          ? AppbarTitle(text: 'SMS Backup', margin: EdgeInsets.only(left: 11.h))
          : Text(
              "${selectedSms.length} Selected Contacts",
              style: CustomTextStyles.titleLargeSofiaProIndigo600,
            ),
      actions: [
        if (selectedSms.isNotEmpty)
          CustomImageView(
            imagePath: ImageConstant.imgFluentDelete28Filled,
            height: 30.adaptSize,
            width: 28.adaptSize,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(
              right: 3.h,
              bottom: 5.v,
            ),
            onTap: () {
              setState(() {
                sms.removeWhere((contact) => selectedSms
                    .any((selected) => selected.body == contact.body));

                // Clear the selectedSms list after deletion
                selectedSms.clear();
              });
              uploadController.deleteSms(sms);
            },
          )
      ],
    );
  }
}
