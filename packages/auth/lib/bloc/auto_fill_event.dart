abstract class AutoFillEvent{}


class FetchAutoFill extends AutoFillEvent {
  final String code;
  FetchAutoFill({required this.code});
}