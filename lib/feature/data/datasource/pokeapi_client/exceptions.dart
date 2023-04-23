// The file implements exceptions

class PokeAPIBadRequestException implements Exception {
  final String msg;

  const PokeAPIBadRequestException([this.msg = 'PokeApi client exception']);

  @override
  String toString() => msg;
}

class PokeAPINotFoundException extends PokeAPIBadRequestException {
  PokeAPINotFoundException([msg = 'PokeAPI client. Not found.']) : super(msg);
}

class PokeAPIReceiveException extends PokeAPIBadRequestException {
  PokeAPIReceiveException([msg = 'PokeAPI client. Failed to retrieve value'])
      : super(msg);
}
