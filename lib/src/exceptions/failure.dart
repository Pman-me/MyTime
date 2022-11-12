enum FailureType { noInternet, error }

class Failure extends Exception {
  late final FailureType _type;
  late final String? _message;


  FailureType get type => _type;

  set type(FailureType value) {
    _type = value;
  }


  String get message => _message!;

  set message(String value) {
    _message = value;
  }

  factory Failure(){
    return Failure();
  }

}
