class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  HttpException.firebase(String code)
      : message = _translateFirebaseErrorCode(code);

  static String _translateFirebaseErrorCode(code) {
    switch (code) {
      case 'EMAIL_EXISTS':
        return 'Địa chỉ E-mail này đã được sử dụng';
      case 'INVALID_EMAIL':
        return 'Đây không phải là một địa chỉ E-mail hợp lệ';
      case 'WEAK_PASSWORD':
        return 'Mật khẩu quá yếu';
      case 'EMAIL_NOT_FOUND':
        return 'Không tìm thấy người dùng';
      case 'INVALID_PASSWORD':
        return 'Mật khẩu không hợp lệ';
      default:
        return code;
    }
  }

  @override
  String toString() {
    return message;
  }
}
