import 'package:flutter/material.dart';
import 'package:postbloc_app/application/core/features/posts/post_page.dart';
import 'package:postbloc_app/application/core/services/theme_service.dart';
import 'package:postbloc_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServiceProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(builder: (context, themeService, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: PostWrapper(),
      );
    });
  }
}
