
class AppException implements Exception{
  final _message;
  final _prefex;
  AppException([this._message,this._prefex]);

  String toString(){
    return '$_prefex$_message';
  }

}
class FetchDataException extends AppException{
  FetchDataException([String? message]):super(message,'Error During Communication');
}
class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,'Invalid request');
}
class UnauthorizedException extends AppException{
  UnauthorizedException([String? message]):super(message,'Unauthorized request');
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message,'Invalid input');
}