import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safebox/core/apirepository_implementation.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';

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

  List<Contact> selectedContacts = [];
  List<Contact> contacts = [];
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
    // var data = await FlutterContacts.getContacts();

    contacts = uploadController.convertVcardToContactList(data);
    setState(() {
      isLoading = false;
    });
    // data = await FlutterContacts.getContacts(withProperties: true);
    // contacts = data;
    // contacts.addAll(data.sublist(101, data.length - 1));
  }

  contactDisplay() async {
    setState(() {
      isLoading = true;
    });
    // await uploadController.extractContact1().then((_) {});
    var data = await uploadController.getUploadedContactsFromPrefs();
    var listContacts = uploadController.convertVcardToContactList(data);
    // var data = await FlutterContacts.getContacts();

    // Perform the heavy computation in a separate isolate
    if (listContacts.isEmpty) {
      await _apiRepositoryImplementation
          .getFilesByType('Contacts', 1)
          .then((value) async {
        await _apiRepositoryImplementation
            .getDownloadUrl(value.items.first.id!)
            .then((url) {
          uploadController.downloadFile(
              value.items.first.name, url, "restoreLocation");
        });
      });
      // await uploadController.extractContact().then((value) {
      //   // contacts.addAll(value);
      // });
    }
    setState(() {
      contacts = listContacts
          .where((element) => element.displayName.isNotEmpty)
          .toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : contacts.isEmpty
              ? Text('No contacts found.')
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = contacts[index];
                    bool isContactSelected = selectedContacts.contains(contact);

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: appTheme.blue800,
                        child: Text(
                          contact.displayName.characters.first.toUpperCase() +
                              contact.displayName.characters
                                  .elementAt(1)
                                  .toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        contact.displayName,
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
                              print(value);
                              // setState(() {
                              selectedContacts.add(contact);
                              // isSelected[index] == true;
                              // });
                            } else {
                              // setState(() {
                              selectedContacts.remove(contact);
                              // isSelected[index] == false;
                              // });
                            }
                          });
                        },
                      ),
                    );
                  },
                ),

      // FutureBuilder<List<Contact>>(
      //   future: FlutterContacts.getContacts(withProperties: true),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Text('No contacts found.');
      //     } else {
      //       List<Contact> contacts = snapshot.data!;
      //       return
      //        ListView.builder(
      //         itemCount: contacts.length,
      //         itemBuilder: (context, index) {
      //           Contact contact = contacts[index];
      //           bool isSelected = selectedContacts.contains(contact);

      //           return ListTile(
      //             leading: CircleAvatar(
      //               child: Text(contact.displayName.characters.first),
      //             ),
      //             title: Text(contact.displayName ),
      //             subtitle: Text(contact.phones.first.number),
      //             trailing: Checkbox(
      //               value: isSelected,
      //               onChanged: (value) {
      //                 setState(() {
      //                   if (value != null && value) {
      //                     selectedContacts.add(contact);
      //                   } else {
      //                     selectedContacts.remove(contact);
      //                   }
      //                 });
      //               },
      //             ),
      //           );
      //         },
      //       );

      //     }
      //   },
      // ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 13.v),
            onTap: () {
              Get.back();
            }),
        title: AppbarTitle(
            text: "${selectedContacts.length} Selected Contacts",
            margin: EdgeInsets.only(left: 11.h)),
        actions: [
          TextButton(
              onPressed: () {
                if (selectedContacts.isNotEmpty) {
                  widget.restore != null
                      ? uploadController.restoreContact(selectedContacts)
                      : uploadController.uploadContact(selectedContacts);
                  Get.back();
                } else {
                  ProgressDialogUtils.showFailureToast("No contacts selected");
                }
              },
              child: Text(
                widget.restore != null ? "Restore" : "Upload",
                style: theme.textTheme.headlineSmall!.copyWith(
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
