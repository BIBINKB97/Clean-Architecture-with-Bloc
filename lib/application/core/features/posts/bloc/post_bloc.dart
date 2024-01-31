import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestEvent>((event, emit) {
      emit(PostStateLoading());

      // Future.delayed(Duration(seconds: 2), () {
      //   emit(PostStateLoaded(post: posts));
      // });
    });
  }
}
