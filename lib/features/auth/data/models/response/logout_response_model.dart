class LogoutResponse {
  final String message;
  final int status;

  LogoutResponse({
    required this.message,
    required this.status,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}
