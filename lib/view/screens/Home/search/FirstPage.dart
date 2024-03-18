import 'package:firbase/controller/SavedController.dart';
import 'package:firbase/view/screens/Home/search/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/SearchController.dart';
import '../../../widgets/custome_textformfield.dart';

class FirstPageSearch extends StatelessWidget {
   FirstPageSearch({super.key});
   
  SizedBox size=SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchControllerr>(
  builder: (context, provider, child) {
  return ListView(children: [
          SizedBox(height: 10,),
          //appbar
          Row(children: [
            IconButton(onPressed: (){Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
            Expanded(
                flex: 2,
                child: CustomeTextformfield(icon: Icon(Icons.search,color: Colors.black,),ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPageSearch(),));
                },name: "Type Somthing",controller: provider.search),),
          ],),size,

          //Recent searches
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            color: Colors.black12,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Text("Recent searches")),

          Container(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
              provider.search.text==""?Container():ListTile(
                enabled: false,
                title: Text("${provider.search.text}",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black)),
                trailing: Icon(Icons.delete_forever),
                leading: Icon(Icons.access_time),
              )
            ],),
          ),
        ],);
  },
),
      ),
    );
  }
}
