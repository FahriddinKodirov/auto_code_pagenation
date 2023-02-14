abstract class AutoFillState {}

class InitialAutoFillState extends AutoFillState {}


class LoadAutoFillInSuccess extends AutoFillState {
  LoadAutoFillInSuccess({required this.codeAutoFill});

  final String codeAutoFill;
}



