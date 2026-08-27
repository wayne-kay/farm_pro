import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../services/order_service.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  void initState() {
    super.initState();

     Future.microtask(() {
      if (!mounted) return;
      final authService = context.read<AuthService>();
      final orderService = context.read<OrderService>();

      final user = authService.currentUser; 
      final token = authService.token; 

      if(user != null && token != null){
        orderService.fetchOrders(user.id, token);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderService>();
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My Orders'),
      ),

      body: orders.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )

          : orders.orders.isEmpty
              ? const Center(
                child: Text(
                  "You have no orders yet.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )

              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.orders.length,
                  itemBuilder: (context, index) {
                    final order = orders.orders[index];

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),

                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(16),

                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.1),

                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Theme.of(context) .colorScheme .primary,
                          ),
                        ),

                        title: Text(
                          order.productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Padding(
                          padding:
                              const EdgeInsets.only(
                            top: 6,
                          ),

                          child: Text(
                            '${order.orderStatus} • '
                            '${_formatDate(order.createdAt)}',
                          ),
                        ),

                        trailing: Text(
                          'KSh ${(order.price * order.quantity).toStringAsFixed(2)}',

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  
  String _formatDate(dynamic date) {
    if (date == null) {
      return '';
    }

    final value = DateTime.tryParse(
      date.toString(),
    );

    if (value == null) {
      return date.toString();
    }

    return '${value.day}/${value.month}/${value.year}';
  }
}
