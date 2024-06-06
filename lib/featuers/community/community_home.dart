// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'package:flutter_application_9/core/constant/color.dart';

import 'command_info.dart';
import 'model/add_command.dart';
import 'model/community_modle.dart';

class Community extends StatelessWidget {
  Community({
    Key? key,
    // required this.comments,
  }) : super(key: key);

  List<CommentModel> comments = [
    CommentModel(
      name: 'name',
      id: "1",
      text: 'text',
      subject: 'subject',
      time: DateTime.now(),
      // class_: 'class',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'تعليقات',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                 SearchBar(
                  hintText: 'بحث',
                  leading: SvgPicture.asset(
                'assets/svg/search-normal.svg',
                color: Colors.black,
              )
                  // svg: 'assets/svg/search-normal.svg',
                );
                // showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: SvgPicture.asset(
                'assets/svg/search-normal.svg',
                color: Colors.black,
              )),
        ],
        leading: IconButton(
            onPressed: () {
               Get.to(()  =>   const AddedCommand());
            },
            icon: SvgPicture.asset(
              'assets/svg/messages.svg',
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(
            height: 700,
            child: ListView.builder(
              itemCount: 10,
             itemBuilder: (context, index) {
                return const Command(
                  height:160,
                );     
                   }
              ),
          ),
      
        ],
      ),
      )
    );
  }

  // ignore: non_constant_identifier_names
}
class Command extends StatelessWidget {
  const Command({
    Key? key,
    required this.height,
  }) : super(key: key);

final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
              onTap:(){
                 Get.to(()=> const CommandInfo( ));
              },
              child: Container(
                // width:360.h,
                height: height,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:AppColor.grey),
                ),
                child: Row(
                  children: [
                             
                    // ignore: prefer_const_constructors
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
              
                        children: [
                           const Text(
                          'احمد ليث',
                          style: TextStyle(
                              height: 1.5,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        const SizedBox(width:190,),
                          //  const Spacer(),
                        const Text("12:12 PM",
                        style: TextStyle(
                          color: Colors.black,fontSize: 12),),
                
                          SvgPicture.asset('assets/svg/warning-2.svg',width: 24,),
                                    ],
                             ),
                        // Text(comments[index].time.toString()),
                        
                        const Text(
                          'المادة: الرياضيات السادس علمي',
                          style: TextStyle(
                              height: 1.5,
                              color: AppColor.primaryColor,
                              fontSize: 16),
                        ),
                        
                         SizedBox(
                          // width: 306.h,
                          height: 80.h,
                          child: const Text(
                            'هنا يكتب السؤال هنا يكتب السؤال هنا يكتب السؤال \nهنا يكتب السؤال هنا يكتب السؤال هنا يكتب السؤال \nهناهنا يكتب السؤال هنا يكتب السؤال هنا يكتب السؤال \nهنا يكتب السؤال هنا يكتب السؤال هنا يكتب السؤال \nهنا يكتب السؤال هنا يكتب السؤال هنا يكتب السؤ...  ',
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 14,
                                height: 2,
                                overflow: TextOverflow.clip),
                          ),
                        ),
                        
                        // Text(comments[index].comment, style: const TextStyle(color: Colors.white),),
                        // Text(comments[index].subject),
                        //   Text(comments[index].text),
                      ],
                    ),
                    
                    //      Row(
                    //   children: [
                    //     const Text("12:12 PM",
                    //     style: TextStyle(
                    //       color: Colors.black,fontSize: 12),),
                        
                    //      SvgPicture.asset('assets/svg/warning-2.svg',width: 24,),
                    //     // Text(comments[index].time.toString()),
                    //   ],
                    // ),
                  ],
                ),
              ),
          
      
        ),
      ),
    );
  }
}

//  AddedCommand(
//                 onFilterChanged: (stage, class_, subject) {
                  // Filter the comments based on the selected filters
                //   final filteredComments = comments.where((comment) {
                //     return (stage == null || comment.subject == stage) &&
                //         (class_ == null || comment.class == class_) &&
                //         (subject == null || comment.subject == subject);
                //   }).toList();
        
                //   Update the UI with the filtered comments
                //   setState(() {
                //     comments = filteredComments;
                //   });
              //    },
              // ),