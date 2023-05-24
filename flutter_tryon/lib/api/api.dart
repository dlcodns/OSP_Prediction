class API {
  static const hostConnect = "https://b4bc-34-126-76-38.ngrok.io";
  static const hostConnectUser = "$hostConnect/user";
  static const phpConnect = "";

  static const signup = "$phpConnect/user/signup.php";
  static const login = "$phpConnect/user/login.php";
  static const validateEmail = "$phpConnect/user/validate_email.php";

  static const clothupload = "$hostConnect/inputs/cloth";
  static const modelupload = "$hostConnect/inputs/img";
  static const predict = "$hostConnect/predictimage";
  static const getuserimage = "$hostConnect/user/image_viewall.php";
}
