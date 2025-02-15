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

 Date: 15/02/2025 10:40:11
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
INSERT INTO `t_code` VALUES ('0ceb50d85b2d498cade95ffb42586d29', 1, '测试', 't_test', '2025-01-29 10:33:30', NULL, 1, NULL, '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('127fed7a41e148db831183e60eb161fb', 40, '乡村级', 't_unit_level', '2025-01-29 17:25:43', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('2d898238ca354d4f930e7f4bb6a06538', 2, '欠费', 't_cons_consStatus', '2025-02-06 09:25:23', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('5586351a-9428-11ef-98c4-005056c00001', 1, '公司账号', 't_user_level', '2024-10-27 13:57:22', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('60d0cfe8c3904de3b5bec6f3ad200bca', 30, '镇所级', 't_unit_level', '2025-01-29 17:25:15', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('6180cd54-9429-11ef-98c4-005056c00001', 1, '正常', 't_user_status', '2024-10-27 14:04:52', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('67fe17e031dc4d3989fadf8b95d364e4', 4, '民生', 't_cons_consType', '2025-02-06 09:24:17', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('67fec8dc-9429-11ef-98c4-005056c00001', 0, '异常', 't_user_status', '2024-10-27 14:05:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('692086f027f3451eb9b2646e6a2f9f86', 1, '公变', 't_transformer_type', '2025-02-01 17:55:53', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('6c9adfb5c28e4f5792aee7a3251b3782', 50, '村组级', 't_unit_level', '2025-01-29 17:27:25', NULL, 1, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('76bbaa931a624e8e8fdfd295b512ca57', 1, '个人', 't_cons_consType', '2025-02-06 09:23:20', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('7eadb86f43814be6bb6a244b361f5524', 0, '回收', 't_line_status', '2025-01-29 21:31:34', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('82fa40d92a614ce0abaca21557ef6501', 3, '公企', 't_cons_consType', '2025-02-06 09:24:04', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('83fced153d17464d92db7f9e7fbd2c13', 3, '专线', 't_line_type', '2025-01-29 10:36:48', NULL, 0, '专门给独立的个体配的线路，应付特殊情况', '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('9abe8d3d-966b-11ef-a4bf-005056c00001', 1, '男性', 't_user_sex', '2024-10-30 11:03:57', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('9edbddd91b46486092ef6363bef1c273', 1, '正常', 't_cons_consStatus', '2025-02-06 09:25:16', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('a7414f98-966b-11ef-a4bf-005056c00001', 2, '女性', 't_user_sex', '2024-10-30 11:04:18', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('adc5e729242a4f2bb0e7a1e806edc3d0', 1, '投入', 't_line_status', '2025-01-29 21:31:21', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('bc884c18-9428-11ef-98c4-005056c00001', 2, '管理员账号', 't_user_level', '2024-10-27 14:00:15', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('c731a8910ba84e809f343645ddca5be8', 2, '专变', 't_transformer_type', '2025-02-01 17:56:05', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('cf4fea45-9428-11ef-98c4-005056c00001', 3, '领导账号', 't_user_level', '2024-10-27 14:00:46', NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('dadd8e1f3ad24fa6ae18c2d5e9deb126', 1, '2', 't_test', '2025-01-29 10:38:10', NULL, 1, NULL, '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('e3ea5631d9f64b4b82c04710b133043b', 20, '县级', 't_unit_level', '2025-01-29 17:24:27', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('ef02688e4bb34409b2cf93e8604f6aad', 1, '41', 't_test', '2025-01-29 20:38:50', '2025-01-29 20:38:56', 1, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('f126c3b6db29450daee12da4abdc7d0f', 1, '主线', 't_line_type', '2025-01-29 10:31:53', NULL, 0, '一般为源头的线路', '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c00001', 3, '员工账号', 't_user_level', '2024-10-27 14:02:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c02002', 3, '无', 't_user_sex', '2024-12-26 11:51:32', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fda47e0b0943475f8614d6d0fad6bfe7', 2, '支线', 't_line_type', '2025-01-29 10:32:03', '2025-01-29 10:32:33', 0, '一般是主线下的线路', '赣州供电局', '赣州供电局');
INSERT INTO `t_code` VALUES ('ff803984de95482ebd4048c10c345a1a', 2, '私企', 't_cons_consType', '2025-02-06 09:23:49', NULL, 0, NULL, '上饶广信供电局', NULL);

-- ----------------------------
-- Table structure for t_cons_info
-- ----------------------------
DROP TABLE IF EXISTS `t_cons_info`;
CREATE TABLE `t_cons_info`  (
                                `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `cons_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `cons_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `cons_type` int(0) NULL DEFAULT NULL,
                                `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `transformer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `connection_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `balance` decimal(10, 2) NULL DEFAULT NULL,
                                `cons_status` int(0) NULL DEFAULT NULL,
                                `total_consumption` decimal(10, 2) NULL DEFAULT NULL,
                                `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `create_time` timestamp(0) NULL DEFAULT NULL,
                                `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `update_time` timestamp(0) NULL DEFAULT NULL,
                                `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `is_deleted` int(0) NULL DEFAULT 0,
                                `emergency_transformer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `cons_no`(`cons_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cons_info
-- ----------------------------
INSERT INTO `t_cons_info` VALUES ('9a763ab1b498432abd50124865811ef8', '334142142', 'X', 1, NULL, NULL, '00136400', NULL, 0.00, 2, 0.00, '是否', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-07 17:07:48', '上饶广信供电局', '2025-02-07 17:11:44', '上饶广信供电局', 1, NULL);
INSERT INTO `t_cons_info` VALUES ('bfe0771b9ad1433fb2fbc8a0635a2a0b', '00220250208', '广信一中', 4, '广信区中心高中一中', '911-9854-8754', '00036400', '2020-05-30', 10000.00, 1, 10000.00, '民生用户，随时做好保电措施', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:26:17', '上饶广信供电局', NULL, NULL, 0, '10036400');
INSERT INTO `t_cons_info` VALUES ('cddfae83219840c385757275f6dcebee', '33414214', '测试', 4, '413', '12312', '00136400', '2025-02-14', 0.00, 2, 43.00, '134复电', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-07 16:45:40', '上饶广信供电局', '2025-02-07 17:07:55', '上饶广信供电局', 1, NULL);
INSERT INTO `t_cons_info` VALUES ('e74bcfb504a54ec29a5bac77a0c1a745', '01020250208', '胡为', 1, '广信区中心', '17872451245', '00036400', '2025-02-06', 200.35, 1, 1562.51, NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:38:41', '上饶广信供电局', NULL, NULL, 0, NULL);
INSERT INTO `t_cons_info` VALUES ('eacd8ac751ba4998a29e6bf71a2c24de', '00120250207', '广信人民医院', 4, '广信中心区人民医院', '120', '00036400', '2020-01-02', 10000.00, 1, 10000.00, '该用户为民生用户，不能停电，要随时做好保电措施！', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-07 17:18:34', '上饶广信供电局', '2025-02-08 11:26:46', '上饶广信供电局', 0, '10136400');

-- ----------------------------
-- Table structure for t_drone_info
-- ----------------------------
DROP TABLE IF EXISTS `t_drone_info`;
CREATE TABLE `t_drone_info`  (
                                 `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `drone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `drone_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `drone_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `produce_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `run_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `produce_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `view_area` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `create_time` timestamp(0) NULL DEFAULT NULL,
                                 `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `update_time` timestamp(0) NULL DEFAULT NULL,
                                 `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `is_deleted` int(0) NULL DEFAULT 0,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `drone_no_unique_index`(`drone_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_drone_info
-- ----------------------------
INSERT INTO `t_drone_info` VALUES ('1de17c43f0d94836ae165ce5fbd60e0a', 'csa21345312223', '测试123', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250214/f049eaa172004d70bb6558485258323d94a1939c30a2495a9ed11747ff5c132c_p1.png', '2025-02-04', '2025-02-27', '撒旦方法', '的撒v得到', '打发大水', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-14 22:12:21', '上饶广信供电局', '2025-02-14 22:12:53', '上饶广信供电局', 1);
INSERT INTO `t_drone_info` VALUES ('58441a77431445eb9e28aeb701201a80', 'J10T3454', '歼10号', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250214/9f684e75ab8d4d96b0f360e52de4cb09fj.webp', '2025-02-01', '2025-02-26', '上饶无人机专造厂', '上饶广信区县中心区域线路和变压器', '暂无', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-14 22:18:05', '上饶广信供电局', NULL, NULL, 0);

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
                               `line_type` int(0) NULL DEFAULT NULL,
                               `main_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `access_time` timestamp(0) NULL DEFAULT NULL,
                               `create_time` timestamp(0) NULL DEFAULT NULL,
                               `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `update_time` timestamp(0) NULL DEFAULT NULL,
                               `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `is_deleted` int(0) NULL DEFAULT 0,
                               `line_status` int(0) NULL DEFAULT NULL,
                               `unit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_lineinfo
-- ----------------------------
INSERT INTO `t_lineinfo` VALUES ('02df5d1f67e6452884e8827b61d7a84a', '煌固镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640013', 555, 3.99, '煌固镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:07:34', '2025-01-30 21:07:44', '上饶广信供电局', '2025-02-08 10:59:40', '上饶广信供电局', 0, 1, '煌固镇');
INSERT INTO `t_lineinfo` VALUES ('08861aa41edc4e50976b3b5f614017fa', '华坛山镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640011', 362.21, 4.96, '华坛山镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:05:02', '2025-01-30 21:05:13', '上饶广信供电局', '2025-02-08 11:00:02', '上饶广信供电局', 0, 1, '华坛山镇');
INSERT INTO `t_lineinfo` VALUES ('0fb3b7170fa147bb8f655c1891913675', '五府山镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640021', 325.21, 5.21, '五府山镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:18:16', '2025-01-30 21:18:26', '上饶广信供电局', '2025-02-08 10:56:25', '上饶广信供电局', 0, 1, '五府山镇');
INSERT INTO `t_lineinfo` VALUES ('1091606387684e9bb51738548e2df365', '应家乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640008', 265, 3.2, '应家乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:01:42', '2025-01-30 21:01:57', '上饶广信供电局', '2025-02-08 11:00:54', '上饶广信供电局', 0, 1, '应家乡');
INSERT INTO `t_lineinfo` VALUES ('152518471e3e485198ae81c034fa49cb', '湖村乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640006', 306.12, 3.18, '湖村乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 20:57:54', '2025-01-30 20:58:14', '上饶广信供电局', '2025-02-08 11:01:13', '上饶广信供电局', 0, 1, '湖村乡');
INSERT INTO `t_lineinfo` VALUES ('1d029d22e6474dacb102cd051980ca91', '广信一中10kV专线', '5d1f6eed770f40dd9916098fb17934bc', '36400', 0.65, 1.5, '关信城区中心高中学校一中', '10kV', '100A', 3, '0', '2020-01-31 00:00:00', '2025-02-08 11:06:14', '上饶广信供电局', '2025-02-08 11:06:27', '上饶广信供电局', 0, 1, '上饶广信区');
INSERT INTO `t_lineinfo` VALUES ('2580df7618ed4e0bbbc8ad876eb40b6a', '测试', '5d1f6eed770f40dd9916098fb17934bc', '364000202', 0, 0, NULL, NULL, NULL, 3, '0', '2025-01-30 20:19:37', '2025-01-30 20:19:31', '上饶广信供电局', '2025-01-30 20:19:38', '上饶广信供电局', 1, NULL, '板桥');
INSERT INTO `t_lineinfo` VALUES ('2dc16de115c74420a0f211778a01d868', '清水乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640005', 96.25, 3.5, '清水乡中心镇供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 20:56:14', '2025-01-30 20:56:34', '上饶广信供电局', '2025-02-08 11:01:22', '上饶广信供电局', 0, 1, '清水乡');
INSERT INTO `t_lineinfo` VALUES ('39a7f166c3d04c0d88f7f3c369b5876b', '皂头镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640016', 235, 3.5, '皂头镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:10:44', '2025-01-30 21:10:47', '上饶广信供电局', '2025-02-08 10:58:59', '上饶广信供电局', 0, 1, '皂头镇');
INSERT INTO `t_lineinfo` VALUES ('44ea350dc8984946b275501965f2c12c', '尊桥乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640007', 360.35, 1.9, '尊桥乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-23 00:00:00', '2025-01-30 20:59:43', '上饶广信供电局', '2025-02-08 11:01:02', '上饶广信供电局', 0, 1, '尊桥乡');
INSERT INTO `t_lineinfo` VALUES ('4ca46ed654c346ef930306a6d5558a9c', '茶亭镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640015', 354.29, 7.23, '茶亭镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:10:06', '2025-01-30 21:10:21', '上饶广信供电局', '2025-02-08 10:59:18', '上饶广信供电局', 0, 1, '茶亭镇');
INSERT INTO `t_lineinfo` VALUES ('523dd38825f44f8ebcb13ef07549cec1', '旭日街道办分线苏家1线', '5d1f6eed770f40dd9916098fb17934bc', '364000201', 20.21, 1.66, '苏家村委中心定区', '10kV', '100A', 2, 'c0ac449703cb49d0a1860a66dce5c84e', '2025-01-30 21:29:22', '2025-01-30 21:29:41', '上饶广信供电局', '2025-02-08 11:02:24', '上饶广信供电局', 0, 1, '苏家');
INSERT INTO `t_lineinfo` VALUES ('5eec610f338047348e051e43071cbd38', '黄沙岭乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640010', 365.88, 6.2, '黄沙岭乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:04:03', '2025-01-30 21:04:16', '上饶广信供电局', '2025-02-08 11:00:11', '上饶广信供电局', 0, 1, '黄沙岭乡');
INSERT INTO `t_lineinfo` VALUES ('65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', '5d1f6eed770f40dd9916098fb17934bc', '36400', 500, 10, '上饶广信区核心供电区', '110kV', '1100A', 1, '0', '2024-11-01 08:59:00', '2025-01-30 18:39:30', '上饶广信供电局', '2025-02-08 10:55:49', '上饶广信供电局', 0, 1, '上饶广信区');
INSERT INTO `t_lineinfo` VALUES ('67d539db00c94a669f645d09263b757a', '上泸镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640018', 352.22, 3.02, '上泸镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:13:41', '2025-01-30 21:13:58', '上饶广信供电局', '2025-02-08 10:58:39', '上饶广信供电局', 0, 1, '上泸镇');
INSERT INTO `t_lineinfo` VALUES ('9420816acfa54c0ab0a42ac7f0625807', '铁山乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640009', 368.21, 3.9, '铁山乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:03:03', '2025-01-30 21:03:15', '上饶广信供电局', '2025-02-08 11:00:24', '上饶广信供电局', 0, 1, '铁山乡');
INSERT INTO `t_lineinfo` VALUES ('94ba291a677c4dd3848af113f9152c00', '四十八镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640017', 362.554, 6.8, '四十八镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:12:56', '2025-01-30 21:13:05', '上饶广信供电局', '2025-02-08 10:58:51', '上饶广信供电局', 0, 1, '四十八镇');
INSERT INTO `t_lineinfo` VALUES ('a37d87cea988483285f81321ad6febd4', '广信区10kV人民医院专线', '5d1f6eed770f40dd9916098fb17934bc', '36400', 2.32, 2.01, '广信区中心人民医院', '10kv', '100A', 3, '0', '2025-02-06 09:42:55', '2025-02-06 09:43:14', '王文', '2025-02-08 10:55:22', '上饶广信供电局', 0, 1, '上饶广信区');
INSERT INTO `t_lineinfo` VALUES ('a812d83f75a246c59ed957e39d88c22e', '石人乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640004', 301, 5, '石人乡镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 20:51:46', '2025-01-30 20:52:02', '上饶广信供电局', '2025-02-08 11:01:30', '上饶广信供电局', 0, 1, '石人乡');
INSERT INTO `t_lineinfo` VALUES ('ad22013d139445f990fd5dac188bdb77', '罗桥街道35kV主线I线', '5d1f6eed770f40dd9916098fb17934bc', '3640001', 200, 5, '罗桥街道核心供电区域', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 19:34:56', '2025-01-30 19:04:57', '上饶广信供电局', '2025-02-08 11:02:09', '上饶广信供电局', 0, 1, '罗桥街道');
INSERT INTO `t_lineinfo` VALUES ('af14a4f58e314b6db15cd685b8d35122', '罗桥街道分线横山村1线', '5d1f6eed770f40dd9916098fb17934bc', '364000102', 62.21, 1.5, '横山村村委中心区', '10kV', '100A', 2, 'ad22013d139445f990fd5dac188bdb77', '2025-01-30 21:27:20', '2025-01-30 21:27:36', '上饶广信供电局', '2025-02-08 11:02:34', '上饶广信供电局', 0, 1, '横山村');
INSERT INTO `t_lineinfo` VALUES ('af61a369518c45c9989e93d3d31c35bc', '花厅镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640020', 635, 10.25, '花厅镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:17:25', '2025-01-30 21:17:36', '上饶广信供电局', '2025-02-08 10:58:13', '上饶广信供电局', 0, 1, '花厅镇');
INSERT INTO `t_lineinfo` VALUES ('b15343a2e4f74a339951db662d270836', '郑坊镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640012', 325.22, 3.99, '郑坊镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:06:19', '2025-01-30 21:06:31', '上饶广信供电局', '2025-02-08 10:59:47', '上饶广信供电局', 0, 1, '郑坊镇');
INSERT INTO `t_lineinfo` VALUES ('b189816f6b5842029795cbc85bd1a22d', '田墩镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640019', 365.21, 8.2, '田墩镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:16:32', '2025-01-30 21:16:43', '上饶广信供电局', '2025-02-08 10:58:25', '上饶广信供电局', 0, 1, '田墩镇');
INSERT INTO `t_lineinfo` VALUES ('b9c89aa7b47a4e12a76b538fccdbb74b', '望仙乡主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640003', 100, 2, '望仙乡镇供电中心区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 20:50:28', '2025-01-30 20:50:52', '上饶广信供电局', '2025-02-08 11:01:42', '上饶广信供电局', 0, 1, '望仙乡');
INSERT INTO `t_lineinfo` VALUES ('bcc279d98d67463f86f4213aafd19df2', '罗桥街道分线樟村1线', '5d1f6eed770f40dd9916098fb17934bc', '364000101', 65.21, 2.2, '樟村村中心区域', '10kV', '100A', 2, 'ad22013d139445f990fd5dac188bdb77', '2025-01-30 21:20:28', '2025-01-30 21:21:06', '上饶广信供电局', '2025-02-08 11:02:42', '上饶广信供电局', 0, 1, '樟村');
INSERT INTO `t_lineinfo` VALUES ('c0ac449703cb49d0a1860a66dce5c84e', '旭日街道办主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640002', 125, 6, '旭日街道办镇中心区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 20:47:58', '2025-01-30 20:48:23', '上饶广信供电局', '2025-02-08 11:01:56', '上饶广信供电局', 0, 1, '旭日街道办');
INSERT INTO `t_lineinfo` VALUES ('c902b96cb53d4614ba3a5cb1d184ff1d', '旭日街道办分线板桥1线', '5d1f6eed770f40dd9916098fb17934bc', '364000202', 38.32, 3.54, '板桥村委中心', '10kV', '100A', 2, 'c0ac449703cb49d0a1860a66dce5c84e', '2025-01-30 21:30:39', '2025-01-30 21:30:47', '上饶广信供电局', '2025-02-08 11:02:15', '上饶广信供电局', 0, 1, '板桥');
INSERT INTO `t_lineinfo` VALUES ('c9242f1c2d3342a5ad4faa40a972ba96', '测试', '5d1f6eed770f40dd9916098fb17934bc', '3640001', 0.4, 0.4, NULL, NULL, NULL, 3, '0', '2025-02-20 00:00:00', '2025-02-01 20:49:07', '上饶广信供电局', NULL, NULL, 1, 0, '罗桥街道');
INSERT INTO `t_lineinfo` VALUES ('f4fb359a09fc453ab40d861a51ffd9a6', '枫岭头镇主线1线', '5d1f6eed770f40dd9916098fb17934bc', '3640014', 325, 6.2, '枫岭头镇中心供电区', '35kV', '350A', 1, '65653dde05fd4a3aa7483ec6563cfad0', '2025-01-30 21:09:02', '2025-01-30 21:09:12', '上饶广信供电局', '2025-02-08 10:59:29', '上饶广信供电局', 0, 1, '枫岭头镇');

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
INSERT INTO `t_menu` VALUES ('367ddc9346bb4645b7e0cdd1ee578f99', 'a476ab2407404a99be9dc38f04c3aacf', '台区停运事件', 'transformerEvent', 2, 1, '2025-01-31 15:12:21', '2025-01-31 15:12:27', 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_menu` VALUES ('36db6f32c5ff4f03b8c717534ee8d7a2', '797e4d4189e44c4aaec65ea1f64ef73e', '线路资源', 'lineSource', 1, 1, '2025-01-28 10:50:56', '2025-01-28 10:51:12', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('3c5da8df5abc4b7a9237a33018d866bd', '0', '测试', 'test', 2, 1, '2025-01-11 16:13:58', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('46071c0823d0459790bacf2cde16e41c', 'c441995936674b3398be5a47621511eb', '用户资源管理', 'consSource', 2, 1, '2025-01-28 10:54:23', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('4cd4e6e54abe477bbb351cdb9360f339', '797e4d4189e44c4aaec65ea1f64ef73e', '变压器资源', 'transformerSource', 2, 1, '2025-01-28 10:51:46', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('63d332c0af32487daa5d6d0a2d155de9', 'a476ab2407404a99be9dc38f04c3aacf', '台区停运事件报表', 'transformerEventReport', 3, 1, '2025-01-31 15:13:31', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('63ddaa4db4d34cde898fc2fee1b43641', '0', '资源管理', 'source', 2, 1, '2025-01-28 10:48:10', '2025-01-28 10:48:24', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('6ce8dc54ed82417a95b1545032bb0663', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路事件报表', 'lineEventReport', 3, 1, '2025-01-27 19:09:28', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('71209d8c82af46ed8711c026ca397e67', 'f75b896a53d84b19bf7d4e20030bc15e', '数据字典', 'sysDict', 4, 1, '2025-01-28 21:29:15', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('78bd9009908d4a9b819478de40153c60', 'dc1aa7743a964b0082a7f28b3f23cf6a', '电能使用情况', 'electricityUsageStatus', 6, 1, '2025-02-06 09:16:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('797e4d4189e44c4aaec65ea1f64ef73e', '63ddaa4db4d34cde898fc2fee1b43641', '实体资源', 'entity', 1, 1, '2025-01-28 10:49:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('7addbc7e3c1b4eda972b09db94e35bd9', '797e4d4189e44c4aaec65ea1f64ef73e', '无人机资源', 'droneSource', 3, 1, '2025-01-28 10:53:08', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('934b080987164cd3b1834c863aa48a5e', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户停电事件报表', 'consEventReport', 3, 1, '2025-02-06 09:14:38', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('a41e4d3522a74eb3aba4fd931a9d45b0', 'a476ab2407404a99be9dc38f04c3aacf', '变压器信息', 'transformerInfo', 1, 1, '2025-01-31 15:11:55', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('a476ab2407404a99be9dc38f04c3aacf', '0', '台区管理', 'transformer', 4, 1, '2025-01-31 15:11:18', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('b66a1f232f974c7ca47542daa1d40aec', 'dc1aa7743a964b0082a7f28b3f23cf6a', '电费充值记录', 'electricityRechargeHistory', 5, 1, '2025-02-06 09:15:40', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('ba9885cfab6040ad92ea536bff8f920b', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路停电事件', 'lineEvent', 2, 1, '2025-01-12 18:52:36', '2025-01-27 19:12:44', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('c441995936674b3398be5a47621511eb', '63ddaa4db4d34cde898fc2fee1b43641', '虚拟资源', 'virtual', 2, 1, '2025-01-28 10:49:59', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('cb5d56df80854e50bc6d7e5b6d1b457f', '0', '线路管理', 'line', 3, 1, '2025-01-12 18:50:47', '2025-01-28 10:47:31', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('d20c094cffb24cb5a41e6cb2b0bc3b7a', 'f75b896a53d84b19bf7d4e20030bc15e', '用户管理', 'sysUser', 1, 1, '2025-01-11 15:34:39', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('d710b2eec3054a58a702377a566c5c0b', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户停电事件', 'consEvent', 2, 1, '2025-02-06 09:14:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('d91c89667a7240dbbb7a398db999b7d4', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户信息', 'consInfo', 1, 1, '2025-02-06 09:13:37', '2025-02-07 17:39:15', 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_menu` VALUES ('daf1f1d8bbab483d8376e49184b23d52', 'dc1aa7743a964b0082a7f28b3f23cf6a', '客户反馈', 'customerFeedback', 4, 1, '2025-02-06 09:15:05', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('dc1aa7743a964b0082a7f28b3f23cf6a', '0', '用电户管理', 'cons', 5, 1, '2025-02-06 09:12:59', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('e042702fb0994d0e809029d0534d0a53', 'c441995936674b3398be5a47621511eb', '单位管理', 'unitSource', 1, 1, '2025-01-28 10:53:55', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
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
INSERT INTO `t_role` VALUES ('de05cbb207ad4d9c9d531423d81221d7', '开发者', 'developer', '系统的开发者，拥有所有菜单的操作权限！', '2025-01-11 15:46:57', '2025-01-29 16:01:36', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '上饶广信供电局');
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
INSERT INTO `t_role_menu` VALUES ('07211d9136c745b0ad5101a5ad1e2ff4', 'de05cbb207ad4d9c9d531423d81221d7', 'e042702fb0994d0e809029d0534d0a53', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('074eb068a0234e9d9a4c60e76dd29f4f', 'de05cbb207ad4d9c9d531423d81221d7', '71209d8c82af46ed8711c026ca397e67', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('0f8cf4f022ff45068ec5e8ca35ab7595', 'de05cbb207ad4d9c9d531423d81221d7', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('13c19e16eb2d45628f80dfbf3dbad3f2', '23315a6badcb42e78d70ce6d9439d653', 'd91c89667a7240dbbb7a398db999b7d4', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('14a85d7d1fe848a587b385749da4bfcf', '23315a6badcb42e78d70ce6d9439d653', '36db6f32c5ff4f03b8c717534ee8d7a2', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('26f462c008634e33982f5e45c7094749', 'de05cbb207ad4d9c9d531423d81221d7', '78bd9009908d4a9b819478de40153c60', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('29edde6e66e74d8f9fd7bf21655d0e99', 'de05cbb207ad4d9c9d531423d81221d7', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('3168be432b09497dbaaa5aeb8319791b', '23315a6badcb42e78d70ce6d9439d653', '71209d8c82af46ed8711c026ca397e67', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('34e6f97435ac4c88bb2cce437c8c399e', '23315a6badcb42e78d70ce6d9439d653', '6ce8dc54ed82417a95b1545032bb0663', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('427ce677978e495fbfd6ce4a8168c6d5', 'de05cbb207ad4d9c9d531423d81221d7', 'b66a1f232f974c7ca47542daa1d40aec', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('4343264c82c842f5b80749cd2a23e620', '23315a6badcb42e78d70ce6d9439d653', '63d332c0af32487daa5d6d0a2d155de9', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('4c235d2f542540088553e2c147050f18', 'de05cbb207ad4d9c9d531423d81221d7', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('4c92b28d12a641de8d07ced81dacc330', '23315a6badcb42e78d70ce6d9439d653', 'c441995936674b3398be5a47621511eb', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('4ec5320373574214b4585fb20becc86a', '23315a6badcb42e78d70ce6d9439d653', 'a41e4d3522a74eb3aba4fd931a9d45b0', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('57d6abd7c7d04d5c95a59e5da85caa30', '23315a6badcb42e78d70ce6d9439d653', 'b66a1f232f974c7ca47542daa1d40aec', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('5c976bb426834c9f9b6c78e4dc364f11', 'de05cbb207ad4d9c9d531423d81221d7', 'd710b2eec3054a58a702377a566c5c0b', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('5f72862b496c4df3b5e2e0d63eabcfbc', 'de05cbb207ad4d9c9d531423d81221d7', '36db6f32c5ff4f03b8c717534ee8d7a2', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('65e1b52daa6a47a4b61b1f77fb678f03', 'de05cbb207ad4d9c9d531423d81221d7', '03dc8d35a8b24ac196f5abfe91693866', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('68dabb256aa746f6893f98c1e40d7d3c', 'de05cbb207ad4d9c9d531423d81221d7', 'a476ab2407404a99be9dc38f04c3aacf', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6c0cc7e86d094231ab0192821c1f0faa', 'de05cbb207ad4d9c9d531423d81221d7', '797e4d4189e44c4aaec65ea1f64ef73e', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6c39dbc2927b4cee8f82896708daf404', 'de05cbb207ad4d9c9d531423d81221d7', 'dc1aa7743a964b0082a7f28b3f23cf6a', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6f50d82c546946d5bb2d0f6c62af0600', 'de05cbb207ad4d9c9d531423d81221d7', '934b080987164cd3b1834c863aa48a5e', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('7423ed0ebbee4d2a8272a28a6838658c', 'de05cbb207ad4d9c9d531423d81221d7', 'c441995936674b3398be5a47621511eb', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('747253537e914a3d8fcf8336e5e9b5e9', '23315a6badcb42e78d70ce6d9439d653', '367ddc9346bb4645b7e0cdd1ee578f99', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('77056655b59c4d7a932a20f57b95bd3a', 'de05cbb207ad4d9c9d531423d81221d7', '63ddaa4db4d34cde898fc2fee1b43641', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('78f34761c8c24cb1be68384c840518f4', 'de05cbb207ad4d9c9d531423d81221d7', 'ba9885cfab6040ad92ea536bff8f920b', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('7961264e5bb84ff3b9df9e790522a150', '23315a6badcb42e78d70ce6d9439d653', 'dc1aa7743a964b0082a7f28b3f23cf6a', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8020c1099d674db4af60446a22463836', 'de05cbb207ad4d9c9d531423d81221d7', 'd91c89667a7240dbbb7a398db999b7d4', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('815d53f18b9046279a8f70d2f7887f6e', 'de05cbb207ad4d9c9d531423d81221d7', 'daf1f1d8bbab483d8376e49184b23d52', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8d70d57fd1f0439ea40f0783d606ad62', 'de05cbb207ad4d9c9d531423d81221d7', 'e2c56b46a6624ebf87e35c256a44af5d', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8f1275b2cd464bf9a0bfb978f1ddf943', '23315a6badcb42e78d70ce6d9439d653', '4cd4e6e54abe477bbb351cdb9360f339', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('942f436e043a4d7395db96dd2f50e563', 'de05cbb207ad4d9c9d531423d81221d7', '7addbc7e3c1b4eda972b09db94e35bd9', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('967cbaabf0dd4dda90a51740b9bcb2e0', 'de05cbb207ad4d9c9d531423d81221d7', '4cd4e6e54abe477bbb351cdb9360f339', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('9c7dcab641cd4a9785074622be0b696c', '23315a6badcb42e78d70ce6d9439d653', '934b080987164cd3b1834c863aa48a5e', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a2ab5b4149bd48de9d6d818088607bf7', '23315a6badcb42e78d70ce6d9439d653', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a3654b00c846490689d6a5007d2d764f', '23315a6badcb42e78d70ce6d9439d653', '797e4d4189e44c4aaec65ea1f64ef73e', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a4e4779347b84bc499108c1a9facd992', '23315a6badcb42e78d70ce6d9439d653', 'ba9885cfab6040ad92ea536bff8f920b', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a9348b5b088a48a0b061375e14e20d2d', '23315a6badcb42e78d70ce6d9439d653', '78bd9009908d4a9b819478de40153c60', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('ab95340082964e99aa38bfb55c000208', 'de05cbb207ad4d9c9d531423d81221d7', '63d332c0af32487daa5d6d0a2d155de9', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('ac49d44ea35e4dc2be3000121e548f7a', '23315a6badcb42e78d70ce6d9439d653', 'a476ab2407404a99be9dc38f04c3aacf', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('acecd74ece5f4019b695897f2013ac84', '23315a6badcb42e78d70ce6d9439d653', '7addbc7e3c1b4eda972b09db94e35bd9', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('adb6e96b913e49e590ac7c7017ca3e7d', 'de05cbb207ad4d9c9d531423d81221d7', '367ddc9346bb4645b7e0cdd1ee578f99', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('b7158d97d4964cb184b5473cffe9f461', '23315a6badcb42e78d70ce6d9439d653', 'd710b2eec3054a58a702377a566c5c0b', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('c74e81f6df6f41cb8f72153ce6ec25b8', 'de05cbb207ad4d9c9d531423d81221d7', '6ce8dc54ed82417a95b1545032bb0663', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('cdb81c54b69543e388ddef91ccd22eb4', '23315a6badcb42e78d70ce6d9439d653', 'e042702fb0994d0e809029d0534d0a53', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('d1593c609c0b4e67afb2bfa53eee5b81', '23315a6badcb42e78d70ce6d9439d653', 'daf1f1d8bbab483d8376e49184b23d52', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('d2a63ba115e947c895a381bc1cd7de9d', '23315a6badcb42e78d70ce6d9439d653', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('d3e2258bf45a4e99bcf765e028370663', 'de05cbb207ad4d9c9d531423d81221d7', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('d8f918a30d2c42eb98be61769772790e', '23315a6badcb42e78d70ce6d9439d653', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('dc1026acd95d4cb59c26ef002a1bdf1a', '23315a6badcb42e78d70ce6d9439d653', '46071c0823d0459790bacf2cde16e41c', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('e276035a972841b2bf6c51fec14a115d', '23315a6badcb42e78d70ce6d9439d653', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-02-06 11:19:12', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('ee430cfc7ae14ce08cb8f05a4f6b31c7', 'de05cbb207ad4d9c9d531423d81221d7', '46071c0823d0459790bacf2cde16e41c', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f65cae25b781454fb757bd52412445d2', 'de05cbb207ad4d9c9d531423d81221d7', 'a41e4d3522a74eb3aba4fd931a9d45b0', '2025-02-06 09:17:45', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('fce737284f5a4ca29189616fa76164ab', '23315a6badcb42e78d70ce6d9439d653', '63ddaa4db4d34cde898fc2fee1b43641', '2025-02-06 11:19:12', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_transformerinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_transformerinfo`;
CREATE TABLE `t_transformerinfo`  (
                                      `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `transformer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `transformer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `rated_capacity` double NULL DEFAULT NULL,
                                      `line_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `line_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `transformer_type` int(0) NULL DEFAULT NULL,
                                      `primary_voltage` double NULL DEFAULT NULL,
                                      `secondary_voltage` double NULL DEFAULT NULL,
                                      `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `install_date` timestamp(0) NULL DEFAULT NULL,
                                      `maintenance_records` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                      `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `create_time` timestamp(0) NULL DEFAULT NULL,
                                      `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `update_time` timestamp(0) NULL DEFAULT NULL,
                                      `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `is_deleted` int(0) NULL DEFAULT 0,
                                      PRIMARY KEY (`id`) USING BTREE,
                                      UNIQUE INDEX `transformer_code`(`transformer_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_transformerinfo
-- ----------------------------
INSERT INTO `t_transformerinfo` VALUES ('3d4d5b9cc5dd476c9383fd29d8aeec27', '00036400', '广信区域中心01号公变', 'TM-001', 200.26, '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', 1, 400.21, 203.24, '上饶市中心变压器专造厂', '2021-09-01 00:00:00', '2024年10月21号因老旧问题进行系统维修。', '上饶广信区县中心小巷灾', '目前以可用，电压较高，请小心行事。', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-01 22:57:34', '上饶广信供电局', '2025-02-08 11:07:04', '上饶广信供电局', 0);
INSERT INTO `t_transformerinfo` VALUES ('3e5d9d56c9464a288b6b0329436f8e6a', '1284912340fsdggs', '测试sdg', 'TM-001', 0.5, '0fb3b7170fa147bb8f655c1891913675', '五府山镇主线1线', 1, 0.2, 0, 'guanxq', '2025-02-01 22:49:38', 'sada', 'dasd', 'dsa', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-01 22:49:42', '上饶广信供电局', '2025-02-01 22:50:23', '上饶广信供电局', 1);
INSERT INTO `t_transformerinfo` VALUES ('52707f1253fc46bca4fd2f0af2d1a793', '10036400', '广信一中01号专变', 'TM-001', 500, '1d029d22e6474dacb102cd051980ca91', '广信一中10kV专线', 2, 822, 254, NULL, '2020-05-29 00:00:00', '无', '广信区中心一中高中', '该变压器为广信一中的专有变压器，为应急而准备', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:17:59', '上饶广信供电局', '2025-02-08 11:19:40', '上饶广信供电局', 0);
INSERT INTO `t_transformerinfo` VALUES ('a2cf3bafe0a147c4b6da55a43ccce28c', '10136400', '广信人民医院01号专变', 'TM-001', 103.2, 'a37d87cea988483285f81321ad6febd4', '广信区10kV人民医院专线', 2, 23.21, 10.21, '上饶变压器制造公司', '2025-02-06 09:46:00', '暂无', '广信区中心人民医院总部', '当人民医院的主供电变压器发生停电时启用该特定应急变压器', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-06 09:46:51', '王文', '2025-02-08 11:19:51', '上饶广信供电局', 0);
INSERT INTO `t_transformerinfo` VALUES ('b7d34d8d50174af681b2c483e9798e45', '00136400', '广信中心区02号公变', 'TM-002', 521, '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', 1, 878, 245, '上饶变压器专造公司', '2025-02-14 19:30:46', '无', '广信中心区域', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-02-14 19:31:02', '上饶广信供电局', NULL, NULL, 0);

-- ----------------------------
-- Table structure for t_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit`  (
                           `unit_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           `unit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `parent_unit_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `unit_level` int(0) NULL DEFAULT NULL,
                           `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `create_time` timestamp(0) NULL DEFAULT NULL,
                           `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `update_time` timestamp(0) NULL DEFAULT NULL,
                           `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                           `is_deleted` int(0) NULL DEFAULT 0,
                           `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_unit
-- ----------------------------
INSERT INTO `t_unit` VALUES ('364000403', '荷叶村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:22:05', '上饶广信供电局', NULL, NULL, 0, '04edff5bac794176b72cd1a12d19fcf9');
INSERT INTO `t_unit` VALUES ('3640005', '清水乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:45:13', '上饶广信供电局', NULL, NULL, 0, '084c9831022a4ead95d8fcbb434c86c8');
INSERT INTO `t_unit` VALUES ('3640019', '田墩镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:56:22', '上饶广信供电局', NULL, NULL, 0, '0cd2469aae8a40218eb414fa33bb77f2');
INSERT INTO `t_unit` VALUES ('3640001', '罗桥街道', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:02:27', '上饶广信供电局', NULL, NULL, 0, '0de5a94cd2324bf5aab6589efe2bb418');
INSERT INTO `t_unit` VALUES ('3640003', '望仙乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:44:26', '上饶广信供电局', NULL, NULL, 0, '10565c7147fc4a96be9a10ebebfa81b8');
INSERT INTO `t_unit` VALUES ('3640020', '花厅镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:56:39', '上饶广信供电局', NULL, NULL, 0, '170d8c01f8744dbbb495e812aaf301cb');
INSERT INTO `t_unit` VALUES ('364000506', '左溪', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:35:27', '上饶广信供电局', NULL, NULL, 0, '1991309bb2c1446e80113d9e9c9355b2');
INSERT INTO `t_unit` VALUES ('364000408', '汪宅村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:24:54', '上饶广信供电局', NULL, NULL, 0, '1af040521044468b8598142ab171a255');
INSERT INTO `t_unit` VALUES ('364000507', '常阜', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:36:07', '上饶广信供电局', NULL, NULL, 0, '1c597c12513249908ff2d52521bce098');
INSERT INTO `t_unit` VALUES ('364000410', '石人村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:25:52', '上饶广信供电局', NULL, NULL, 0, '1d626683ad9a4e5f80bd5e3bb0d26505');
INSERT INTO `t_unit` VALUES ('364000102', '横山村', '3640001', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:59:44', '上饶广信供电局', NULL, NULL, 0, '1dc57985cf054b1ab5489e49b03814e3');
INSERT INTO `t_unit` VALUES ('364000502', '洪家', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:33:01', '上饶广信供电局', NULL, NULL, 0, '211ab47bb1a741fb84fe01c65615d532');
INSERT INTO `t_unit` VALUES ('36444', '测试', '0', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:41:12', '上饶广信供电局', NULL, NULL, 1, '25865151071a482d875ccf2b3d3201d2');
INSERT INTO `t_unit` VALUES ('3640002', '旭日街道办', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:40:40', '上饶广信供电局', NULL, NULL, 0, '28294ced35994aefa6d3201889176397');
INSERT INTO `t_unit` VALUES ('364000503', '清水', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:33:40', '上饶广信供电局', NULL, NULL, 0, '2d80ef73f9564bfbacbf38a6a4c4b9fa');
INSERT INTO `t_unit` VALUES ('3640017', '四十八镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:55:41', '上饶广信供电局', NULL, NULL, 0, '3218c1f28c3f4e139c17147fb954c915');
INSERT INTO `t_unit` VALUES ('3640021', '五府山镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:56:57', '上饶广信供电局', NULL, NULL, 0, '3309effbc3074ea299f7c698ec92ad74');
INSERT INTO `t_unit` VALUES ('364000303', '望仙村', '3640003', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:10:26', '上饶广信供电局', NULL, NULL, 0, '3419ea55c8104cb19fa92d820eca474d');
INSERT INTO `t_unit` VALUES ('364000402', '毛宅村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:21:33', '上饶广信供电局', NULL, NULL, 0, '34b51340744545a89c11a753a75d0781');
INSERT INTO `t_unit` VALUES ('364000304', '大济村', '3640003', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:10:57', '上饶广信供电局', NULL, NULL, 0, '37e50c83ac54482385e550aa52c777b6');
INSERT INTO `t_unit` VALUES ('364000504', '双溪', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:34:13', '上饶广信供电局', NULL, NULL, 0, '3849fb0e782e42d0a4c0337c7efb5355');
INSERT INTO `t_unit` VALUES ('364000404', '郑宅村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:22:34', '上饶广信供电局', NULL, NULL, 0, '3b533fd20320480599e037eecf4b0e43');
INSERT INTO `t_unit` VALUES ('3640010', '黄沙岭乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:52:19', '上饶广信供电局', NULL, NULL, 0, '401c488964a64a2e846a5933981e9c16');
INSERT INTO `t_unit` VALUES ('364000201', '苏家', '3640002', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:05:09', '上饶广信供电局', NULL, NULL, 0, '42c0cceca2e34eb1bf9782cf1873d9bf');
INSERT INTO `t_unit` VALUES ('3640016', '皂头镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:55:21', '上饶广信供电局', NULL, NULL, 0, '5606f4458c89474a8f4a229d0966051d');
INSERT INTO `t_unit` VALUES ('364000302', '祝狮村', '3640003', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:09:32', '上饶广信供电局', NULL, NULL, 0, '5fc4cb52a6ee42bea6d2248bc19d9887');
INSERT INTO `t_unit` VALUES ('3640011', '华坛山镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:53:24', '上饶广信供电局', NULL, NULL, 0, '6197eb2f4dca4731866cd8cd65857b97');
INSERT INTO `t_unit` VALUES ('364000405', '杉树村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:23:08', '上饶广信供电局', NULL, NULL, 0, '61f1b2bbe1614c0e89221bbb1f711cd2');
INSERT INTO `t_unit` VALUES ('3640015', '茶亭镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:55:04', '上饶广信供电局', NULL, NULL, 0, '709519225c9e4895a9364c0983f588ab');
INSERT INTO `t_unit` VALUES ('3640006', '湖村乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:45:33', '上饶广信供电局', NULL, NULL, 0, '727285e3e3a447799083e6a81a2de294');
INSERT INTO `t_unit` VALUES ('36400', '上饶广信区', '0', 20, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 19:35:30', '上饶广信供电局', '2025-01-29 19:59:24', '上饶广信供电局', 0, '742bb1cc11364b4c8a712e5df5930843');
INSERT INTO `t_unit` VALUES ('364000406', '苏桥村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:23:46', '上饶广信供电局', NULL, NULL, 0, '8d39c227fe234da8be3f370b3ca3056f');
INSERT INTO `t_unit` VALUES ('364000305', '葛路村', '3640003', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:11:27', '上饶广信供电局', NULL, NULL, 0, '8e57b586bb99451c9ce46b153262eacb');
INSERT INTO `t_unit` VALUES ('3640007', '尊桥乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:50:50', '上饶广信供电局', NULL, NULL, 0, '914421b3afde4865acb208df27963705');
INSERT INTO `t_unit` VALUES ('364000202', '板桥', '3640002', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:05:36', '上饶广信供电局', NULL, NULL, 0, '973690ef958e468ba625f43a6dcfea6a');
INSERT INTO `t_unit` VALUES ('00000', '测啊', '0', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 18:45:16', '上饶广信供电局', NULL, NULL, 1, '9ef5a9e5bf6f46f3ba1bc86ede9092e7');
INSERT INTO `t_unit` VALUES ('364000407', '青山村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:24:19', '上饶广信供电局', NULL, NULL, 0, 'b8a92b5f7bbf408cbf8ebf7219d138cd');
INSERT INTO `t_unit` VALUES ('364000101', '樟村', '3640001', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:59:05', '上饶广信供电局', NULL, NULL, 0, 'b972bfb394644f008bc99cecc89e018f');
INSERT INTO `t_unit` VALUES ('364000409', '桐圩村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:25:21', '上饶广信供电局', NULL, NULL, 0, 'b9993b0ae45d45c8be3e1a5736e0dfb4');
INSERT INTO `t_unit` VALUES ('3640008', '应家乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:51:42', '上饶广信供电局', NULL, NULL, 0, 'ba63d7b005d3475cba3b8bef025f9c25');
INSERT INTO `t_unit` VALUES ('3640018', '上泸镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:56:03', '上饶广信供电局', NULL, NULL, 0, 'c7b1f64a22b64faf8eeaea4c8651d93f');
INSERT INTO `t_unit` VALUES ('3640004', '石人乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:44:53', '上饶广信供电局', NULL, NULL, 0, 'cc1bacdd108b4dd8968b41c2679340f2');
INSERT INTO `t_unit` VALUES ('364000505', '东汪村', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:34:54', '上饶广信供电局', NULL, NULL, 0, 'd3ddabcb95584ebfb87823adf53cd5c9');
INSERT INTO `t_unit` VALUES ('364000501', '墩底', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:32:14', '上饶广信供电局', NULL, NULL, 0, 'd61c4b8f720444eb8361dc1a52feb665');
INSERT INTO `t_unit` VALUES ('364000301', '南峰村', '3640003', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 21:08:44', '上饶广信供电局', NULL, NULL, 0, 'e6c0d6e2dcc342148fde96c10dd383c5');
INSERT INTO `t_unit` VALUES ('3640012', '郑坊镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:53:43', '上饶广信供电局', NULL, NULL, 0, 'e7c2a48b8e274021840f7099085c29f7');
INSERT INTO `t_unit` VALUES ('364000508', '前汪', '3640005', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 20:36:38', '上饶广信供电局', NULL, NULL, 0, 'f2974b9e53764c3cbf1f9e4057b259fe');
INSERT INTO `t_unit` VALUES ('3640013', '煌固镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:54:01', '上饶广信供电局', '2025-01-29 20:54:18', '上饶广信供电局', 0, 'f91d5b663e854dd8bbd702e03a296393');
INSERT INTO `t_unit` VALUES ('364000401', '双龙村', '3640004', 40, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-30 15:21:03', '上饶广信供电局', NULL, NULL, 0, 'f9aefc97c98549f1b17793a1e9ede3d1');
INSERT INTO `t_unit` VALUES ('3640009', '铁山乡', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:52:01', '上饶广信供电局', NULL, NULL, 0, 'fd2fea8d9e424646b733ee0ab8a3aac1');
INSERT INTO `t_unit` VALUES ('3640014', '枫岭头镇', '36400', 30, '5d1f6eed770f40dd9916098fb17934bc', '2025-01-29 20:54:45', '上饶广信供电局', NULL, NULL, 0, 'fd895b6adf1e4863bcacb985e1103377');

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
INSERT INTO `t_user` VALUES ('0ed453d14de143f58c6a54b0d6979a95', 'xk123', 'f379eaf3c831b04de153469d1bec345e', '肖大侠', 1, 3, '江西吉安', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/7a84d8082f924f9eb7c6fbce3ccaa47f33068c1ae01941d2b53a7efd2f806203_t1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 20:08:23', '2025-01-29 16:00:42', 0, 1, '13667961644', '系统开发者', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('355e4d747e104801854d0a46f7ad73c3', 'ww123', 'f379eaf3c831b04de153469d1bec345e', '王文', 1, 2, '赣州', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/4315ec15f7e34674a91f3e64c23fedaa01.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 19:51:21', '2025-01-29 16:00:44', 0, 2, '18779867786', '聪明人', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('5d1f6eed770f40dd9916098fb17934bc', 'wangwen', 'e10adc3949ba59abbe56e057f20f883e', '上饶广信供电局', 1, 1, '江西上饶', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/cdbda25360104e449eda7beef697ca14gdgs.jpg', NULL, '-1', '2024-10-04 17:37:50', '2024-12-26 20:01:22', 0, 3, '0791-95598', '该账户为供电公司账户，权限最大，可以操作所有菜单。', NULL, '赣州供电局');
INSERT INTO `t_user` VALUES ('7d12fff3e576406ca5cec1840cc0d9f6', 'wanwen', '96e79218965eb72c92a549dd5a330112', '王德法', 1, 3, NULL, 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250128/0d283a606a034bfc947becb4b749e21ae54085f340d34460945e40f9b3ceabbc_g21.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-29 16:39:08', '2025-02-07 17:39:56', 0, 2, NULL, NULL, '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('bd375d793ae24830891689038d0cf054', 'wx123', 'f379eaf3c831b04de153469d1bec345e', '王辛', 1, 3, '江西省上饶市广信区', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241228/e5ee66fd0925407f96890769acd80bb794a1939c30a2495a9ed11747ff5c132c_p1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-28 17:02:24', '2025-01-29 16:00:40', 0, 1, '1582025202', '维修电路，及时排查', '王文', '上饶广信供电局');

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
