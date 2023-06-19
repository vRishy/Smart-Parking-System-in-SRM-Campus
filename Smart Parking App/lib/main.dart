import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _netIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Image.asset(
                      'images/1.png',
                      height: 100,
                      width: 300,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _netIdController,
                      decoration: InputDecoration(
                        labelText: 'Net ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        validateLogin(
                            _netIdController.text, _passwordController.text, context);
                      },
                      child: Text('Log In'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Navigate to forgot password screen
                      },
                      child: Text('Forgot Password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateLogin(String username, String password, BuildContext context) {
  if (username == 'dhruv' && password == '1234') {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DashboardPage(),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Invalid credentials'),
        content: Text('Please enter a valid username and password'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Hello Dhruv'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What would you like to do today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to new booking screen
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewBookingPage()),
    );

              },
              child: Text('New Booking'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to leave parking slot screen
                            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LeaveParkingSlotPage ()),
    );
              },
              child: Text('Leave Parking Slot'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to modify parking slot screen
            
              },
              child: Text('Modify Parking Slot'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class NewBookingPage extends StatefulWidget {
  const NewBookingPage({Key? key}) : super(key: key);

  @override
  _NewBookingPageState createState() => _NewBookingPageState();
}

class _NewBookingPageState extends State<NewBookingPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? selected =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selected != null && selected != _selectedTime) {
      setState(() {
        _selectedTime = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('New Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : 'Selected date: ${_selectedDate!.toString().substring(0, 10)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Time:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime == null
                        ? 'No time selected'
                        : 'Selected time: ${_selectedTime!.format(context)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select'),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Confirm booking and navigate back to dashboard
                Navigator.pop(context);
              },
              child: Text('BOOK'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LeaveParkingSlotPage extends StatefulWidget {
  @override
  _LeaveParkingSlotPageState createState() => _LeaveParkingSlotPageState();
}

class _LeaveParkingSlotPageState extends State<LeaveParkingSlotPage> {
  String name = 'Dhruv';
  String slotNumber = 'P21';
  String userType = 'STUDENT';
  String bookingDateTime = '2023-04-15 14:30:00'; // replace with actual booking datetime
  String timeLeft = '00:30:00'; // replace with actual time left for slot

  void leaveParkingSlot() {
    // Remove entry from list
    setState(() {
      // Remove entry from list
    });
    // Show notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Parking slot left successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    // Navigate back to previous screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Parking Slot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booked Slot Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Booked Slot: $slotNumber',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Type: $userType',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Booking Date and Time: $bookingDateTime',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Time Left for Slot: $timeLeft',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: leaveParkingSlot,
                child: Text('Leave Parking Slot'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

