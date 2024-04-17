import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/models/userfiles_item_model.dart';
import 'package:safebox/presentation/contact_selection_page.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/appbar_trailing_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_floating_button.dart';
import 'package:safebox/widgets/custom_list_view.dart';
import 'package:safebox/widgets/custom_search_view.dart';
import 'package:simple_grouped_listview/simple_grouped_listview.dart';

class FilesPageScreen extends StatefulWidget {
  final String title;
  const FilesPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<FilesPageScreen> createState() => _FilesPageScreenState();
}

class _FilesPageScreenState extends State<FilesPageScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final Uploadanager uploadController = Get.put(Uploadanager());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<UserfilesItemModel> searchResult = [];
  List<UserfilesItemModel> recentFiles = [];
  List<Contact> selectedContacts = [];
  List<Contact> contacts = [];
  bool isLoading = false;
  int page = 1;
  bool hasMore = false;
  @override
  void initState() {
    intiateFileCall();
    super.initState();
  }

  intiateFileCall() {
    widget.title.toLowerCase() == "contacts"
        ? contactDisplay()
        : recentFilesCall();
  }

  void recentFilesCall() {
    recentFiles = [];
    setState(() {
      isLoading = true;
    });
    _apiRepositoryImplementation
        .getFilesByType(widget.title, page)
        .then((value) {
      // List<UserfilesItemModel> list = parsedFileList(value.data['data']);
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        print(hasMore);
        // print(allFiles.length); // Assign the new list directly
      });
    });
    _scrollController.addListener(_onScroll);
  }

  void contactDisplay() async {
    setState(() {
      isLoading = true;
    });
    // await uploadController.extractContact1().then((_) {});
    var data = await uploadController.getUploadedContactsFromPrefs();
    contacts = uploadController.convertVcardToContactList(data);
    // var data = await FlutterContacts.getContacts();

    // Perform the heavy computation in a separate isolate
    if (contacts.isEmpty) {
      await _apiRepositoryImplementation
          .getFilesByType(widget.title, 1)
          .then((value) async {
        await _apiRepositoryImplementation
            .getDownloadUrl(value.items.first.id!)
            .then((url) {
          uploadController.downloadFile(
              value.items.first.name, url, "restoreLocation");
        });
      });
      await uploadController.extractContact().then((value) {
        // contacts.addAll(value);
      });
    }

    setState(() {
      isLoading = false;
    });
  }

// // Function to be run in a separate isolate
//   Future<List<Contact>> extractContactInBackground(_) async {
//     // Perform the contact extraction without using non-serializable objects
//     List<Contact> contacts = [];

//     try {
//       Directory appDir = await getApplicationDocumentsDirectory();
//       File importedContact = File("${appDir.path}/contacts.vcf");
//       if (importedContact.existsSync()) {
//         var vCardContacts = await importedContact.readAsString();
//         var lines = vCardContacts.split('\n');
//         var vCardData = '';

//         for (var line in lines) {
//           if (line.startsWith('BEGIN:VCARD')) {
//             vCardData = '';
//           }
//           vCardData += '$line\n';
//           if (line.startsWith('END:VCARD')) {
//             Contact contact = Contact.fromVCard(vCardData);
//             if (contact != null) {
//               contacts.add(contact);
//             }
//           }
//         }
//       }
//     } catch (e) {
//       print('Error extracting contacts: $e');
//     }

//     return contacts;
//   }

  // contactDisplay() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var listContact = await uploadController.extractContact();
  //   // .then((value) {
  //   // print(value.length);
  //   // contacts.addAll(value);
  //   // setState(() {});
  //   // });
  //   // if (contacts.isEmpty) {
  //   //   await _apiRepositoryImplementation
  //   //       .getFilesByType(widget.title, 1)
  //   //       .then((value) async {
  //   //     await _apiRepositoryImplementation
  //   //         .getDownloadUrl(value.items.first.id!)
  //   //         .then((url) {
  //   //       uploadController.downloadFile(
  //   //           value.items.first.name, url, "restoreLocation");
  //   //     });
  //   //   });
  //   //   await uploadController.extractContact().then((value) {
  //   //     // contacts.addAll(value);
  //   //   });
  //   // }

  //   setState(() {
  //     contacts = listContact;
  //     isLoading = false;
  //   });
  // }

  void recentFilesCallBack() {
    _apiRepositoryImplementation.getFilesByType(widget.title, 1).then((value) {
      setState(() {
        recentFiles = value.items;
        hasMore = value.hasMoreItems;
        page = value.currentPage; // Assign the new list directly
        isLoading = false;
        print(hasMore);
      });
    });
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading && hasMore) {
      _apiRepositoryImplementation
          .getFilesByType(widget.title, page + 1)
          .then((value) {
        setState(() {
          recentFiles.addAll(value.items);
          hasMore = value.hasMoreItems;
          page = value.currentPage;
        });
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("loadmore");
      _loadMoreItems();
    }
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.blue,
            // Colors.white,
          ),
        ),
      ),
    );
  }
  // static List<UserfilesItemModel> parsedFileList(dynamic responseBody) {
  //   final parsed = responseBody.cast<Map<String, dynamic>>();
  //   return parsed
  //       .map<UserfilesItemModel>((json) => UserfilesItemModel.fromJson(json))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 2.v),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: CustomSearchView(
                      controller: _searchController,
                      hintText: "lbl_search_files".tr,
                      onChanged: (p0) {
                        setState(() {
                          searchResult = recentFiles
                              .where((element) => element.name!
                                  .toLowerCase()
                                  .contains(p0.toLowerCase()))
                              .toList();
                          if (p0.isEmpty) {
                            searchResult = [];
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 39.v),
                  isLoading == true
                      ? const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              strokeWidth: 4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue,
                                // Colors.white,
                              ),
                            ),
                          ),
                        )
                      : searchResult.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: searchResult.length,
                              itemBuilder: (BuildContext context, int index) {
                                UserfilesItemModel item = searchResult[index];

                                return CustomListView(
                                    item: item,
                                    reloadResource: recentFilesCallBack);
                              })
                          : recentFiles.isNotEmpty
                              ? GroupedListView.list(
                                  items: recentFiles,
                                  physics: const ScrollPhysics(),
                                  headerBuilder: (context, DateTime index) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 30.h, bottom: 10.h),
                                        child: Text(
                                          ProgressDialogUtils.formatDateTime(
                                              index),
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                    );
                                  },
                                  listItemBuilder: (context,
                                      int count,
                                      int itemIndex,
                                      UserfilesItemModel item,
                                      int index) {
                                    if (index == recentFiles.length - 1 &&
                                        hasMore) {
                                      return _buildLoadingIndicator();
                                    }
                                    return CustomListView(
                                      item: item,
                                      reloadResource: recentFilesCall,
                                    );
                                  },
                                  itemGrouper: ((item) => DateTime(
                                      item.updatedAt!.year,
                                      item.updatedAt!.month,
                                      item.updatedAt!.day)))
                              : contacts.isNotEmpty && !isLoading
                                  ? ListView.builder(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: contacts.length,
                                      itemBuilder: (context, index) {
                                        Contact contact = contacts[index];
                                        bool isContactSelected =
                                            selectedContacts.contains(contact);

                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: appTheme.blue800,
                                            child: Text(
                                              contact.displayName.characters
                                                      .first
                                                      .toUpperCase()
                                                      .toString() +
                                                  contact.displayName.characters
                                                      .elementAt(1)
                                                      .toUpperCase()
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          title: Text(
                                            contact.displayName.toString(),
                                            style: theme.textTheme.bodyLarge,
                                          ),
                                          // subtitle: Text(contact.phones.first.number.isNotEmpty
                                          //     ? contact.phones.first.number
                                          //     : ""),
                                          trailing: Checkbox(
                                            value: isContactSelected,
                                            visualDensity: const VisualDensity(
                                              vertical: -4,
                                              horizontal: -4,
                                            ),
                                            // overlayColor: ,
                                            checkColor: appTheme.blue800,

                                            activeColor: appTheme.blue800,
                                            fillColor: MaterialStateProperty
                                                .resolveWith<Color>(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.disabled)) {
                                                return Colors.white
                                                    .withOpacity(.32);
                                              }
                                              return Colors.white;
                                            }),
                                            onChanged: (value) {
                                              setState(() {
                                                if (value != null && value) {
                                                  print(value);
                                                  // setState(() {
                                                  selectedContacts.add(contact);
                                                  // isSelected[index] == true;
                                                  // });
                                                } else {
                                                  // setState(() {
                                                  selectedContacts
                                                      .remove(contact);
                                                  // isSelected[index] == false;
                                                  // });
                                                }
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  : SingleChildScrollView(
                                      padding: EdgeInsets.only(top: 256.v),
                                      child: Column(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgFolderGray200,
                                            height: 47.adaptSize,
                                            width: 47.adaptSize),
                                        SizedBox(height: 14.v),
                                        SizedBox(
                                            width: 246.h,
                                            child: Text(
                                                "You have no ${widget.title} here yet.",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleLargeOpenSansGray40001)),
                                      ]))

                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Padding(
                  //         padding: EdgeInsets.only(left: 31.h),
                  //         child: Text("msg_thur_24_mar_2022".tr,
                  //             style: theme.textTheme.bodyMedium))),
                  // SizedBox(height: 18.v),
                  // // _buildUserFiles(),
                ]))),
        floatingActionButton: _buildFloatingActionButton());
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: selectedContacts.isEmpty
                ? widget.title
                : "${selectedContacts.length} Selected Contacts",
            margin: EdgeInsets.only(left: 10.h)),
        actions: [
          selectedContacts.isEmpty
              ? AppbarTrailingImage(
                  imagePath: ImageConstant.imgOverflowMenu,
                  margin: EdgeInsets.fromLTRB(30.h, 13.v, 30.h, 12.v))
              : TextButton(
                  onPressed: () {
                    if (selectedContacts.isNotEmpty) {
                      uploadController.restoreContact(selectedContacts);
                      Get.back();
                    } else {
                      ProgressDialogUtils.showFailureToast(
                          "No contacts selected");
                    }
                  },
                  child: Text(
                    "Restore",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: appTheme.indigo900,
                    ),
                  ))
        ]);
  }

  // /// Section Widget
  // Widget _buildUserFiles() {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 31.h, right: 25.h),
  //       child: Obx(() => ListView.separated(
  //           physics: NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           separatorBuilder: (context, index) {
  //             return SizedBox(height: 17.v);
  //           },
  //           itemCount: controller
  //               .filesPageModelObj.value.userfilesItemList.value.length,
  //           itemBuilder: (context, index) {
  //             UserfilesItemModel model = controller
  //                 .filesPageModelObj.value.userfilesItemList.value[index];
  //             return UserfilesItemWidget(model);
  //           })));
  // }

  /// Section Widget
  Widget _buildFloatingActionButton() {
    return CustomFloatingButton(
        onTap: () {
          if (widget.title == "Files") {
            uploadController.docsUpload(callBack: recentFilesCall);
          } else if (widget.title == "Photos") {
            uploadController.photoUpload(callBack: recentFilesCall);
          } else if (widget.title == "Videos") {
            uploadController.videoUpload(callBack: recentFilesCall);
          } else if (widget.title == "Audios") {
            uploadController.audioUpload(callBack: recentFilesCall);
          } else if (widget.title == "Contacts") {
            Get.to(const CustomContactSelectionScreen());
          } else if (widget.title == "Whatsapp") {
            uploadController.whatsappUpload(callBack: recentFilesCall);
          }
        },
        height: 64,
        width: 64,
        backgroundColor: appTheme.blue800,
        child: CustomImageView(
            imagePath: ImageConstant.imgAntDesignPlusOutlined,
            height: 32.0.v,
            width: 32.0.h));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
