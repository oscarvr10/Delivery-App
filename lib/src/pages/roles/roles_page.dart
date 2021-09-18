import 'package:delivery_app/src/models/role.dart';
import 'package:delivery_app/src/pages/roles/roles_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({Key? key}) : super(key: key);

  @override
  _RolesPageState createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {

  RolesController _con = new RolesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async{
      await _con.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona un Rol'),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.20),
        child: ListView(
          children: _con.user != null && _con.user!.roles!.length > 0 ? _con.user!.roles!.map((Role role){
            return _cardRole(role);
          }).toList() : [],
        ),
      ),
    );
  }

  Widget _cardRole(Role role){
    return GestureDetector(
      onTap: () {
        _con.goToPage(role.route);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            child: FadeInImage(
              image: NetworkImage(role.image),
              placeholder: AssetImage('assets/img/no-image.png'),
              fit: BoxFit.contain,
              fadeInDuration: Duration(milliseconds: 50),
            ),
          ),
          SizedBox(height: 12),
          Text(
            role.name,
            style: TextStyle(
                fontSize:  16,
                color: Colors.black
            ),
          ),
          SizedBox(height: 35)
        ],
      ),
    );
  }

  void refresh(){
    setState(() {});
  }
}
