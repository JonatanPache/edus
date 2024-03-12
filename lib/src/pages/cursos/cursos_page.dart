import 'package:edus/src/models/curso_model.dart';
import 'package:edus/src/pages/learning/curso_card.dart';
import 'package:edus/src/provider/resources_repository.dart';
import 'package:edus/src/utils/AppCircleButton.dart';
import 'package:edus/src/utils/ContentArea.dart';
import 'package:edus/src/utils/background_decoration.dart';
import 'package:edus/src/utils/menu_screen.dart';
import 'package:edus/src/utils/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CursosPage extends ConsumerStatefulWidget {
  const CursosPage({super.key});
  @override
  ConsumerState<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends ConsumerState<CursosPage> {
  final MyZoomDrawerController _controller = MyZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _controller.zoomDrawerController,
        borderRadius: 50.0,
        showShadow: false,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        menuBackgroundColor: Colors.orange,
        menuScreen: MenuScreen(
          controller: _controller,
        ),
        mainScreen: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.orangeAccent,
                  Colors.red,
                  Colors.redAccent
                ],
                begin: Alignment.topLeft, //begin of the gradient color
                end: Alignment.bottomRight, //end of the gradient color
                stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                //set the stops number equal to numbers of color
                ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCircleButton(
                          onTap: _controller.toogleDrawer,
                          child: const Icon(Icons.menu)),
                      const SizedBox(height: 10),
                      const Text(
                        'Que quieres aprender hoy?',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: FutureBuilder(
                        future: ref
                            .read(resourcesRepositoryProvider)
                            .getCursosAll(),
                        builder: (context,
                            AsyncSnapshot<List<CursoModel>> snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 20);
                              },
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CursoCard(model: snapshot.data![index]);
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
