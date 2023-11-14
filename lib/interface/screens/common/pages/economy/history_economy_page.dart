import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/economy/add_spending.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryEconomyPage extends StatefulWidget {
  const HistoryEconomyPage({super.key});

  @override
  State<HistoryEconomyPage> createState() => _HistoryEconomyPageState();
}

class _HistoryEconomyPageState extends State<HistoryEconomyPage> {
  // ignore: lines_longer_than_80_chars
  final List<SortParametrs> sortParametrs =
      GetIt.I.get<AppProvider>().sortParametrs;

  Enum pageState = EconomySortState.all;
  List<HistoryElement> elements = [];
  bool loading = true;

  EconomyBloc? bloc;

  @override
  void initState() {
    setState(() {
      elements = [];
    });
    bloc = BlocProvider.of<EconomyBloc>(context);
    bloc!.add(GetSpendingsEvent());

    super.initState();
  }

  void setNewState({required EconomySortState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }

    // if (pageState == EconomySortState.all) {
    //   elements = initialList;
    // } else if (pageState == EconomySortState.byDate) {
    //   elements = initialList;
    // } else if (pageState == EconomySortState.min) {
    // } else if (pageState == EconomySortState.max) {}
  }

  Color getCurrentButtonColor({required EconomySortState state}) {
    if (state == pageState) {
      return UTILSConstants.purple;
    }
    return UTILSConstants.grey;
  }

  Future goToCreate() async {
    final element = await Navigator.push(
      context,
      MaterialPageRoute(builder: AddSpedingScreen.builder),
    );

    if (element != null) {
      setState(
        () => elements.add(element),
      );
    }
  }

  void onError() => debugPrint('error adding');

  void setElements(List<HistoryElement> elementsBloc) => setState(() {
        elements = elementsBloc;
        loading = false;
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: getPadding(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    color: UTILSConstants.black,
                    widget: const Row(),
                  ),
                  CustomButton(
                    color: UTILSConstants.white,
                    text: AppLocalizations.current.add,
                    tap: goToCreate,
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(620),
                child: BlocListener<EconomyBloc, EconomyBlocState>(
                  listener: (context, state) {
                    if (state is BlocError) {
                      onError();
                    } else if (state is GetHistorySuccess) {
                      setElements(state.elements);
                    }
                  },
                  child: loading
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: elements.length,
                          itemBuilder: (context, index) {
                            return Note(element: elements[index]);
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.all),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.all),
            //           text: AppLocalizations.current.sortAll,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.byDate),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.byDate),
            //           text: AppLocalizations.current.sortByDate,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.min),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.min),
            //           text: AppLocalizations.current.sortMin,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => setNewState(state: HistoryState.max),
            //         child: CustomButton(
            //           color: getCurrentButtonColor(state: HistoryState.max),
            //           text: AppLocalizations.current.sortMax,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),





