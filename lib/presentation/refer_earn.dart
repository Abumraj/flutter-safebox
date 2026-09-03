import 'package:flutter/material.dart';

class ReferEarnPage extends StatelessWidget {
  const ReferEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refer & Earn Program'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Refer & Earn Program',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'How to Refer and Earn:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            BulletList(
              items: [
                'Find Your Referral Code: Each user/subscriber has a unique referral code, which can be found on the User Profile Page.',
                'Share Your Code: Copy your referral code and share it with others.',
                'Earn Rewards: Each time a new user registers using your referral code and subscribes, you earn N100.',
                'Usage of Referral Earnings: Referral earnings can only be used or withdrawn after you have subscribed to the service. This means you cannot use your referral bonus until you have an active subscription.',
              ],
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
