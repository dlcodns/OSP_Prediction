class API {
  static const hostConnect = "https://2d61-34-123-4-54.ngrok.io";
  static const hostConnectUser = "$hostConnect/user";
  static const phpConnect = "http://192.168.35.229/api_users";

  static const signup = "$phpConnect/user/signup.php";
  static const login = "$phpConnect/user/login.php";
  static const validateEmail = "$phpConnect/user/validate_email.php";

  static const clothupload = "$hostConnect/inputs/cloth";
  static const modelupload = "$hostConnect/inputs/img";
  static const predict = "$hostConnect/predictimage";
  //static const getuserimage = "$hostConnect/user/image_viewall.php";
}
