part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostRequestEvent extends PostEvent{

   @override
  List<Object> get props => [];
}