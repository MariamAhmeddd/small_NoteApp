abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterSuccess extends RegisterStates{}

class RegisterFail extends RegisterStates{
  String message;
  RegisterFail({required this.message});
}