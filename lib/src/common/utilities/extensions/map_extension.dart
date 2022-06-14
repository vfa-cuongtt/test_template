///An extension function to facilitate adding nullable Maps
///(I need it in other places, declared it here for clarity)
extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}
