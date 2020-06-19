part of 'jsonpost_bloc.dart';

abstract class JsonpostEvent extends Equatable {
  const JsonpostEvent();
}

class GetPost extends JsonpostEvent {
  String title;
  String body;

  GetPost(this.body,this.title);
  @override
  // TODO: implement props
  List<Object> get props => [title,body];
}

class GetUsers extends JsonpostEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResetUI extends JsonpostEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
