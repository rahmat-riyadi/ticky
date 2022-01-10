import 'package:flutter/material.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: myGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded)
          ),
           title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.person_outline_rounded, size: 20, color: Color(0xFFC08C06)),
              ),
              Text(
                'pengaturan profil', style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFC08C06)
                ),
              )
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: MyColor.textColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    scale: 0.2,
                    image: AssetImage(
                      'assets/images/poster1.jpg',
                    )
                  )
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(1.3,1.3),
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.secondaryColor,
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.edit, size: 15, color: MyColor.textColor,)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Rahmat Riyadi Syam', style: TextStyle(
                  color: MyColor.textColor, fontSize: 18
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ListTile(
                  // tileColor: Colors.red,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'username', style: TextStyle(
                      color: Colors.white.withOpacity(0.21),
                      fontSize: 12
                    ),
                  ),
                  subtitle: Text(
                    'rahmat_riyadi_1177', style: TextStyle(
                      color: MyColor.textColor
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: MyColor.secondaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Icon(Icons.edit, size: 16, color: MyColor.textColor),
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'kata sandi', style: TextStyle(
                    color: Colors.white.withOpacity(0.21),
                    fontSize: 12
                  ),
                ),
                subtitle: Text(
                  '1711****', style: TextStyle(
                    color: MyColor.textColor
                  ),
                ),
                trailing: GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: MyColor.secondaryColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Icon(Icons.edit, size: 16, color: MyColor.textColor),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'email', style: TextStyle(
                    color: Colors.white.withOpacity(0.21),
                    fontSize: 12
                  ),
                ),
                subtitle: Text(
                  'rahmatriyadi171102@gmail.com', style: TextStyle(
                    color: MyColor.textColor
                  ),
                ),
                trailing: GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: MyColor.secondaryColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Icon(Icons.edit, size: 16, color: MyColor.textColor),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}