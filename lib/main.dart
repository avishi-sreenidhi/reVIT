import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reVIT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 7, 46, 83),
              Color.fromARGB(255, 66, 103, 172)
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Student Name",
                  style: TextStyle(color: Colors.white)),
              accountEmail: const Text("22BCE3254",
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/images.jpeg',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 7, 46, 83),
                    Color.fromARGB(255, 66, 103, 172)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.white),
              title: const Text('Room Service',
                  style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomServiceScreen(),
                ),
              ),
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.report_problem, color: Colors.white),
              title: const Text('Complaints',
                  style: TextStyle(color: Colors.white)),
              onTap: () => print('fix'),
            ),
            ListTile(
              leading: const Icon(Icons.star_rate, color: Colors.white),
              title: const Text('Mess Reviews',
                  style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessReviewPage(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.commute, color: Colors.white),
              title:
                  const Text('Shuttle', style: TextStyle(color: Colors.grey)),
              onTap: () => print('fix'),
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.white),
              title:
                  const Text('Events', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventsPage(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts, color: Colors.white),
              title:
                  const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const Navbar(),
        appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.50)),
            centerTitle: true,
            title: Text("Home")),
        body: Center(
          child: Column(
            children: const [
              SizedBox(height: 25.0),
              /*ElevatedButton(
              onPressed: () {
                _registerUser('iniyanckalai@gmail.com', 'abc123!');
              } ,
              child: const Text('add user')
            )*/
            ],
          ),
        ));
  }
}

class MessReviewPage extends StatefulWidget {
  const MessReviewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessReviewPageState createState() => _MessReviewPageState();
}

class _MessReviewPageState extends State<MessReviewPage> {
  // Initial Selected Value
  String dropdownvalue = 'PR Mess';

  // List of items in our dropdown menu
  var items = [
    'PR Mess',
    'SSS Mess',
    'Darling',
    'Mess 4',
    'Mess 5',
  ];

  int _rating = 0;

  Widget _buildStar(int index) {
    if (index < _rating) {
      return const Icon(Icons.star, color: Colors.yellow);
    } else {
      return const Icon(Icons.star_border);
    }
  }

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.50)),
        centerTitle: true,
        title: const Text("Mess Review", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Mess Type',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 8),
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),

                // After selecting the desired option, it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Rate the mess',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () => _setRating(index + 1),
                    child: _buildStar(index),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Enter your feedback',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Type your feedback here',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackScreen(),
                    ),
                  );
                },
                child: const Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Submitted"),
      ),
      body: const Center(
        child: Text(
          "Your review has been sent.",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Submitted"),
      ),
      body: const Center(
        child: Text("Your complaint has been registered."),
      ),
    );
  }
}

class RoomServiceScreen extends StatefulWidget {
  @override
  _RoomServiceScreenState createState() => _RoomServiceScreenState();
}

class _RoomServiceScreenState extends State<RoomServiceScreen> {
  List<String> _services = [
    'Sweeping the floor',
    'Mopping the floor',
    'Cleaning the fan',
    'Washing the curtains',
    'Cleaning shelves and tables',
    'Fixing the AC',
    'Electricity issues',
  ];

  Set<String> _selectedServices = Set<String>();

  void _toggleService(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  void _submitServices() {
    // TODO: Implement the logic to submit the selected services
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.50)),
        title: const Text('Room Service'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select the services you need:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _services.length,
              itemBuilder: (BuildContext context, int index) {
                final service = _services[index];
                return CheckboxListTile(
                  title: Text(service),
                  value: _selectedServices.contains(service),
                  onChanged: (bool? value) {
                    _toggleService(service);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThanksScreen(),
                ),
              );
            },
            child: const Text('Submit'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Set<String> _selectedServices = Set<String>();

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank you!'),
      ),
      body: const Center(
        child: Text(
          'Thanks for your request! We will process your order as soon as possible.',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Student Name';
  String _registrationNo = '22BCE3254';
  String _email = 'student.name2022@vitstudent.ac.in';
  String _block = 'A';
  String _roomNo = '101';

  final _nameController = TextEditingController();
  final _registrationNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _blockController = TextEditingController();
  final _roomNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _registrationNoController.text = _registrationNo;
    _emailController.text = _email;
    _blockController.text = _block;
    _roomNoController.text = _roomNo;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _registrationNoController.dispose();
    _emailController.dispose();
    _blockController.dispose();
    _roomNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.50)),
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50.0,
                //backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Name', style: TextStyle(fontSize: 16.0)),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Registration No', style: TextStyle(fontSize: 16.0)),
            TextField(
              controller: _registrationNoController,
              decoration: const InputDecoration(
                hintText: 'Enter your registration number',
              ),
              onChanged: (value) {
                setState(() {
                  _registrationNo = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Email', style: TextStyle(fontSize: 16.0)),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Block', style: TextStyle(fontSize: 16.0)),
            TextField(
              controller: _blockController,
              decoration: const InputDecoration(
                hintText: 'Enter your block',
              ),
              onChanged: (value) {
                setState(() {
                  _block = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Room No', style: TextStyle(fontSize: 16.0)),
            TextField(
              controller: _roomNoController,
              decoration: const InputDecoration(
                hintText: 'Enter your room number',
              ),
              onChanged: (value) {
                setState(() {
                  _roomNo = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save changes to database or API
                // ...
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String name;
  final String venue;
  final String timing;
  final String organizer;

  Event({
    required this.name,
    required this.venue,
    required this.timing,
    required this.organizer,
  });
}

final List<Event> events = [
  Event(
      name: 'WomenTechies\'23',
      venue: 'Anna Auditorium',
      timing: '9:00AM 4th March - 5:00PM 5th March',
      organizer: 'GDSC'),
  Event(
      name: 'Event 2',
      venue: 'Venue 2',
      timing: '9:00 AM - 5:00 PM',
      organizer: 'Club 2'),
  Event(
      name: 'Event 3',
      venue: 'Venue 3',
      timing: '11:00 AM - 7:00 PM',
      organizer: 'Club 3'),
  Event(
      name: 'Event 4',
      venue: 'Venue 4',
      timing: '8:00 AM - 4:00 PM',
      organizer: 'Club 4'),
  Event(
      name: 'Event 5',
      venue: 'Venue 5',
      timing: '9:00 AM - 5:00 PM',
      organizer: 'Club 5'),
];

class EventBlock extends StatelessWidget {
  final Event event;
  final Color backgroundColor;
  final bool hasShadow;

  EventBlock({
    required this.event,
    required this.backgroundColor,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final boxShadow = hasShadow
        ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0.0, 5.0),
            ),
          ]
        : null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: EdgeInsets.only(bottom: hasShadow ? 16.0 : 0.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: boxShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              event.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Venue: ${event.venue}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Timing: ${event.timing}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Organizer: ${event.organizer}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events;

  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return EventBlock(
          event: events[index],
          backgroundColor: Colors.grey,
        );
      },
    );
  }
}

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.50)),
        centerTitle: true,
        title: const Text('Events'),
      ),
      body: EventList(events: events),
    );
  }
}
