class Validator {
  static String? validname (String? input){
    if(input == null || input.trim().isEmpty){
      return 'Required Name';
    }
    else if(input.length < 6){
      return 'Invalid Name';
    }
    return null ;
  }
  static String? validemail (String? input){
    RegExp emailExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(input == null || input.trim().isEmpty ){
      return "Email is required";
    }
    else if(!emailExp.hasMatch(input)){
      return "Email bad format";
    }
    return null ;
  }
  static String? validpass (String? input){
    RegExp passExp =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(input == null || input.trim().isEmpty){
      return"Required Password";
    }
    else if (input.length < 6){
      return'Password should be at least 6 chars ';
    }
    else if(!passExp.hasMatch(input)){
      return'Weak Password';
    }
    return null;
  }
  // static String? validconfpass (String? input){
  //   if(input != passExp. ){
  //     return"Password doesn't match";
  //   }
  //   return null;
  // }
}