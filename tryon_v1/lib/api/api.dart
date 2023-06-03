class API {
  static const hostConnect = "https://c81a-34-143-232-126.ngrok.io";
  static const hostConnectUser = "$hostConnect/user";
  static const phpConnect = "http://192.168.45.78/api_users";

  static const signup = "$phpConnect/user/signup.php";
  static const login = "$phpConnect/user/login.php";
  static const validateEmail = "$phpConnect/user/validate_email.php";

  static const clothupload = "$hostConnect/inputs/cloth";
  static const modelupload = "$hostConnect/inputs/img";
  static const predict = "$hostConnect/predictimage";
  //static const getuserimage = "$hostConnect/user/image_viewall.php";
}
