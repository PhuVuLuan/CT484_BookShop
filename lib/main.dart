import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/HienThi.dart';
import 'ui/SanPham/ChinhSuaSP.dart';

Future<void> main() async {
  // Load the .env file
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthManager(),),
        ChangeNotifierProvider(create: (ctx) => QuanLySP(),),
        ChangeNotifierProvider(create: (ctx) => QuanLyGioHang()),
        ChangeNotifierProvider(create: (ctx) => QuanLyDH()),
      ],
      child:Consumer<AuthManager>(
         builder: (ctx, authManager, child){
          return MaterialApp(
            title: 'Books Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Lato',
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.green,
                ).copyWith(
                  secondary: Color.fromARGB(255, 255, 233, 34),
            )),
            home: authManager.isAuth
                ? const tongQuan()
                : FutureBuilder(
                    future: authManager.tryAutoLogin(),
                    builder: (ctx, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen();
                    },
            ),
            routes: {
              SanPhamND.routeName: (ctx) => const SanPhamND(),
              showOrder.routeName: (ctx) => const showOrder(),
              show_cart.routeName: (ctx) => const show_cart(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == ChiTietSP.routeName) {
                final sanphamId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return ChiTietSP(
                      ctx.read<QuanLySP>().findById(sanphamId)!,
                    );
                  },
                );
              }
              if (settings.name == EditSanPham.routeName) {
                final sanphamId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditSanPham(
                      sanphamId != null
                          ? ctx.read<QuanLySP>().findById(sanphamId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },  
          );
         }
      ),
    );
  }
}
