import 'package:equatable/equatable.dart';
import 'package:recomend_toba/login/data/data_login.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPost extends LoginEvent {
  final DataLogin data;
  const LoginPost(this.data);
}
