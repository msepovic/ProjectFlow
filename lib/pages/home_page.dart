import 'package:flutter/material.dart';
import 'package:projectflow/main.dart';
import 'package:projectflow/pages/dashboard_page.dart';
import 'package:projectflow/pages/login_page.dart';
import 'package:projectflow/pages/projects_page.dart';
import 'package:projectflow/pages/settings_page.dart';
import 'package:projectflow/pages/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  final List <Widget> _pages = [
    DashboardPage(),
    ProjectsPage(),
    TaskPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        leading: FlutterLogo(),
        title: Text('ProjectFlow',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // left as null for when the feature will be implemented
            },
          ),
          SizedBox(width: 10,),
          PopupMenuButton<String>(
            icon: const Icon(Icons.person),
            onSelected: (value) async {
              if (value == 'logout') {
                await supabase.auth.signOut();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                }
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            leading: FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.add) 
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home), 
                label: Text('Home')
                ),
              NavigationRailDestination(
                icon: Icon(Icons.dashboard), 
                label: Text('Projects')
                ),
              NavigationRailDestination(
                icon: Icon(Icons.task), 
                label: Text('Tasks')
                ),
              NavigationRailDestination(
                icon: Icon(Icons.settings), 
                label: Text('Settings')
                ),
            ], 
            selectedIndex: _selectedindex, onDestinationSelected: (int index) {
              setState(() {
                _selectedindex = index;
              });
            },),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _pages[_selectedindex],
            )
          )
        ],
      ),
    );
  }
}
