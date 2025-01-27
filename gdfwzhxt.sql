/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : gdfwzhxt

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 27/01/2025 20:03:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_code
-- ----------------------------
DROP TABLE IF EXISTS `t_code`;
CREATE TABLE `t_code`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `code` int(0) NULL DEFAULT NULL COMMENT '状态码',
                           `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '码值',
                           `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
                           `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
                           `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
                           `is_deleted` int(0) NULL DEFAULT 0 COMMENT '删除标识',
                           `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                           `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
                           `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_code
-- ----------------------------
INSERT INTO `t_code` VALUES ('03f7c591-9429-11ef-98c4-005056c00001', 5, '前台账号', 't_user_level', '2024-10-27 14:02:15', NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('5586351a-9428-11ef-98c4-005056c00001', 1, '公司账号', 't_user_level', '2024-10-27 13:57:22', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('6180cd54-9429-11ef-98c4-005056c00001', 1, '正常', 't_user_status', '2024-10-27 14:04:52', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('67fec8dc-9429-11ef-98c4-005056c00001', 0, '异常', 't_user_status', '2024-10-27 14:05:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('9abe8d3d-966b-11ef-a4bf-005056c00001', 1, '男性', 't_user_sex', '2024-10-30 11:03:57', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('a7414f98-966b-11ef-a4bf-005056c00001', 2, '女性', 't_user_sex', '2024-10-30 11:04:18', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('bc884c18-9428-11ef-98c4-005056c00001', 2, '管理员账号', 't_user_level', '2024-10-27 14:00:15', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('cf4fea45-9428-11ef-98c4-005056c00001', 3, '领导账号', 't_user_level', '2024-10-27 14:00:46', NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c00001', 3, '员工账号', 't_user_level', '2024-10-27 14:02:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c02002', 3, '无', 't_user_sex', '2024-12-26 11:51:32', NULL, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_lineinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_lineinfo`;
CREATE TABLE `t_lineinfo`  (
                               `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `line_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `unit_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `line_length` double NULL DEFAULT NULL,
                               `radius` double NULL DEFAULT NULL,
                               `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `voltage_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `rated_current` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `line_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `main_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `access_time` timestamp(0) NULL DEFAULT NULL,
                               `create_time` timestamp(0) NULL DEFAULT NULL,
                               `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `update_time` timestamp(0) NULL DEFAULT NULL,
                               `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `is_deleted` int(0) NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_lineinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属上级（为0表示顶级菜单）',
                           `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单标题',
                           `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件名称',
                           `sort_value` int(0) NULL DEFAULT NULL COMMENT '排序',
                           `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态（0：异常 1：正常）',
                           `create_time` timestamp(0) NULL DEFAULT NULL,
                           `update_time` timestamp(0) NULL DEFAULT NULL,
                           `is_deleted` int(0) NULL DEFAULT 0,
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属供电公司id',
                           `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('03dc8d35a8b24ac196f5abfe91693866', 'f75b896a53d84b19bf7d4e20030bc15e', '角色管理', 'sysRole', 2, 1, '2025-01-11 15:35:09', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('323bdcfbf0e243718bf71f828de04acb', '3c5da8df5abc4b7a9237a33018d866bd', '测试子节点', 'test1', 1, 0, '2025-01-11 16:14:17', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('3c5da8df5abc4b7a9237a33018d866bd', '0', '测试', 'test', 2, 1, '2025-01-11 16:13:58', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('6ce8dc54ed82417a95b1545032bb0663', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路事件报表', 'lineEventReport', 3, 1, '2025-01-27 19:09:28', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('ba9885cfab6040ad92ea536bff8f920b', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路停电事件', 'lineEvent', 2, 1, '2025-01-12 18:52:36', '2025-01-27 19:12:44', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('cb5d56df80854e50bc6d7e5b6d1b457f', '0', '线路管理', 'line', 2, 1, '2025-01-12 18:50:47', '2025-01-12 19:04:53', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('d20c094cffb24cb5a41e6cb2b0bc3b7a', 'f75b896a53d84b19bf7d4e20030bc15e', '用户管理', 'sysUser', 1, 1, '2025-01-11 15:34:39', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('e2c56b46a6624ebf87e35c256a44af5d', 'f75b896a53d84b19bf7d4e20030bc15e', '菜单管理', 'sysMenu', 3, 1, '2025-01-11 15:35:16', '2025-01-11 15:36:27', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('ea450ae6a98a4aebafd3b56e5b20dc5b', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路信息', 'lineInfo', 1, 1, '2025-01-12 18:51:43', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('f75b896a53d84b19bf7d4e20030bc15e', '0', '系统管理', 'system', 1, 1, '2025-01-11 15:33:55', '2025-01-11 15:35:57', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
                           `role_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
                           `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                           `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
                           `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
                           `is_deleted` int(0) NULL DEFAULT 0 COMMENT '删除标识',
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属供电公司',
                           `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('19165643fab342038bbc855af1844f36', '测试人员', 'test', '其主要负责测试系统的各方面功能，确保系统无bug！', '2024-11-23 17:00:32', '2024-12-25 19:09:25', 0, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('23315a6badcb42e78d70ce6d9439d653', '平台管理员', 'administrators', '管理平台的运行，操作用户权限等...', '2024-11-17 16:55:59', '2024-12-25 18:22:15', 0, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('59ed1e3ebece42a09f4ae7fa90b3ccad', '电路维修师父', 'editor', '有电路故障事件时，维修师父第一时间收到，修好后提交维修记录。', '2024-12-25 18:24:37', '2024-12-29 15:38:52', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_role` VALUES ('65a987200dbf48a6b8b16dea71cb34a9', 'test1', 'test1', NULL, '2024-12-26 11:41:21', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_role` VALUES ('a0f24a6726d748ecbbe49af62844d331', 'sd', 'd', NULL, '2024-12-01 13:55:45', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL);
INSERT INTO `t_role` VALUES ('cbf1901522b347fbbfef03a0756136a0', '普通用户', 'admin', '普通的员工用户，负责系统的各种数据观测和处理。', '2024-11-23 16:23:42', '2024-12-26 10:13:00', 0, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('de05cbb207ad4d9c9d531423d81221d7', '开发者', 'developer', '系统的开发者，拥有所有菜单的操作权限！', '2025-01-11 15:46:57', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_role` VALUES ('f0403832bde34b7d904818a5362297b3', 'read用户', 'readAdmin', '该用户只有查询数据的权限', '2024-11-23 16:51:28', '2024-12-25 19:37:05', 0, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
                                `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                                `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色id',
                                `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单id',
                                `create_time` timestamp(0) NULL DEFAULT NULL,
                                `update_time` timestamp(0) NULL DEFAULT NULL,
                                `is_deleted` int(0) NULL DEFAULT 0,
                                `is_half` tinyint(0) NULL DEFAULT NULL,
                                `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('10b36f34bc9546db9a2d26de5ee0956e', 'de05cbb207ad4d9c9d531423d81221d7', 'e2c56b46a6624ebf87e35c256a44af5d', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('16448608b7fd47928f2b009b440ca19f', '23315a6badcb42e78d70ce6d9439d653', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-01-12 18:53:20', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('196130ce8a734efa9a144b8ac7363b4c', 'de05cbb207ad4d9c9d531423d81221d7', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('202c355d3f6f43469e37f1f826e171ae', '23315a6badcb42e78d70ce6d9439d653', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-01-12 18:53:20', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('24d148b69c954200b17b4fae30c9b20a', 'de05cbb207ad4d9c9d531423d81221d7', '6ce8dc54ed82417a95b1545032bb0663', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('288b052eb8514182826882a01fd1ca1c', 'de05cbb207ad4d9c9d531423d81221d7', 'ba9885cfab6040ad92ea536bff8f920b', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('2f87ba39b2de4c16a6914bc65f9808ed', 'de05cbb207ad4d9c9d531423d81221d7', '03dc8d35a8b24ac196f5abfe91693866', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('309d4afb1e7a4a51bad220f39f982e04', 'de05cbb207ad4d9c9d531423d81221d7', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('3e8a5f9cf2274760828cf6dc20972b4e', '23315a6badcb42e78d70ce6d9439d653', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-01-12 18:53:20', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('4e7a6ee91b1f42c7a2fd110232dfbfdc', '23315a6badcb42e78d70ce6d9439d653', 'ba9885cfab6040ad92ea536bff8f920b', '2025-01-12 18:53:20', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('899473f4cf9340268193de9e8bdababb', 'de05cbb207ad4d9c9d531423d81221d7', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('c369359f2d874013bee58142cd5e1bfb', 'de05cbb207ad4d9c9d531423d81221d7', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-01-27 19:24:37', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('dc7b51c24d5242c6ad701bf2599c44c6', '23315a6badcb42e78d70ce6d9439d653', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-01-12 18:53:20', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `login_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
                           `login_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
                           `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
                           `status` int(0) NULL DEFAULT NULL COMMENT '账号状态',
                           `level` int(0) NULL DEFAULT NULL COMMENT '账号等级',
                           `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户地址',
                           `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
                           `show_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '展示图片',
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属公司',
                           `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
                           `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
                           `is_deleted` int(0) NULL DEFAULT 0 COMMENT '是否删除',
                           `sex` int(0) NULL DEFAULT NULL COMMENT '性别',
                           `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
                           `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                           `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0ed453d14de143f58c6a54b0d6979a95', 'xk123', 'f379eaf3c831b04de153469d1bec345e', '肖大侠', 1, 3, '江西吉安', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/7a84d8082f924f9eb7c6fbce3ccaa47f33068c1ae01941d2b53a7efd2f806203_t1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 20:08:23', '2024-12-29 15:39:01', 0, 1, '13667961644', '系统开发者', '赣州供电局', '赣州供电局');
INSERT INTO `t_user` VALUES ('355e4d747e104801854d0a46f7ad73c3', 'ww123', 'f379eaf3c831b04de153469d1bec345e', '王文', 1, 2, '赣州', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/4315ec15f7e34674a91f3e64c23fedaa01.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 19:51:21', '2025-01-12 18:46:32', 0, 2, '18779867786', '聪明人', '赣州供电局', '赣州供电局');
INSERT INTO `t_user` VALUES ('5d1f6eed770f40dd9916098fb17934bc', 'wangwen', 'e10adc3949ba59abbe56e057f20f883e', '赣州供电局', 1, 1, '江西赣州', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/cdbda25360104e449eda7beef697ca14gdgs.jpg', NULL, '-1', '2024-10-04 17:37:50', '2024-12-26 20:01:22', 0, 3, '0791-95598', '该账户为供电公司账户，权限最大，可以操作所有菜单。', NULL, '赣州供电局');
INSERT INTO `t_user` VALUES ('7d12fff3e576406ca5cec1840cc0d9f6', 'wanwen', '96e79218965eb72c92a549dd5a330112', '王德法', 1, 3, NULL, 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250127/86987e609d204f139834c20ddf90e69a5c1d9d7edce6a_610.jpg', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-29 16:39:08', '2025-01-27 18:59:32', 0, 2, NULL, NULL, '赣州供电局', '赣州供电局');
INSERT INTO `t_user` VALUES ('bd375d793ae24830891689038d0cf054', 'wx123', 'f379eaf3c831b04de153469d1bec345e', '王辛', 1, 3, '江西省上饶市广信区', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241228/e5ee66fd0925407f96890769acd80bb794a1939c30a2495a9ed11747ff5c132c_p1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-28 17:02:24', NULL, 0, 1, '1582025202', '维修电路，及时排查', '王文', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
                                `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                                `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色id',
                                `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
                                `create_time` timestamp(0) NULL DEFAULT NULL,
                                `update_time` timestamp(0) NULL DEFAULT NULL,
                                `is_deleted` int(0) NULL DEFAULT 0,
                                `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('0267ffbfd38e481696dedbd0c6562560', 'f0403832bde34b7d904818a5362297b3', '0ed453d14de143f58c6a54b0d6979a95', '2024-12-29 16:01:09', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('0b010228b0e34bdfa0889c103a1df8b0', 'f0403832bde34b7d904818a5362297b3', 'bd375d793ae24830891689038d0cf054', '2024-12-29 16:38:33', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('1b62f5a6cf8f4a81b4856a3d131fe497', '19165643fab342038bbc855af1844f36', 'bd375d793ae24830891689038d0cf054', '2024-12-29 16:38:33', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('513021f34b994f73aa287f36b637425d', '23315a6badcb42e78d70ce6d9439d653', 'bd375d793ae24830891689038d0cf054', '2024-12-29 16:38:33', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('b03fba767a164bcfb34900c08650432e', '23315a6badcb42e78d70ce6d9439d653', '355e4d747e104801854d0a46f7ad73c3', '2025-01-11 22:08:04', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('c258390e18764fcfb051446486b8cb54', '19165643fab342038bbc855af1844f36', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('ce5e90083e4f4322a3cd768d012858e5', 'f0403832bde34b7d904818a5362297b3', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('fcd5fc26bacc4ecfad0a0363ddeec8cb', '23315a6badcb42e78d70ce6d9439d653', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('fe2bc95f84ae4222a4bd6ce4a30ce985', 'de05cbb207ad4d9c9d531423d81221d7', '5d1f6eed770f40dd9916098fb17934bc', '2025-01-11 15:49:26', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');

SET FOREIGN_KEY_CHECKS = 1;
