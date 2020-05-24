import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ownerapp/constAndString/const.dart';
import 'package:ownerapp/generated/json/user_login_response_entity_helper.dart';
import 'package:ownerapp/views/dataModel/user_login_response_entity.dart';
import 'package:scoped_model/scoped_model.dart';


class ApiScopedModel  extends Model{
  static ApiScopedModel of(BuildContext context,
      {bool rebuildOnChange = false}) =>
      ScopedModel.of(context, rebuildOnChange: rebuildOnChange);

//  var _userToken;
//  get userToken => _userToken;

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );



  UserLoginResponseEntity userLoginResponseEntity = UserLoginResponseEntity();
//  UserLoginVerifyResponseEntity userLoginVerifyResponseEntity = UserLoginVerifyResponseEntity();
//  UserDashboardResponseEntity userDashboardResponseEntity = UserDashboardResponseEntity();
//  UserListroomBookingResponseEntity userListroomBookingResponseEntity = UserListroomBookingResponseEntity();
//  UserListroomAvailableResponseEntity userListroomAvailableResponseEntity = UserListroomAvailableResponseEntity();
//

  Future<String> logUserIn(String phoneNumber) async {
    try {

      final response = await _dio.post("/login/check",data: {
        "login": phoneNumber
      });

      userLoginResponseEntity= userLoginResponseEntityFromJson(userLoginResponseEntity,response.data);
      notifyListeners();

    } on DioError catch (error) {
      print(error);
      if(error.type == DioErrorType.DEFAULT){
        return REQUEST_FAIL;
      }
      return error.response.data['message'];
    } catch (e) {
      print(e);
      return REQUEST_FAIL;
    }
    return REQUEST_SUCCESS;
  }
  // ignore: non_constant_identifier_names
//  Future<String> VerifyPhoneNumber(String phoneNumber,String code) async {
//
//    try {
//
//      final response = await _dio.post("/login/verify", data: {
//        "login": phoneNumber,
//        "code": code
//      });
//
//
//      userLoginVerifyResponseEntity = userLoginVerifyResponseEntityFromJson(userLoginVerifyResponseEntity, response.data);
//
//      _userToken = parseJwt(response.headers.value("Token"));
//      _dio = Dio(
//        BaseOptions(
//            baseUrl: BASE_URL,
//            headers: {
//              "Authorization": "Bearer ${response.headers.value("Token")}",
//              "Content-Type": "application/json",
//            }
//        ),
//      );
//
//      notifyListeners();
//
//    } on DioError catch (error) {
//      if(error.type == DioErrorType.DEFAULT){
//        return REQUEST_FAIL;
//      }
//      return error.response.data['message'];
//    } catch (e) {
//      return REQUEST_FAIL;
//    }
//    return REQUEST_SUCCESS;
//  }
//  // ignore: non_constant_identifier_names
//  Future<String> ViewDashboard(int ownerID) async {
//    try {
//      final response = await _dio.get("/3/dashBoard");
//      print(response);
//      userDashboardResponseEntity = userDashboardResponseEntityFromJson(userDashboardResponseEntity, response.data);
//
//      notifyListeners();
//
//    } on DioError catch (error) {
//      print(error);
//      if(error.type == DioErrorType.DEFAULT){
//        return REQUEST_FAIL;
//      }
//      return error.response.data['message'];
//    } catch (e) {
//      print(e);
//      return REQUEST_FAIL;
//    }
//    return REQUEST_SUCCESS;
//  }
//  // ignore: non_constant_identifier_names
//  Future<String> ListRoomAvailable(int ownerID,int houseID,int choice) async {
//    try {
//      final response = await _dio.get("/3/3/room?is_rent=0");
//      print(response);
//      userListroomAvailableResponseEntity = userListroomAvailableResponseEntityFromJson(userListroomAvailableResponseEntity, response.data);
//
//      notifyListeners();
//
//    } on DioError catch (error) {
//      print(error);
//      if(error.type == DioErrorType.DEFAULT){
//        return REQUEST_FAIL;
//      }
//      return error.response.data['message'];
//    } catch (e) {
//      print(e);
//      return REQUEST_FAIL;
//    }
//    return REQUEST_SUCCESS;
//  }
//  // ignore: non_constant_identifier_names
//  Future<String> ListRoomBooking(int ownerID,int houseID,int choice) async {
//    try {
//      final response = await _dio.get("/3/3/room?is_rent=1");
//      print(response);
//      userListroomBookingResponseEntity = userListroomBookingResponseEntityFromJson(userListroomBookingResponseEntity, response.data);
//
//      notifyListeners();
//
//    } on DioError catch (error) {
//      print(error);
//      if(error.type == DioErrorType.DEFAULT){
//        return REQUEST_FAIL;
//      }
//      return error.response.data['message'];
//    } catch (e) {
//      print(e);
//      return REQUEST_FAIL;
//    }
//    return REQUEST_SUCCESS;
//  }
//  // ignore: non_constant_identifier_names
//  Future<String> AddPeopleToRoom(int houseID,String firstName,String lastName,String nationalID,String gender,String phoneNumber,int totalMember,String date) async {
//
//    try {
//      final response = await _dio.post("/3/3/room/$houseID/register", data: {
//        "national_card_id": nationalID,
//        "first_name": firstName,
//        "last_name": lastName,
//        "gender": gender,
//        "contacts": phoneNumber,
//        "members": totalMember,
//        "bill_date": date
//      });
//
//
//      userLoginResponseEntity= userLoginResponseEntityFromJson(userLoginResponseEntity,response.data);
//      notifyListeners();
//
//    } on DioError catch (error) {
//      print(error);
//      if(error.type == DioErrorType.DEFAULT){
//        return REQUEST_FAIL;
//      }
//      return error.response.data['message'];
//    } catch (e) {
//      print(e);
//      return REQUEST_FAIL;
//    }
//    return REQUEST_SUCCESS;
//  }

}