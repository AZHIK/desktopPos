import 'package:go_router/go_router.dart';
import 'package:pharmavault/features/auth/screens/login_screen.dart';
import 'package:pharmavault/features/auth/screens/create_account_page.dart';
import 'package:pharmavault/features/auth/screens/user_list.dart';
import 'package:pharmavault/features/checkout/screens/checkout_screen.dart';
import 'package:pharmavault/features/home/screens/homescreen.dart';
import 'package:pharmavault/features/orders/screens/orders_screen.dart';
import 'package:pharmavault/features/pos/screens/pos_products_screen.dart';
import 'package:pharmavault/features/products/screens/products_list.dart';
import 'package:pharmavault/features/sync/screens/sync_screen.dart';


final List<GoRoute> appRoutes =[ 
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/create-account', builder: (context, state) => const CreateAccountPage()),
      GoRoute(path: '/home', builder: (context, state) =>  Homescreen()),
      GoRoute(
        path: '/products',
        builder: (context, state) => ProductsList(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => CheckoutScreen(),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => OrdersScreen(),
      ),
      GoRoute(
        path: '/sync-status',
        builder: (context, state) => SyncStatusScreen(),
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => UserList(),
      ),
      GoRoute(
        path: '/pos',
        builder: (context, state) => PosScreen(),
      ),
    ];
const String initialRoute = '/login';
