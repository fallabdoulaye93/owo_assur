import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../controllers/cgu_controller.dart';

class CguView extends GetView<CguController> {
   CguView({Key? key}) : super(key: key);
  Widget pageContentTitle = Html(
    data: """<b>Conditions générales d\'utilisation</b><br />""",
  );
  Widget pageContentText = Html(
    data: """
                <div style="font-size:11.1px;">
                  <span style="font-size:11px;">
                      Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.
                      On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).
                  </span>
                </div> <br />

        """,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CguController>(
        builder: (_){
          return Material(
            color: Colors.grey[100],
            child: SafeArea(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  physics: ClampingScrollPhysics(),
                  child:Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CloseButton()
                      ],
                    ),
                    Container( child: pageContentTitle),
                    SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Container( child: pageContentText)
                    )
                  ])
              ) ,
            ),
          );
        },
      ),
    );
  }
}
