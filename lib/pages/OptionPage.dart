// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class RentalCarScreen extends StatefulWidget {
  @override
  _RentalCarScreenState createState() => _RentalCarScreenState();
}

class _RentalCarScreenState extends State<RentalCarScreen> {
  
  final Map<String, Map<String, dynamic>> options = {
    'Additional Drivers': {'count': 0, 'price': 10, 'details': ''},
    'GPS & Android Auto/Apple CarPlay': {'count': 0, 'price': 5, 'details': ''},
    'Refueling/Charging Service': {'count': 0, 'price': 20, 'details': ''},
    'Cross-Border Driving': {'count': 0, 'price': 15, 'details': ''},
    'Mobility Service': {'count': 0, 'price': 25, 'details': ''},
    'Tire & Windshield Protection': {'count': 0, 'price': 12, 'details': ''},
    'Interior Protection': {'count': 0, 'price': 10, 'details': ''},
    'Infant Seat (0-13 kg / Group 0+)': {'count': 0, 'price': 8, 'details': ''},
    'Child Seat (0-10 kg, 9-18 kg / Group 0+)': {'count': 0, 'price': 8, 'details': ''},
    'Booster Seat (15-36 kg / Group 2/3)': {'count': 0, 'price': 6, 'details': ''},
  };

  
  final Map<String, IconData> optionIcons = {
    'Additional Drivers': Icons.person_add,
    'GPS & Android Auto/Apple CarPlay': Icons.gps_fixed,
    'Refueling/Charging Service': Icons.local_gas_station,
    'Cross-Border Driving': Icons.public,
    'Mobility Service': Icons.car_rental,
    'Tire & Windshield Protection': Icons.shield,
    'Interior Protection': Icons.shield_outlined,
    'Infant Seat (0-13 kg / Group 0+)': Icons.child_friendly,
    'Child Seat (0-10 kg, 9-18 kg / Group 0+)': Icons.child_care,
    'Booster Seat (15-36 kg / Group 2/3)': Icons.chair,
  };

  void _incrementOption(String option) {
    setState(() {
      options[option]!['count']++;
    });
  }

  void _decrementOption(String option) {
    setState(() {
      if (options[option]!['count'] > 0) {
        options[option]!['count']--;
      }
    });
  }

 int _calculateTotal() {
  int total = 0;
  options.forEach((_, details) {
    total += (details['count'] as int) * (details['price'] as int);
  });
  return total;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: options.keys.map((option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: _buildOptionContainer(
                  title: option,
                  count: options[option]!['count'],
                  price: options[option]!['price'],
                  icon: optionIcons[option] ?? Icons.car_rental,
                  onIncrement: () => _incrementOption(option),
                  onDecrement: () => _decrementOption(option),
                ),
              )).toList(),
            ),
          ),
          _buildSummaryBox(),
        ],
      ),
    );
  }

  Widget _buildOptionContainer({
    required String title,
    required int count,
    required int price,
    required IconData icon,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
   child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
         Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
        
        ElevatedButton(
          onPressed: onDecrement,
          child: Text('-'),
        ),
        SizedBox(height:10),
        ElevatedButton(
          onPressed: onIncrement,
          child: Text('+'),
        ),
      ],
    ),
      ],
    ),
    SizedBox(height: 8),
    Text(
      'Price: $price€ / day',
      style: TextStyle(color: Colors.white70, fontSize: 16),
    ),
    
 
  ],
),


    );
  }

  Widget _buildSummaryBox() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Selected Options:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.keys
                .where((option) => options[option]!['count'] > 0)
                .map((option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '$option: ${options[option]!['count']} x ${options[option]!['price']}€ = ${options[option]!['count'] * options[option]!['price']}€',
                        style: TextStyle(fontSize: 16),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Total: ${_calculateTotal()}€',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          ElevatedButton(
      onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), backgroundColor: Colors.blueAccent, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
      ),
      child: Text(
        'continue',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
    ),
        ],
      ),
    );
  }
}
