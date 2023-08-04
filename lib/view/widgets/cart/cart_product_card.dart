import 'package:flutter/material.dart';
import 'package:frist_app/routes/route.dart';
import 'package:frist_app/utils/theme.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://www.bing.com/images/search?view=detailV2&ccid=qHtv3QOQ&id=3223BBB6B6B7AF60EA1C130BD97AC751411734AE&thid=OIP.qHtv3QOQpwI8flOSs7QKYQAAAA&mediaurl=https%3A%2F%2Flondonfuse.ca%2Fwp-content%2Fuploads%2F2019%2F07%2FFreeActivities_3-398x500.png&exph=500&expw=398&q=unsplash&simid=608031167664696345&form=IRPRST&ck=0C9216E2BD3952471B15189AFE622355&selectedindex=2&ajaxhist=0&ajaxserp=0&vt=0&sim=11&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.a87b6fdd0390a7023c7e5392b3b40a61%3Frik%3DrjQXQVHHetkLEw%26pid%3DImgRaw%26r%3D0&pivotparams=insightsToken%3Dccid_yIEB%252BZ7K*cp_1DE6615FA226AB324E1AAB1864811935*mid_9A68F2B77A78EA04843EFB575D79528CA974F02F*simid_608019352190977946*thid_OIP.yIEB-Z7KC38rkAwXNZxv5QHaLG&iss=VSI&ajaxhist=0&ajaxserp=0"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Developper of flutter",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$109.99",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const Text(
                    "1",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
