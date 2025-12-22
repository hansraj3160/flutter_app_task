import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/get_di.dart' as di;  
import 'features/employee/presentation/employee_screen.dart'; 
Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
 
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titan Group Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
       
      home: const EmployeeScreen(),
    );
  }
}