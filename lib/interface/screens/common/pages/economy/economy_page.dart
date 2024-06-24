// ignore_for_file: eol_at_end_of_file, lines_longer_than_80_chars

import 'package:app_with_apps/core/manager/economy_bloc/economy_bloc.dart';
import 'package:app_with_apps/core/models.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/common/pages/economy/create/create_spending_screen.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EconomyPage extends StatefulWidget {
  const EconomyPage({super.key});

  @override
  State<EconomyPage> createState() => _EconomyPageState();
}

class _EconomyPageState extends State<EconomyPage> {
  Enum pageState = EconomySortState.all;
  List<EconomyModel> elements = [];
  bool loading = true;
  EconomyBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<EconomyBloc>(context);
    bloc!.add(GetEconomyEvent());
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
    return UTILSConstants.grey1;
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

  void setElements(EconomyModels models) => setState(() {
        elements = models.models;
        loading = false;
      });

  @override
  void dispose() {
    bloc!.add(DisposeEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Stack(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.money),
          Padding(
            padding: EdgeInsets.only(top: h * 0.09),
            child: SizedBox(
              width: w * 0.8,
              child: BlocListener<EconomyBloc, EconomyBlocState>(
                listener: (context, state) {
                  if (state is BlocError) {
                    onError();
                  } else if (state is GetHistorySuccess) {
                    setElements(state.elements);
                  } else if (state is Delete) {
                    if (state.isDeleted) {
                      bloc!.add(GetEconomyEvent());
                    }
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final element in elements) SpendingWidget(element: element),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.75),
            child: GestureDetector(
              onTap: goToCreate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    color: Colors.green,
                    height: h * 0.07,
                    width: w * 0.8,
                    widget: Center(
                      child: CustomText(text: AppLocalizations.current.addMoney),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
