import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Facebook Profile Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/cover.jpg", height: 200, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child:  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: myProfileImg(48)
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Ousseynou Mbodji", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                ),
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Flutter est un « toolkit », boîte à outils, qui a été créé par le géant du web Google. C'est un toolkit qui est orienté UI.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: modificationDuProfile(text: "Modifier le profile"),
                ),
                modificationDuProfile(icon: Icons.border_color),
              ],
            ),
            const Divider(thickness: 2),
            simpleText(text: "À propos de moi"),
            sectionApropo(icon: Icons.home, text: "Somone, Thies, Sénégal"),
            sectionApropo(icon: Icons.work, text: "Développeur fullStack Spring Boot | Angular"),
            sectionApropo(icon: Icons.favorite, text: "En couple avec mon Ordi"),
            const Divider(thickness: 2),
            simpleText(text: "Amis"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mesAmis(text: "Mbaye", img: "images/cat.jpg", width: width/3.5),
                mesAmis(text: "Mbaye", img: "images/cat.jpg", width: width/3.5),
                mesAmis(text: "Mbaye", img: "images/cat.jpg", width: width/3.5),

              ],
            ),
            const Divider(thickness: 2),
            simpleText(text: "Mes Posts"),
            mesPosts(time: "5 minutes ", image: "images/mountain.jpg", description: "Partez à la découverte d'un métier en vogue, passionnant, dynamique et ouvert sur l'avenir : community manager !",likes: 3, commentaire: 5),
            mesPosts(time: "2 jours ", image: "images/sunflower.jpg", description: "On va maintenant faire un petit cas pratique des quatre plugins que l'on vient d'installer ensemble",likes: 40, commentaire: 15),
            mesPosts(time: "1 semaine ", image: "images/work.jpg", description: "Une ville intelligente est une ville qui donne la possibilité au citoyen d'obtenir des services en utilisant son ordinateur ou son téléphone mobile.",likes: 129, commentaire: 58)


          ],
        ),
      )
    );
  }



  CircleAvatar myProfileImg(double radius){
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      backgroundImage: AssetImage("images/profile.jpg"),
    );
  }

  Container modificationDuProfile({IconData? icon , String? text}){
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue
      ),

      child: (icon == null)
          ? Center(child: Text(text ?? "", style: const TextStyle(color: Colors.white), textAlign: TextAlign.center))
          : Icon(icon, color: Colors.white),
    );
  }
  
  Widget sectionApropo({required IconData icon, required String text}){
    return Row(
      children: [
        Icon(icon),
        Text(text, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)
      ],
    );
  }
  Widget simpleText({required String text}){
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(text, 
            textAlign: TextAlign.right, 
            style: const TextStyle(fontWeight: FontWeight.bold))
    );
  }

  Widget mesAmis({required String text, required String img, required double width}){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: width,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            boxShadow: const [BoxShadow(color: Colors.grey)],
            image: DecorationImage(
                image: AssetImage(img), fit: BoxFit.cover
            ),
          ),
        ),
        Text(text),
      ],
    );
  }
  Widget mesPosts({required String time, required String image, required String description, int likes = 0, int commentaire = 0}){
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 8),
              child: myProfileImg(20)),
              Text("  Ousseynou Mbodji"),
              Spacer(),
              Text("il y'a $time ", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Padding(padding: EdgeInsets.all(8),
              child: Image.asset("$image", fit: BoxFit.cover)
          ),
          Text("$description", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("$likes Likes"),
              Icon(Icons.message),
              Text("$commentaire Commentaires")
            ],
          )

        ],
      )
    );
  }
}
