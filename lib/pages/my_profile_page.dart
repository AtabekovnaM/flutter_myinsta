import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  File _image;
  List<Post> items = new List();
  int axisCount = 1;
  String post_img1 = "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964";
  String post_img2 = "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72";

  @override
  void initState(){
    //  TODO: implement initState
    super.initState();
    items.add(Post(postImage: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img2,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img2,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img1,caption: "Discover more great images on our sponsor's site"));
    items.add(Post(postImage: post_img2,caption: "Discover more great images on our sponsor's site"));
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Billabong', fontSize: 25),
            ),
          )
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //#myphoto
            GestureDetector(
              onTap: (){
                _showPicker(context);
              },
              child: Stack(
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
                      borderRadius: BorderRadius.circular(35),
                      child: _image == null
                          ? Image(
                        image: AssetImage("assets/images/ic_person.png"),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      )
                          : Image.file(
                        _image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.add_circle,color: Colors.purple,)
                      ],
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 10,),

            //#Myinfos
            Text("Muslima".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text("muslima@gmail.com",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),
            //#Mycounts
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("675".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("POSTS",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4,562".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("FOLLOWERS",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 1,height: 20,color: Colors.grey.withOpacity(0.5),),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("897".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 3,),
                          Text("FOLLOWINGS",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            axisCount = 1;
                          });
                        },
                        icon: Icon(Icons.list_alt),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            axisCount = 2;
                          });
                        },
                        icon: Icon(Icons.grid_view),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //#myposts
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: axisCount),
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return _itemOfPost(items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child:  CachedNetworkImage(
              width: double.infinity,
              imageUrl: post.postImage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url,error) => Icon(Icons.error),
              fit: BoxFit.cover,
            )
          ),

          SizedBox(height: 3,),
          Text(post.caption,style: TextStyle(color: Colors.black87.withOpacity(0.7)),maxLines: 2,)
        ],
      ),
    );
  }
}
