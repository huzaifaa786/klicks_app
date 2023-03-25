import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, this.type = 'suv', this.title, this.day,this.ontap});

  final type;
  final title;
  final day;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        shadowColor: grey,
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: White,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    width: MediaQuery.of(context).size.width * 0.51,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // SizedBox(height: 2),
                        // Text(
                        //   day,
                        //   style: TextStyle(
                        //       fontSize: 12, fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                  )
                ],
              ),
              type == 'suv'
                  ? Container(
                      height: 60,
                      width: 60,
                      padding: EdgeInsets.only(left: 4,right: 4),
                      decoration: BoxDecoration(
                        color: White,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image(
                        image: AssetImage('assets/images/car2.png'),
                        height: 12,
                      ),
                    )
                  : Container(
                      height: 60,
                      width: 60,
                      padding: EdgeInsets.only(left: 4,right: 4),
                      decoration: BoxDecoration(
                        color: White,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image(
                        image: AssetImage('assets/images/car1.png'),
                        height: 12,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
