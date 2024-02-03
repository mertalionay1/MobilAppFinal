enum ProductServicePath {
  register(value: '/register'),
  login(value: '/login'),
  user(value: '/users')
  ;

  const ProductServicePath({
    required this.value,
  });
  final String value;

  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
