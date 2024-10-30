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

 Date: 30/10/2024 11:30:52
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
                           `is_deleted` int(0) NULL DEFAULT NULL COMMENT '删除标识',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_code
-- ----------------------------
INSERT INTO `t_code` VALUES ('03f7c591-9429-11ef-98c4-005056c00001', 5, '前台账号', 't_user_level', '2024-10-27 14:02:15', NULL, 0);
INSERT INTO `t_code` VALUES ('5586351a-9428-11ef-98c4-005056c00001', 1, '公司账号', 't_user_level', '2024-10-27 13:57:22', NULL, 0);
INSERT INTO `t_code` VALUES ('6180cd54-9429-11ef-98c4-005056c00001', 1, '正常', 't_user_status', '2024-10-27 14:04:52', NULL, 0);
INSERT INTO `t_code` VALUES ('67fec8dc-9429-11ef-98c4-005056c00001', 0, '异常', 't_user_status', '2024-10-27 14:05:03', NULL, 0);
INSERT INTO `t_code` VALUES ('9abe8d3d-966b-11ef-a4bf-005056c00001', 1, '男性', 't_user_sex', '2024-10-30 11:03:57', NULL, 0);
INSERT INTO `t_code` VALUES ('a7414f98-966b-11ef-a4bf-005056c00001', 2, '女性', 't_user_sex', '2024-10-30 11:04:18', NULL, 0);
INSERT INTO `t_code` VALUES ('bc884c18-9428-11ef-98c4-005056c00001', 2, '管理员账号', 't_user_level', '2024-10-27 14:00:15', NULL, 0);
INSERT INTO `t_code` VALUES ('cf4fea45-9428-11ef-98c4-005056c00001', 3, '领导账号', 't_user_level', '2024-10-27 14:00:46', NULL, 0);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c00001', 4, '员工账号', 't_user_level', '2024-10-27 14:02:03', NULL, 0);

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
                           `is_deleted` int(0) NULL DEFAULT NULL COMMENT '是否删除',
                           `sex` int(0) NULL DEFAULT NULL COMMENT '性别',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('52943b68-8234-11ef-a7f7-005056c00001', 'wangwen', 'e10adc3949ba59abbe56e057f20f883e', '赣州供电局', 1, 1, '江西赣州', NULL, NULL, '-1', '2024-10-04 17:37:50', NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
