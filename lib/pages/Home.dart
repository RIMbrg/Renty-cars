// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_import, file_names

import 'package:flutter/material.dart' ;
import 'package:renty_cars/widgets/NavBar.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
DateTime? _pickUpDate;
  TimeOfDay? _pickUpTime;
  String _pickUpLocation = "Select location";

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _pickUpDate) {
      setState(() {
        _pickUpDate = pickedDate;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _pickUpTime) {
      setState(() {
        _pickUpTime = pickedTime;
      });
    }
  }

 Future<void> _selectLocation() async {
  final url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$_pickUpLocation");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not open the map';
  }
}

  Widget _buildOptionCard(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent, size: 28),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
      ),
    );
  }
  @override
   Widget build(BuildContext context) {
    var _selectedIndex;
    return Scaffold(
      backgroundColor: Colors.blueAccent[50],
      appBar: AppBar(
        
        title: Text('Renty Car', style: TextStyle(fontSize: 24,color:Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

       child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(
   width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                ),
              ),
  child: Center(
    child: Image.asset('images/2.png',fit: BoxFit.contain,),
  ),
      ),
    
    SizedBox(height: 20),
  Container(
  padding: EdgeInsets.only(bottom: 30), 
   decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
              ),
  
  child: Column(
    
    children: [ 
            _buildOptionCard(
              'Pick-Up Date',
              _pickUpDate == null
                  ? 'Select date'
                  : '${_pickUpDate!.day}/${_pickUpDate!.month}/${_pickUpDate!.year}',
              Icons.calendar_today,
              () => _selectDate(context),
            ),
            _buildOptionCard(
              'Pick-Up Time',
              _pickUpTime == null
                  ? 'Select time'
                  : '${_pickUpTime!.hour}:${_pickUpTime!.minute}',
              Icons.access_time,
              () => _selectTime(context),
            ),
           _buildOptionCard(
  'Pick-Up Location',
  _pickUpLocation,
  Icons.location_on,
  _selectLocation,
),
  SizedBox(height: 20),
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
        'Show Offer',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
    ),
     
      ],  
          
    ),
  ),
          ],
        ),
      ),

          );
    
    
  }
  }
