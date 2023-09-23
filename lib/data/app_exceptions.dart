class AppExceptions implements Exception {
  final _message;
  final _prefix;

  // constructor
  AppExceptions([this._message, this._prefix]);

  @override
  // method to string
  // custom pesan pada throw error
  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends AppExceptions {
  // mengirim pesan message ke parent class
  // constructor pesan message ke parent class
  InternetException(String? message) : super(message, "No Internet");
}

class RequestTimeOut extends AppExceptions {
  // mengirim pesan message ke parent class
  // constructor pesan message ke parent class
  RequestTimeOut(String? message) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions {
  // mengirim pesan message ke parent class
  // constructor pesan message ke parent class
  ServerException(String? message) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppExceptions {
  // mengirim pesan message ke parent class
  // constructor pesan message ke parent class
  InvalidUrlException(String? message) : super(message, "Invalid Url");
}

class FetchDataException extends AppExceptions {
  // mengirim pesan message ke parent class
  // constructor pesan message ke parent class
  FetchDataException(String? message) : super(message, "");
}
