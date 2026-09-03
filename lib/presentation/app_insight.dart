import 'package:flutter/material.dart';
import 'package:safebox/presentation/terms_of_service.dart';

class AppInsightsPage extends StatelessWidget {
  const AppInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Insights'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SafeBox Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            BulletList(
              items: [
                'Secure Contact Backup: SafeBox ensures your contact lists remain safe, even if your phone or SIM card is lost or damaged.',
                'Easy Retrieval: Effortlessly retrieve your contact list, WhatsApp contacts, and important SMS messages stored in SafeBox back to your phone.',
                'Memory Management: Transfer important SMS messages to SafeBox when your phone memory is full, ensuring you never lose critical information.',
                'Password Assistance: Access your account easily, even if you forget your password.',
                'Data Protection: Once your data is saved or uploaded to SafeBox, it is protected from loss or damage due to phone or SIM issues. Data can only be deleted intentionally by you.',
                'Affordable Subscription: Enjoy these features with a yearly subscription of just N1,000 (approximately 1 USD).',
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'SafeBox provides peace of mind by safeguarding your essential contacts and messages, ensuring you can always access them when needed.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
