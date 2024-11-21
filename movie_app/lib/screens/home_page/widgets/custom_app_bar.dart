import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/service/api.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Api().getNowPlaying();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: Icon(Icons.menu_rounded,
                  size: 30, color: Colors.grey.shade300),
            ),
          ),
          Text(
            "Movies",
            style: GoogleFonts.dancingScript(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Icon(Icons.more_vert_rounded,
                size: 30, color: Colors.grey.shade300),
          ),
        ],
      ),
    );
  }
}
