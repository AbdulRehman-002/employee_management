import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:virtoxed_text/views/add_employee/add_employee_provider.dart';
import 'package:virtoxed_text/views/employee_details/employee_detail_provider.dart';
import 'package:virtoxed_text/views/home/home_provider.dart';
import 'package:virtoxed_text/views/splash_screen.dart';
import 'package:virtoxed_text/views/update_employee/update_employee_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

var uuid = Uuid();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => AddEmployeeProvider()),
        ChangeNotifierProvider(create: (context) => UpdateEmployeeProvider()),
        // ChangeNotifierProvider(create: (context) => EmployeeDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen(),
      ),
    );
  }
}
