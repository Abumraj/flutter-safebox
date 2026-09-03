import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'This privacy policy applies to the Safebox app (hereby referred to as "Application") for mobile devices that was created by Wavefield Limited (hereby referred to as "Service Provider") as a Free service. This service is intended for use "AS IS".',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Information Collection and Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'Your device\'s Internet Protocol address (e.g. IP address)',
                'The pages of the Application that you visit, the time and date of your visit, the time spent on those pages',
                'The time spent on the Application',
                'The operating system you use on your mobile device',
              ],
            ),
            Text(
              'The Application does not gather precise information about the location of your mobile device.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices, and marketing promotions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information, including but not limited to Email, Phone, Name. The information that the Service Provider request will be retained by them and used as described in this privacy policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Third Party Access',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:',
              style: TextStyle(fontSize: 16),
            ),
            BulletList(
              items: [
                'Google Play Services',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'The Service Provider may disclose User Provided and Automatically Collected Information:',
              style: TextStyle(fontSize: 16),
            ),
            BulletList(
              items: [
                'as required by law, such as to comply with a subpoena, or similar legal process;',
                'when they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request;',
                'with their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement.',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Opt-Out Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Retention Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you\'d like them to delete User Provided Data that you have provided via the Application, please contact them at safebox2024app@gmail.com and they will respond in a reasonable time.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Children',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (safebox2024app@gmail.com) so that they will be able to take the necessary actions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'This privacy policy is effective as of 2024-06-27',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Consent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at safebox2024app@gmail.com.',
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
