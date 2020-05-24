String validatePhone(String value){
  String pattern = r'^((?!([1-9]))[0-9]{9,10})$';
  RegExp regExp = new RegExp(pattern);
  if(value.isEmpty){
    return 'Phone number is required';
  }else if(!regExp.hasMatch(value)){
    return 'Your number must be 0-9';
  }
  return null;
}