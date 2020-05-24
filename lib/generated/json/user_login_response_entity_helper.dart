import 'package:ownerapp/views/dataModel/user_login_response_entity.dart';

userLoginResponseEntityFromJson(UserLoginResponseEntity data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error'];
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	return data;
}

Map<String, dynamic> userLoginResponseEntityToJson(UserLoginResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['message'] = entity.message;
	return data;
}