import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/home_blocs.dart';
import 'package:online_learning_app/common/entities/colors.dart';
import 'package:online_learning_app/event/home_events.dart';
import 'package:online_learning_app/state/home_states.dart';
import 'package:online_learning_app/widget/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBlocs,HomeStates>(builder: (context,state){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child:Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  width: 375.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]
                  ),
                  child: BottomNavigationBar(
                    onTap: (value){
                      context.read<HomeBlocs>().add(TriggerHomeEvent(value));
                    },
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: state.index,
                    items: bottomTabs
                  ),
                )
            ) ),
      );
    });
  }
}
