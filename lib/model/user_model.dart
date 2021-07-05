class UserModel{
  String id;
  String username;
  String email;
  String photoUrl;
  String displayName;
  String bio;
  int state;
  UserModel({
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
    this.state,
  });
  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['username'] = user.username;
    data['email'] = user.email;
    data['displayName'] = user.displayName;
    data["bio"] = user.bio;
    data["state"] = user.state;
    data["photoUrl"] = user.photoUrl;
    return data;
  }

  // Named constructor
  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.username = mapData['username'];
    this.email = mapData['email'];
    this.displayName = mapData['displayName'];
    this.bio = mapData['bio'];
    this.state = mapData['state'];
    this.photoUrl = mapData['photoUrl'];
  }
}
