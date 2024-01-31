import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postbloc_app/domain/entities/post_entity.dart';
import 'package:postbloc_app/domain/entities/usecases/post_usecases.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestEvent>((event, emit) async {
      print("bloc initialized");

      try {
        final posts = await PostUseCases().getPostFormDataSource();

        emit(PostStateLoaded(posts: posts));
      } catch (e) {
        emit(PostStateError(message: e.toString()));
      }
    });
  }
}
