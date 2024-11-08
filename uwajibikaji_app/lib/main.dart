import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'pages/login_page.dart'; // Import your LoginPage
// import 'pages/register_page.dart'; // Import your RegisterPage
import 'pages/home_page.dart'; // Import your HomePage
import 'pages/profilepage.dart';
import 'pages/ViewReportsPage.dart';
import 'pages/ReportPage.dart';
import 'pages/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://emwjbvdsqqgvcqiuzzum.supabase.co', // Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVtd2pidmRzcXFndmNxaXV6enVtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA4ODE4MTMsImV4cCI6MjA0NjQ1NzgxM30.WwogPWsKSNtM5Bp3PIQ5aIL2acYtn7Nq1tR1XB7IOVY', // Replace with your Supabase anon key
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uwajibikaji App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define routes for the app
      initialRoute: '/home', // Initial route (can be /login or /home)
      routes: {
        // '/login': (context) => LoginPage(),
        // '/register': (context) => RegisterPage(), // Define RegisterPage route
        '/home': (context) => HomePage(), // Define HomePage route
        '/report': (context) => ReportPage(),
        '/viewReports': (context) => ViewReportsPage(),
        '/profile': (context) => ProfilePage(),
        //'/themes': (context) => ThemeData(),
      },
    );
  }
}