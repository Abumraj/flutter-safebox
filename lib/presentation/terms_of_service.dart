import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Security and Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'End-to-End Encryption: All uploaded/saved data are encrypted end-to-end. Only you can access your data.',
                'Subscription: Ensure continuous access by subscribing for N1,000 (1 USD) per year.',
                'Password Security: Do not share your password to prevent data theft.',
                'Liability: We are not responsible for data theft as we cannot access your data once you set the password.',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Terms of Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'These terms and conditions apply to the SafeBox app (referred to as "Application") for mobile devices, created by Wavefield Limited (referred to as "Service Provider") as a free service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'By downloading or using the Application, you agree to the following terms. It is advised that you read and understand these terms before using the Application. Unauthorized copying, modifying, or extracting source code from the Application is prohibited. All intellectual property rights related to the Application remain with the Service Provider.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Service Provider\'s Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'Modifications: The Service Provider may modify the Application or charge for its services at any time for any reason. Any charges will be communicated clearly.',
                'Data Handling: The Application stores and processes personal data you provide to deliver the Service. It is your responsibility to maintain the security of your phone and access to the Application.',
                'Device Security: Avoid jailbreaking or rooting your phone, which could expose it to malware and compromise security features, potentially causing the Application to malfunction.',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Third-Party Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Application uses third-party services, each with its own Terms and Conditions. Below is the link to the Terms and Conditions of the third-party service provider used by the Application:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            BulletList(
              items: [
                'Google Play Services',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Connectivity and Usage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'Internet Connection: Some functions of the Application require an active internet connection. The Service Provider is not responsible if the Application does not function due to lack of internet access or exhausted data allowance.',
                'Mobile Data Charges: If using the Application outside a Wi-Fi area, you may incur charges from your mobile network provider. You accept responsibility for any such charges, including roaming charges.',
                'Device Maintenance: It is your responsibility to ensure your device remains charged. The Service Provider is not liable if you cannot access the Service due to a dead battery.',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Updates and Termination',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'Updates: The Service Provider aims to keep the Application updated but relies on third-party information. The Service Provider is not liable for any loss resulting from relying on the Application\'s functionality.',
                'Termination: The Service Provider may cease providing the Application at any time without notice. Upon termination, you must cease using the Application and delete it from your device if necessary.',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to Terms and Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Service Provider may update these Terms and Conditions periodically. You are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Effective Date: June 27, 2024',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have any questions or suggestions about these Terms and Conditions, please contact the Service Provider at safebox2024app@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;

  BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: TextStyle(fontSize: 16)),
              Expanded(child: Text(item, style: TextStyle(fontSize: 16))),
            ],
          ),
        );
      }).toList(),
    );
  }
}
