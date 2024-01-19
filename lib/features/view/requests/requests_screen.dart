import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_interception_requests/features/view/requests/widgets/product_card.dart';
import 'package:proxy_interception_requests/features/view_model/request_view_model.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  Widget getMediaWidget(
      BuildContext context, RequestViewModel requestViewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: requestViewModel.getAllProducts,
                    child: const Text('Get all products'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () => requestViewModel.onAddProductTap(context),
                    child: const Text('Add a new product'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (requestViewModel.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Wrap(
                  spacing: 8,
                  children: List.generate(
                    requestViewModel.products.length,
                    (index) => ProductCardWidget(
                      productEntity: requestViewModel.products[index],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RequestViewModel requestViewModel = Provider.of<RequestViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        requestViewModel.cleanData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            requestViewModel.requestPackageType.name,
          ),
        ),
        body: getMediaWidget(
          context,
          requestViewModel,
        ),
      ),
    );
  }
}
