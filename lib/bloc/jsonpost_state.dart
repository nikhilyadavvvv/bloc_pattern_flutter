part of 'jsonpost_bloc.dart';

abstract class JsonpostState extends Equatable {
  const JsonpostState();
}

class JsonpostInitial extends JsonpostState {
  @override
  List<Object> get props => [];
}

class JsonpostLoading extends JsonpostState {
  const JsonpostLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class JsonpostLoaded extends JsonpostState {
  final UserCreated userCreated;
  const JsonpostLoaded(this.userCreated);
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UsersLoaded extends JsonpostState {

  final Users users;
  const UsersLoaded(this.users);
  @override
  // TODO: implement props
  List<Object> get props => [users];
  
}
