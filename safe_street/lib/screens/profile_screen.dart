import 'package:flutter/material.dart';
import 'package:safe_street/models/experience.dart';
import 'package:safe_street/models/user.dart';
import 'package:safe_street/models/score.dart'; 

class ProfileScreen extends StatelessWidget {
  final SafeStreetUser currentUser;

  // need to write code to generate following two lists
  final List<Score> userScores;
  final List<Experience> userExperiences; 

  const ProfileScreen({
    Key? key,
    required this.currentUser,
    required this.userScores,
    required this.userExperiences,
  }) : super(key: key);

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
            // Display user details
            Text(
              currentUser.fullName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Email: ${currentUser.emailId}'),
            // Display other user details...

            SizedBox(height: 16),

            // Logout button
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
              },
              child: Text('Logout'),
            ),

            SizedBox(height: 16),

            // Your Scores section
            Text(
              'Your Scores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Display user scores and associated experiences
            ListView.builder(
              shrinkWrap: true,
              itemCount: userExperiences.length,
              itemBuilder: (context, index) {
                final experience = userExperiences[index];

                // Find the corresponding score
                final correspondingScore = userScores.firstWhere(
                  (score) => score.scoreId == experience.scoreId,
                  orElse: () => Score(), // Provide a default value if not found
                );

                // Display score and experience details
                return ListTile(
                  title: Text('Score: ${correspondingScore.score} out of 5 stars'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location: ${correspondingScore.location}'),
                      experience.experienceText.isNotEmpty ? Text('Experience: ${experience.experienceText}') : Container(),
                      // Add other details as needed...
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
