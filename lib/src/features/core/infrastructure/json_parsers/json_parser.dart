abstract class JsonParser<T> {
  Future<List<T>> parseFetchAll(dynamic json);
  Future<T> parseFetchById(dynamic json);
}
