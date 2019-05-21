final String userTable = 'users';
final String colId = 'id';
final String colName = 'name';
final String colUser = 'username';
final String colPass = 'password';

class Users {
  int _id;
  String _name;
  String _username;
  String _password;

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  String get username {
    return _username;
  }

  String get password {
    return _password;
  }

  Users();

  Users.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._name = map['name'];
    this._username = map['username'];
    this._password = map['password'];
  }

  Users.getValue(id, name, username, password){
    this._id = id;
    this._name = name;
    this._username = username;
    this._password = password;
  }

   Users.map(dynamic object) {
    this._id = object['id'];
    this._name = object['name'];
    this._username = object['username'];
    this._password = object['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {colName: _name, colUser: _username, colPass: _password};
    if (_id != null) {
      map[colId] = _id;
    }
    return map;
  }

  void setValue(name, username, password) {
    this._name = name;
    this._username = username;
    this._password = password;
  }

}