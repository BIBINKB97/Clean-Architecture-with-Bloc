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
              activeColor: Colors.green,
              activeTrackColor: Colors.white,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Posts",
                style: themeData.textTheme.displayLarge,
              ),
              Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
              Center(
                  child: Text("posts are loading",
                      style: themeData.textTheme.displayLarge)),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text("1"),
                        ),
                        title: Text("Post one"),
                        subtitle: Text("post one body"),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
