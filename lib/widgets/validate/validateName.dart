String validateName(String value){
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(pattern);
  if(value.isEmpty){
    return 'Full name is required';
  }else if(!regExp.hasMatch(value)){
    return 'Full name must be all a-z or A-Z';
  }
  return null;
}