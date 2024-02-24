import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/widgets/app_bar/appbar_leading_image.dart';
import 'package:safebox/widgets/app_bar/appbar_title.dart';
import 'package:safebox/widgets/app_bar/custom_app_bar.dart';

class CustomContactSelectionScreen extends StatefulWidget {
  const CustomContactSelectionScreen({super.key});

  @override
  CustomContactSelectionScreenState createState() =>
      CustomContactSelectionScreenState();
}

class CustomContactSelectionScreenState
    extends State<CustomContactSelectionScreen> {
  final Uploadanager uploadController = Get.put(Uploadanager());

  List<Contact> selectedContacts = [];
  List<Contact> contacts = [];
  bool isLoading = false;

  @override
  void initState() {
    getContactsFromPhoneBook();
    super.initState();
  }

  getContactsFromPhoneBook() async {
    setState(() {
      isLoading = true;
    });
    var data = await FlutterContacts.getContacts(withProperties: true);
    setState(() {
      contacts = data.sublist(0, 100);
      isLoading = false;
    });
    contacts.addAll(data.sublist(101, data.length - 1));
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
                          contact.displayName.characters.first +
                              contact.displayName.characters.elementAt(1),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        contact.displayName,
                        style: theme.textTheme.bodyLarge,
                      ),
                      subtitle: Text(contact.phones.first.number),
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
            text: "${selectedContacts.length} Select Contacts",
            margin: EdgeInsets.only(left: 11.h)),
        actions: [
          TextButton(
              onPressed: () {
                if (selectedContacts.isNotEmpty) {
                  uploadController.uploadContact(selectedContacts);
                  Get.back();
                } else {
                  ProgressDialogUtils.showFailureToast("No contacts selected");
                }
              },
              child: Text(
                "Upload",
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: appTheme.indigo900,
                ),
              ))
        ]);
  }
}
