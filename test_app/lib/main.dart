import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/vm/location_handler.dart';
import 'package:test_app/vm/login_handler.dart';
import 'package:test_app/vm/tab_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  Get.put(TabVM());
  Get.put(LocationHandler());
  Get.put(LoginHandler());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
