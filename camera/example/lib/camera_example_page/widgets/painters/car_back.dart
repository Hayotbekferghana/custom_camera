// import 'package:flutter/material.dart';
//
// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter1 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Path path_0 = Path();
//     path_0..moveTo(size.width * 0.6232587, size.height * 0.2404724)
//     ..cubicTo(size.width * 0.6232587, size.height * 0.2404724, size.width * 0.8366637, size.height * 0.3834185,
//         size.width * 0.8331933, size.height * 0.5341506)
//     ..cubicTo(size.width * 0.8297232, size.height * 0.6848826, size.width * 0.7713112, size.height * 0.7571897,
//         size.width * 0.7487563, size.height * 0.7705388)
//     ..cubicTo(size.width * 0.7262013, size.height * 0.7838881, size.width * 0.6764661, size.height * 0.9115372,
//         size.width * 0.6753091, size.height * 0.9198807)
//     ..cubicTo(size.width * 0.6741520, size.height * 0.9282240, size.width * 0.6443813, size.height * 0.9305730,
//         size.width * 0.6443813, size.height * 0.9305730)
//     ..lineTo(size.width * 0.5916811, size.height * 0.9345478)
//     ..lineTo(size.width * 0.5445619, size.height * 0.9403119)
//     ..lineTo(size.width * 0.5127355, size.height * 0.9461754);
//     path_0.lineTo(size.width * 0.4924821, size.height * 0.9525356);
//     path_0.lineTo(size.width * 0.4722285, size.height * 0.9594924);
//     path_0.lineTo(size.width * 0.4487584, size.height * 0.9618982);
//     path_0.cubicTo(size.width * 0.4487584, size.height * 0.9618982, size.width * 0.4288333, size.height * 0.9613347,
//         size.width * 0.4282475, size.height * 0.9613347);
//     path_0.cubicTo(size.width * 0.4276613, size.height * 0.9613347, size.width * 0.4125229, size.height * 0.9604421,
//         size.width * 0.4125229, size.height * 0.9604421);
//     path_0.lineTo(size.width * 0.3810731, size.height * 0.9568725);
//     path_0.lineTo(size.width * 0.3539203, size.height * 0.9530216);
//     path_0.lineTo(size.width * 0.3406379, size.height * 0.9496395);
//     path_0.lineTo(size.width * 0.3338989, size.height * 0.9465398);
//     path_0.lineTo(size.width * 0.3257915, size.height * 0.9413738);
//     path_0.lineTo(size.width * 0.3200296, size.height * 0.9358313);
//     path_0.lineTo(size.width * 0.3163173, size.height * 0.9281289);
//     path_0.lineTo(size.width * 0.3143640, size.height * 0.9218821);
//     path_0.lineTo(size.width * 0.2906304, size.height * 0.8376234);
//     path_0.lineTo(size.width * 0.2834773, size.height * 0.8371890);
//     path_0.lineTo(size.width * 0.2637755, size.height * 0.8351047);
//     path_0.lineTo(size.width * 0.2455019, size.height * 0.8315280);
//     path_0.lineTo(size.width * 0.2312176, size.height * 0.8279281);
//     path_0.cubicTo(size.width * 0.2312176, size.height * 0.8279281, size.width * 0.2181661, size.height * 0.8230484,
//         size.width * 0.2178704, size.height * 0.8229775);
//     path_0.cubicTo(size.width * 0.2175744, size.height * 0.8229065, size.width * 0.2054579, size.height * 0.8175537,
//         size.width * 0.2054579, size.height * 0.8175537);
//     path_0.lineTo(size.width * 0.1935872, size.height * 0.8108031);
//     path_0.lineTo(size.width * 0.1832432, size.height * 0.8031054);
//     path_0.lineTo(size.width * 0.1778747, size.height * 0.7974685);
//     path_0.lineTo(size.width * 0.1727528, size.height * 0.7916655);
//     path_0.lineTo(size.width * 0.1698467, size.height * 0.7853176);
//     path_0.lineTo(size.width * 0.1678264, size.height * 0.7790410);
//     path_0.lineTo(size.width * 0.1667923, size.height * 0.7721012);
//     path_0.lineTo(size.width * 0.1666448, size.height * 0.7660143);
//     path_0.lineTo(size.width * 0.1674824, size.height * 0.7607796);
//     path_0.lineTo(size.width * 0.1694032, size.height * 0.7553791);
//     path_0.lineTo(size.width * 0.1736384, size.height * 0.7482501);
//     path_0.lineTo(size.width * 0.1777763, size.height * 0.7432523);
//     path_0.lineTo(size.width * 0.1829483, size.height * 0.7381600);
//     path_0.lineTo(size.width * 0.1889568, size.height * 0.7336122);
//     path_0.lineTo(size.width * 0.1956557, size.height * 0.7295622);
//     path_0.lineTo(size.width * 0.2034877, size.height * 0.7247304);
//     path_0.lineTo(size.width * 0.2099397, size.height * 0.7220537);
//     path_0.lineTo(size.width * 0.2165893, size.height * 0.7186429);
//     path_0.lineTo(size.width * 0.2232389, size.height * 0.7160849);
//     path_0.lineTo(size.width * 0.2318096, size.height * 0.7135033);
//     path_0.lineTo(size.width * 0.2421525, size.height * 0.7105903);
//     path_0.lineTo(size.width * 0.2492947, size.height * 0.7090741);
//     path_0.lineTo(size.width * 0.2582595, size.height * 0.7070607);
//     path_0.lineTo(size.width * 0.2684059, size.height * 0.7055452);
//     path_0.cubicTo(size.width * 0.2684059, size.height * 0.7055452, size.width * 0.2744645, size.height * 0.7049523,
//         size.width * 0.2751536, size.height * 0.7050001);
//     path_0.cubicTo(size.width * 0.2758429, size.height * 0.7050479, size.width * 0.2847093, size.height * 0.7048583,
//         size.width * 0.2847093, size.height * 0.7048583);
//     path_0.lineTo(size.width * 0.2617248, size.height * 0.2577288);
//     path_0.lineTo(size.width * 0.2516392, size.height * 0.2562648);
//     path_0.lineTo(size.width * 0.2439053, size.height * 0.2542041);
//     path_0.lineTo(size.width * 0.2343499, size.height * 0.2520248);
//     path_0.lineTo(size.width * 0.2255816, size.height * 0.2491821);
//     path_0.lineTo(size.width * 0.2184877, size.height * 0.2462214);
//     path_0.lineTo(size.width * 0.2097688, size.height * 0.2426919);
//     path_0.lineTo(size.width * 0.2037101, size.height * 0.2397548);
//     path_0.lineTo(size.width * 0.1967155, size.height * 0.2361067);
//     path_0.lineTo(size.width * 0.1917400, size.height * 0.2329563);
//     path_0.lineTo(size.width * 0.1863221, size.height * 0.2287163);
//     path_0.lineTo(size.width * 0.1819869, size.height * 0.2252814);
//     path_0.lineTo(size.width * 0.1780957, size.height * 0.2213260);
//     path_0.lineTo(size.width * 0.1736128, size.height * 0.2160672);
//     path_0.lineTo(size.width * 0.1701643, size.height * 0.2097660);
//     path_0.lineTo(size.width * 0.1683917, size.height * 0.2049579);
//     path_0.lineTo(size.width * 0.1670125, size.height * 0.1995804);
//     path_0.lineTo(size.width * 0.1666181, size.height * 0.1948667);
//     path_0.lineTo(size.width * 0.1665691, size.height * 0.1905080);
//     path_0.lineTo(size.width * 0.1676525, size.height * 0.1852025);
//     path_0.lineTo(size.width * 0.1689333, size.height * 0.1810097);
//     path_0.lineTo(size.width * 0.1714944, size.height * 0.1760587);
//     path_0.lineTo(size.width * 0.1736128, size.height * 0.1715346);
//     path_0.lineTo(size.width * 0.1765189, size.height * 0.1682656);
//     path_0.lineTo(size.width * 0.1805093, size.height * 0.1643570);
//     path_0.lineTo(size.width * 0.1834152, size.height * 0.1610649);
//     path_0.lineTo(size.width * 0.1873565, size.height * 0.1576772);
//     path_0.lineTo(size.width * 0.1940552, size.height * 0.1536505);
//     path_0.lineTo(size.width * 0.1997699, size.height * 0.1497659);
//     path_0.lineTo(size.width * 0.2035627, size.height * 0.1477526);
//     path_0.lineTo(size.width * 0.2094739, size.height * 0.1455968);
//     path_0.lineTo(size.width * 0.2152859, size.height * 0.1426356);
//     path_0.lineTo(size.width * 0.2224288, size.height * 0.1403617);
//     path_0.lineTo(size.width * 0.2286843, size.height * 0.1378037);
//     path_0.lineTo(size.width * 0.2352365, size.height * 0.1360509);
//     path_0.lineTo(size.width * 0.2415901, size.height * 0.1339424);
//     path_0.cubicTo(size.width * 0.2415901, size.height * 0.1339424, size.width * 0.2485357, size.height * 0.1324977,
//         size.width * 0.2488315, size.height * 0.1324977);
//     path_0.cubicTo(size.width * 0.2491275, size.height * 0.1324977, size.width * 0.2555805, size.height * 0.1318581,
//         size.width * 0.2555805, size.height * 0.1318581);
//     path_0.lineTo(size.width * 0.2556787, size.height * 0.06496453);
//     path_0.lineTo(size.width * 0.2567131, size.height * 0.06077180);
//     path_0.lineTo(size.width * 0.2585848, size.height * 0.05430517);
//     path_0.lineTo(size.width * 0.2631168, size.height * 0.04904643);
//     path_0.lineTo(size.width * 0.2666637, size.height * 0.04532734);
//     path_0.lineTo(size.width * 0.2734125, size.height * 0.04260345);
//     path_0.lineTo(size.width * 0.2809981, size.height * 0.04096921);
//     path_0.cubicTo(size.width * 0.2809981, size.height * 0.04096921, size.width * 0.2885355, size.height * 0.04023498,
//         size.width * 0.2892245, size.height * 0.04028227);
//     path_0.cubicTo(size.width * 0.2899136, size.height * 0.04032956, size.width * 0.3034605, size.height * 0.04035320,
//         size.width * 0.3034605, size.height * 0.04035320);
//     path_0.lineTo(size.width * 0.3415373, size.height * 0.03914483);
//     path_0.lineTo(size.width * 0.3842947, size.height * 0.03825283);
//     path_0.lineTo(size.width * 0.3972664, size.height * 0.03892549);
//     path_0.lineTo(size.width * 0.4126243, size.height * 0.04000948);
//     path_0.lineTo(size.width * 0.4277115, size.height * 0.04190283);
//     path_0.lineTo(size.width * 0.4400944, size.height * 0.04352143);
//     path_0.lineTo(size.width * 0.4510048, size.height * 0.04612291);
//     path_0.lineTo(size.width * 0.4623947, size.height * 0.04885443);
//     path_0.lineTo(size.width * 0.4719229, size.height * 0.05148473);
//     path_0.lineTo(size.width * 0.5036048, size.height * 0.06359544);
//     path_0.lineTo(size.width * 0.5162443, size.height * 0.06984692);
//     path_0.lineTo(size.width * 0.5287627, size.height * 0.07783534);
//     path_0.lineTo(size.width * 0.5362264, size.height * 0.08391330);
//     path_0.lineTo(size.width * 0.5433283, size.height * 0.09126441);
//     path_0.lineTo(size.width * 0.5529573, size.height * 0.09873177);
//     path_0.lineTo(size.width * 0.5589768, size.height * 0.1062564);
//     path_0.lineTo(size.width * 0.5648755, size.height * 0.1148234);
//     path_0.lineTo(size.width * 0.5725789, size.height * 0.1250691);
//     path_0.lineTo(size.width * 0.5789589, size.height * 0.1333468);
//     path_0.lineTo(size.width * 0.5846157, size.height * 0.1425505);
//     path_0.lineTo(size.width * 0.5888293, size.height * 0.1504225);
//     path_0.lineTo(size.width * 0.6019504, size.height * 0.1773970);
//     path_0.lineTo(size.width * 0.6097747, size.height * 0.1966144);
//     path_0.lineTo(size.width * 0.6149507, size.height * 0.2133432);
//     path_0.lineTo(size.width * 0.6194040, size.height * 0.2290879);
//     path_0.lineTo(size.width * 0.6232587, size.height * 0.2404724);
//     path_0.close();
//
//     final Paint paint0Stroke = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = size.width * 0.008762933;
//     paint0Stroke.color = const Color(0xffFEFEFE).withValues(alpha:1);
//     canvas.drawPath(path_0, paint0Stroke);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
