import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import 'package:squelette_mobile_parcours/models/AuthentificationModel.dart';
import 'package:squelette_mobile_parcours/widget/Chargement.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  AuthentificationModel user = AuthentificationModel();
  GetStorage stockage = GetStorage();
  Color other = Colors.black;
  Color selectedItem = Colors.orange;
  final ImagePicker picker = ImagePicker();
  XFile? imageSelectione;


  bool isVisible = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.COLOR_TRANSPARENT,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Utils.COLOR_NOIR,
            ),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: const Icon(
                  Icons.close,
                  color: Utils.COLOR_ORANGE,
                )),
          )
        ],
      ),
      body:  Stack(
        children: [_body(context), Chargement(isVisible)],
      ),

    );
  }

  Widget _body(BuildContext context) {
    var profileCtrl = context.watch<AuthentificationCtrl>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 0,),
        Container(
          child: InkWell(
            onTap: () async {},
            child: imageSelectione == null
                ? CircleAvatar(
              radius: 80.0,

              backgroundImage: AssetImage('images/image2.png',),
            )
                : CircleAvatar(
              radius: 80.0,
              backgroundImage: FileImage(File(imageSelectione!.path)),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          child: Text('${profileCtrl.user.email}',
            style: TextStyle(
                height: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Utils.COLOR_NOIR,
              fontFamily: 'Schyler'
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Utils.COLOR_NOIR
          ),
          child: TextButton(
            child: Text(
              'Changer ma photo',
              style: TextStyle(color: Utils.COLOR_BLANCHE,fontWeight: FontWeight.bold,fontFamily: "Schyler"),
            ),
            onPressed: () async {
              imageSelectione =
              await picker.pickImage(source: ImageSource.gallery);
              if (imageSelectione != null) {
                Directory directory = await getApplicationDocumentsDirectory();
                print(directory.path);
                var cheminSplit = imageSelectione!.path.split('/');
                String filename = cheminSplit.last;
                print(cheminSplit);
                print(filename);
                imageSelectione?.saveTo("${directory.path}/${filename}");
              }
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child:
          ListView(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //color: Utils.COLOR_BLEU_CIEL,
                  ),
                  child:  ListTile(
                    title: Text(
                      'Termes et Condition',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Schyler"
                      ),
                    ),
                    leading: Icon(
                      Icons.bookmark,
                      color: Utils.COLOR_ORANGE,
                      size: 35,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(height: 15,color: Utils.COLOR_GREY,),
                //SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //color: Utils.COLOR_BLEU_CIEL,
                  ),
                  child:  ListTile(
                    title: Text(
                      'A propos',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Schyler"
                      ),
                    ),
                    leading: Icon(
                      Icons.info,
                      color: Utils.COLOR_ORANGE,
                      size: 35,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(height: 15,color: Utils.COLOR_GREY,),
                //SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //color: Utils.COLOR_BLEU_CIEL,
                  ),
                  child:  ListTile(
                    title: Text(
                      'Configuration',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Schyler"
                      ),
                    ),
                    leading: Icon(
                      Icons.settings,
                      color: Utils.COLOR_ORANGE,
                      size: 35,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
                //SizedBox(height: 20,),
                Divider(height: 15,color: Utils.COLOR_GREY,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //color: Utils.COLOR_BLEU_CIEL,
                  ),
                  child:  ListTile(
                    title: Text(
                      'Déconnexion',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Schyler",
                      ),
                    ),
                    leading: Icon(
                      Icons.login,
                      color: Utils.COLOR_ORANGE,
                      size: 35,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onTap: () =>ouvrirDialog2(context),

                  ),
                ),
                SizedBox(height: 20,),

              ]),
        ),

      ],
    );
  }


  ouvrirDialog2(BuildContext context) async {

    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Deconnexion?",style: TextStyle(fontFamily: 'Schyler',color: Utils.COLOR_ORANGE),),
          content: new Text("Souhaitez-vous vraiment vous déconnecter de TimeKeep?",style: TextStyle(fontFamily: 'Schyler'),),
          actions: <Widget>[
            TextButton(
              child: new Text(
                "Annuler",
                style: TextStyle(color: Utils.COLOR_ROUGE,fontFamily: 'Schyler'),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: new Text("Se déconnecter",style: TextStyle(color:Utils.COLOR_ORANGE,fontFamily: 'Schyler'),),
              onPressed: () async {
                var auth = context.read<AuthentificationCtrl>();
                auth.logout({});
                isVisible = true;
                setState(() {});
                stockage.remove(StockageKeys.tokenKey);
                Navigator.popAndPushNamed(context, Routes.Authentification);
                await Future.delayed(Duration(seconds: 7));
                isVisible = false;



              },
            ),
          ],
        );
      },
    );
// code executé apres fermeture de la boite de dialogue

  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action:
      SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}


