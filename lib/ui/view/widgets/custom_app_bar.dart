import 'package:chat_gpt_app/data/entities/services.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBar});
  final AppBar appBar;
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/chatgpt-icon.png",
            width: 40,
            height: 40,
          ),
          const Text(
            'ChatGPT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
