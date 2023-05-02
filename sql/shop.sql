/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 23/04/2023 17:02:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES (1, '关于世界上第一家超市的诞生，有两种说法。\r\n1、1916年9月9日，第一家自助服务商店Piggly Wiggly [1]  在田纳西州孟菲斯市开业。它的经营者克拉伦斯.桑德斯（Clarence Saunders）在1917年将这种由消费者自行在货架上挑选商品最后结账的零售店经营模式申请了专利，这就是超级市场的雏形。超级市场很快风靡全球，为了使自己的商品在超级市场中更具有吸引力，广告和商品包装业也因此发展起来。\r\n2、最早产生于1930年的美国纽约。1930年8月，美国人迈克尔·库仑（MichaelCullen）在美国纽约州开设了第一家——金库仑联合商店。当时，美国正处在经济大危机时期，迈克尔·库仑根据他几十年食品经营经验精确设计了低价策略，并首创商品品种别定价方法。他的平均毛利率只有9%，这和当时美国一般商店25-40%的毛利率相比是令人吃惊的。为了保证售价的低廉，必须做到进货价格的低廉，只有大量进货才能压低进价，迈克尔·库仑就以连锁的方式开设分号，建立起保证大量进货的销售系统，他首创了自助式销售方式，采取一次性集中结算。\r\n据说世界第一家超市开张那天，人们尚不知超市为何物，纷纷抱着好奇的心态前往光顾，并把逛超市作为一种时尚。但过不多久，人们逐渐尝到了超市便利的甜头，上超市购物又成为人们日常的一种需要。于是乎，超市像雨后春笋似地布遍世界各地。\r\n智利是较早出现超市的拉美国家之一。1957年, 在圣地亚哥的老富人区PROVIDENCIA 和RICARDO LEON两条大街的交汇处出现了智利首家超市\"ALMAC\", 这家所谓的超市,以现代人的目光看来, 只不过是一家店面既小商品也不丰富的原始超市而已。 [3]  现而今，智利已有大小超市668家。其中占地10000平方米左右的大超市有36家，建筑总面积32.4万平方米。首都大区占了21家（LIDER 11家，JUMBO 5家，CARREFOUR 5家）, 其他大区15家; 小于10000平方米的有632家，建筑总面积80.88万平方米。 首都大区占有178家, 其他大区454家。 2002年超市销售总额为43.44亿美元, 为当年全国GDP的7%, 占了全国零售额的60%。\r\n像其他国家一样，智利的超市业也经历了从无到有. 从小到大的演变、发展过程。具体说来，1960年至1970年间为演变期。在这时期，零星、单个的超市逐渐向合作、连锁的方向发展，在首都圣地亚哥的一些超市还开始进行初步的改造。与此同时，在圣市出现了第一家大型超市－JUMB; 1980年－1990年为发展期，超市开始向各大区发展; 90年代为巩固期。在这时期，智利超市业趁国家经济发展之际，获到巨大发展，超市年均增长 20.42%，实际增长10.86%（减去倒闭超市后的净增长）。大型超市也随之迅速增加，并且向阿根廷、秘鲁、乌拉圭等周边国家进军。与此同时，各大区超市业的发展态势也十分强劲; 进入21世纪后，智利的超市业方兴未艾，一是每年都在增加投资建新店，2001年新增投资3亿美元，2002年4.2亿美元, 今年估计为2.5亿美元。二是超市越建越大，为数不少的超市\"巨无霸\"正在圣地亚哥周围拔起。现有超市的兼并风也在暗地里进行着。因此，大超市在全国零售业中的占有率正在逐年扩大：2002年为 72.11%, 今年首季增加到了74.78%，预计2003年超市实际增长率将为6%－7%。\r\n像其他西方国家一样，在拉美国家中超市正在占据越来越多的零售业市场。2002年，智利超市销售占全国零售额的比例高达59%（预计2003年将超过60%），与阿根廷并驾齐驱，居拉美各国之首，墨西哥次之，为49%，巴西和哥伦比亚位居第三，为46%。在激烈的竞争中，传统的百货商店正在逐年丢失市场份额：1994年，百货商店和售货亭占全国零售业销售总额的百分比还高达33%，到2002年已猛跌至22%。饭店、酒吧、冷饮店和食品店的销售比例从1997年的14%降到了2002年的9%。只有药店的销售比例有所增长，从1997年占6%提高到了2002年的10%。\r\n智利很大一部分的超市、特别是大型超市的业主为外国跨国公司，D&S、LIDER、JUMBO、CARREFOUR等世界大型超市连锁店集团在智各地均有分连锁店，并且在智超市中占据了最大的市场份额。业内人士分析认为，随着智利对外洽签越来越多的自由贸易协定，将为这类超市集团在智业务创造更多的发展机会。\r\n在消费习惯方面，79%的智利居民日常主要到超市进行采购。逛超市的主要是妇女，占了60%，与其他地方一样，往往问得多，实际购买的少。超市促销产品特别受消费者光顾。越来越多的顾客喜欢用现金购买，用信用卡的正在减少，近年来用信用卡到超市购物的顾客人数减少了30%。智利人购物虽然也看重品牌，但更看重价格。在购买品牌商品时，大多专注一种自己喜欢和用惯了的品牌，很少有变动。\r\n随着对外交流的扩大，智利超市中进口货也在逐年增多，15年前进口货所占比例仅为0.75%, 已增加到10%。\r\n在智利超市的货架上不乏中国商品，其中纺纺织品、服装、五金、厨房用具、鞋类、箱包占了很大份额。虽然大多商品为外国品牌的定牌货，但令人高兴的是，像\"海尔\"这样的家电名牌产品已在近年进入智利超市和大百货店。相信随着我价廉质优的品牌商品越来越多地被智利人民所了解，将有更多的中国名牌商品出现在智利超市的货架上。\r\n补充：\r\n超级市场产生于1930年的美国纽约，被称为零售业的第三次革命。\r\n1930年8月美国人迈克尔·库仑（Michael Cullen）在美国纽约州开设了第一家超级市场--金库仑联合商店。当时，美国正处在经济大危机时期，迈克尔·库仑根据他几十年食品经营经验精确设计了低价策略，并首创商品品种别定价方法。它的超级市场平均毛利率只有9%，这和当时美国一般商店25-40%的毛利率相比是令人吃惊的。为了保证售价的低廉，必须做到进货价格的低廉，只有大量进货才能压低进价，迈克尔·库仑就以连锁的方式开设分号，建立起保证大量进货的销售系统。它首创了自助式销售方式，采取一次性集中结算。\r\n20世纪30年代中期以后，超级市场这种零售组织形式由美国逐渐传到了日本和欧洲。在我国，超级市场被引入于1978年，当时称作自选商场。');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (13, 15, '小S', '13812344444', '辽宁省沈阳市东陵区白塔街380号', '1');
INSERT INTO `address` VALUES (14, 12, '小薇', '13845454545', '辽宁省沈阳市东陵区白塔街380号', '0');
INSERT INTO `address` VALUES (15, 15, '张三', '15612341234', '辽宁省沈阳市东陵区白塔街380号', '0');
INSERT INTO `address` VALUES (16, 16, '李天泽', '18062677102', '白云山市饭都花园221', '0');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NULL DEFAULT NULL,
  `memberid` int(11) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (28, 36, 14, 1);
INSERT INTO `cart` VALUES (29, 38, 15, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (10, '零食', '0');
INSERT INTO `category` VALUES (11, '日用品', '0');
INSERT INTO `category` VALUES (12, '测试1', '1');
INSERT INTO `category` VALUES (13, '生活', '0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `productid` int(11) NULL DEFAULT NULL,
  `quality` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, 15, 34, 4, 3, '一般吧', '2023-04-03 02:22:06');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (18, '37', 'in', 104000);
INSERT INTO `inventory` VALUES (19, '36', 'in', 104000);
INSERT INTO `inventory` VALUES (20, '35', 'in', 104000);
INSERT INTO `inventory` VALUES (21, '34', 'in', 104000);
INSERT INTO `inventory` VALUES (22, '33', 'in', 104000);
INSERT INTO `inventory` VALUES (23, '33', 'in', 104000);
INSERT INTO `inventory` VALUES (24, '32', 'in', 104000);
INSERT INTO `inventory` VALUES (29, '38', 'in', 104000);
INSERT INTO `inventory` VALUES (33, '32', 'in', 104000);
INSERT INTO `inventory` VALUES (35, '33', 'in', 104000);
INSERT INTO `inventory` VALUES (36, '34', 'in', 104000);
INSERT INTO `inventory` VALUES (37, '36', 'in', 104000);
INSERT INTO `inventory` VALUES (118, '37', 'out', 1);
INSERT INTO `inventory` VALUES (119, '38', 'out', 1);
INSERT INTO `inventory` VALUES (120, '34', 'out', 1);
INSERT INTO `inventory` VALUES (121, '36', 'out', 2);
INSERT INTO `inventory` VALUES (122, '35', 'out', 1);
INSERT INTO `inventory` VALUES (123, '38', 'out', 1);
INSERT INTO `inventory` VALUES (124, '37', 'out', 2);
INSERT INTO `inventory` VALUES (125, '36', 'out', 1);
INSERT INTO `inventory` VALUES (126, '35', 'out', 1);
INSERT INTO `inventory` VALUES (127, '33', 'out', 1);
INSERT INTO `inventory` VALUES (128, '37', 'out', 1);
INSERT INTO `inventory` VALUES (129, '38', 'out', 1);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lev` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `integral` int(255) NULL DEFAULT NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yue` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (12, 'xm', '123', '小明', '1554215626926.jpg', '13822222222', '131231@qq.com', '0', '普通会员', 0, '2023-04-02 22:34:03', '0', '在用', 0);
INSERT INTO `member` VALUES (15, 'ss', '123', '小S', '1554228920644.jpg', '13833333333', 'ss@126.com', '0', '普通会员', 0, '2023-04-03 02:15:38', '0', '在用', 0);
INSERT INTO `member` VALUES (16, 'mimi', '202cb962ac59075b964b07152d234b70', 'mimi', '1589881438036.png', '15612341234', '14123@qq.com', '12312', '普通会员', 0, '2023-05-19 17:44:19', '0', '在用', 136);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(255) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `replycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `replysavetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, 15, '希望上架一些新鲜果蔬', '2020-05-03 22:21:22', '', '');
INSERT INTO `message` VALUES (3, 16, '123', '2020-05-19 17:44:31', '', '');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (8, ' 临过期食品，你明示了吗? 宁德超市大多未设专柜', '1588516182203.jpg', '超市设“临近商品销售区”，但所卖商品并不是临过期商品。\r\n根据工商部门的相关要求，商家对即将到保质期的食品应当集中陈列或向消费者做出醒目提示。12月10日，记者走访了宁德市区沃尔玛、华润万家、东宁、康宁等各大超市。走访发现这些超市大多未设置“临界”食品销售专柜，快过期食品则通过打折、搭售等方式进行促销;而消费者在购买过程中，并不会特别注意食品保质期。\r\n消费者：\r\n不会特别注意保质期\r\n走访中，记者发现大多消费者在购物时，几乎都是直接将所需产品放入购物车，很少有人会留意查看生产日期、保质期。\r\n在康宁超市，正在挑选商品的刘女士表示，她一般不会特别在意产品的保质期，认为超市能摆上架的应该都不会过期。她说：“我工作忙，逛次超市会买很多东西存着。但有时候不注意，一些东西放一段时间确实就过期了。”而同时，刘女士表示，即将到保质期说明还没过保质期，质量应该没有问题，但在价格一样的情况下，要是有生产日期新鲜的产品，肯定不会选即将到保质期的。而超市应当设置专区，对这些准过期食品进行打折促销，也避免误导消费者。\r\n　\r\n超 市：\r\n准过期商品“混搭卖”\r\n尽管按照工商部门的要求，应当设置临界食品专区，但记者走访发现，大多超市都未设置，两三家有设置的，也形同虚设。\r\n在东宁超市，记者发现了三处“临近商品处理区”，但仔细观察之下，这些处理区销售的均非即将过期的产品。“临近商品处理区”形同虚设。\r\n那么超市对于“临界”食品又是如何处理呢?在该超市的乳制品区，记者发现很多商品都捆绑着两瓶或者两袋奶制品进行“买赠”促销，而这些被搭售的商品均已快过保质期。记者注意到，某品牌10瓶装的酸奶上用胶带捆绑着两小瓶其他品牌酸奶，并贴上赠品字样。因经过捆绑，很难看清赠品的保质期。记者向销售人员询问该赠品是否将过期，销售人员表示，这赠品离过期还有五天。这段时间内喝完两瓶酸奶绝非难事。\r\n在华润万家的果蔬区，记者看到一处水果集中处理区。框中陈列着各类水果，但皆有些变质，新鲜不再，而价格也相对低廉。销售人员表示，这些水果放置时间有些长，表面有些残损，但又未真正变质，因而采取低价促销手段。最终还没卖完，只能当做垃圾处理。而对于其他类型商品，该工作人员表示大部分商品一旦过期，将退回批发商进行处理。而对于生鲜、熟食区的商品，销售人员则表示会在每天晚上进行打折促销。但对于仍未卖完的商品去向，则表示并不清楚。\r\n此外，对于如何辨别货架上商品何时过期的问题，销售人员说，一般在增补商品时，会将新近生产产品放到里侧。这样经过一段时间，结合商品的销售量，就大概能了解哪些商品存放时间长，工作人员便会进行记录。\r\n工商部门：\r\n应当设置“临界”专柜\r\n对于超市“临界”食品管理问题，市工商局食品监察科的负责人表示，许多商家在销售过程中，以不清楚“临过期”具体定义为由而不设处理区。其实，早在2007年，国家工商总局就对“临过期”食品作详细界定，所售食品分别按照1年以上、半年以上不足1年、90天以上不足半年、30天以上不足90天、16天以上不足30天、3天以上少于15天等不同保质期，对应按照或者不低于期满之日前45天、20天、15天、10天、5天、2天期限，执行临近保质期食品管理要求。\r\n而几年前，我市也曾响应上级主管部门的意见，要求市区各大超市设置“临近商品处理区”，当时几个超市也按照要求执行了。但因该要求只是建议性质，并未强制执行，随着时间推移，许多超市便取消了这一专区。而工商部门又无法循法而对其进行处罚。\r\n但从保障食品安全、保护消费者合法权益的角度，工商部门仍建议各大商家应当对临过期食品明确标示，引导消费者购物，并且方便工商部门统一监管。', '2023-05-03 22:29:59');

-- ----------------------------
-- Table structure for ordermsg
-- ----------------------------
DROP TABLE IF EXISTS `ordermsg`;
CREATE TABLE `ordermsg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fkstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addrid` int(11) NULL DEFAULT NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waybillno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shfs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shsavetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distributorinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordermsg
-- ----------------------------
INSERT INTO `ordermsg` VALUES (18, 'DD0403021705', '15', '100.00', '已付款', '待发货', 13, '2023-04-03 02:17:05', NULL, NULL, '自取', '2020-04-03 20:20:10', '');
INSERT INTO `ordermsg` VALUES (20, 'DD0403021839', '15', '64.00', '已付款', '待发货', 13, '2023-04-03 02:18:40', NULL, NULL, '送货上门', '2020-04-03 19:28:16', '配送员姓名：rqwe配送员联系方式：1312313123');
INSERT INTO `ordermsg` VALUES (21, 'DD0408233414', '12', '62.00', '已付款', '待发货', 14, '2023-04-08 23:34:14', NULL, NULL, '自取', '2020-04-08 23:34:53', '配送员姓名：饿饿俄而荣荣荣荣配送员联系方式：21312312412312');
INSERT INTO `ordermsg` VALUES (22, 'DD0417174946', '16', '112.00', '待付款', '待发货', 16, '2023-04-17 17:49:46', NULL, NULL, '送货上门', NULL, '配送员姓名：wreqweqwewq配送员联系方式：12312423412');
INSERT INTO `ordermsg` VALUES (23, 'DD0417175655', '16', '42.00', '已付款', '已收货', 16, '2023-04-17 17:56:55', NULL, NULL, '自取', '2023-04-23 16:59:26', '配送员姓名：123212321配送员联系方式：3123213213');

-- ----------------------------
-- Table structure for ordermsgdetails
-- ----------------------------
DROP TABLE IF EXISTS `ordermsgdetails`;
CREATE TABLE `ordermsgdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productid` int(255) NULL DEFAULT NULL,
  `memberid` int(255) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `savetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordermsgdetails
-- ----------------------------
INSERT INTO `ordermsgdetails` VALUES (42, 'DD0403021705', 34, 15, 2, '2023-04-03 12:27:05');
INSERT INTO `ordermsgdetails` VALUES (43, 'DD0403021705', 36, 15, 2, '2023-04-03 12:17:05');
INSERT INTO `ordermsgdetails` VALUES (46, 'DD0403021839', 34, 15, 1, '2023-04-03 22:10:39');
INSERT INTO `ordermsgdetails` VALUES (47, 'DD0403021839', 36, 15, 2, '2023-04-03 22:18:40');
INSERT INTO `ordermsgdetails` VALUES (48, 'DD0408233414', 35, 12, 1, '2023-04-08 23:34:14');
INSERT INTO `ordermsgdetails` VALUES (49, 'DD0408233414', 33, 12, 1, '2023-04-08 23:34:14');
INSERT INTO `ordermsgdetails` VALUES (50, 'DD0417174946', 35, 16, 1, '2023-04-17 17:49:46');
INSERT INTO `ordermsgdetails` VALUES (51, 'DD0417174946', 38, 16, 1, '2023-04-17 17:49:46');
INSERT INTO `ordermsgdetails` VALUES (52, 'DD0417174946', 37, 16, 2, '2023-04-17 17:49:46');
INSERT INTO `ordermsgdetails` VALUES (53, 'DD0417174946', 36, 16, 1, '2023-04-17 17:49:46');
INSERT INTO `ordermsgdetails` VALUES (54, 'DD0417175655', 37, 16, 1, '2023-04-17 17:56:55');
INSERT INTO `ordermsgdetails` VALUES (55, 'DD0417175655', 38, 16, 1, '2023-04-17 17:56:55');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (10, '1554226422931.jpg');
INSERT INTO `picture` VALUES (11, '1554226430404.jpg');
INSERT INTO `picture` VALUES (12, '1554226437619.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `categoryid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vote` int(11) NULL DEFAULT NULL,
  `delstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `issj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tprice` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (32, '干果坚果礼盒大礼包', '1554226516526.jpg', 148, '10', '<embed src=\"/onlineshopssm/attached/media/20190403/20190403013551_58.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', 0, '0', 'yes', 130);
INSERT INTO `product` VALUES (33, '脆脆鲨', '1554226605810.jpg', 29, '10', '<embed src=\"/onlineshopssm/attached/media/20190403/20190403013706_710.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', 0, '0', 'yes', 0);
INSERT INTO `product` VALUES (34, '手撕面包棒', '1554226656166.jpg', 36, '10', '<div style=\"text-align:center;\">\r\n	<embed src=\"/onlineshopssm/attached/media/20190403/20190403013759_230.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /><br />\r\n</div>', 0, '0', 'yes', 0);
INSERT INTO `product` VALUES (35, '手撕面包', '1554226713303.jpg', 33, '10', '<embed src=\"/onlineshopssm/attached/media/20190403/20190403013858_322.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', 0, '0', 'yes', 0);
INSERT INTO `product` VALUES (36, '黑人薄荷清新口气牙膏', '1554226892263.jpg', 14, '11', '<embed src=\"/onlineshopssm/attached/media/20190403/20190403014154_384.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', 0, '0', 'yes', 0);
INSERT INTO `product` VALUES (37, '炭丝旋洁软毛成人牙刷', '1554226982422.jpg', 23, '11', '<img src=\"/onlineshopssm/attached/image/20190403/20190403014339_153.jpg\" alt=\"\" />', 0, '0', 'yes', 20);
INSERT INTO `product` VALUES (38, '九洲鹿毛巾', '1554229492856.jpg', 19, '11', '<embed src=\"/onlineshopssm/attached/media/20190403/20190403022511_268.mp4\" type=\"\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', 0, '0', 'yes', 0);
INSERT INTO `product` VALUES (39, '妙脆角小包45g', '1681725341389.jpg', 4.5, '10', '<p>\r\n	<br />\r\n</p>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:\" background-color:#ffffff;\"=\"\">\r\n		妙脆角，英文名为Bugles，属于三维立体<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%86%A8%E5%8C%96%E9%A3%9F%E5%93%81/1069580\">膨化食品</a>，是2000年以来在国内面世的一种全新的膨化食品。按所使用的原料不同又可分为马铃薯三维立体膨化食品和谷物三维立体膨化食品，尤其是谷物三维立体膨化食品还以成本低廉而更具市场优势。三维立体膨化食品的外观不循窠臼，一改传统膨化食品扁平且缺乏变化的单一模样，采用全新的生产工艺，使生产出的产品外形变化多样、立体感强，并且组织细腻、口感酥脆.<span style=\"font-family:\" font-size:12px;\"=\"\"></span> \r\n	</div>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img src=\"data:image/jpeg;base64,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\" alt=\"妙脆角生产视频\" /> \r\n	</p>', 0, '0', 'yes', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '202cb962ac59075b964b07152d234b70', '管理员', '男', '15622222222', '0', '超级管理员');
INSERT INTO `user` VALUES (4, 'emp', '202cb962ac59075b964b07152d234b70', 'emp', '男', '13872961177', '0', '员工');
INSERT INTO `user` VALUES (5, 'root', '202cb962ac59075b964b07152d234b70', 'root', '男', '13987689876', '0', '员工');
INSERT INTO `user` VALUES (6, 'zeze_2115', '202cb962ac59075b964b07152d234b70', '管理员', '女', '18062677012', '0', '超级管理员');
INSERT INTO `user` VALUES (7, 'wreqweqwewq', '202cb962ac59075b964b07152d234b70', '管理员', '男', '12312423412', '0', '配送员');
INSERT INTO `user` VALUES (8, '饿饿俄而荣荣荣荣', '202cb962ac59075b964b07152d234b70', '饿饿俄而荣荣荣荣', '男', '21312312412312', '0', '配送员');
INSERT INTO `user` VALUES (9, 'rqwe', '202cb962ac59075b964b07152d234b70', 'eqeweqeq', '女', '1312313123', '0', '配送员');
INSERT INTO `user` VALUES (10, '123212321', '202cb962ac59075b964b07152d234b70', '12312321321', '男', '3123213213', '0', '配送员');
INSERT INTO `user` VALUES (11, 'ryrtutytrtyrtytry', '202cb962ac59075b964b07152d234b70', 'rtyrturyrtyrty', '男', '34562332425', '0', '配送员');
INSERT INTO `user` VALUES (12, 'pouioipuipoui', '202cb962ac59075b964b07152d234b70', 'puiopioiupuo', '男', '1242311312321321', '0', '配送员');

SET FOREIGN_KEY_CHECKS = 1;
