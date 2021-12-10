class ApiResponse {
  final int statusCode;
  final dynamic body;

  ApiResponse(this.statusCode, this.body);

  bool isOk() {
    return statusCode >= 200 && statusCode < 300;
  }

  bool isNotFound() {
    return statusCode == 404;
  }
}
