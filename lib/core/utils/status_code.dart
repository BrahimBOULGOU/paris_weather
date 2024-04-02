enum StatusCode {
  success('200'),
  notFound('400');

  final String value;

  const StatusCode(this.value);
}
