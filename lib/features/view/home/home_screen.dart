import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_interception_requests/features/model/domain/enums/request_package_type.dart';
import 'package:proxy_interception_requests/features/view/requests/requests_screen.dart';
import 'package:proxy_interception_requests/features/view_model/request_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interception of requests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<RequestViewModel>(
                              create: (context) => RequestViewModel(
                                    requestPackageType: RequestPackageType.http,
                                  ),
                              child: const RequestsScreen()),
                    ),
                  );
                },
                child: const Text('http')),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<RequestViewModel>(
                            create: (context) => RequestViewModel(
                                  requestPackageType: RequestPackageType.dio,
                                ),
                            child: const RequestsScreen()),
                  ),
                );
              },
              child: const Text('dio'),
            ),
          ],
        ),
      ),
    );
  }
}
