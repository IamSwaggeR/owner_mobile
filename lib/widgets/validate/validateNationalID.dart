String validateNationalID(String value){
  String pattern = r'^([0-9]{9,9})$';
  RegExp regExp = new RegExp(pattern);
  if(value.isEmpty){
    return 'Qty is required';
  }else if(!regExp.hasMatch(value)){
    return 'NationalID must be 9 digits';
  }
  return null;
}