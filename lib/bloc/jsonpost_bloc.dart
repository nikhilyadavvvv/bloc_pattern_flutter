import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_post/models/user_created.dart';
import 'package:bloc_post/repository/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'jsonpost_event.dart';
part 'jsonpost_state.dart';

class JsonpostBloc extends Bloc<JsonpostEvent, JsonpostState> {
  final PostRepository repository;
  JsonpostBloc(this.repository);

  @override
  JsonpostState get initialState => JsonpostInitial();

  @override
  Stream<JsonpostState> mapEventToState(
    JsonpostEvent event,
  ) async* {
    // TODO: implement mapEventToState
    yield JsonpostLoading();
    if (event is GetPost) {
      try { 
        final post = await repository.makePostRequest(event.title, event.body);
        print(post);
        yield JsonpostLoaded(post);
      } catch (e) {
      }
    }
  }
}
