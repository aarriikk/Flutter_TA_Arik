import 'package:flutter/material.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/screens/auth/login.dart';
// import 'package:my_app/screens/history.dart';
import 'package:my_app/screens/layout.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iot App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const LoginPage()
          : const LayoutPage(),
    );
  }
}
