import 'package:flutter/material.dart';
import 'package:safe_street/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User currentUser;

  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit profile screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentUser.fullName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: ${currentUser.emailId}'),
            if (currentUser.gender != null) ...[
              SizedBox(height: 8),
              Text('Gender: ${currentUser.gender}'),
            ],
            if (currentUser.age != null) ...[
              SizedBox(height: 8),
              Text('Age: ${currentUser.age}'),
            ],
            SizedBox(height: 8),
            Text('Aadhar No: ${currentUser.aadharNo}'),
            SizedBox(height: 8),
            Text('Country: ${currentUser.country}'),
            SizedBox(height: 8),
            Text('City: ${currentUser.city}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the scores screen
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, backgroundColor: Colors.transparent,
              ),
              child: Text('Your Scores'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Navigate to the settings screen
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, backgroundColor: Colors.transparent,
              ),
              child: Text('Settings'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, backgroundColor: Colors.transparent,
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
