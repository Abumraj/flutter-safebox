import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/presentation/contact_item-option.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';
import 'package:safebox/widgets/custom_search_view.dart';

class CustomContactSelectionScreen extends StatefulWidget {
  final String? restore;
  const CustomContactSelectionScreen({super.key, this.restore});

  @override
  CustomContactSelectionScreenState createState() =>
      CustomContactSelectionScreenState();
}

class CustomContactSelectionScreenState
    extends State<CustomContactSelectionScreen> {
  final ApiRepositoryImplementation _apiRepositoryImplementation =
      Get.put(ApiRepositoryImplementation());
  final Uploadanager uploadController = Get.put(Uploadanager());
  final TextEditingController _searchController = TextEditingController();
  List<Contact> searchResult = [];
  List<Contact> selectedContacts = [];
  List<Contact> contacts = [];
  bool isSelectAll = false;
  bool isLoading = false;

  @override
  void initState() {
    widget.restore != null ? contactDisplay() : getContactsFromPhoneBook();
    super.initState();
  }

  getContactsFromPhoneBook() async {
    setState(() {
      isLoading = true;
    });
    var data = await uploadController.getContactsFromPrefs();
    if (data.isEmpty) {
      await uploadController.cacheContacts(false);
      data = await uploadController.getContactsFromPrefs();
    }
    contacts = uploadController.convertVcardToContactList(data);
    setState(() {
      isLoading = false;
    });
  }

  contactDisplay() async {
    print("restore");
    setState(() {
      isLoading = true;
    });
    var data = await uploadController.getUploadedContactsFromPrefs();
    var listContacts = uploadController.convertVcardToContactList(data);

    if (listContacts.isEmpty) {
      await _apiRepositoryImplementation
          .getFilesByType('Contacts', 1)
          .then((value) async {
        if (value.items.isNotEmpty) {
          await _apiRepositoryImplementation
              .getDownloadUrl(value.items.first.id!)
              .then((url) {
            uploadController.downloadFile(
                value.items.first.name, url, "restoreLocation");
          });
        } else {
          ProgressDialogUtils.showFailureToast(
              "No contact files found to restore.");
        }
      });
    }
    setState(() {
      contacts = listContacts
          .where((element) => element.displayName.isNotEmpty)
          .toList();
      uploadController.saveContactsCountToPrefs(contacts.length.toString());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: CustomSearchView(
                controller: _searchController,
                hintText: "Search Contacts",
                onChanged: (value) {
                  setState(() {
                    if (contacts.isNotEmpty) {
                      searchResult = contacts
                          .where((element) => element.name
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                    if (value.isEmpty) {
                      searchResult = [];
                    }
                  });
                },
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchResult.isEmpty && _searchController.text.isNotEmpty
                    ? Center(
                        child: SizedBox(
                            width: 220.h,
                            child: Text("No Result Found",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles
                                    .titleLargeOpenSansGray40001)),
                      )
                    : searchResult.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResult.length,
                              itemBuilder: (context, index) {
                                Contact searchContact = searchResult[index];
                                bool isContactSelected =
                                    selectedContacts.contains(searchContact);

                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: appTheme.blue800,
                                    child: Text(
                                      searchContact.displayName.characters.first
                                              .toUpperCase() +
                                          (searchContact.displayName.characters
                                                      .length >
                                                  1
                                              ? searchContact
                                                  .displayName.characters
                                                  .elementAt(1)
                                                  .toUpperCase()
                                              : ''),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    searchContact.displayName,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  subtitle: Text(searchContact.phones.isNotEmpty
                                      ? searchContact.phones.first.number
                                          .toString()
                                      : ""),
                                  trailing: Checkbox(
                                    value: isContactSelected,
                                    visualDensity: const VisualDensity(
                                      vertical: -4,
                                      horizontal: -4,
                                    ),
                                    checkColor: appTheme.blue800,
                                    activeColor: appTheme.blue800,
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.white.withOpacity(.32);
                                      }
                                      return Colors.white;
                                    }),
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != null && value) {
                                          selectedContacts.add(searchContact);
                                        } else {
                                          selectedContacts
                                              .remove(searchContact);
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        : contacts.isEmpty
                            ? const Center(child: Text('No contacts found.'))
                            : Expanded(
                                child: ListView.builder(
                                  physics: const ScrollPhysics(),
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) {
                                    Contact contact = contacts[index];
                                    bool isContactSelected =
                                        selectedContacts.contains(contact);

                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: appTheme.blue800,
                                        child: Text(
                                          contact.displayName.characters.first
                                                  .toUpperCase() +
                                              (contact.displayName.characters
                                                          .length >
                                                      1
                                                  ? contact
                                                      .displayName.characters
                                                      .elementAt(1)
                                                      .toUpperCase()
                                                  : ''),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      title: Text(
                                        contact.displayName,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      subtitle: Text(contact.phones.isNotEmpty
                                          ? contact.phones.first.number
                                              .toString()
                                          : ""),
                                      trailing: Checkbox(
                                        value: isContactSelected,
                                        visualDensity: const VisualDensity(
                                          vertical: -4,
                                          horizontal: -4,
                                        ),
                                        checkColor: appTheme.blue800,
                                        activeColor: appTheme.blue800,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
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
                                              selectedContacts.add(contact);
                                            } else {
                                              selectedContacts.remove(contact);
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
          ],
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        centerTitle: true,
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
                      selectedContacts.addAll(contacts);
                      isSelectAll = true;
                    } else {
                      selectedContacts = [];
                      isSelectAll = false;
                    }
                  });
                },
              ),
        title: Text(
          "${selectedContacts.length} Selected Contacts",
          style: CustomTextStyles.titleLargeSofiaProIndigo600,
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (selectedContacts.isNotEmpty) {
                  if (widget.restore == null) {
                    uploadController.uploadContact(selectedContacts);
                    Get.back();
                  }
                } else {
                  ProgressDialogUtils.showFailureToast("No contacts selected");
                }
              },
              child: widget.restore != null
                  ? CustomImageView(
                      imagePath: ImageConstant.imgInfo,
                      height: 30.adaptSize,
                      width: 28.adaptSize,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(
                        right: 1.h,
                        bottom: 5.v,
                      ),
                      onTap: () {
                        if (selectedContacts.isNotEmpty) {
                          print("started");

                          Get.bottomSheet(ItemOptionBottomsheet(restore: () {
                            uploadController.restoreContact(selectedContacts);
                          }, delete: () {
                            print(contacts.length);
                            // Remove selected contacts from the contacts list
                            setState(() {
                              contacts.removeWhere((contact) =>
                                  selectedContacts.any((selected) =>
                                      selected.displayName ==
                                      contact.displayName));

                              // Clear the selectedContacts list after deletion
                              selectedContacts.clear();
                            });
                            print(contacts.length);
                            uploadController.deleteContact(contacts);
                          }));
                        } else {
                          ProgressDialogUtils.showFailureToast(
                              "No contacts selected");
                        }
                      },
                    )
                  : Text(
                      "Upload",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: appTheme.indigo900,
                      ),
                    )),
          if (widget.restore == null)
            IconButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  uploadController.cacheContacts(true).then((value) {
                    getContactsFromPhoneBook();
                  });
                },
                icon: const Icon(Icons.refresh))
        ]);
  }
}
