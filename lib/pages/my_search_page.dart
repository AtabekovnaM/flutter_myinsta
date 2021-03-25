import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/model/user_model.dart';

class MySearchPage extends StatefulWidget {
  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  var searchController = TextEditingController();
  List<User> items = new List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
    items.add(User(fullname: "khurshidbek",email: "khurshid@gmail.com"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Search",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Billabong",
                fontSize: 25
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            //#Searchuser
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7)
              ),
              height: 45,
              child: TextField(
                style: TextStyle(color: Colors.black87),
                controller: searchController,
                onChanged: (input){
                  print(input);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 15.0,color: Colors.grey),
                  icon: Icon(Icons.search, color: Colors.grey,)
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (ctx,index){
                      return _itemOfUser(items[index]);
                    }
                )
            ),
          ],
        ),
      )
    );
  }


  Widget _itemOfUser(User user){
    return Container(
      height: 90,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                width: 1.5,
                color: Color.fromRGBO(193, 53, 132, 1)
              )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.5),
              child: Image(
                image: AssetImage("assets/images/ic_person.png"),
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3,),
              Text(
                user.email,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey
                      )
                    ),
                    child: Center(
                      child: Text("Follow"),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

