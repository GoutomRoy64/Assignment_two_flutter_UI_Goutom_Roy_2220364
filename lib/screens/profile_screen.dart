import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 1. Top Header
            _buildHeader(),
            const SizedBox(height: 30),

            // 2. Page Title
            const Text(
              "User Profile",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
            const SizedBox(height: 25),

            // 3. Large Avatar with Shadow
            _buildLargeAvatar(),
            const SizedBox(height: 30),

            // 4. Info Cards
            _buildInfoCard("Name", "Goutom Roy"),
            _buildInfoCard("Student ID", "2220364"),
            _buildInfoCard("Email", "2220364@iub.edu.bd"),

            // 5. Bio / Story Card
            _buildBioCard(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFF5346E8),
          child: Text("G", style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome back", style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text("Goutom Roy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5)],
          ),
          child: const Icon(Icons.notifications_outlined),
        )
      ],
    );
  }

  Widget _buildLargeAvatar() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF5346E8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5346E8).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: const Center(
        child: Text(
          "G",
          style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              label,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12
              )
          ),
          const SizedBox(height: 5),
          Text(
              value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87
              )
          ),
        ],
      ),
    );
  }

  Widget _buildBioCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Bio / Story",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )
          ),
          const SizedBox(height: 10),
          const Text(
            "\"I am a Computer Science and Engineering student with a deep passion for software development, particularly in Android app development and database management. I am constantly exploring new technologies and frameworks to improve my skills and build innovative, efficient solutions.\"",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
                height: 1.5
            ),
          ),
          const SizedBox(height: 15),

        ],
      ),
    );
  }
}