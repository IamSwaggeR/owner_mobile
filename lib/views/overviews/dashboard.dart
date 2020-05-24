import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/diologs/loadingDiolog.dart';
import 'package:ownerapp/widgets/navigation/buttomNavBar.dart';
import 'package:ownerapp/widgets/overviews/dardboard/dashboardMonthlyColumn.dart';
import 'package:ownerapp/widgets/overviews/dardboard/dashboardToday.dart';
import 'package:ownerapp/widgets/text/textTitle.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  bool isLoading = false;
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  getData() async {
//    var userID = ApiScopedModel.of(context).userToken;
//    int id = userID['id'];
//    await ApiScopedModel.of(context).ViewDashboard(id);
//    setState(() {
//      isLoading = false;
//    });
//  }

  @override
  Widget build(BuildContext context) {
//    var apiScopedModel = ApiScopedModel.of(context).userDashboardResponseEntity.data;
    var apiScopedModel;
    return Scaffold(
      bottomNavigationBar: ButtomNavBar(
        isActiveDashBoard: true,
      ),
      body: isLoading
          ? LoadingDiolog()
          :Container(
        color: appColor,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          physics: ScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DashBoardMonthlyColumn(
                    topText: totalMoney,
//                    buttomText: apiScopedModel.monthlySummary.price,
                    buttomText: 00,
                    marginRight: 6,
                  ),
                ),
                Expanded(
                  child: DashBoardMonthlyColumn(
                    topText: totalTenant,
//                    buttomText: apiScopedModel.monthlySummary.tenants,
                    buttomText: 00,
                    marginLeft: 6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
//                      Navigator.of(context).push(
//                        MaterialPageRoute(
//                          builder: (context) => Room(
//                            textTitle: totalRoom,
//                          ),
//                        ),
//                      );
                    },
                    child: DashBoardMonthlyColumn(
                      topText: totalRoom,
//                      buttomText: apiScopedModel.monthlySummary.rooms,
                      buttomText: 00,
                      marginRight: 6,
                    ),
                  ),
                ),
                Expanded(
                  child: DashBoardMonthlyColumn(
                    topText: peoplePaid,
//                    buttomText: apiScopedModel.monthlySummary.paid,
                    buttomText: 00,
                    marginLeft: 6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            TextTitle(
              text: 'Today',
            ),
            SizedBox(
              height: 6,
            ),
            DashBoardToday(
              textLeft: money,
//              textRight: apiScopedModel.todaySummary.price,
              textRight: 00,
            ),
            DashBoardToday(
              textLeft: tenant,
//              textRight: apiScopedModel.todaySummary.tenants,
              textRight: 00,
            ),
            DashBoardToday(
              textLeft: room,
//              textRight: apiScopedModel.todaySummary.rooms,
              textRight: 00,
            ),
            DashBoardToday(
              textLeft: paid,
//              textRight: apiScopedModel.todaySummary.paid,
              textRight: 00,
            ),
          ],
        ),
      ),
    );
  }
}
