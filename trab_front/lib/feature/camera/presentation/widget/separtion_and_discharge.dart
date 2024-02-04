
// import 'package:flutter/material.dart';

// Image classifiedPhotoWidget(
//     {required String item, required String img, required int index}) {
//   if (item == "플라스틱") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "플라스틱",
//         content: "무색페트병은 내용물, 라벨 제거 후 찌그러트려 뚜껑을 닫아 전용함에 배출해야해요!",
//         svg: AppSvgs.plastic,
//         img: img);
//   } else if (item == "vinyl") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "비닐",
//         content:
//             "비닐 속 이물질이 제거되지 않는다면 종량제 봉투에 배출해주세요. 오염된 부분만 가위로 오려내서  배출해도 좋아요. ",
//         svg: AppSvgs.vinyl,
//         img: img);
//   } else if (item == "can") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "캔",
//         content: "캔은 내용물을 비우고 물로 헹구는 등  이물질을 제거하여 전용함에 배출해야해요.",
//         svg: AppSvgs.can,
//         img: img);
//   } else if (item == "waste") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "일반",
//         content:
//             "종량제 봉투안에 생활음식물과 재활용 쓰레기를 혼합해서 버릴경우 과태료 대상이 될 수 있어요. 종량제 봉투를 사용하여 잘 배출하도록 해요!",
//         svg: AppSvgs.waste,
//         img: img);
//   } else if (item == "styrofoam") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "스티로폼",
//         content:
//             "스티로폼을 분리할 때는 비닐테이프나  배송장 종이 등 이물질을 반드시 제거 후 배출해야해요. 무늬, 색상이 있거나 비닐이 코팅된 스티로폼은 재활용이 어려우니 종량제 봉투에 버려주세요",
//         svg: AppSvgs.styrofoam,
//         img: img);
//   } else if (item == "glass") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "유리",
//         content:
//             "유리병은 용기 속 표시를 확인해야해요! 재활용 표시가 있다면 유리 전용 수거함에 배출하고 재사용 표시가 있다면 반환처에 반환해야해요.",
//         svg: AppSvgs.glass,
//         img: img);
//   } else if (item == "food") {
//     return classifiedPhotoContainer(
//         index: index,
//         title: "음식물",
//         content:
//             "채소의 뿌리와 과일의 껍데기는 음식물쓰레기가 아니에요. 음식물과 함께 섞일 수 있는 껌, 비닐,병뚜껑, 나무이쑤시개, 종이 등을 유의해서 배출 하도록 해요!",
//         svg: AppSvgs.food,
//         img: img);
//   }
//   return classifiedPhotoContainer(
//       index: index,
//       title: "종이",
//       content:
//           "골판지류는 테이프와 이물질을 모두 제거해 주세요. 신문,책자류는 스프링 등 종이류와 다른 재질은 제거 후 배출해주세요.",
//       svg: AppSvgs.paper,
//       img: img);
// }