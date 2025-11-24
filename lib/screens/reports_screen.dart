import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

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
              "Monthly Spending Report",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Colors.black87
              ),
            ),
            const SizedBox(height: 20),

            // 3. Total Expenses Card
            _buildTotalExpensesCard(),
            const SizedBox(height: 25),

            // 4. Spending Breakdown Card
            _buildSpendingBreakdownCard(),
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

  Widget _buildTotalExpensesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), 
            blurRadius: 10, 
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Expenses (Last 30 days)", 
            style: TextStyle(color: Colors.grey, fontSize: 14)
          ),
          const SizedBox(height: 10),
          const Text(
            "-\$1270.00",
            style: TextStyle(
              color: Colors.redAccent, 
              fontSize: 32, 
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.arrow_upward, color: Colors.red.shade300, size: 16),
              const SizedBox(width: 4),
              Text(
                "Up 12% from last month", 
                style: TextStyle(color: Colors.red.shade300, fontSize: 13)
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSpendingBreakdownCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), 
            blurRadius: 10, 
            spreadRadius: 2
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Spending Breakdown", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 18
            )
          ),
          const SizedBox(height: 25),
          
          _buildSpendingItem("Food & Drink", "\$450.00", "35%", 0.35, Colors.redAccent),
          _buildSpendingItem("Shopping", "\$320.00", "25%", 0.25, const Color(0xFF5346E8)),
          _buildSpendingItem("Housing", "\$280.00", "22%", 0.22, Colors.amber),
          _buildSpendingItem("Transport", "\$150.00", "12%", 0.12, Colors.green),
          _buildSpendingItem("Other", "\$70.00", "6%", 0.06, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSpendingItem(String category, String amount, String percentage, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: const TextStyle(color: Colors.black87, fontSize: 14)),
              Text(
                "$amount ($percentage)", 
                style: const TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 14
                )
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Custom Progress Bar with rounded ends
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}