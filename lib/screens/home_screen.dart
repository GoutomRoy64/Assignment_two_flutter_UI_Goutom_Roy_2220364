import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            _buildHeader(),
            const SizedBox(height: 20),

            // 2. Main Balance Card
            _buildBalanceCard(),
            const SizedBox(height: 25),

            // 3. Action Buttons (Transfer, etc.)
            _buildActionButtons(),
            const SizedBox(height: 30),

            // 4. Recent Transactions Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("View All", style: TextStyle(color: Color(0xFF5346E8))),
                )
              ],
            ),
            const SizedBox(height: 10),

            // 5. Transactions List
            _buildTransactionItem(
              icon: Icons.movie_creation_outlined,
              title: "Netflix Subscription",
              subtitle: "Entertainment • Today",
              amount: "-\$19.99",
              isIncome: false,
            ),
            _buildTransactionItem(
              icon: Icons.coffee,
              title: "Coffee Shop",
              subtitle: "Food & Drink • Today",
              amount: "-\$4.50",
              isIncome: false,
            ),
            _buildTransactionItem(
              icon: Icons.attach_money,
              title: "Salary Deposit",
              subtitle: "Income • Yesterday",
              amount: "+\$3500.00",
              isIncome: true,
            ),
            _buildTransactionItem(
              icon: Icons.shopping_cart_outlined,
              title: "Grocery Store",
              subtitle: "Shopping • Yesterday",
              amount: "-\$55.80",
              isIncome: false,
            ),
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
          child: Text("S", style: TextStyle(color: Colors.white, fontSize: 20)),
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

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF5346E8), // The purple color from image
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5346E8).withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total Balance", style: TextStyle(color: Colors.white70)),
              Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "\$8,945.32",
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Savings: \$5,500", style: TextStyle(color: Colors.white70)),
              Row(
                children: const [
                  Text("Last 30 days: +\$300", style: TextStyle(color: Colors.white70)),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward, color: Colors.white70, size: 16),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.file_upload_outlined, "Transfer"),
        _buildActionButton(Icons.receipt_long, "Pay Bills"),
        _buildActionButton(Icons.link, "Invest"),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      width: 100, // Fixed width for uniformity
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF5346E8), size: 28),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required bool isIncome,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.grey.shade700),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isIncome ? Colors.green : Colors.red,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}