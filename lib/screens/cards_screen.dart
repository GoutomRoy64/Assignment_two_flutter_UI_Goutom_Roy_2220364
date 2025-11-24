import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header (Consistent with other pages)
            _buildHeader(),
            const SizedBox(height: 30),

            // 2. Page Title
            const Text(
              "My Cards",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
            const SizedBox(height: 20),

            // 3. Credit Card Widget
            _buildCreditCard(),
            const SizedBox(height: 25),

            // 4. Action Buttons (Block, Details, Limit)
            _buildActionButtonsRow(),
            const SizedBox(height: 30),

            // 5. Linked Accounts Section
            const Text(
              "Linked Accounts",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
            const SizedBox(height: 15),
            _buildLinkedAccountItem(),
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
            Text("Welcome back,", style: TextStyle(color: Colors.grey, fontSize: 12)),
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

  Widget _buildCreditCard() {
    return Container(
      width: double.infinity,
      height: 220,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E2129), // Dark grey/blue
            Color(0xFF2C3E50), // Slightly lighter blue-grey
            Color(0xFF000000), // Black
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Row: Chip and Bank Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Gold Chip
              Container(
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.amber.shade400,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const Text(
                "BANK",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          // Middle: Card Number
          const Text(
            "4567  **** **** 1234",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
              fontFamily: "Courier", // Monospace look
            ),
          ),

          // Bottom Row: Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("CARD HOLDER", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  SizedBox(height: 5),
                  Text("GOUTOM ROY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("EXPIRES", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  SizedBox(height: 5),
                  Text("12/28", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.close, "Block", Colors.red.shade100, Colors.red),
        _buildActionButton(Icons.credit_card, "Details", Colors.blue.shade100, Colors.blue),
        _buildActionButton(Icons.info_outline, "Limit", Colors.purple.shade100, Colors.purple),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color bgColor, Color iconColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkedAccountItem() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: const Text(
                "G",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                )
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                  "Shared Savings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
              ),
              SizedBox(height: 3),
              Text(
                  "\$5,500.00",
                  style: TextStyle(color: Colors.grey, fontSize: 12)
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}