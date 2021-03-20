
class Validations{
  static bool isValid(String string){
    return string != null && string.length > 0;
  }

  static var UserData = {'admin': 'admin','admin1':'admin1'};

  static bool checkEmail(String email){
    return email.contains('@');
  }

  static bool ktdb(String string){
    var codeUnit = string.codeUnits.toList();
    for(var i in codeUnit){
      if(i < 48) return false;
      else if(i >= 58 && i <= 64) return false;
      else if(i >= 91 && i <= 96) return false;
      else if(i > 122) return false;
    }
    return true;
  }

  static bool numOfKey(String string){
    return string != null && string.length >= 5;
  }

  static bool checkUser(String user){
    return UserData.containsKey(user);
  }
  static bool checkPass(String user,String password){
    return UserData[user] == password;
  }
}