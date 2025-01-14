/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : guli

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 10/01/2024 16:35:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL, NULL, 0, '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', 1, NULL, '/edu/teacher', 'Layout', NULL, NULL, 0, '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', 1, NULL, 'list', '/edu/teacher/list', NULL, NULL, 0, '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', 1, '', 'save', '/edu/teacher/save', NULL, NULL, 0, '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', NULL, NULL, 0, '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', NULL, NULL, 0, '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'save/:id', '/edu/teacher/save', NULL, NULL, 0, '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', 1, NULL, '/edu/subject', 'Layout', NULL, NULL, 0, '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', 1, NULL, 'list', '/edu/subject/list', NULL, NULL, 0, '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', 1, NULL, 'save', '/edu/subject/save', NULL, NULL, 0, '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', 2, 'subject.list', '', '', NULL, NULL, 0, '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', 2, 'subject.import', '', '', NULL, NULL, 0, '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, NULL, '/edu/course', 'Layout', NULL, NULL, 0, '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, NULL, 'list', '/edu/course/list', NULL, NULL, 0, '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', 1, NULL, 'info', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 0, '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', 2, 'course.update', 'info/:id', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', 2, 'chapter.update', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 0, '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', 1, NULL, '/sta', 'Layout', NULL, NULL, 0, '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', 1, NULL, 'create', '/sta/create', NULL, NULL, 0, '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', 1, NULL, 'show', '/sta/show', NULL, NULL, 0, '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', 2, 'daily.list', '', '', NULL, NULL, 0, '2019-11-15 22:45:30', '2019-11-15 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', 2, 'daily.add', '', '', NULL, NULL, 0, '2019-11-15 22:45:51', '2019-11-15 22:45:51');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', 'CMS管理', 1, NULL, '/cms', 'Layout', NULL, NULL, 0, '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195353513549205505', '查看', 2, 'banner.list', '', NULL, NULL, NULL, 0, '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195353513549205505', '添加', 2, 'banner.add', 'banner/add', '/cms/banner/form', NULL, NULL, 0, '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195353513549205505', '修改', 2, 'banner.update', 'banner/update/:id', '/cms/banner/form', NULL, NULL, 0, '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195352547621965825', 'Bander列表', 1, NULL, 'banner/list', '/cms/banner/list', NULL, NULL, 0, '2019-11-15 22:51:01', '2019-11-18 10:51:29');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353513549205505', '删除', 2, 'banner.remove', '', '', NULL, NULL, 0, '2019-11-15 22:51:39', '2019-11-15 22:51:39');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', 1, NULL, '/order', 'Layout', NULL, NULL, 0, '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', 1, NULL, 'list', '/order/list', NULL, NULL, 0, '2019-11-15 22:53:33', '2019-11-15 22:53:58');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', 2, 'order.list', '', '', NULL, NULL, 0, '2019-11-15 22:54:12', '2019-11-15 22:54:12');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2019-11-18 13:38:56', '2019-11-18 13:38:56');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员', NULL, NULL, 0, '2019-11-11 13:09:32', '2019-11-18 10:27:18');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', NULL, NULL, 0, '2019-11-11 13:09:45', '2019-11-18 10:25:44');
INSERT INTO `acl_role` VALUES ('1196300996034977794', 'test', NULL, NULL, 0, '2019-11-18 13:35:58', '2019-11-18 13:35:58');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1604395270945873922', '1196300996034977794', '1', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270958456834', '1196300996034977794', '1195350831744782337', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270958456835', '1196300996034977794', '1195350919074385921', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270958456836', '1196300996034977794', '1195351159672246274', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270958456837', '1196300996034977794', '1195351326706208770', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270958456838', '1196300996034977794', '1195351566221938690', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');
INSERT INTO `acl_role_permission` VALUES ('1604395270971039745', '1196300996034977794', '1195351020463296513', 0, '2022-12-18 16:36:55', '2022-12-18 16:36:55');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '88316675d7882e3fdbe066000273842c', 'admin', '', NULL, 0, '2019-11-01 10:39:47', '2019-11-01 10:39:47');
INSERT INTO `acl_user` VALUES ('2', 'test', '88316675d7882e3fdbe066000273842c', 'test', NULL, NULL, 0, '2019-11-01 16:36:07', '2019-11-01 16:40:08');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1604389217470472194', '1196300996034977794', '2', 0, '2022-12-18 16:12:52', '2022-12-18 16:12:52');

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1', 'test1', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/banner/banner-2-green.jpg', '/course', 1, 0, '2019-11-13 18:05:32', '2019-11-18 10:28:22');
INSERT INTO `crm_banner` VALUES ('2', 'test2', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/banner/1.jpg', '/teacher', 2, 0, '2019-11-13 21:26:27', '2019-11-14 09:12:15');
INSERT INTO `crm_banner` VALUES ('3', 'test3', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/banner/banner-1-green.jpg', '', 0, 0, '2022-12-14 20:10:38', '2022-12-14 20:10:40');
INSERT INTO `crm_banner` VALUES ('4', 'test4', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/banner/banner-2-blue.jpg', '', 0, 0, '2022-12-14 20:08:28', '2022-12-14 20:08:33');
INSERT INTO `crm_banner` VALUES ('5', 'test5', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/banner/1.jpg', '', 0, 0, '2022-12-14 20:12:02', '2022-12-14 20:12:04');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1602626551425003521', '1602626493023514625', '第一章 注册中心', 1, '2022-12-13 11:28:40', '2022-12-13 11:28:40');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1602865417251700737', '1602626493023514625', '1189389726308478977', '1602293365750865922', '十一月', 'https://thirdwx.qlogo.cn/mmopen/vi_32/kicMSQWMibhHZPmd8VaWd1YV0XBfCiaGnMS93MFszlfpOzic5TxgRVkNgDN4miar2hPwVnrKElveRhfZZiaD7HNDaQKQ/132', '干货满满，值得推荐！', 0, '2022-12-14 11:17:50', '2022-12-14 11:17:50');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1192252213659774977', '1189389726308478977', '1178214681139539969', '1178214681118568449', 'java基础课程：test', 0.01, 2, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/05.jpg', 4, 387, 1, 'Normal', 0, '2022-12-13 09:27:33', '2022-12-13 13:35:03');
INSERT INTO `edu_course` VALUES ('14', '1189389726308478977', '1178214681210843137', '1178214681181483010', 'XHTML CSS2 JS整站制作教程课程学习', 0.00, 3, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/1442295570359.jpg', 3, 44, 15, 'Normal', 0, '2022-12-13 18:33:34', '2022-12-13 21:21:45');
INSERT INTO `edu_course` VALUES ('15', '1189389726308478977', '1178214681210843137', '1178214681181483010', 'HTML5入门课程学习', 0.00, 23, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/1442295556203.jpg', 0, 51, 17, 'Normal', 0, '2022-12-13 18:34:32', '2022-12-13 10:19:20');
INSERT INTO `edu_course` VALUES ('1602626493023514625', '1189389726308478977', '1178214681139539969', '1178214681118568449', 'Spring Cloud Alibaba', 0.01, 12, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/08.jpg', 0, 0, 1, 'Normal', 0, '2022-12-13 11:28:26', '2022-12-13 11:29:16');
INSERT INTO `edu_course` VALUES ('18', '1189389726308478977', '1178214681139539969', '1178214681118568449', 'Java精品课程', 0.01, 20, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/10.jpg', 151, 737, 6, 'Normal', 0, '2022-12-13 21:28:46', '2022-12-13 11:14:52');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程收藏' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1196269345666019330', '1192252213659774977', '1', 1, '2019-11-18 11:30:12', '2019-11-18 11:30:12');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1602626493023514625', '轻松进大厂！', '2022-12-13 11:28:26', '2022-12-13 11:28:26');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程科目' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1178214681118568449', '后端开发', '0', 1, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681139539969', 'Java', '1178214681118568449', 1, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681181483010', '前端开发', '0', 3, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681210843137', 'JavaScript', '1178214681181483010', 4, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681231814658', '云计算', '0', 5, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681252786178', 'Docker', '1178214681231814658', 5, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681294729217', 'Linux', '1178214681231814658', 6, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681324089345', '系统/运维', '0', 7, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681353449473', 'Linux', '1178214681324089345', 7, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681382809602', 'Windows', '1178214681324089345', 8, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681399586817', '数据库', '0', 9, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681428946945', 'MySQL', '1178214681399586817', 9, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681454112770', 'MongoDB', '1178214681399586817', 10, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681483472898', '大数据', '0', 11, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681504444418', 'Hadoop', '1178214681483472898', 11, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681529610242', 'Spark', '1178214681483472898', 12, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681554776066', '人工智能', '0', 13, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681584136193', 'Python', '1178214681554776066', 13, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681613496321', '编程语言', '0', 14, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681626079234', 'Java', '1178214681613496321', 14, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178585108407984130', 'Python', '1178214681118568449', 2, '2019-09-30 16:19:22', '2019-09-30 16:19:22');
INSERT INTO `edu_subject` VALUES ('1178585108454121473', 'HTML/CSS', '1178214681181483010', 3, '2019-09-30 16:19:22', '2019-09-30 16:19:22');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '架构师', 1, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/29/78858cc931444254850893a3fe3cd67d1.jpg', 0, 0, '2019-10-30 14:18:46', '2019-11-12 13:36:36');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '晴天简介', '高级微服务讲师', 2, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/30/d0ea204447f446fb80893f70f043bfcd_bj2.jpg', 0, 0, '2019-10-30 11:53:03', '2019-10-30 11:53:03');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '李刚简介', '高级docker讲师', 2, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/30/7684298d677048a5aefe1ea62a0af6c7_bj5.jpg', 0, 0, '2019-10-30 11:55:19', '2019-11-12 13:37:52');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '王二', '王二简介', '高级mq讲师', 1, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/avatar/2022/11/24/bca3350bb1a24846a1dc1b7e2192b21dfile.png', 0, 0, '2019-10-30 14:18:56', '2019-11-12 13:37:35');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '王五简介', '高级vue讲师', 1, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/avatar/2022/11/24/bca3350bb1a24846a1dc1b7e2192b21dfile.png', 0, 0, '2019-10-30 14:19:02', '2019-11-12 13:37:18');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '李四简介', '高级全栈讲师', 1, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/avatar/2022/11/24/bca3350bb1a24846a1dc1b7e2192b21dfile.png', 0, 0, '2019-11-07 09:18:25', '2019-11-12 13:37:01');
INSERT INTO `edu_teacher` VALUES ('1595704200569421826', '刘洋', '复旦大学研究生毕业', '元老级人物', 2, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/12/01/50a6d59b7d4b449fbea582740823c87c_bj3.jpg', 0, 0, '2022-11-24 09:01:43', '2022-11-24 14:49:39');
INSERT INTO `edu_teacher` VALUES ('1595704200569421874', '周深', '清华大学博士生毕业', '顶级大佬', 5, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/avatar/2022/11/24/bca3350bb1a24846a1dc1b7e2192b21dfile.png', 0, 0, '2022-12-13 09:18:25', '2022-12-13 09:18:25');
INSERT INTO `edu_teacher` VALUES ('1595704200569421875', '不易', '麻省理工博士生毕业', 'spring天花板', 5, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/30/7684298d677048a5aefe1ea62a0af6c7_bj5.jpg', 0, 0, '2022-12-13 09:18:25', '2022-12-13 09:18:25');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1602626662544699393', '1602626493023514625', '1602626551425003521', 'eureka', 'd4fcb364f33442d489a740972ea4e0e6', '6 - What If I Want to Move Faster.mp4', 2, 0, 1, 0, 'Empty', 0, 1, '2022-12-13 11:29:06', '2022-12-13 11:29:06');

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1603301782221213697', '2022-12-13', 0, 142, 119, 100, '2022-12-15 16:11:47', '2022-12-15 16:11:47');
INSERT INTO `statistics_daily` VALUES ('1603302633929166850', '2022-12-12', 4, 126, 157, 101, '2022-12-15 16:15:11', '2022-12-15 16:15:11');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(3) NULL DEFAULT 1 COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1602995449697652737', '53961110413113108151', '1602626493023514625', 'Spring Cloud Alibaba', 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/guli-school/course-cover/08.jpg', '晴天', '1602293365750865922', '十一月', '17737790241', 0.01, 1, 1, 0, '2022-12-14 19:54:32', '2022-12-14 22:09:32');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1603029425522872322', '53961110413113108151', '2022-12-14 22:09:32', 0.01, '4200001669202212147792877719', 'SUCCESS', 1, '{\"transaction_id\":\"4200001669202212147792877719\",\"nonce_str\":\"6PF2TpOkILJqvEQu\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuMgto1xwwytdK8607rXj758\",\"sign\":\"365D478DC67440C5C2305921F7E42C01\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"53961110413113108151\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20221214220939\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2022-12-14 22:09:33', '2022-12-14 22:09:33');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1602163271334072321', NULL, '17737790240', '88316675d7882e3fdbe066000273842c', '默言', 2, 19, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/29/78858cc931444254850893a3fe3cd67d1.jpg', '真', 0, 0, '2022-12-12 04:47:45', '2022-12-12 04:47:45');
INSERT INTO `ucenter_member` VALUES ('1602191573520113665', NULL, '18240526329', '88316675d7882e3fdbe066000273842c', '河南第一', 1, 18, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/30/7684298d677048a5aefe1ea62a0af6c7_bj5.jpg', '善', 0, 0, '2022-12-12 06:40:13', '2022-12-12 06:40:13');
INSERT INTO `ucenter_member` VALUES ('1602196802894528514', NULL, '17737790331', '88316675d7882e3fdbe066000273842c', '河南航空号', 1, 20, 'https://guli-filesystem.oss-cn-shanghai.aliyuncs.com/yunji/images/2022/11/30/d0ea204447f446fb80893f70f043bfcd_bj2.jpg', '美', 0, 0, '2022-12-12 07:01:00', '2022-12-12 07:01:00');
INSERT INTO `ucenter_member` VALUES ('1602293365750865922', 'o3_SC55r_GMm34TpDgUcClKEcnzo', '17737790241', '88316675d7882e3fdbe066000273842c', '十一月', 2, 22, 'https://thirdwx.qlogo.cn/mmopen/vi_32/kicMSQWMibhHZPmd8VaWd1YV0XBfCiaGnMS93MFszlfpOzic5TxgRVkNgDN4miar2hPwVnrKElveRhfZZiaD7HNDaQKQ/132', '做好自己', 0, 0, '2022-12-12 21:24:42', '2022-12-12 21:24:42');

SET FOREIGN_KEY_CHECKS = 1;
