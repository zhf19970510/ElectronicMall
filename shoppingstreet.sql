/*
 Navicat Premium Data Transfer

 Source Server         : localDatabase
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : shoppingstreet

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 27/01/2021 07:19:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `amount` int(11) NULL DEFAULT 0,
  `userId` int(11) NULL DEFAULT NULL,
  `isChecked` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, 740, 1, 26, 0);
INSERT INTO `cart` VALUES (3, 744, 2, 23, 0);
INSERT INTO `cart` VALUES (7, 737, 1, 15, 0);
INSERT INTO `cart` VALUES (28, 740, 3, 23, 0);
INSERT INTO `cart` VALUES (32, 739, 2, 23, 0);
INSERT INTO `cart` VALUES (39, 746, 2, 23, 0);
INSERT INTO `cart` VALUES (40, 756, 3, 23, 0);
INSERT INTO `cart` VALUES (41, 743, 1, 11, 0);
INSERT INTO `cart` VALUES (42, 758, 2, 11, 0);
INSERT INTO `cart` VALUES (43, 751, 2, 11, 0);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `createTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__SS___C63B5EE724927208`(`id`) USING BTREE,
  UNIQUE INDEX `UQ__SS___C12AD09D276EDEB3`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 703 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (531, '会员特惠月开始了', '会员特惠月开始了,亲们赶快下单啊,不到剁手誓不罢休啊,不到离婚誓不清空购物车啊。更多优惠，尽在易买网。', '2010-12-22');
INSERT INTO `news` VALUES (597, '迎双旦促销大酬宾', '迎双旦促销大酬宾', '2010-12-24');
INSERT INTO `news` VALUES (649, '加入会员，赢千万大礼包', '加入会员，赢千万大礼包', '2010-12-22');
INSERT INTO `news` VALUES (650, '新年不夜天，通宵也是开张了', '新年不夜天，通宵也是开张了', '2011-05-22');
INSERT INTO `news` VALUES (651, '积分兑换开始了', '积分兑换开始了', '2010-12-22');
INSERT INTO `news` VALUES (653, '团购阿迪1折起', '团购阿迪1折起', '2010-12-22');
INSERT INTO `news` VALUES (664, '最新酷睿笔记本', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2013-08-05');
INSERT INTO `news` VALUES (675, 'aa', '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '2013-08-14');
INSERT INTO `news` VALUES (676, 'ResultR', 'ResultResultResultResultResu', '2016-03-28');
INSERT INTO `news` VALUES (677, '会员特惠月开始了1', '会员特惠月开始了', '2010-12-22');
INSERT INTO `news` VALUES (678, '迎双旦促销大酬宾2', '迎双旦促销大酬宾', '2010-12-24');
INSERT INTO `news` VALUES (679, '加入会员，赢千万大礼包3', '加入会员，赢千万大礼包', '2010-12-22');
INSERT INTO `news` VALUES (680, '新年不夜天，通宵也是开张了4', '新年不夜天，通宵也是开张了', '2011-05-22');
INSERT INTO `news` VALUES (681, '积分兑换开始了5', '积分兑换开始了', '2010-12-22');
INSERT INTO `news` VALUES (682, '团购阿迪1折起6', '团购阿迪1折起', '2010-12-22');
INSERT INTO `news` VALUES (683, '最新酷睿笔记本7', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2013-08-05');
INSERT INTO `news` VALUES (684, 'aa8', '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '2013-08-14');
INSERT INTO `news` VALUES (685, 'ResultR9', 'ResultResultResultResultResu', '2016-03-28');
INSERT INTO `news` VALUES (686, '会员特惠月开始了11', '会员特惠月开始了', '2010-12-22');
INSERT INTO `news` VALUES (687, '迎双旦促销大酬宾21', '迎双旦促销大酬宾', '2010-12-24');
INSERT INTO `news` VALUES (688, '加入会员，赢千万大礼包31', '加入会员，赢千万大礼包', '2010-12-22');
INSERT INTO `news` VALUES (689, '新年不夜天，通宵也是开张了41', '新年不夜天，通宵也是开张了', '2011-05-22');
INSERT INTO `news` VALUES (690, '积分兑换开始了51', '积分兑换开始了', '2010-12-22');
INSERT INTO `news` VALUES (691, '团购阿迪1折起61', '团购阿迪1折起', '2010-12-22');
INSERT INTO `news` VALUES (692, '最新酷睿笔记本71', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2013-08-05');
INSERT INTO `news` VALUES (693, 'aa81', '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '2013-08-14');
INSERT INTO `news` VALUES (694, 'ResultR91', 'ResultResultResultResultResu', '2016-03-28');
INSERT INTO `news` VALUES (695, '会员特惠月开始了111', '会员特惠月开始了', '2010-12-22');
INSERT INTO `news` VALUES (696, '迎双旦促销大酬宾211', '迎双旦促销大酬宾', '2010-12-24');
INSERT INTO `news` VALUES (697, '加入会员，赢千万大礼包311', '加入会员，赢千万大礼包', '2010-12-22');
INSERT INTO `news` VALUES (698, '新年不夜天，通宵也是开张了411', '新年不夜天，通宵也是开张了', '2011-05-22');
INSERT INTO `news` VALUES (699, '积分兑换开始了511', '积分兑换开始了', '2010-12-22');
INSERT INTO `news` VALUES (700, '团购阿迪1折起611', '团购阿迪1折起', '2010-12-22');
INSERT INTO `news` VALUES (701, '最新酷睿笔记本711', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2013-08-05');
INSERT INTO `news` VALUES (702, 'aa811', '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', '2013-08-14');
INSERT INTO `news` VALUES (703, 'ResultR911', 'ResultResultResultResultResu', '2016-03-28');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(255) NULL DEFAULT NULL COMMENT '用户主键',
  `loginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `createTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `cost` float NULL DEFAULT NULL COMMENT '总消费',
  `serialNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 18, 'shangzezhong', '北京市花园路小区', '2016-06-02 14:51:46', 1721, '60B7487F47F9434EAA5FD1D9E22CB06C');
INSERT INTO `order` VALUES (2, 18, 'shangzezhong', '北京市海淀区成府路', '2016-06-02 14:52:49', 8596, '8EF5E1557D55413781658A65FC301B8A');
INSERT INTO `order` VALUES (3, 2, 'admin', '北京市海淀区大有庄', '2016-06-03 11:41:09', 456, '51718726C1274CC59504AB4E6FD64BA0');
INSERT INTO `order` VALUES (6, 21, 'fsfsfsf', '用户地址', '2018-02-16 17:23:55', 2074, '1354C1BDC92F4F7B95FDD0F582ECED04');
INSERT INTO `order` VALUES (7, 21, 'fsfsfsf', '用户地址', '2018-02-16 17:29:46', 2381, '347340782FF844F8BDDB03B3E4FCB770');
INSERT INTO `order` VALUES (8, 21, 'fsfsfsf', '用户地址', '2018-02-16 17:31:59', 2074, '08BEA7CA9C5041C899A5CC73721A8048');
INSERT INTO `order` VALUES (14, 23, 'zhf', '北京市海淀区成府路', '2019-12-28 17:57:52', 786, '4DE46B88A3F34137BAA4D2BF8E829913');
INSERT INTO `order` VALUES (15, 23, 'zhf', '北京市海淀区成府路', '2019-12-28 22:15:36', 1437, '999039A6BF0549C39ABE71502BE29BCB');
INSERT INTO `order` VALUES (16, 23, 'zhf', '北京市海淀区成府路', '2019-12-29 00:32:52', 786, 'E3134E7A80B74702B30F78B74CF4C0BC');
INSERT INTO `order` VALUES (17, 23, 'zhf', '北京市海淀区成府路', '2019-12-29 08:29:51', 1652, '43024DAFE1144153B6111E98780B169B');
INSERT INTO `order` VALUES (18, 11, 'hyl', '北京市海淀区成府路', '2019-12-29 08:34:57', 1178, '9758EDA420A04259B190E02511D5AC40');
INSERT INTO `order` VALUES (19, 11, 'hyl', '北京市海淀区成府路', '2019-12-29 08:39:38', 1185, '1892AF911C074C1A923375D4CC0D7698');
INSERT INTO `order` VALUES (20, 11, 'hyl', '北京市海淀区成府路', '2019-12-29 08:40:43', 1178, 'A82654F3A085487A992D3C68466C2AF1');
INSERT INTO `order` VALUES (21, 11, 'hyl', '北京市海淀区成府路', '2019-12-29 21:36:02', 2370, 'F245395BC8574D7788887271895DEEF5');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` int(10) NOT NULL COMMENT '订单主键',
  `productId` int(10) NOT NULL COMMENT '商品主键',
  `quantity` int(10) NOT NULL COMMENT '数量',
  `cost` float NOT NULL COMMENT '消费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__SS___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 733, 5, 760);
INSERT INTO `order_detail` VALUES (2, 1, 734, 4, 608);
INSERT INTO `order_detail` VALUES (3, 1, 735, 1, 152);
INSERT INTO `order_detail` VALUES (4, 1, 738, 1, 45);
INSERT INTO `order_detail` VALUES (5, 1, 739, 1, 156);
INSERT INTO `order_detail` VALUES (6, 2, 755, 1, 8596);
INSERT INTO `order_detail` VALUES (7, 3, 733, 1, 152);
INSERT INTO `order_detail` VALUES (8, 3, 734, 1, 152);
INSERT INTO `order_detail` VALUES (9, 3, 735, 1, 152);
INSERT INTO `order_detail` VALUES (12, 6, 744, 2, 589);
INSERT INTO `order_detail` VALUES (13, 6, 747, 1, 896);
INSERT INTO `order_detail` VALUES (14, 7, 744, 1, 589);
INSERT INTO `order_detail` VALUES (15, 7, 747, 2, 896);
INSERT INTO `order_detail` VALUES (16, 8, 744, 2, 589);
INSERT INTO `order_detail` VALUES (17, 8, 747, 1, 896);
INSERT INTO `order_detail` VALUES (24, 14, 739, 2, 312);
INSERT INTO `order_detail` VALUES (25, 14, 740, 3, 474);
INSERT INTO `order_detail` VALUES (26, 15, 746, 1, 963);
INSERT INTO `order_detail` VALUES (27, 15, 740, 3, 474);
INSERT INTO `order_detail` VALUES (28, 16, 739, 2, 312);
INSERT INTO `order_detail` VALUES (29, 16, 740, 3, 474);
INSERT INTO `order_detail` VALUES (30, 17, 740, 3, 474);
INSERT INTO `order_detail` VALUES (31, 17, 744, 2, 1178);
INSERT INTO `order_detail` VALUES (32, 18, 743, 2, 1178);
INSERT INTO `order_detail` VALUES (33, 19, 758, 1, 596);
INSERT INTO `order_detail` VALUES (34, 19, 743, 1, 589);
INSERT INTO `order_detail` VALUES (35, 20, 751, 2, 1178);
INSERT INTO `order_detail` VALUES (36, 21, 751, 2, 1178);
INSERT INTO `order_detail` VALUES (37, 21, 758, 2, 1192);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `price` float NOT NULL COMMENT '价格',
  `stock` int(10) NOT NULL COMMENT '库存',
  `categoryLevel1Id` int(10) NULL DEFAULT NULL COMMENT '分类1',
  `categoryLevel2Id` int(10) NULL DEFAULT NULL COMMENT '分类2',
  `categoryLevel3Id` int(10) NULL DEFAULT NULL COMMENT '分类3',
  `fileName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `isDelete` int(1) NULL DEFAULT 0 COMMENT '是否删除(1：删除 0：未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__SS___94F6E55132E0915F`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 771 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (733, '香奈儿', '香奈儿（Chanel）是一个法国奢侈品品牌，创始人是Coco Chanel', 152, 94, 548, 654, 655, 'img/per_4.jpg', 0);
INSERT INTO `product` VALUES (734, '洗面奶', '洗面奶属于洁肤化妆品，其目的是清除皮肤上的污垢，使皮肤清爽，有助于保持皮肤正常生理状态', 152, 995, 548, 654, 655, 'img/per_9.jpg', 0);
INSERT INTO `product` VALUES (735, '啫喱水', '啫喱水也称发用定型凝胶水或发用啫喱水定型液。它其实就是发用凝胶的一种，按其谐音译成啫喱。', 152, 998, 548, 654, 655, 'img/per_1.jpg', 0);
INSERT INTO `product` VALUES (736, '香水5852', '闪电客杯形汽车香膏车载香水车内车用品固体淡香创意香薰座式摆件除异味', 152, 1000, 548, 654, 655, 'img/per_1.jpg', 0);
INSERT INTO `product` VALUES (737, '香水', '香水是香精的酒精溶液，再加适量定香料等形成的混合物。具有芬芳浓郁的香气，主要作用是喷洒于衣襟、手帕及发际等部位', 152, 111, 548, 654, 655, 'img/per_3.jpg', 0);
INSERT INTO `product` VALUES (738, '润肤露', '润肤露，是乳液的一种，能深入滋润干燥肌肤，补充肌肤每天流失的水份。天然保湿因子，由内部强化其天然保湿层，特效的含油配方，给您多一点的滋润。', 45, 109, 548, 654, 655, 'img/ph_5.jpg', 0);
INSERT INTO `product` VALUES (739, '洁面装', '欧莱雅火山岩控油清痘洁面膏,清洁毛孔,全面抗痘抑制再生,抛弃油光,肌肤重现活力!', 156, 99, 548, 654, 655, 'img/per_2.jpg', 0);
INSERT INTO `product` VALUES (740, '电饭锅', '电饭煲又称作电锅、电饭锅。是利用电能转变为热能的炊具，具有对食品进行蒸、煮、炖、煲、煨等多种加热操作功能，使用方便、安全可靠。它不但能够把食物做熟，而且能够保温，使用起来清洁卫生', 158, 100, 628, 656, 659, 'img/n_img1.jpg', 0);
INSERT INTO `product` VALUES (742, '坚果套餐', '三只松鼠坚果大礼包巨型袋零食组合一箱套餐坚果减压网红零食抖音', 158, 1000, 660, 661, 662, 'img/home_5.jpg', 0);
INSERT INTO `product` VALUES (743, '超甜蜜崭', '蜜饯也称果脯，古称蜜煎。中国民间糖蜜制水果食品。流传于各地，历史悠久。', 589, 1000, 660, 661, 663, 'img/fre_b2.jpg', 0);
INSERT INTO `product` VALUES (744, '华为2566', '华为-「京东」手机，旗舰品质，运行流畅，一触即发，续航无忧，一手掌握大\"视\"界!', 589, 1000, 670, 671, 672, 'img/hw1.jpg', 0);
INSERT INTO `product` VALUES (745, '荣耀3C', '\r\n华为荣耀3C作为华为品牌独立运作推出多款终端之一的一款千元机型，备受关注，据悉，该机型已于2013年12月16日正式发布。', 589, 100, 670, 671, 672, 'img/hw1.jpg', 0);
INSERT INTO `product` VALUES (746, '小米手环', '小米手环4是小米公司2019年6月11日发布的智能新品,与小米手环3相比,表盘不仅从黑白升级为AMOLED彩屏,显示面积也增加了39.9%;表面覆盖2.5D弧面耐刮强化玻璃', 963, 100, 670, 674, 675, 'img/hw1.jpg', 0);
INSERT INTO `product` VALUES (747, '华为2265', '中关村在线(ZOL.COM.CN)提供华为FusionServer RH2265 V2服务器最新报价,同时包括华为FusionServer RH2265 V2图片、华为……', 896, 1000, 670, 671, 673, 'img/hw1.jpg', 0);
INSERT INTO `product` VALUES (748, '越南坚果', '越南干果批发市场页为您提供越南干果各种产品类别、有无中文标签、售卖方式、是否带壳的产品信息,包括越南干果价格、图片等信息', 520, 1000, 660, 661, 662, 'img/n_img2.jpg', 0);
INSERT INTO `product` VALUES (749, '日本进口马桶', '品质优选 马桶一体式全自动翻盖电动冲水日本原装进口家用厕所坐便器 入户安装+质保十年 305mm 0+条评论', 5866, 100, 628, 657, 0, 'img/timg.jpg', 0);
INSERT INTO `product` VALUES (750, '联想Y系列', '联想笔记本拯救者系列,联想笔记本电脑官方,爆款直降千元,快来参与抽奖吧,好礼享不停,领券更优惠,以旧换新,更多活动优惠购不停,还有更多礼品,企业积分换购,还可免费换购礼..', 569, 1000, 670, 690, 691, 'img/t3.jpg', 0);
INSERT INTO `product` VALUES (751, '脑白金1号', '脑白金是无锡健特药业有限公司生产的保健品，自1997年上市以来，已畅销中国二十多年；其脍炙人口的广告语“今年过节不收礼，收礼只收脑白金”家喻户晓', 589, 1000, 676, 677, 680, 'img/fre_b1.jpg', 0);
INSERT INTO `product` VALUES (752, '莫里斯按', '莫里斯的“美术家与工匠结合才能设计制造出有美学质量的为群众享用的工艺品”的主张影响下，英国出现了许多类似的工艺品生产机构。', 589, 1000, 676, 678, 0, 'img/fre_5.jpg', 0);
INSERT INTO `product` VALUES (753, '三鹿好奶粉', '三鹿奶粉是三鹿乳业集团主要开发产品。三鹿奶粉以鲜牛奶为原料，添加钙、铁Va、Vd等多种营养成分，采用先进工艺和设备精制而成，具有含钙量高、钙磷比例合理的特点', 859, 100, 676, 679, 0, 'img/milk_2.jpg', 0);
INSERT INTO `product` VALUES (754, '儿童牛奶', '纯牛奶和鲜牛奶都是适合孩子喝的,但是在一岁以下的孩子,不建议喝纯牛奶,会加重孩子的肾脏负担,也很容易出现过敏的情况', 5896, 100, 676, 679, 0, 'img/milk_1.jpg', 0);
INSERT INTO `product` VALUES (755, '软沙发', '软体沙发指的是以海绵、织物、弹簧等软性物料来填充的带靠背坐具，内部构架是用木材或钢材等材料做成的椅子', 8596, 99, 628, 696, 0, 'img/home_1.jpg', 0);
INSERT INTO `product` VALUES (756, '收纳盒', '装东西的盒子，也就是将东西（多指小件物品，如：办公文具、化妆品、文件资料、小工具、袜子、裤衩等）收集集中起来，顾名思义就叫收纳盒。', 5966, 100, 628, 696, 0, 'img/home_2.jpg', 0);
INSERT INTO `product` VALUES (757, '洗衣液', '进口洗衣液哪个牌子好,立白洗衣精华液,含7种精华,一盖可洗16件,大人小孩都能用!立白,获70%中国城市家庭选择,升级洗衣液到洗衣精华液.', 58, 1000, 628, 696, 0, 'img/make_2.jpg', 0);
INSERT INTO `product` VALUES (758, '红短沙发', '淘宝沙发有哪些-牢固耐用,环保健康,舒适时尚体验,立即选购!上淘宝网,住宅家具随您挑,淘,您喜欢!', 596, 123, 628, 696, 0, 'img/home_r.jpg', 0);
INSERT INTO `product` VALUES (759, '新西兰奶粉', '新西兰奶粉 新西兰专属牧场,含A2型蛋白质的配方奶粉,有助于宝宝健康成长.您选择a2的三大理由:1.优化的DHA和ARA比例;2.含有益生元;3.特别添加乳铁蛋白.', 5896, 100, 676, 679, 0, 'img/milk_8.jpg', 0);
INSERT INTO `product` VALUES (760, '婴儿车', '婴儿车哪个牌子好?婴儿车品牌排行榜提供2019年最新婴儿车品牌排行,为您推荐最安全最受欢迎的婴儿车.婴儿车品牌排行榜,让您不再为选择婴儿车哪个牌子好而烦恼.', 11000, 100, 681, 682, 687, 'img/baby_1.jpg', 0);
INSERT INTO `product` VALUES (761, '夏款婴儿车', '跟普通的婴儿推车比起来,档次高好多。这款婴儿推车设计的也非常合理,细节处理的...', 963, 100, 681, 682, 688, 'img/baby_1.jpg', 0);
INSERT INTO `product` VALUES (762, '抗压旅行箱', '淘宝超值品牌拉杆箱,优享品质,惊喜价格,商品齐全,淘你满意!上淘宝,惊喜随处可淘!来淘宝,一站式购物网站新体验,一网打尽,淘,你喜欢!\r\n商品名称:  台湾皇冠crown专柜正', 569, 1000, 681, 683, 685, 'img/t2.jpg', 0);
INSERT INTO `product` VALUES (763, '透明手提箱', '透明塑料收纳箱透明食物衣物被子手提储物箱整理箱收纳盒 高透明 图片色 手提箱小号28.5*19.5*17cm 0+条评论 广木家居专营店 暂无报价 白领公社周转箱 ...', 8596, 1000, 681, 683, 684, 'img/t2.jpg', 0);
INSERT INTO `product` VALUES (764, '婴儿果粉', '爱乐维婴儿果粉特别添加低聚半乳糖,采用真空包装、冷冻干燥技术,特别制成的一种婴儿果粉固体饮料,四种水果口味,满足宝宝对于口味的要求。', 5896, 1000, 660, 661, 662, 'img/milk_8.jpg', 0);
INSERT INTO `product` VALUES (765, '椰子粉', '椰子粉，是由新鲜椰肉榨取的新鲜椰浆， 再以喷干法而制成的粉末。椰子粉富含人体所需的多种脂肪酸、十八种氨基酸、钙、锌、锰、铁、维生素C等营养元素。椰子的营养价值很高。', 5963, 1000, 660, 661, 662, 'img/milk_8.jpg', 0);
INSERT INTO `product` VALUES (766, '坚果蛋糕', '好吃又营养的坚果蛋糕就做好了。 有话说: 坚果是从COSTCO买的现成的,本身就已经有甜味了。', 200, 100, 660, 661, 663, 'img/fre_r.jpg', 0);
INSERT INTO `product` VALUES (767, '编制手提箱', '现货定制手工野餐篮 户外手提编制保温篮子 带盖牛津里布收纳箱 定制柳编水果篮子堆头筐 创意藤编果篮套装 超市水果展示筐收纳篮 定做柳条编织收纳篮家居用品蔬菜水果...', 5896, 1000, 681, 682, 688, 'img/t2.jpg', 0);
INSERT INTO `product` VALUES (768, '纸箱', '纸箱（英文 carton或hard paper case）：是应用最广泛的包装制品，按用料不同，有瓦楞纸箱、单层纸板箱等，有各种规格和型号。纸箱常用的有三层、五层，七层使用较少，各层分为...', 5896, 100, 681, 682, 687, 'img/home_2.jpg', 0);
INSERT INTO `product` VALUES (769, '健胃液', '清热保肝健胃液价格,清热解毒、排毒利尿、消肿解淤、利尿、排毒、补充体液、增强体质、修复肾功能;', 152, 1000, 676, 679, 0, 'img/fre_6.jpg', 0);
INSERT INTO `product` VALUES (770, '联想NTC', '苹果、小米、华为、联想等厂商已经推出了多款支持USB PD充电的笔记本电脑...从此角度看,属于保护电路的NTC空缺未安装。保险旁是蓝色的Y电容,脚上套...', 8596, 100, 670, 671, 673, 'img/tel_b2.jpg', 0);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parentId` int(10) NOT NULL COMMENT '父级目录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '级别(1:一级 2：二级 3：三级)',
  `iconClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__SS___9EC2A4E236B12243`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 697 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (548, '化妆品', 0, 1, '');
INSERT INTO `product_category` VALUES (628, '家用商品', 0, 1, '');
INSERT INTO `product_category` VALUES (654, '面部护理', 548, 2, '');
INSERT INTO `product_category` VALUES (655, '少女派', 654, 3, '');
INSERT INTO `product_category` VALUES (656, '餐具', 628, 2, '');
INSERT INTO `product_category` VALUES (657, '卫具', 628, 2, '');
INSERT INTO `product_category` VALUES (658, '叉子', 656, 3, '');
INSERT INTO `product_category` VALUES (659, '锅', 656, 3, '');
INSERT INTO `product_category` VALUES (660, '进口食品,生鲜', 0, 1, '');
INSERT INTO `product_category` VALUES (661, '零食/糖果/巧克力', 660, 2, '');
INSERT INTO `product_category` VALUES (662, '坚果', 661, 3, '');
INSERT INTO `product_category` VALUES (663, '蜜饯', 661, 3, '');
INSERT INTO `product_category` VALUES (669, '孕期教育', 546, 3, '');
INSERT INTO `product_category` VALUES (670, '电子商品', 0, 1, '');
INSERT INTO `product_category` VALUES (671, '手机', 670, 2, '');
INSERT INTO `product_category` VALUES (672, '华为手机', 671, 3, '');
INSERT INTO `product_category` VALUES (673, '联想手机', 671, 3, '');
INSERT INTO `product_category` VALUES (674, '手环', 670, 2, '');
INSERT INTO `product_category` VALUES (675, '小米手环', 674, 3, '');
INSERT INTO `product_category` VALUES (676, '保健食品', 0, 1, '');
INSERT INTO `product_category` VALUES (677, '老年保健品', 676, 2, '');
INSERT INTO `product_category` VALUES (678, '中年营养品', 676, 2, '');
INSERT INTO `product_category` VALUES (679, '儿童保健品', 676, 2, '');
INSERT INTO `product_category` VALUES (680, '脑白金', 677, 3, '');
INSERT INTO `product_category` VALUES (681, '箱包', 0, 1, '');
INSERT INTO `product_category` VALUES (682, '旅行箱', 681, 2, '');
INSERT INTO `product_category` VALUES (683, '手提箱', 681, 2, '');
INSERT INTO `product_category` VALUES (684, '大型', 683, 3, '');
INSERT INTO `product_category` VALUES (685, '小型', 683, 3, '');
INSERT INTO `product_category` VALUES (686, '中型', 683, 3, '');
INSERT INTO `product_category` VALUES (687, '大型', 682, 3, '');
INSERT INTO `product_category` VALUES (688, '中型', 682, 3, '');
INSERT INTO `product_category` VALUES (689, '小型', 682, 3, '');
INSERT INTO `product_category` VALUES (690, '电脑', 670, 2, '');
INSERT INTO `product_category` VALUES (691, '联想电脑', 690, 3, '');
INSERT INTO `product_category` VALUES (692, '刀叉', 656, 3, NULL);
INSERT INTO `product_category` VALUES (693, '碗筷', 656, 3, NULL);
INSERT INTO `product_category` VALUES (696, '客厅专用', 628, 2, '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` int(2) NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `identityCode` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `type` int(2) NULL DEFAULT 0 COMMENT '类型（1：后台 0:前台）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__SS___C96109CC3A81B327`(`loginName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'admin', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', 1, '130406198302141869', 'hello11@bdqn.com', '1583233515', 1);
INSERT INTO `user` VALUES (10, 'cgn', '程广宁', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225189987854589', '1044732267@qq.com', '13366055011', 0);
INSERT INTO `user` VALUES (11, 'hyl', '韩语良', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225198874584539', '1044732267@qq.com', '13366055010', 0);
INSERT INTO `user` VALUES (12, 'ck', '陈康', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225189987854589', '1044732267@qq.com', '13366055010', 0);
INSERT INTO `user` VALUES (13, 'kys', '康有沈', 'e10adc3949ba59abbe56e057f20f883e', 1, '1402251985512541525', '1044732267@qq.com', '13366055010', 0);
INSERT INTO `user` VALUES (14, 'sb', '沈白', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225158987854589', '1044732267@qq.com', '13366055010', 0);
INSERT INTO `user` VALUES (15, 'lb', '李白', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225189987854589', '10447322658@qq.com', '1336998554', 0);
INSERT INTO `user` VALUES (16, 'lgw', '李高伟', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225189987854589', '1011322658@qq.com', '1336998554', 0);
INSERT INTO `user` VALUES (18, 'shangzezhong', '尚泽忠', '4297f44b13955235245b2497399d7a93', 1, '140225198810013745', '1044888844@qq.com', '13366528458', 0);
INSERT INTO `user` VALUES (19, 'liguangliang', '李光亮', '25f9e794323b453885f5181f1b624d0b', 1, '140225198841547785', '1047777@qq.com', '13366055048', 0);
INSERT INTO `user` VALUES (20, 'szz', '李光亮', 'e10adc3949ba59abbe56e057f20f883e', 1, '140225198810013748', '1044732267@qq.com', '13366555010', 1);
INSERT INTO `user` VALUES (21, 'fsfsfsf', NULL, '123', 1, NULL, 'a1a1@163.com', '2242424', 0);
INSERT INTO `user` VALUES (22, 'aaa', NULL, '123', 1, NULL, 'zhf19970510@163.com', '13507094150', 0);
INSERT INTO `user` VALUES (23, 'zhf', NULL, 'zhf19970510', 1, NULL, 'zhf19970510@163.com', '13507094150', 0);
INSERT INTO `user` VALUES (24, 'zenghongfa', NULL, 'zhf19970510', 1, NULL, 'zhf19970510@163.com', '13507094150', 0);
INSERT INTO `user` VALUES (26, 'zhf123', NULL, 'zhf19970510', 1, NULL, 'zhf19970510@163.com', '13507094150', 0);
INSERT INTO `user` VALUES (27, 'zhangsan', NULL, '123456', 1, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(255) NULL DEFAULT NULL COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `isDefault` int(2) NULL DEFAULT 0 COMMENT '是否是默认地址（1:是 0否）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (11, 2, '北京市海淀区大有庄', NULL, 0, '朋友家');
INSERT INTO `user_address` VALUES (12, 2, '北京市海淀区大有庄', NULL, 0, '女朋友公司');
INSERT INTO `user_address` VALUES (13, 9, '北京市西直门大桥芬兰国际大厦', NULL, 0, '女朋友地址');
INSERT INTO `user_address` VALUES (14, 18, '北京市花园路小区', NULL, 0, '家里');
INSERT INTO `user_address` VALUES (15, 18, '北京市海淀区成府路', NULL, 0, '公司');
INSERT INTO `user_address` VALUES (16, 11, '北京市海淀区成府路', NULL, 0, '公司');
INSERT INTO `user_address` VALUES (17, 23, '北京市海淀区成府路', NULL, 0, '公司');

-- ----------------------------
-- View structure for allcartinfo
-- ----------------------------
DROP VIEW IF EXISTS `allcartinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `allcartinfo` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`a`.`productId` AS `productId`,`a`.`amount` AS `amount`,`b`.`name` AS `name`,`b`.`description` AS `description`,`b`.`price` AS `price`,`b`.`stock` AS `stock`,`b`.`categoryLevel1Id` AS `categoryLevel1Id`,`b`.`categoryLevel2Id` AS `categoryLevel2Id`,`b`.`categoryLevel3Id` AS `categoryLevel3Id`,`b`.`fileName` AS `fileName`,`b`.`isDelete` AS `isDelete`,`b`.`category1` AS `category1`,`b`.`category2` AS `category2`,`b`.`category3` AS `category3` from (`cart` `a` join `allproductinfo` `b`) where (`a`.`productId` = `b`.`id`) order by `a`.`id` desc;

-- ----------------------------
-- View structure for allproductinfo
-- ----------------------------
DROP VIEW IF EXISTS `allproductinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `allproductinfo` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`description` AS `description`,`b`.`price` AS `price`,`b`.`stock` AS `stock`,`b`.`categoryLevel1Id` AS `categoryLevel1Id`,`b`.`categoryLevel2Id` AS `categoryLevel2Id`,`b`.`categoryLevel3Id` AS `categoryLevel3Id`,`b`.`fileName` AS `fileName`,`b`.`isDelete` AS `isDelete`,(select `a`.`name` from `product_category` `a` where (`a`.`id` = `b`.`categoryLevel1Id`)) AS `category1`,(select `a`.`name` from `product_category` `a` where (`a`.`id` = `b`.`categoryLevel2Id`)) AS `category2`,(select `a`.`name` from `product_category` `a` where (`a`.`id` = `b`.`categoryLevel3Id`)) AS `category3` from `product` `b` where (`b`.`isDelete` = 0);

SET FOREIGN_KEY_CHECKS = 1;
