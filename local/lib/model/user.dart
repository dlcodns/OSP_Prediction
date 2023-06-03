class User{
  int UID;
  String name;
  String user_id;
  String password;

  User(this.UID, this.name, this.user_id, this.password);

  Map<String, dynamic> toJson() => {
    'UID' : UID.toString(),
    'name' : name,
    'user_id' : user_id,
    'password' : password

  };
}