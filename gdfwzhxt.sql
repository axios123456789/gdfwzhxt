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

 Date: 23/11/2024 16:59:04
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
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_code
-- ----------------------------
INSERT INTO `t_code` VALUES ('03f7c591-9429-11ef-98c4-005056c00001', 5, '前台账号', 't_user_level', '2024-10-27 14:02:15', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('5586351a-9428-11ef-98c4-005056c00001', 1, '公司账号', 't_user_level', '2024-10-27 13:57:22', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('6180cd54-9429-11ef-98c4-005056c00001', 1, '正常', 't_user_status', '2024-10-27 14:04:52', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('67fec8dc-9429-11ef-98c4-005056c00001', 0, '异常', 't_user_status', '2024-10-27 14:05:03', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('9abe8d3d-966b-11ef-a4bf-005056c00001', 1, '男性', 't_user_sex', '2024-10-30 11:03:57', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('a7414f98-966b-11ef-a4bf-005056c00001', 2, '女性', 't_user_sex', '2024-10-30 11:04:18', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('bc884c18-9428-11ef-98c4-005056c00001', 2, '管理员账号', 't_user_level', '2024-10-27 14:00:15', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('cf4fea45-9428-11ef-98c4-005056c00001', 3, '领导账号', 't_user_level', '2024-10-27 14:00:46', NULL, 0, NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c00001', 4, '员工账号', 't_user_level', '2024-10-27 14:02:03', NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属上级',
                           `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单标题',
                           `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件名称',
                           `sort_value` int(0) NULL DEFAULT NULL COMMENT '排序',
                           `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态（0：异常 1：正常）',
                           `create_time` timestamp(0) NULL DEFAULT NULL,
                           `update_time` timestamp(0) NULL DEFAULT NULL,
                           `is_deleted` int(0) NULL DEFAULT 0,
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属供电公司id',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
                           `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
                           `role_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
                           `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                           `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
                           `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
                           `is_deleted` int(0) NULL DEFAULT 0 COMMENT '删除标识',
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属供电公司',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('23315a6badcb42e78d70ce6d9439d653', '平台管理员', 'administrators', '管理平台的运行，操作用户权限等...', '2024-11-17 16:55:59', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role` VALUES ('cbf1901522b347fbbfef03a0756136a0', '普通用户', 'admin', '普通的员工用户，负责系统的各种数据观测和处理', '2024-11-23 16:23:42', '2024-11-23 16:24:35', 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role` VALUES ('f0403832bde34b7d904818a5362297b3', 'read用户', 'readAdmin', '该用户只有查询数据的权限', '2024-11-23 16:51:28', '2024-11-23 16:52:20', 0, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_role_mune
-- ----------------------------
DROP TABLE IF EXISTS `t_role_mune`;
CREATE TABLE `t_role_mune`  (
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
-- Records of t_role_mune
-- ----------------------------

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
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('5d1f6eed770f40dd9916098fb17934bc', 'wangwen', 'e10adc3949ba59abbe56e057f20f883e', '赣州供电局', 1, 1, '江西赣州', NULL, NULL, '-1', '2024-10-04 17:37:50', NULL, 0, NULL);

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

SET FOREIGN_KEY_CHECKS = 1;
