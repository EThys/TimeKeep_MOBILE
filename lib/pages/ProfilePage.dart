import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/Constantes.dart';
import 'package:squelette_mobile_parcours/controllers/ProfileCtrl.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color other = Colors.black;
  Color selectedItem = Colors.orange;
  final ImagePicker picker = ImagePicker();
  XFile? imageSelectione;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<ProfileCtrl>();
      userCtrl.recuperProfil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),

    );
  }

  Widget _body() {
    var userCtrl = context.watch<ProfileCtrl>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: InkWell(
            onTap: () async {


            },
            child: imageSelectione == null
                ? CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('images/image1.jpg'),
            )
                : CircleAvatar(
              radius: 80.0,
              backgroundImage: FileImage(File(imageSelectione!.path)),
            ),
          ),
        ),
        Container(
          child: TextButton(
            child: Text(
              'Changer la photo',
              style: TextStyle(color: Colors.grey),
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
        Container(
          child: Text("profil name",
            //  '${userCtrl.user?.name == null ? 'Profil Name' : userCtrl.user?.name}',
            style: TextStyle(
                height: 1.5,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.black87),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child:
          ListView(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Mes publications',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  leading: Icon(
                    Icons.public,
                    color: Colors.black,
                    size: 35,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Mes favoris',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 35,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                    size: 35,
                  ),
                  trailing: badges.Badge(
                    badgeContent: Text("6", style: TextStyle(color: Colors.white),),
                  ),
                  /*Icon(
                Icons.notifications_paused_rounded,
                color: Colors.black,
                size: 20,
              ),*/
                  onTap: () {},
                ),
                ListTile(
                  title: Text("non defini",
                    // '${userCtrl.user?.email == null ? "non defini" : userCtrl.user?.email}',
                    style: TextStyle(fontSize: 14),
                  ),
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 35,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("non defini",
                    //   "${userCtrl.user?.telephone==null? 'non defini':userCtrl.user?.telephone}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 35,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Aide',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                    size: 35,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Déconnexion',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 35,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 120,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: 343,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      //other=Colors.orange;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(Icons.update),
                          ),
                          Text(
                            'Mettre à jour le profile',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: other,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ]),
        ),

      ],
    );
  }
}