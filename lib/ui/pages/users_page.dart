import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/users_profile_provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UsersProfileProvider? usersProfileProvider;
  @override
  void initState() {
    usersProfileProvider =
        Provider.of<UsersProfileProvider>(context, listen: false);
    usersProfileProvider!.getUserProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, UsersProfileProvider value, Widget? child) {
        return value.usersProfileModel != null ? Scaffold(
          backgroundColor: Colors.grey[800],
          body: SafeArea(
            child: Column(
              children: [
                // Profile photo
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 100.w,
                  height: 35.h,
                  // decoration: const BoxDecoration(color: Colors.red),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 120,
                          backgroundImage: NetworkImage('${value.usersProfileModel!.images![0].url}'),
                        ),
                      ]),
                ),
                // Profile Name
                Container(
                  width: 100.w,
                  height: 10.h,
                  // decoration: const BoxDecoration(color: Colors.amber),
                  child: Center(
                      child: Text(
                    '${value.usersProfileModel!.displayName}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  )),
                ),
                // Followers
                Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 6.h,
                    // decoration: const BoxDecoration(color: Colors.cyan),
                    child: Text(
                      'Followers : ${value.usersProfileModel!.followers!.total}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    )),
                // Profile Social Media Icons
                Container(
                  // padding: const EdgeInsets.all(5),
                  width: 100.w,
                  height: 8.h,
                  // decoration: const BoxDecoration(color: Colors.orange),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 1.h),
                        width: 6.h,
                        height: 6.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(
                                scale: 1,
                                image: AssetImage('assets/ic_instagram.png'))),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 1.h),
                        width: 6.h,
                        height: 6.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(
                                scale: 1,
                                image: AssetImage('assets/ic_twitter.png'))),
                      ),
                      Container(
                        width: 6.h,
                        height: 6.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(
                                scale: 1,
                                image: AssetImage('assets/ic_facebook.png'))),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                      // color: Colors.red
                      ),
                  child: Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                            animationDuration: const Duration(seconds: 1),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 6.h, vertical: 4.h))),
                        onPressed: () {},
                        child: const Text(
                          'Premium\'a Geç',
                          style: TextStyle(fontSize: 25),
                        )),
                  ),
                )
              ],
            ),
          ),
        ) : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
