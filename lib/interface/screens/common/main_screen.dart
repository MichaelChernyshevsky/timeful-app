import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  EconomyBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    super.initState();
  }

  void changePage(int index) {
    setState(
      () => _selectedIndex = index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GetIt.I.get<AppProvider>().pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: Container(
        color: UTILSConstants.black,
        height: getHeight(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: AppConstants.iconsBottomBar.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => changePage(index),
                splashColor: UTILSConstants.transparent,
                highlightColor: UTILSConstants.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == _selectedIndex ? 0 : size.width * .02,
                        right: size.width * .02,
                        left: size.width * .02,
                      ),
                      width: size.width * .128,
                      height: index == _selectedIndex ? size.width * .014 : 0,
                      decoration: BoxDecoration(
                        color: UTILSConstants.purple,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    Icon(
                      AppConstants.iconsBottomBar[index],
                      size: size.width * .046,
                      color: index == _selectedIndex
                          ? UTILSConstants.purple
                          : UTILSConstants.grey,
                    ),
                    SizedBox(height: size.width * .03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
