import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/controllers/session_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  final materialTheme = MaterialTheme(ThemeData.light().textTheme);
  Get.put(SessionController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: materialTheme.light(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
