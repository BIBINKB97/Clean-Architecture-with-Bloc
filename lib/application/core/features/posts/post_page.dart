import 'package:flutter/material.dart';
import 'package:postbloc_app/application/core/services/theme_service.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PostApp Bloc",
          style: themeData.textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
    );
  }
}
