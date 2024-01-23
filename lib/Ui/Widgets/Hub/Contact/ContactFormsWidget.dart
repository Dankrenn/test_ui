import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';
import 'package:test_ui/Ui/Setting/TextStyle.dart';

class ContactFormsWidget extends StatelessWidget {
  const ContactFormsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyleSetting.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorStyleSetting.backgroundColor,
        title: const Text('Профиль', style: TextStyleSetting.textStyleAppbar,),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,color: ColorStyleSetting.colorGray,),
            onPressed: () {},
          ),
        ],
      ),
      body: ProfileTab(),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AvatarWidget(),
        const SizedBox(height: 20),
        const UserInfoWidget(),
        const TabBarWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/736x/f0/9a/23/f09a2387b2f7c6ad839d47143a1b91c0.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: CircleAvatar(
        child: ProfilePicture(
          name: 'f',
          radius: 100,
          fontsize: 21,
          tooltip: true,
          img: 'https://opis-cdn.tinkoffjournal.ru/mercury/main-2-midjourney-avatars.whzewv..jpg',
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'John Doe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: ColorStyleSetting.colorGray,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'User ID: unique_user_id',
          style: TextStyle(
            color: ColorStyleSetting.colorWhite,
          ),
        ),
      ],
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileButton(icon: Icons.people, label: 'Друзья'),
        ProfileButton(icon: Icons.photo, label: 'Галерея'),
        ProfileButton(icon: Icons.post_add, label: 'Посты'),
      ],
    );
  }
}



class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyleSetting.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      icon: Icon(icon, color: ColorStyleSetting.colorGray),
      label: Text(
        label,
        style: TextStyle(color: ColorStyleSetting.colorGray),
      ),
    );
  }
}
