// ignore_for_file: eol_at_end_of_file, lines_longer_than_80_chars

import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/screens/create_spending_screen.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryEconomyPage extends StatefulWidget {
  const HistoryEconomyPage({super.key});

  @override
  State<HistoryEconomyPage> createState() => _HistoryEconomyPageState();
}

class _HistoryEconomyPageState extends State<HistoryEconomyPage> {
  final List<SortParametrs> sortParametrs =
      GetIt.I.get<AppProvider>().sortParametrs;

  Enum pageState = EconomySortState.all;
  List<EconomyElement> elements = [];
  bool loading = true;
  EconomyBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    bloc!.add(GetSpendingsEvent());
    super.initState();
  }

  void setNewState({required EconomySortState state}) {
    if (pageState != state) {
      setState(() => pageState = state);
    }
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
      MaterialPageRoute(builder: CreateSpedingScreen.builder),
    );

    if (element != null) {
      setState(
        () => elements.add(element),
      );
    }
  }

  void onError() => debugPrint(AppLocalizations.current.errorLoading);

  void setElements(List<EconomyElement> elementsBloc) => setState(() {
        elements = elementsBloc;
        loading = false;
      });

  @override
  void dispose() {
    bloc!.add(DisposeEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
            child: Row(
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
          ),
          SizedBox(
            height: size.height * 0.74,
            child: BlocListener<EconomyBloc, EconomyBlocState>(
              listener: (context, state) {
                if (state is BlocError) {
                  onError();
                } else if (state is GetHistorySuccess) {
                  setElements(state.elements);
                }
              },
              child: ListView.builder(
                padding: getPadding(all: 0),
                itemCount: elements.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return SpendingWidget(element: elements[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
