import 'package:delivery_app/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key? key}) : super(key: key);

  @override
  _ClientProductsListPageState createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  ClientProductsListController _controller = new ClientProductsListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _controller.logout,
          child: Text('Cerrar Sesión'),
        )
      ),
    );
  }
}
