String validateNumber(String value){
  String pattern = r'^((?!([0]))[0-9]{1,10})$';
  RegExp regExp = new RegExp(pattern);
  if(value.isEmpty){
    return 'Qty is required';
  }else if(!regExp.hasMatch(value)){
    return 'Wrong input';
  }
  return null;
}