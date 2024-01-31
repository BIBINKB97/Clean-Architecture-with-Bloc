import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postbloc_app/application/core/features/posts/bloc/post_bloc.dart';
import 'package:postbloc_app/application/core/services/theme_service.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: PostPage(),
    );
  }
}

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
              }),
          IconButton(
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(PostRequestEvent());
              },
              icon: Icon(Icons.refresh))
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

              Expanded(
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostInitial) {
                      return Text("posts are waiting to loaded");
                    } else if (state is PostStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (state is PostStateLoaded) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                child: Text("1"),
                              ),
                              title: Text(state.posts[index].title),
                              subtitle: Text(state.posts[index].body),
                            ),
                          );
                        },
                        itemCount: 10,
                      );
                    } else if (state is PostStateError) {
                      return Center(
                        child: Text("some thing went wrong"),
                      );
                    }
                    return Text('nullll');
                  },
                ),
              )

              // Center(
              //   child: CircularProgressIndicator(
              //     color: Colors.blue,
              //   ),
              // ),
              // Center(
              //     child: Text("posts are loading",
              //         style: themeData.textTheme.displayLarge)),
              // Expanded(
              //   child:
              // ListView.builder(
              //     itemBuilder: (context, index) {
              //       return Card(
              //         child: ListTile(
              //           leading: CircleAvatar(
              //             radius: 25,
              //             child: Text("1"),
              //           ),
              //           title: Text("Post one"),
              //           subtitle: Text("post one body"),
              //         ),
              //       );
              //     },
              //     itemCount: 10,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
