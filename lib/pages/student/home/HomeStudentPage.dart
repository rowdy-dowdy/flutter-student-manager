import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_student_manager/components/student/notifications/list_notification.dart';
import 'package:flutter_student_manager/components/student/list_icon_student.dart';
import 'package:flutter_student_manager/controllers/AuthController.dart';
import 'package:flutter_student_manager/controllers/student/ClassroomController.dart';
import 'package:flutter_student_manager/controllers/student/CodeScanController.dart';
import 'package:flutter_student_manager/models/StudentModel.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_student_manager/components/student/bottom_navbar_student.dart';
import 'package:flutter_student_manager/components/logo.dart';

class HomeStudentPage extends ConsumerStatefulWidget {
  const HomeStudentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeStudentPageState();
}

class _HomeStudentPageState extends ConsumerState<HomeStudentPage> with WidgetsBindingObserver {
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose(){
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("App Lifecycle State : $state");
    if (state == AppLifecycleState.resumed) {
      ref.read(codeScanControllerProvider.notifier).loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/img/home_bg3.jpg",
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        // Container(color: Colors.black.withOpacity(0.3),),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final user = ref.watch(authControllerProvider).user as StudentModel;
                      return Container(
                        // height: 70,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.6),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: CachedNetworkImage(
                                imageUrl: user.getImage(),
                                imageBuilder: (context, imageProvider) => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.green,
                                          Colors.orange,
                                        ],
                                      ),
                                    ),
                                    child: Icon(CupertinoIcons.person_fill, color: Colors.green[50], size: 40,)
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(minHeight: 55),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(user.name, style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    const SizedBox(height: 5,),
                                    Text(ref.watch(getUserTextStateProvider)),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => context.go('/student/notifications'), 
                              icon: const Icon(CupertinoIcons.bell_fill), color: Colors.white,
                            )
                          ],
                        ),
                      );
                    }
                  ),
          
                  const SizedBox(height: 20,),
                  const HomeListIconStudent(),
          
                  const SizedBox(height: 20,),
                  const Expanded(child: HomeListNotification())
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBarStudent(),
        ),
      ],
    );
  }
}