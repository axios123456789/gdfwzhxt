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

 Date: 29/03/2025 16:18:25
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
INSERT INTO `t_code` VALUES ('05555206cb21475f85d8aacdd9c671b1', 2, '已复电', 't_transformer_event_status', '2025-02-16 17:29:18', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('0ceb50d85b2d498cade95ffb42586d29', 1, '测试', 't_test', '2025-01-29 10:33:30', NULL, 1, NULL, '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('0dcbb5d1138f4213a8d82db3b786533c', 1, '待处理', 't_person_accept_status', '2025-03-09 19:00:29', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('0fc26de206b24dcc8348c0c1d1497584', 4, '已生成事件和工单', 't_view_record_handle_flag', '2025-03-18 21:00:16', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('127fed7a41e148db831183e60eb161fb', 40, '乡村级', 't_unit_level', '2025-01-29 17:25:43', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('14817bb918af49e6a45093c24e159945', 4, '线路电流突变', 't_transformer_event_type', '2025-02-16 17:28:00', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('16b3a46360cf4fb0b200a774f231b610', 3, '已生成工单', 't_view_record_handle_flag', '2025-03-18 21:00:05', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('1722aea2eca04a148791e92f7fbbe574', 1, '未处理', 't_view_record_handle_flag', '2025-03-18 20:59:39', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('2132deb36c714f6784ce27a44370e401', 1, '线路停运', 't_cons_event_type', '2025-02-16 20:00:57', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('2d898238ca354d4f930e7f4bb6a06538', 2, '欠费', 't_cons_consStatus', '2025-02-06 09:25:23', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3afaff22edad4171baf7c7a045e79a86', 1, '无人机巡视', 't_work_order_source', '2025-02-23 17:39:29', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3b1bbd68af064084bfc4a1ccc8b2b0b6', 1, '配变本身故障', 't_transformer_event_type', '2025-02-16 17:26:51', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3b506208221d4d00b258d80754db5d99', 1, '未复电', 't_transformer_event_status', '2025-02-16 17:29:10', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3b6d998aebc049aba0b45899cabbfb00', 3, '用户停电事件', 't_work_order_event_type', '2025-02-27 18:46:01', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3be144d89c0943859aa519c168c771db', 2, '线路跳闸', 't_transformer_event_type', '2025-02-16 17:27:11', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('3cdd3b24646a4517a6c9c96d98dd87c8', 2, '已复电', 't_line_event_status', '2025-02-22 15:04:10', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('4bc9c251730342e8a5df0a9c6e8fd573', 4, '已提交', 't_person_accept_status', '2025-03-09 19:01:23', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('5586351a-9428-11ef-98c4-005056c00001', 1, '公司账号', 't_user_level', '2024-10-27 13:57:22', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('5626d54ae9c44789853616c820c8f0a4', 1, '线路', 't_view_record_equip_type', '2025-03-18 20:57:19', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('56313e7c4c7a4ae5a15dc507f93b47db', 2, '变压器故障', 't_cons_event_type', '2025-02-15 16:22:09', '2025-02-16 20:01:03', 0, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('60d0cfe8c3904de3b5bec6f3ad200bca', 30, '镇所级', 't_unit_level', '2025-01-29 17:25:15', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('6180cd54-9429-11ef-98c4-005056c00001', 1, '正常', 't_user_status', '2024-10-27 14:04:52', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('67fe17e031dc4d3989fadf8b95d364e4', 4, '民生', 't_cons_consType', '2025-02-06 09:24:17', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('67fec8dc-9429-11ef-98c4-005056c00001', 0, '异常', 't_user_status', '2024-10-27 14:05:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('692086f027f3451eb9b2646e6a2f9f86', 1, '公变', 't_transformer_type', '2025-02-01 17:55:53', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('693ed7cab6c648729da5a06e55994042', 6, '已完成', 't_work_order_status', '2025-02-23 17:43:45', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('6c9adfb5c28e4f5792aee7a3251b3782', 50, '村组级', 't_unit_level', '2025-01-29 17:27:25', NULL, 1, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('720314fdb66d40f099d17a6442a0247c', 2, '配变停运事件', 't_work_order_event_type', '2025-02-27 18:45:45', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('76bbaa931a624e8e8fdfd295b512ca57', 1, '个人', 't_cons_consType', '2025-02-06 09:23:20', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('7eadb86f43814be6bb6a244b361f5524', 0, '回收', 't_line_status', '2025-01-29 21:31:34', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('81ecb92a19d34bb09633dc9b78525c4e', 6, '已完成', 't_person_accept_status', '2025-03-12 20:38:12', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('82fa40d92a614ce0abaca21557ef6501', 3, '公企', 't_cons_consType', '2025-02-06 09:24:04', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('83fced153d17464d92db7f9e7fbd2c13', 3, '专线', 't_line_type', '2025-01-29 10:36:48', NULL, 0, '专门给独立的个体配的线路，应付特殊情况', '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('89e908d489804801bfce5217259847a2', 2, '已生成停电事件', 't_view_record_handle_flag', '2025-03-18 20:59:51', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('8dc7f2d4635141aba4585205a3fe9482', 3, '已派单', 't_work_order_status', '2025-02-23 17:42:43', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('9abe8d3d-966b-11ef-a4bf-005056c00001', 1, '男性', 't_user_sex', '2024-10-30 11:03:57', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('9edbddd91b46486092ef6363bef1c273', 1, '正常', 't_cons_consStatus', '2025-02-06 09:25:16', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('a0ed7d659ce140a3bc7718cedb0d2a6a', 5, '支线故障', 't_transformer_event_type', '2025-02-16 17:28:35', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('a397de7b28414a349960cd2f6583bc90', 3, '自建工单', 't_work_order_source', '2025-02-23 17:40:17', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('a7414f98-966b-11ef-a4bf-005056c00001', 2, '女性', 't_user_sex', '2024-10-30 11:04:18', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('a858308a36aa438f9f30d2ac6280bdaf', 2, '主动抢修工单', 't_work_order_type', '2025-02-23 17:38:13', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('aa20ee3f668f44cd8b3e4745380abaf1', 2, '处理中', 't_person_accept_status', '2025-03-09 19:00:49', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('ad0ed8ec03264f6aa76847305f6eb9bc', 1, '未复电', 't_cons_event_status', '2025-02-15 16:23:54', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('adc5e729242a4f2bb0e7a1e806edc3d0', 1, '投入', 't_line_status', '2025-01-29 21:31:21', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('ae03f7d76ff24e428459793563770cdb', 4, '其他来源', 't_work_order_source', '2025-02-23 17:40:48', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('af417e20792b4b3d807f3473e0ab5533', 1, '未处理', 't_work_order_status', '2025-02-23 17:41:55', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('b487ae3af75646e3aa1aaa6f00c2d2d1', 4, '已接单', 't_work_order_status', '2025-02-23 17:43:06', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('bc884c18-9428-11ef-98c4-005056c00001', 2, '管理员账号', 't_user_level', '2024-10-27 14:00:15', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('bdbd2bc15ad14132aab9e4491fa6dca6', 1, '未复电', 't_line_event_status', '2025-02-22 15:03:54', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('be2d5c29cf8942ffa7ded980875ffc8f', 5, '被驳回', 't_person_accept_status', '2025-03-09 19:01:38', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('c731a8910ba84e809f343645ddca5be8', 2, '专变', 't_transformer_type', '2025-02-01 17:56:05', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('cdc7d27b77ed4bdfb6fd3a1aff6b3c1c', 2, '已复电', 't_cons_event_status', '2025-02-15 16:24:10', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('cf4fea45-9428-11ef-98c4-005056c00001', 3, '领导账号', 't_user_level', '2024-10-27 14:00:46', NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('dadd8e1f3ad24fa6ae18c2d5e9deb126', 1, '2', 't_test', '2025-01-29 10:38:10', NULL, 1, NULL, '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('dd14f7b9dda449c7821d601aec5be904', 2, '待受理', 't_work_order_status', '2025-02-23 17:42:09', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('e06e4423660e457193121b8b65883d17', 2, '故障停运', 't_line_event_type', '2025-02-22 15:03:33', '2025-02-22 20:25:16', 0, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('e1f25615cdd44ae69f499d004dfb0cff', 4, '用户欠费', 't_cons_event_type', '2025-02-15 16:22:52', '2025-02-16 20:01:14', 0, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('e2f0f2baaa014f3c8e7edff57fb09256', 3, '用户电表故障', 't_cons_event_type', '2025-02-15 16:22:34', '2025-02-16 20:01:09', 0, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('e3ea5631d9f64b4b82c04710b133043b', 20, '县级', 't_unit_level', '2025-01-29 17:24:27', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('ecd975c3f736462caeb0a5ea35883e5d', 1, '线路停运事件', 't_work_order_event_type', '2025-02-27 18:45:26', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('ef02688e4bb34409b2cf93e8604f6aad', 1, '41', 't_test', '2025-01-29 20:38:50', '2025-01-29 20:38:56', 1, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('f05b75df6e28421ebf3e316871402aba', 2, '用户反馈', 't_work_order_source', '2025-02-23 17:39:47', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('f126c3b6db29450daee12da4abdc7d0f', 1, '主线', 't_line_type', '2025-01-29 10:31:53', NULL, 0, '一般为源头的线路', '赣州供电局', NULL);
INSERT INTO `t_code` VALUES ('f38c297115a44d7b8667e92cc457502c', 3, '非抢工单', 't_work_order_type', '2025-02-23 17:38:31', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('f4baf3eb47fb4862b96687158ec78c13', 3, '线路检修停运', 't_transformer_event_type', '2025-02-16 17:27:37', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('f5fb7d85358447be8231da71a0621079', 1, '故障报修工单', 't_work_order_type', '2025-02-23 17:37:56', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('f7538abf247b467a8c85fc3854a16c47', 1, '计划停运', 't_line_event_type', '2025-02-22 15:03:23', '2025-02-22 20:25:22', 0, NULL, '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_code` VALUES ('f80ad5c812e24d85a19ca4ecab71d2a4', 2, '变压器', 't_view_record_equip_type', '2025-03-18 20:57:27', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('fa05aea0281741a5b819b2e12ba54c1a', 5, '已督办', 't_work_order_status', '2025-02-23 17:43:25', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('faa2e341c7b84cc183a5515dea23f755', 3, '督办中', 't_person_accept_status', '2025-03-09 19:01:04', NULL, 0, NULL, '上饶广信供电局', NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c00001', 3, '员工账号', 't_user_level', '2024-10-27 14:02:03', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fce03f73-9428-11ef-98c4-005056c02002', 3, '无', 't_user_sex', '2024-12-26 11:51:32', NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_code` VALUES ('fda47e0b0943475f8614d6d0fad6bfe7', 2, '支线', 't_line_type', '2025-01-29 10:32:03', '2025-01-29 10:32:33', 0, '一般是主线下的线路', '赣州供电局', '赣州供电局');
INSERT INTO `t_code` VALUES ('ff803984de95482ebd4048c10c345a1a', 2, '私企', 't_cons_consType', '2025-02-06 09:23:49', NULL, 0, NULL, '上饶广信供电局', NULL);

-- ----------------------------
-- Table structure for t_cons_event
-- ----------------------------
DROP TABLE IF EXISTS `t_cons_event`;
CREATE TABLE `t_cons_event`  (
                                 `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `cons_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `cons_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `power_outage_time` timestamp(0) NULL DEFAULT NULL,
                                 `power_outage_duration` decimal(10, 2) NULL DEFAULT NULL,
                                 `power_supply_time` timestamp(0) NULL DEFAULT NULL,
                                 `power_outage_type` int(0) NULL DEFAULT NULL,
                                 `status` int(0) NULL DEFAULT NULL,
                                 `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `create_time` timestamp(0) NULL DEFAULT NULL,
                                 `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `update_time` timestamp(0) NULL DEFAULT NULL,
                                 `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `transformer_event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `line_event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `is_generate_work_order` int(0) NULL DEFAULT NULL,
                                 PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cons_event
-- ----------------------------
INSERT INTO `t_cons_event` VALUES ('03c3d3a4-0334-11f0-957d-005056c00001', '01120250222', '王小条', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 1, 2, '广信区110kV源端母线I线在2025-03-17 20:30:01发生故障停运。线路发生该类型停电的具体原因是线路发生故障断裂！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, NULL, 'c5ea7dc5ffd44572902f99a094aa745d', NULL);
INSERT INTO `t_cons_event` VALUES ('03c3dc5b-0334-11f0-957d-005056c00001', '01220250222', '王文', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 1, 2, '广信区110kV源端母线I线在2025-03-17 20:30:01发生故障停运。线路发生该类型停电的具体原因是线路发生故障断裂！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, NULL, 'c5ea7dc5ffd44572902f99a094aa745d', NULL);
INSERT INTO `t_cons_event` VALUES ('03c3deb1-0334-11f0-957d-005056c00001', '01020250208', '胡为', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 1, 2, '广信区110kV源端母线I线在2025-03-17 20:30:01发生故障停运。线路发生该类型停电的具体原因是线路发生故障断裂！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, NULL, 'c5ea7dc5ffd44572902f99a094aa745d', NULL);
INSERT INTO `t_cons_event` VALUES ('ad25baa8dfcb4e4dbc731fd6d5804514', '01120250222', '王小条', '2025-03-21 00:00:00', 134.68, '2025-03-23 00:48:41', 3, 2, '该用户户表停转了', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 13:44:03', '上饶广信供电局', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_cons_event` VALUES ('b7d7d10b-0737-11f0-8af5-005056c00001', '01120250222', '王小条', '2025-03-23 00:07:05', 0.00, NULL, 1, 1, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('b7d7e975-0737-11f0-8af5-005056c00001', '01220250222', '王文', '2025-03-23 00:07:05', 0.00, NULL, 1, 1, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('b7d8014b-0737-11f0-8af5-005056c00001', '01020250208', '胡为', '2025-03-23 00:07:05', 0.00, NULL, 1, 1, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('bd72a807-0792-11f0-93c5-005056c00001', '01120250222', '王小条', '2025-03-23 10:57:28', 0.00, NULL, 2, 1, '广信区域中心01号公变在2025-03-23 10:57:28发生配变本身故障。变压器发生该类型停电的具体原因是配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 'c37d918124a24dafb5181f9d50d38145', NULL, NULL);
INSERT INTO `t_cons_event` VALUES ('bd7373ca-0792-11f0-93c5-005056c00001', '01020250208', '胡为', '2025-03-23 10:57:28', 0.00, NULL, 2, 1, '广信区域中心01号公变在2025-03-23 10:57:28发生配变本身故障。变压器发生该类型停电的具体原因是配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 'c37d918124a24dafb5181f9d50d38145', NULL, NULL);

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
INSERT INTO `t_cons_info` VALUES ('9bec2e8196254f879c29a08e46ab4810', '01120250222', '王小条', 1, NULL, '15478895421', '00036400', '2025-02-20', 30.21, 1, 354.00, NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-02-21 23:16:30', '上饶广信供电局', '2025-02-22 12:03:51', '上饶广信供电局', 0, NULL);
INSERT INTO `t_cons_info` VALUES ('bfe0771b9ad1433fb2fbc8a0635a2a0b', '00220250208', '广信一中', 4, '广信区中心高中一中', '911-9854-8754', '00036400', '2020-05-30', 10000.00, 1, 10000.00, '民生用户，随时做好保电措施', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:26:17', '上饶广信供电局', NULL, NULL, 0, '10036400');
INSERT INTO `t_cons_info` VALUES ('c14c3f6b575540f7961b2c8abc501f54', '01220250222', '王文', 1, '上饶广信区县中心小学对面', '12545521457', '00136400', '2025-02-22', 1.30, 1, 5642.00, '正常用户，但是用电量还挺大！', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-22 12:05:49', '上饶广信供电局', NULL, NULL, 0, NULL);
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
INSERT INTO `t_drone_info` VALUES ('1b8cbc2322f84ec2803e269011185b67', 'TM2344512', '歼11号', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250329/6b1e075e5f3c45e4a88fd41d84649d7efj.webp', '2025-02-05', '2025-02-24', '上饶无人机专造厂', '广信区核心2区', '暂无', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-15 10:54:11', '上饶广信供电局', '2025-03-29 13:54:48', '上饶广信供电局', 0);
INSERT INTO `t_drone_info` VALUES ('1de17c43f0d94836ae165ce5fbd60e0a', 'csa21345312223', '测试123', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250214/f049eaa172004d70bb6558485258323d94a1939c30a2495a9ed11747ff5c132c_p1.png', '2025-02-04', '2025-02-27', '撒旦方法', '的撒v得到', '打发大水', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-14 22:12:21', '上饶广信供电局', '2025-02-14 22:12:53', '上饶广信供电局', 1);
INSERT INTO `t_drone_info` VALUES ('58441a77431445eb9e28aeb701201a80', 'J10T3454', '歼10号', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250329/c34b06eb323244a1b5e94e20d1646e85fj.webp', '2025-02-01', '2025-02-26', '上饶无人机专造厂', '上饶广信区县中心区域线路和变压器', '暂无', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-14 22:18:05', '上饶广信供电局', '2025-03-29 13:55:01', '上饶广信供电局', 0);

-- ----------------------------
-- Table structure for t_line_event
-- ----------------------------
DROP TABLE IF EXISTS `t_line_event`;
CREATE TABLE `t_line_event`  (
                                 `Mid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `line_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `line_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `power_outage_time` timestamp(0) NULL DEFAULT NULL,
                                 `power_outage_duration` decimal(10, 2) NULL DEFAULT NULL,
                                 `power_supply_time` timestamp(0) NULL DEFAULT NULL,
                                 `power_outage_type` int(0) NULL DEFAULT NULL,
                                 `status` int(0) NULL DEFAULT NULL,
                                 `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `create_time` timestamp(0) NULL DEFAULT NULL,
                                 `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `update_time` timestamp(0) NULL DEFAULT NULL,
                                 `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `effect_transformer_number` int(0) NULL DEFAULT NULL,
                                 `effect_cons_number` int(0) NULL DEFAULT NULL,
                                 `is_generate_work_order` int(0) NULL DEFAULT NULL,
                                 PRIMARY KEY (`Mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_line_event
-- ----------------------------
INSERT INTO `t_line_event` VALUES ('01059d358a8448bfacb2e5d69a69b4ab', '1d029d22e6474dacb102cd051980ca91', '广信一中10kV专线', '2025-03-22 13:36:52', 31.21, '2025-03-23 01:00:44', 2, 2, '线路层级的问题导致停运，具体巡视原因描述为：线路发生故障', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 23:37:34', '上饶广信供电局', NULL, NULL, 1, 0, NULL);
INSERT INTO `t_line_event` VALUES ('84e6ff237048445da2f0c80e86569b20', '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', '2025-03-23 00:07:05', 0.00, NULL, 1, 1, '线路层级的问题导致停运，具体巡视原因描述为：null', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, 2, 5, NULL);
INSERT INTO `t_line_event` VALUES ('c5ea7dc5ffd44572902f99a094aa745d', '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 2, 2, '线路发生故障断裂！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, 2, 5, NULL);

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
INSERT INTO `t_menu` VALUES ('135b928cbd114a9592e919ea33a0caf8', '5b133ba32b4441b38fc8848184958662', '接单中心', 'acceptOrderCenter', 3, 1, '2025-02-22 21:46:19', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('323bdcfbf0e243718bf71f828de04acb', '3c5da8df5abc4b7a9237a33018d866bd', '测试子节点', 'test1', 1, 0, '2025-01-11 16:14:17', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('367ddc9346bb4645b7e0cdd1ee578f99', 'a476ab2407404a99be9dc38f04c3aacf', '台区停运事件', 'transformerEvent', 2, 1, '2025-01-31 15:12:21', '2025-01-31 15:12:27', 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_menu` VALUES ('36db6f32c5ff4f03b8c717534ee8d7a2', '797e4d4189e44c4aaec65ea1f64ef73e', '线路资源', 'lineSource', 1, 1, '2025-01-28 10:50:56', '2025-01-28 10:51:12', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('3b03e9b47f834645b720ae2a75043c60', 'a26d824a628547c795d8f5445d499efe', '巡视工单', 'inspectionWorkOrder', 2, 1, '2025-02-22 21:13:55', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('3c5da8df5abc4b7a9237a33018d866bd', '0', '测试', 'test', 2, 1, '2025-01-11 16:13:58', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('46071c0823d0459790bacf2cde16e41c', 'c441995936674b3398be5a47621511eb', '用户资源管理', 'consSource', 2, 1, '2025-01-28 10:54:23', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('4cd4e6e54abe477bbb351cdb9360f339', '797e4d4189e44c4aaec65ea1f64ef73e', '变压器资源', 'transformerSource', 2, 1, '2025-01-28 10:51:46', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('5b133ba32b4441b38fc8848184958662', '0', '工单管控', 'workOrderControl', 7, 1, '2025-02-22 21:44:51', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('63d332c0af32487daa5d6d0a2d155de9', 'a476ab2407404a99be9dc38f04c3aacf', '台区停运事件报表', 'transformerEventReport', 3, 1, '2025-01-31 15:13:31', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('63ddaa4db4d34cde898fc2fee1b43641', '0', '资源管理', 'source', 2, 1, '2025-01-28 10:48:10', '2025-01-28 10:48:24', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('6ce8dc54ed82417a95b1545032bb0663', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路事件报表', 'lineEventReport', 3, 1, '2025-01-27 19:09:28', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('71209d8c82af46ed8711c026ca397e67', 'f75b896a53d84b19bf7d4e20030bc15e', '数据字典', 'sysDict', 4, 1, '2025-01-28 21:29:15', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('78bd9009908d4a9b819478de40153c60', 'dc1aa7743a964b0082a7f28b3f23cf6a', '电能使用情况', 'electricityUsageStatus', 6, 1, '2025-02-06 09:16:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('797e4d4189e44c4aaec65ea1f64ef73e', '63ddaa4db4d34cde898fc2fee1b43641', '实体资源', 'entity', 1, 1, '2025-01-28 10:49:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('7addbc7e3c1b4eda972b09db94e35bd9', '797e4d4189e44c4aaec65ea1f64ef73e', '无人机资源', 'droneSource', 3, 1, '2025-01-28 10:53:08', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('80e31e3aca20485c999647bb7e0a5dc6', '5b133ba32b4441b38fc8848184958662', '个人工单管理', 'personOrderManagement', 4, 1, '2025-02-22 21:46:51', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('934b080987164cd3b1834c863aa48a5e', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户停电事件报表', 'consEventReport', 3, 1, '2025-02-06 09:14:38', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('a26d824a628547c795d8f5445d499efe', '0', '无人机巡视', 'droneInspection', 6, 1, '2025-02-22 21:12:58', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('a41e4d3522a74eb3aba4fd931a9d45b0', 'a476ab2407404a99be9dc38f04c3aacf', '变压器信息', 'transformerInfo', 1, 1, '2025-01-31 15:11:55', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('a476ab2407404a99be9dc38f04c3aacf', '0', '台区管理', 'transformer', 4, 1, '2025-01-31 15:11:18', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('b66a1f232f974c7ca47542daa1d40aec', 'dc1aa7743a964b0082a7f28b3f23cf6a', '电费充值记录', 'electricityRechargeHistory', 5, 1, '2025-02-06 09:15:40', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('ba9885cfab6040ad92ea536bff8f920b', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路停电事件', 'lineEvent', 2, 1, '2025-01-12 18:52:36', '2025-01-27 19:12:44', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('c2993d9b1e1e432cbb1a2745c6244f35', '5b133ba32b4441b38fc8848184958662', '工单受理中心', 'workOrderHandleCenter', 2, 1, '2025-02-22 21:45:46', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('c441995936674b3398be5a47621511eb', '63ddaa4db4d34cde898fc2fee1b43641', '虚拟资源', 'virtual', 2, 1, '2025-01-28 10:49:59', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('cb5d56df80854e50bc6d7e5b6d1b457f', '0', '线路管理', 'line', 3, 1, '2025-01-12 18:50:47', '2025-01-28 10:47:31', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('d20c094cffb24cb5a41e6cb2b0bc3b7a', 'f75b896a53d84b19bf7d4e20030bc15e', '用户管理', 'sysUser', 1, 1, '2025-01-11 15:34:39', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('d710b2eec3054a58a702377a566c5c0b', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户停电事件', 'consEvent', 2, 1, '2025-02-06 09:14:10', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('d91c89667a7240dbbb7a398db999b7d4', 'dc1aa7743a964b0082a7f28b3f23cf6a', '用户信息', 'consInfo', 1, 1, '2025-02-06 09:13:37', '2025-02-07 17:39:15', 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_menu` VALUES ('daf1f1d8bbab483d8376e49184b23d52', 'dc1aa7743a964b0082a7f28b3f23cf6a', '客户反馈', 'customerFeedback', 4, 1, '2025-02-06 09:15:05', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('dc1aa7743a964b0082a7f28b3f23cf6a', '0', '用电户管理', 'cons', 5, 1, '2025-02-06 09:12:59', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('e042702fb0994d0e809029d0534d0a53', 'c441995936674b3398be5a47621511eb', '单位管理', 'unitSource', 1, 1, '2025-01-28 10:53:55', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('e2c56b46a6624ebf87e35c256a44af5d', 'f75b896a53d84b19bf7d4e20030bc15e', '菜单管理', 'sysMenu', 3, 1, '2025-01-11 15:35:16', '2025-01-11 15:36:27', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');
INSERT INTO `t_menu` VALUES ('e783480ef19b45f9be313e09fb82d149', 'a26d824a628547c795d8f5445d499efe', '巡视记录', 'inspectionRecord', 1, 1, '2025-02-22 21:13:34', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('ea450ae6a98a4aebafd3b56e5b20dc5b', 'cb5d56df80854e50bc6d7e5b6d1b457f', '线路信息', 'lineInfo', 1, 1, '2025-01-12 18:51:43', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_menu` VALUES ('f159d9813fb34534a6243ec6b1af799a', '5b133ba32b4441b38fc8848184958662', '工单管理', 'workOrderManagement', 1, 1, '2025-02-22 21:45:19', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', NULL);
INSERT INTO `t_menu` VALUES ('f75b896a53d84b19bf7d4e20030bc15e', '0', '系统管理', 'system', 1, 1, '2025-01-11 15:33:55', '2025-01-11 15:35:57', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '赣州供电局');

-- ----------------------------
-- Table structure for t_person_accept
-- ----------------------------
DROP TABLE IF EXISTS `t_person_accept`;
CREATE TABLE `t_person_accept`  (
                                    `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `accept_time` timestamp(0) NULL DEFAULT NULL,
                                    `work_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `handle_status` int(0) NULL DEFAULT NULL,
                                    `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `process_begin_time` timestamp(0) NULL DEFAULT NULL,
                                    `supervise_begin_time` timestamp(0) NULL DEFAULT NULL,
                                    `supervise_end_time` timestamp(0) NULL DEFAULT NULL,
                                    `work_order_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                    `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    `event_type` int(0) NULL DEFAULT NULL,
                                    `work_order_source` int(0) NULL DEFAULT NULL,
                                    `work_order_type` int(0) NULL DEFAULT NULL,
                                    `urge_to_handle_count` int(0) NULL DEFAULT NULL,
                                    `last_urge_to_handle_time` timestamp(0) NULL DEFAULT NULL,
                                    `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_person_accept
-- ----------------------------
INSERT INTO `t_person_accept` VALUES ('2503f076e87146f2a0f6dcad9f86bf8b', '上饶广信供电局', '2025-03-23 00:43:01', '2025032397', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:43:12', '2025-03-23 00:57:44', '2025-03-23 00:57:51', '非抢工单没有发生停电事件，但是出现了相关问题，问题描述：配变因线路调整故障', NULL, 2, 1, 3, 1, '2025-03-23 00:43:04', '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('8011e8628a0d43939d762de218a1bbd3', '上饶广信供电局', '2025-03-23 00:59:56', '2025032275', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 01:00:12', '2025-03-23 01:00:44', '2025-03-23 01:00:50', '故障报修工单发生停电事件，出现了相关问题，问题描述：线路发生故障', '01059d358a8448bfacb2e5d69a69b4ab', 1, 1, 1, 1, '2025-03-23 01:00:01', '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('9c7aca7fba59403eb12e2a1e5f22a6d9', '上饶广信供电局', '2025-03-17 21:33:55', '202503170101', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:34:11', '2025-03-17 21:35:44', '2025-03-17 21:36:29', '线路因为特殊原因导致发生断裂，影响到了多个用户，请及时派单抢修！', 'c5ea7dc5ffd44572902f99a094aa745d', 1, 3, 1, 1, '2025-03-17 21:33:57', '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('b64b521c0df54dae9c0926e285650310', '上饶广信供电局', '2025-03-23 01:02:22', '2025032219', 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, NULL, '主动抢修工单发生停电事件，出现了相关问题，问题描述：配变故障', 'ada618247d6c4e6f9cf5caa4b9ce8bf7', 2, 1, 2, 3, '2025-03-29 14:20:33', '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('df705f8a70064532aa065df35ba0103c', '上饶广信供电局', '2025-03-23 00:48:13', '202503220303', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:48:16', '2025-03-23 00:48:41', '2025-03-23 00:48:49', '该用户的户表好像出了问题，目前用户已在催处理，请接单督办！', 'ad25baa8dfcb4e4dbc731fd6d5804514', 3, 3, 3, NULL, NULL, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge_record`;
CREATE TABLE `t_recharge_record`  (
                                      `recharge_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `recharge_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `cons_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `cons_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `recharge_amount` decimal(10, 2) NULL DEFAULT NULL,
                                      `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                      `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `operate_time` timestamp(0) NULL DEFAULT NULL,
                                      `relation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                      `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_recharge_record
-- ----------------------------
INSERT INTO `t_recharge_record` VALUES ('王嘉尔', NULL, '01220250222', '王文', 0.30, '无', '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '2025-03-29 16:11:31', '父子', 'd6fe9a3671b84bad9e4c841e753e0d54');
INSERT INTO `t_recharge_record` VALUES ('流项', '2025-03-29', '01220250222', '王文', 0.30, '冲几毛！', '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '2025-03-29 16:15:00', '母子', '1bfd1be2f5eb4323b7e767513ea9e82b');
INSERT INTO `t_recharge_record` VALUES ('王加加', '2025-03-28', '01120250222', '王小条', 20.00, '', '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '2025-03-29 16:16:46', '父子', '104e608a9bd245f2a963261800dfc1d4');

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
INSERT INTO `t_role` VALUES ('19165643fab342038bbc855af1844f36', '测试人员', 'test', '其主要负责测试系统的各方面功能，确保系统无bug！', '2024-11-23 17:00:32', '2024-12-25 19:09:25', 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('23315a6badcb42e78d70ce6d9439d653', '平台管理员', 'administrators', '管理平台的运行，操作用户权限等...', '2024-11-17 16:55:59', '2024-12-25 18:22:15', 0, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('59ed1e3ebece42a09f4ae7fa90b3ccad', '电路维修师', 'editor', '有电路故障事件时，维修师父第一时间收到，修好后提交维修记录。', '2024-12-25 18:24:37', '2025-03-09 20:18:08', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_role` VALUES ('65a987200dbf48a6b8b16dea71cb34a9', 'test1', 'test1', NULL, '2024-12-26 11:41:21', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', NULL);
INSERT INTO `t_role` VALUES ('a0f24a6726d748ecbbe49af62844d331', 'sd', 'd', NULL, '2024-12-01 13:55:45', NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL);
INSERT INTO `t_role` VALUES ('cbf1901522b347fbbfef03a0756136a0', '普通用户', 'admin', '普通的员工用户，负责系统的各种数据观测和处理。', '2024-11-23 16:23:42', '2024-12-26 10:13:00', 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');
INSERT INTO `t_role` VALUES ('de05cbb207ad4d9c9d531423d81221d7', '开发者', 'developer', '系统的开发者，拥有所有菜单的操作权限！', '2025-01-11 15:46:57', '2025-01-29 16:01:36', 0, '5d1f6eed770f40dd9916098fb17934bc', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_role` VALUES ('f0403832bde34b7d904818a5362297b3', 'read用户', 'readAdmin', '该用户只有查询数据的权限', '2024-11-23 16:51:28', '2024-12-25 19:37:05', 1, '5d1f6eed770f40dd9916098fb17934bc', NULL, '赣州供电局');

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
INSERT INTO `t_role_menu` VALUES ('00daae6d2b1346d19574e6e6968cce8a', 'de05cbb207ad4d9c9d531423d81221d7', '63ddaa4db4d34cde898fc2fee1b43641', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('04727649af654ed9a552ea635839f384', 'de05cbb207ad4d9c9d531423d81221d7', 'e783480ef19b45f9be313e09fb82d149', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('08998b13961f4edb83f728cfabc367d6', '23315a6badcb42e78d70ce6d9439d653', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-03-09 20:01:05', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('0b37114085b14eae94778e833642db83', '23315a6badcb42e78d70ce6d9439d653', 'd91c89667a7240dbbb7a398db999b7d4', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('0d3d887c6ed94e1f83f0239eafc986c0', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('0f4dc64a7fd74df991d20277b30f8b91', '23315a6badcb42e78d70ce6d9439d653', 'e783480ef19b45f9be313e09fb82d149', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('15e9a06a8d104367902ff4b4d05ebdbd', '23315a6badcb42e78d70ce6d9439d653', 'dc1aa7743a964b0082a7f28b3f23cf6a', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('1875ed05385048c39d711caa475de60b', 'de05cbb207ad4d9c9d531423d81221d7', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('19935cb29a9b489997389e1026157ac1', '23315a6badcb42e78d70ce6d9439d653', '4cd4e6e54abe477bbb351cdb9360f339', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('1b920613a3df4b01bcd4fd784a7766b9', '23315a6badcb42e78d70ce6d9439d653', '46071c0823d0459790bacf2cde16e41c', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('1cfe962c27f7479cb66c17c4cbfeed32', '23315a6badcb42e78d70ce6d9439d653', 'f159d9813fb34534a6243ec6b1af799a', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('1d0303c5173b46119006d4fde85b4ade', '23315a6badcb42e78d70ce6d9439d653', '367ddc9346bb4645b7e0cdd1ee578f99', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('1d58a8e4d0d149869f736fb20d6e1d60', 'de05cbb207ad4d9c9d531423d81221d7', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('216f2540507943b0899e1f9488ffb1ef', 'de05cbb207ad4d9c9d531423d81221d7', '4cd4e6e54abe477bbb351cdb9360f339', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('28d4afdb3fdd40dfbeec0011c4ce1041', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'dc1aa7743a964b0082a7f28b3f23cf6a', '2025-03-09 20:18:51', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('2b2742c5cfbf470c92d54a39ee6fa2c9', '23315a6badcb42e78d70ce6d9439d653', 'b66a1f232f974c7ca47542daa1d40aec', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('2cf255e8d562479c8f228e4cac60c7fe', '23315a6badcb42e78d70ce6d9439d653', '3b03e9b47f834645b720ae2a75043c60', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('2ec9815a19f44187af04fdc9635fe68c', '23315a6badcb42e78d70ce6d9439d653', '80e31e3aca20485c999647bb7e0a5dc6', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('313adc050b444ba9b53622ada23f8dc3', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-03-09 20:18:51', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('363186bc89d14539bb67291c75859d36', 'de05cbb207ad4d9c9d531423d81221d7', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('3be6f65a6a56439e9276b3034ad6a99f', 'de05cbb207ad4d9c9d531423d81221d7', 'd91c89667a7240dbbb7a398db999b7d4', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('48ebcbce2b7d4e20a4f3fe590b49aed7', '23315a6badcb42e78d70ce6d9439d653', 'daf1f1d8bbab483d8376e49184b23d52', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('49b802da439b42e3b9cfff6774b94adb', '59ed1e3ebece42a09f4ae7fa90b3ccad', '63d332c0af32487daa5d6d0a2d155de9', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('51237c1bba65413688b3e7b369cb8382', '23315a6badcb42e78d70ce6d9439d653', '71209d8c82af46ed8711c026ca397e67', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('534ea9f6af7f4dd8835b9c54261b54b8', 'de05cbb207ad4d9c9d531423d81221d7', 'ba9885cfab6040ad92ea536bff8f920b', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('5ed8333ed60a4892adba025a6e5eb132', '23315a6badcb42e78d70ce6d9439d653', 'ba9885cfab6040ad92ea536bff8f920b', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('60a51ca6165c4afd916d6acca458ff87', 'de05cbb207ad4d9c9d531423d81221d7', 'f75b896a53d84b19bf7d4e20030bc15e', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('611c38463c8041189f48e6a8317e6cf6', 'de05cbb207ad4d9c9d531423d81221d7', '71209d8c82af46ed8711c026ca397e67', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('61d0e618142743aba9b07588801c346a', 'de05cbb207ad4d9c9d531423d81221d7', '6ce8dc54ed82417a95b1545032bb0663', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('627ee39998a440f1bea8654613ba779a', '23315a6badcb42e78d70ce6d9439d653', '6ce8dc54ed82417a95b1545032bb0663', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('64a00526e7704355a8f7fda4110dbfdb', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'a476ab2407404a99be9dc38f04c3aacf', '2025-03-09 20:18:51', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('64e73e6aae9f4d67ad39a8c02147e5ac', 'de05cbb207ad4d9c9d531423d81221d7', 'f159d9813fb34534a6243ec6b1af799a', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('68fb43cf886b472db79adc578f8b2c39', 'de05cbb207ad4d9c9d531423d81221d7', 'a41e4d3522a74eb3aba4fd931a9d45b0', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6ab2a12cda9b411eaab18637af0c72ee', 'de05cbb207ad4d9c9d531423d81221d7', 'a476ab2407404a99be9dc38f04c3aacf', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6d80cbe8a7414d9899a8b0fa08b97c3b', '23315a6badcb42e78d70ce6d9439d653', '36db6f32c5ff4f03b8c717534ee8d7a2', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6e8e21e68d9644feb787141e6df31857', '59ed1e3ebece42a09f4ae7fa90b3ccad', '934b080987164cd3b1834c863aa48a5e', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6f79b46208d74498813894772703de32', 'de05cbb207ad4d9c9d531423d81221d7', 'daf1f1d8bbab483d8376e49184b23d52', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6f846f1c286143ebbc30c940b16e28e3', 'de05cbb207ad4d9c9d531423d81221d7', '135b928cbd114a9592e919ea33a0caf8', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('6fce0bbc266349acba9eac5b4f0e0ae3', '23315a6badcb42e78d70ce6d9439d653', '135b928cbd114a9592e919ea33a0caf8', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('77fba58d29a547ed9f0d4feb87deafaa', '23315a6badcb42e78d70ce6d9439d653', 'a41e4d3522a74eb3aba4fd931a9d45b0', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('79cb4567f7384a9289eca2f0c95ff9bb', '59ed1e3ebece42a09f4ae7fa90b3ccad', '135b928cbd114a9592e919ea33a0caf8', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('80711800655647589a1bb7bc032f07b6', 'de05cbb207ad4d9c9d531423d81221d7', 'a26d824a628547c795d8f5445d499efe', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8085b43fdd474c26bea4e6a547293fa6', '59ed1e3ebece42a09f4ae7fa90b3ccad', '6ce8dc54ed82417a95b1545032bb0663', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8151c9c0a350419aa5fcfeeaa828067e', 'de05cbb207ad4d9c9d531423d81221d7', 'c441995936674b3398be5a47621511eb', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8411c0da9d4a446193360e94a218327b', '23315a6badcb42e78d70ce6d9439d653', '7addbc7e3c1b4eda972b09db94e35bd9', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('8600f6ecd8e34798ac20a44ade50aee3', 'de05cbb207ad4d9c9d531423d81221d7', '934b080987164cd3b1834c863aa48a5e', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('87a7e18780c64e56a4f84544d1d91ae7', 'de05cbb207ad4d9c9d531423d81221d7', '5b133ba32b4441b38fc8848184958662', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('87d80941f453442aa60c9474fb571a5c', 'de05cbb207ad4d9c9d531423d81221d7', 'd710b2eec3054a58a702377a566c5c0b', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('9bfd71ded8724c68b2cbffc530104627', 'de05cbb207ad4d9c9d531423d81221d7', 'c2993d9b1e1e432cbb1a2745c6244f35', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('9fb448f53c8841379ffff65af765cf5d', '23315a6badcb42e78d70ce6d9439d653', '78bd9009908d4a9b819478de40153c60', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a1139184f38f42e1833843edb584ef40', '59ed1e3ebece42a09f4ae7fa90b3ccad', '5b133ba32b4441b38fc8848184958662', '2025-03-09 20:18:51', NULL, 0, 1, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a29598eac23341318a855cc97085e494', '23315a6badcb42e78d70ce6d9439d653', 'cb5d56df80854e50bc6d7e5b6d1b457f', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a5b3a0886da34656a4a3d7a60086feb8', 'de05cbb207ad4d9c9d531423d81221d7', '80e31e3aca20485c999647bb7e0a5dc6', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('a9274ef28f2042d2b08cda68726f2bac', '23315a6badcb42e78d70ce6d9439d653', 'ea450ae6a98a4aebafd3b56e5b20dc5b', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('ac9c8740c93b4b538508ed083bccf7c0', '23315a6badcb42e78d70ce6d9439d653', '934b080987164cd3b1834c863aa48a5e', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('acfb738f3bf14b72b5e03f7fa2c5ecde', 'de05cbb207ad4d9c9d531423d81221d7', '78bd9009908d4a9b819478de40153c60', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('afba31ca3cce466f95950e611fdc6512', 'de05cbb207ad4d9c9d531423d81221d7', '367ddc9346bb4645b7e0cdd1ee578f99', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('afd0ce5da6b548ac9b7f25d17684dd11', 'de05cbb207ad4d9c9d531423d81221d7', '63d332c0af32487daa5d6d0a2d155de9', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('b0b6f487215c446ea439eb5bb3fcb1b3', '23315a6badcb42e78d70ce6d9439d653', '63ddaa4db4d34cde898fc2fee1b43641', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('b0cd90d92a2d45fd8a311ed603aa6a55', 'de05cbb207ad4d9c9d531423d81221d7', '3b03e9b47f834645b720ae2a75043c60', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('b65a962f4389418b9172fe09e5c2d4e9', 'de05cbb207ad4d9c9d531423d81221d7', '46071c0823d0459790bacf2cde16e41c', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('c0b6544c8fc64584a09053d45930aef6', 'de05cbb207ad4d9c9d531423d81221d7', '03dc8d35a8b24ac196f5abfe91693866', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('c74d8e4e64ea40df994cccf1cb416374', 'de05cbb207ad4d9c9d531423d81221d7', '797e4d4189e44c4aaec65ea1f64ef73e', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('c75c3c31c692495db267c117e24562e2', '23315a6badcb42e78d70ce6d9439d653', 'c2993d9b1e1e432cbb1a2745c6244f35', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('cb4ed8f0769b45dcaeb1adf132ce85cb', 'de05cbb207ad4d9c9d531423d81221d7', '36db6f32c5ff4f03b8c717534ee8d7a2', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('cbdbd0075a2e4b42b3e85b3de83f764f', '23315a6badcb42e78d70ce6d9439d653', '5b133ba32b4441b38fc8848184958662', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('cc5f51449308408186bd669520e8bb83', '59ed1e3ebece42a09f4ae7fa90b3ccad', '80e31e3aca20485c999647bb7e0a5dc6', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('cd6ee24fdbf640848bd751447f09a59a', '23315a6badcb42e78d70ce6d9439d653', '797e4d4189e44c4aaec65ea1f64ef73e', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('e271053c0e1e48beb04882f91f994c0b', 'de05cbb207ad4d9c9d531423d81221d7', '7addbc7e3c1b4eda972b09db94e35bd9', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('e5c94b0f4ae24032a96e69a0901b95a5', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'a41e4d3522a74eb3aba4fd931a9d45b0', '2025-03-09 20:18:51', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('e92ec93844fa4616b812dd03f19252ff', 'de05cbb207ad4d9c9d531423d81221d7', 'dc1aa7743a964b0082a7f28b3f23cf6a', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('ed6877bcc009461dad52517ba409305f', '23315a6badcb42e78d70ce6d9439d653', 'e042702fb0994d0e809029d0534d0a53', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f29977f5a9314d6fa078e360f926c5d1', 'de05cbb207ad4d9c9d531423d81221d7', 'e042702fb0994d0e809029d0534d0a53', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f50d7f1cf1e245e9bf63a85423bc17a0', 'de05cbb207ad4d9c9d531423d81221d7', 'e2c56b46a6624ebf87e35c256a44af5d', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f5573657502242deb950749624e1e1ad', '23315a6badcb42e78d70ce6d9439d653', 'a26d824a628547c795d8f5445d499efe', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f6720d95f3754f7484d667e52575363b', 'de05cbb207ad4d9c9d531423d81221d7', 'b66a1f232f974c7ca47542daa1d40aec', '2025-02-22 21:47:10', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f6b70c78f1fe4e05be14601c1e055d0c', '23315a6badcb42e78d70ce6d9439d653', 'd20c094cffb24cb5a41e6cb2b0bc3b7a', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f75dab8587904ceb8bda5bb2647478bf', '23315a6badcb42e78d70ce6d9439d653', 'd710b2eec3054a58a702377a566c5c0b', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('f88e64094b77402cbfb09edffb6b1386', '23315a6badcb42e78d70ce6d9439d653', '63d332c0af32487daa5d6d0a2d155de9', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('fc91116a86e947b59fec602d47c8f2d3', '23315a6badcb42e78d70ce6d9439d653', 'c441995936674b3398be5a47621511eb', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_role_menu` VALUES ('fff5d78284d6484eaf5c4652fa193359', '23315a6badcb42e78d70ce6d9439d653', 'a476ab2407404a99be9dc38f04c3aacf', '2025-03-09 20:01:05', NULL, 0, 0, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_transformer_event
-- ----------------------------
DROP TABLE IF EXISTS `t_transformer_event`;
CREATE TABLE `t_transformer_event`  (
                                        `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                        `transformer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `transformer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `terminal_outage_time` timestamp(0) NULL DEFAULT NULL,
                                        `outage_duration` decimal(10, 2) NULL DEFAULT NULL,
                                        `terminal_supply_time` timestamp(0) NULL DEFAULT NULL,
                                        `power_outage_type` int(0) NULL DEFAULT NULL,
                                        `status` int(0) NULL DEFAULT NULL,
                                        `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                        `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `create_time` timestamp(0) NULL DEFAULT NULL,
                                        `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `update_time` timestamp(0) NULL DEFAULT NULL,
                                        `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `effect_cons_number` int(0) NULL DEFAULT NULL,
                                        `line_event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `is_generate_work_order` int(0) NULL DEFAULT NULL,
                                        PRIMARY KEY (`data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_transformer_event
-- ----------------------------
INSERT INTO `t_transformer_event` VALUES ('03c2ad9d-0334-11f0-957d-005056c00001', '00036400', '广信区域中心01号公变', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 5, 2, '广信区110kV源端母线I线在2025-03-17 20:30:01发生故障停运。线路发生该类型停电的具体原因是线路发生故障断裂！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, 4, 'c5ea7dc5ffd44572902f99a094aa745d', NULL);
INSERT INTO `t_transformer_event` VALUES ('03c2d62b-0334-11f0-957d-005056c00001', '00136400', '广信中心区02号公变', '2025-03-17 20:30:01', 2.93, '2025-03-17 21:35:44', 5, 2, '广信区110kV源端母线I线在2025-03-17 20:30:01发生故障停运。线路发生该类型停电的具体原因是线路发生故障断裂！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:30:38', '上饶广信供电局', NULL, NULL, 1, 'c5ea7dc5ffd44572902f99a094aa745d', NULL);
INSERT INTO `t_transformer_event` VALUES ('9378c8d3-0733-11f0-8af5-005056c00001', '10036400', '广信一中01号专变', '2025-03-22 13:36:52', 31.21, '2025-03-23 01:00:44', 5, 2, '广信一中10kV专线在2025-03-22 13:36:52发生故障停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：线路发生故障！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 23:37:34', '上饶广信供电局', NULL, NULL, 0, '01059d358a8448bfacb2e5d69a69b4ab', NULL);
INSERT INTO `t_transformer_event` VALUES ('ada618247d6c4e6f9cf5caa4b9ce8bf7', '10036400', '广信一中01号专变', '2025-03-22 18:08:01', 0.00, NULL, 4, 1, '配变层级的问题导致停运，具体巡视原因描述为：配变故障', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 23:22:15', '上饶广信供电局', NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_transformer_event` VALUES ('b7d68401-0737-11f0-8af5-005056c00001', '00036400', '广信区域中心01号公变', '2025-03-23 00:07:05', 0.00, NULL, 3, 1, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, 4, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_transformer_event` VALUES ('b7d6a002-0737-11f0-8af5-005056c00001', '00136400', '广信中心区02号公变', '2025-03-23 00:07:05', 0.00, NULL, 3, 1, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', NULL, NULL, 1, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_transformer_event` VALUES ('c37d918124a24dafb5181f9d50d38145', '00036400', '广信区域中心01号公变', '2025-03-23 10:57:28', 0.00, NULL, 1, 1, '配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 4, NULL, NULL);

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
INSERT INTO `t_user` VALUES ('0ed453d14de143f58c6a54b0d6979a95', 'xk123', 'f379eaf3c831b04de153469d1bec345e', '肖大侠', 1, 3, '江西吉安', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/7a84d8082f924f9eb7c6fbce3ccaa47f33068c1ae01941d2b53a7efd2f806203_t1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 20:08:23', '2025-01-29 16:00:42', 1, 1, '13667961644', '系统开发者', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('355e4d747e104801854d0a46f7ad73c3', 'ww123', 'f379eaf3c831b04de153469d1bec345e', '王文', 1, 2, '赣州', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/4315ec15f7e34674a91f3e64c23fedaa01.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-26 19:51:21', '2025-01-29 16:00:44', 1, 2, '18779867786', '聪明人', '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('5d1f6eed770f40dd9916098fb17934bc', 'wangwen', 'e10adc3949ba59abbe56e057f20f883e', '上饶广信供电局', 1, 1, '江西上饶', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241226/cdbda25360104e449eda7beef697ca14gdgs.jpg', NULL, '-1', '2024-10-04 17:37:50', '2024-12-26 20:01:22', 0, 3, '0791-95598', '该账户为供电公司账户，权限最大，可以操作所有菜单。', NULL, '赣州供电局');
INSERT INTO `t_user` VALUES ('7d12fff3e576406ca5cec1840cc0d9f6', 'wanwen', '96e79218965eb72c92a549dd5a330112', '王德法', 1, 3, NULL, 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250217/66a23ed470c24829a7c9a6a414af7106dongt1.webp', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-29 16:39:08', '2025-02-17 14:39:11', 1, 2, NULL, NULL, '赣州供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('a1a0c84fb7274a5289cde4e7ec6df71f', 'a7798121a', '7b7fb059f91d86810ec58f67423f6dae', '李力', 1, 3, '江西吉安', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250329/4a0153b6bdf54dd58acfbffac047e97501.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-09 20:21:22', '2025-03-29 13:52:50', 0, 1, '154232548754', '该用户为专门抢修电路，账户密码为：xk123456789', '上饶广信供电局', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('bd375d793ae24830891689038d0cf054', 'wx123', 'f379eaf3c831b04de153469d1bec345e', '王辛', 0, 3, '江西省上饶市广信区', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20241228/e5ee66fd0925407f96890769acd80bb794a1939c30a2495a9ed11747ff5c132c_p1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2024-12-28 17:02:24', '2025-02-15 10:50:11', 1, 1, '1582025202', '维修电路，及时排查', '王文', '上饶广信供电局');
INSERT INTO `t_user` VALUES ('d2e7af767c224e7099890bda2164a07b', 'ww12345', 'f379eaf3c831b04de153469d1bec345e', '王文', 1, 2, '上饶广信区', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250329/bf2fecca7ebd49d0964f5e43f01cf1d094a1939c30a2495a9ed11747ff5c132c_p1.png', NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-09 20:03:37', '2025-03-29 13:53:04', 0, 1, '15425479854', '该账户为管理员账户，主要用于为公司新员工创建账号，该账户的密码为666666，请牢记！', '上饶广信供电局', '上饶广信供电局');

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
INSERT INTO `t_user_role` VALUES ('4191a3d724c942758840771ec646623f', '23315a6badcb42e78d70ce6d9439d653', 'd2e7af767c224e7099890bda2164a07b', '2025-03-09 20:04:13', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('513021f34b994f73aa287f36b637425d', '23315a6badcb42e78d70ce6d9439d653', 'bd375d793ae24830891689038d0cf054', '2024-12-29 16:38:33', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('b03fba767a164bcfb34900c08650432e', '23315a6badcb42e78d70ce6d9439d653', '355e4d747e104801854d0a46f7ad73c3', '2025-01-11 22:08:04', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('c258390e18764fcfb051446486b8cb54', '19165643fab342038bbc855af1844f36', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('ce5e90083e4f4322a3cd768d012858e5', 'f0403832bde34b7d904818a5362297b3', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('dfd425d2bfe64a4ba5e0b6b1633187f4', '59ed1e3ebece42a09f4ae7fa90b3ccad', 'a1a0c84fb7274a5289cde4e7ec6df71f', '2025-03-09 20:22:00', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('fcd5fc26bacc4ecfad0a0363ddeec8cb', '23315a6badcb42e78d70ce6d9439d653', '7d12fff3e576406ca5cec1840cc0d9f6', '2025-01-07 19:07:52', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_user_role` VALUES ('fe2bc95f84ae4222a4bd6ce4a30ce985', 'de05cbb207ad4d9c9d531423d81221d7', '5d1f6eed770f40dd9916098fb17934bc', '2025-01-11 15:49:26', NULL, 0, '5d1f6eed770f40dd9916098fb17934bc');

-- ----------------------------
-- Table structure for t_view_record
-- ----------------------------
DROP TABLE IF EXISTS `t_view_record`;
CREATE TABLE `t_view_record`  (
                                  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  `equip_type` int(0) NULL DEFAULT NULL,
                                  `equip_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `equip_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `equip_fault_type` int(0) NULL DEFAULT NULL,
                                  `drone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `drone_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `view_time` timestamp(0) NULL DEFAULT NULL,
                                  `view_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `handle_flag` int(0) NULL DEFAULT NULL,
                                  `update_time` timestamp(0) NULL DEFAULT NULL,
                                  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `is_deleted` int(0) NULL DEFAULT 0,
                                  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `equip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_view_record
-- ----------------------------
INSERT INTO `t_view_record` VALUES ('1ac62eae2048470489c806be49954207', 1, '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', 1, 'TM2344512', '歼11号', '2025-03-23 00:07:05', '上饶广信供电局', NULL, 2, NULL, NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信区核心供电区');
INSERT INTO `t_view_record` VALUES ('27507090f3144c45b5356bce5af5bbe7', 1, '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', 1, 'J10T3454', '歼10号', '2025-03-22 13:24:08', '上饶广信供电局', '该线路计划检修停运，时间大概1小时！', 1, '2025-03-22 13:28:25', '上饶广信供电局', 1, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信区核心供电区');
INSERT INTO `t_view_record` VALUES ('3a71860385dd4d22828eadcf73c6e3e2', 1, '1d029d22e6474dacb102cd051980ca91', '广信一中10kV专线', 2, 'TM2344512', '歼11号', '2025-03-22 13:36:52', '上饶广信供电局', '线路发生故障', 4, '2025-03-22 13:38:45', '上饶广信供电局', 0, '5d1f6eed770f40dd9916098fb17934bc', '关信城区中心高中学校一中');
INSERT INTO `t_view_record` VALUES ('4682e05d68e34d8fb4918baf6519edac', 2, '10036400', '广信一中01号专变', 4, 'TM2344512', '歼11号', '2025-03-22 18:08:01', '上饶广信供电局', '配变故障', 4, '2025-03-22 23:37:27', '上饶广信供电局', 0, '5d1f6eed770f40dd9916098fb17934bc', '广信区中心一中高中');
INSERT INTO `t_view_record` VALUES ('6be8218a366c401babadeac5ac9b4221', 2, '00136400', '广信中心区02号公变', 2, 'TM2344512', '歼11号', '2025-03-23 00:08:13', '上饶广信供电局', '配变因线路调整故障', 3, NULL, NULL, 1, '5d1f6eed770f40dd9916098fb17934bc', '广信中心区域');
INSERT INTO `t_view_record` VALUES ('c0aead2a04ba4b1681c8bdfeab3c1349', 2, '00036400', '广信区域中心01号公变', 1, 'TM2344512', '歼11号', '2025-03-23 10:57:28', '上饶广信供电局', '变压器因为老化产生停运！', 4, NULL, NULL, 0, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信区县中心小巷灾');

-- ----------------------------
-- Table structure for t_work_order
-- ----------------------------
DROP TABLE IF EXISTS `t_work_order`;
CREATE TABLE `t_work_order`  (
                                 `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `work_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `work_order_type` int(0) NULL DEFAULT NULL,
                                 `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `work_order_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `work_order_source` int(0) NULL DEFAULT NULL,
                                 `work_order_status` int(0) NULL DEFAULT NULL,
                                 `accept_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `urge_to_process_count` int(0) NULL DEFAULT NULL,
                                 `last_urge_to_process_time` timestamp(0) NULL DEFAULT NULL,
                                 `urge_to_accept_count` int(0) NULL DEFAULT NULL,
                                 `last_urge_to_accept_time` timestamp(0) NULL DEFAULT NULL,
                                 `urge_to_handle_count` int(0) NULL DEFAULT NULL,
                                 `last_urge_to_handle_time` timestamp(0) NULL DEFAULT NULL,
                                 `handle_time` timestamp(0) NULL DEFAULT NULL,
                                 `handle_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `accept_order_time` timestamp(0) NULL DEFAULT NULL,
                                 `accept_order_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `finish_time` timestamp(0) NULL DEFAULT NULL,
                                 `finish_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `create_time` timestamp(0) NULL DEFAULT NULL,
                                 `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `update_time` timestamp(0) NULL DEFAULT NULL,
                                 `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `is_deleted` int(0) NULL DEFAULT 0,
                                 `event_type` int(0) NULL DEFAULT NULL,
                                 `source_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `work_order_no_unique_index`(`work_order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work_order
-- ----------------------------
INSERT INTO `t_work_order` VALUES ('0b432358f100431a8080ddc0a08a64c4', '20250301213603', 3, '714b0ce6-f659-11ef-b1e0-005056c00001', NULL, 3, 6, NULL, 2, '2025-03-08 22:38:45', 2, '2025-03-09 20:24:10', 20, '2025-03-16 16:34:29', '2025-03-09 19:58:36', '上饶广信供电局', '2025-03-09 20:25:24', '王文', '2025-03-16 16:37:24', '王文', '2025-03-01 21:37:19', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-09 20:24:07', '王文', 1, 3, '20250316163651');
INSERT INTO `t_work_order` VALUES ('2595b9499dd04f0b86b6a94cd05955c1', '202503011504030303', 3, '714b0ce6-f659-11ef-b1e0-005056c00001', '123', 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 15:12:48', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-01 16:54:48', '上饶广信供电局', 1, 3, NULL);
INSERT INTO `t_work_order` VALUES ('30e04c4212f440a3a303c43b19bfef26', '2025032275', 1, '01059d358a8448bfacb2e5d69a69b4ab', '故障报修工单发生停电事件，出现了相关问题，问题描述：线路发生故障', 1, 6, '关信城区中心高中学校一中', 1, '2025-03-23 00:59:42', 1, '2025-03-23 00:59:52', 1, '2025-03-23 01:00:01', '2025-03-23 00:59:45', '上饶广信供电局', '2025-03-23 00:59:56', '上饶广信供电局', '2025-03-23 01:01:07', '上饶广信供电局', '2025-03-22 23:37:34', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 1, '20250323010044');
INSERT INTO `t_work_order` VALUES ('6f2bc5d0f1ca41a083f168c5f63299be', '2025032397', 3, NULL, '非抢工单没有发生停电事件，但是出现了相关问题，问题描述：配变因线路调整故障', 1, 6, '广信中心区域', 1, '2025-03-23 00:42:43', 1, '2025-03-23 00:42:56', 1, '2025-03-23 00:43:04', '2025-03-23 00:42:51', '上饶广信供电局', '2025-03-23 00:43:01', '上饶广信供电局', '2025-03-23 00:58:02', '上饶广信供电局', '2025-03-23 00:08:39', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 2, '20250323005744');
INSERT INTO `t_work_order` VALUES ('963a3ec7bf5a4f3ea29bda575a985c24', '2025032369', 1, 'c37d918124a24dafb5181f9d50d38145', '故障报修工单发生停电事件，出现了相关问题，问题描述：变压器因为老化产生停运！', 1, 1, '上饶广信区县中心小巷灾', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-23 10:58:47', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 2, NULL);
INSERT INTO `t_work_order` VALUES ('9a478ec7a5084e1b987395f1b2a8c469', '20250301150401010101010101', 2, '8247a048df69407e95eddbfcebae9553', '母线发生故障，请及时抢修！！！', 3, 1, '广信中心区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 15:06:11', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-01 17:18:15', '上饶广信供电局', 1, 1, NULL);
INSERT INTO `t_work_order` VALUES ('a873b5e4fa9f499097a6ea8a8402fe29', '20250301171801', 1, '8247a048df69407e95eddbfcebae9553', '线路老旧导致线路故障!', 3, 6, '上饶广信区中心区域', 1, '2025-03-15 14:23:15', 1, '2025-03-15 14:23:26', 7, '2025-03-16 15:51:36', '2025-03-15 14:23:21', '上饶广信供电局', '2025-03-15 14:23:31', '上饶广信供电局', '2025-03-16 16:29:35', '上饶广信供电局', '2025-03-01 17:19:42', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-15 14:14:25', '上饶广信供电局', 1, 1, '20250315143827');
INSERT INTO `t_work_order` VALUES ('b8317bb4e676487488d80822763ee54a', '20250301213602', 2, '714a4a11-f659-11ef-b1e0-005056c00001', NULL, 3, 5, NULL, 1, '2025-03-15 14:23:16', 1, '2025-03-15 14:23:27', 15, '2025-03-17 19:27:49', '2025-03-15 14:23:23', '上饶广信供电局', '2025-03-15 14:23:33', '上饶广信供电局', NULL, NULL, '2025-03-01 21:36:38', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-15 14:22:39', '上饶广信供电局', 1, 2, NULL);
INSERT INTO `t_work_order` VALUES ('b926c3faf67d4073820deb63a6eed22d', '202503220303', 3, 'ad25baa8dfcb4e4dbc731fd6d5804514', '该用户的户表好像出了问题，目前用户已在催处理，请接单督办！', 3, 6, '广信区北湖小学', 1, '2025-03-23 00:42:44', NULL, NULL, NULL, NULL, '2025-03-23 00:48:07', '上饶广信供电局', '2025-03-23 00:48:13', '上饶广信供电局', '2025-03-23 00:49:07', '上饶广信供电局', '2025-03-22 13:45:44', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 14:01:43', '上饶广信供电局', 0, 3, '20250323004841');
INSERT INTO `t_work_order` VALUES ('c586978a9cbf4723a782555306fd5d8a', '2025032219', 2, 'ada618247d6c4e6f9cf5caa4b9ce8bf7', '主动抢修工单发生停电事件，出现了相关问题，问题描述：配变故障', 1, 4, '广信区中心一中高中', 1, '2025-03-23 01:02:08', 1, '2025-03-23 01:02:16', 3, '2025-03-29 14:20:33', '2025-03-23 01:02:13', '上饶广信供电局', '2025-03-23 01:02:22', '上饶广信供电局', NULL, NULL, '2025-03-22 23:22:15', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 2, NULL);
INSERT INTO `t_work_order` VALUES ('c6a5966e4edb43bd87be309d20f8dfd5', '20250301185401', 1, '8247a048df69407e95eddbfcebae9553', NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 18:55:12', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 1, 1, NULL);
INSERT INTO `t_work_order` VALUES ('e90a189a011346369c89dc232776e11b', '202503170101', 1, 'c5ea7dc5ffd44572902f99a094aa745d', '线路因为特殊原因导致发生断裂，影响到了多个用户，请及时派单抢修！', 3, 6, '广信区中心县区！', 1, '2025-03-17 21:32:51', 1, '2025-03-17 21:33:45', 1, '2025-03-17 21:33:57', '2025-03-17 21:33:32', '上饶广信供电局', '2025-03-17 21:33:55', '上饶广信供电局', '2025-03-17 21:36:33', '上饶广信供电局', '2025-03-17 21:32:44', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 1, '20250317213544');

-- ----------------------------
-- Table structure for t_work_source
-- ----------------------------
DROP TABLE IF EXISTS `t_work_source`;
CREATE TABLE `t_work_source`  (
                                  `accept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `source_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `submit_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `handle_object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `handle_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `really_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `fault_record_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `handle_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `handle_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `accept_flag` int(0) NULL DEFAULT NULL,
                                  `submit_time` timestamp(0) NULL DEFAULT NULL,
                                  `refuse_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `refuse_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `refuse_time` timestamp(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work_source
-- ----------------------------
INSERT INTO `t_work_source` VALUES ('9c7aca7fba59403eb12e2a1e5f22a6d9', '20250317213544', '上饶广信供电局', '广信区110kV源端母线I线', '线路发生故障断裂！', '线路是因为楼上有人丢小刀导致把线路切坏。', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250317/55e3f1b7b18b4dca96365d28158ea260u=92874499,748355427&fm=253&fmt=auto&app=138&f=JPEG.webp', '目前线路已被维修师父用胶带胶好，线路可正常送电！', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250317/560ad8e6582444889a7555f071302201u=1277269179,4077274548&fm=253&fmt=auto&app=138&f=JPEG.webp', 1, '2025-03-17 21:35:44', '图片不清晰', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-17 21:36:10');
INSERT INTO `t_work_source` VALUES ('df705f8a70064532aa065df35ba0103c', '20250323004841', '上饶广信供电局', '王小条', '该用户户表停转了', '没问题', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/82f92db995ae4adab691f6aeb529216701.png', '所属', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/a6d7844930be4939af0c1477826b947e9DX10IGH4C1M.jpg', 1, '2025-03-23 00:48:41', NULL, NULL, '5d1f6eed770f40dd9916098fb17934bc', NULL);
INSERT INTO `t_work_source` VALUES ('2503f076e87146f2a0f6dcad9f86bf8b', '20250323005744', '上饶广信供电局', NULL, NULL, '现场无问题，是由于线路检修导致停运，无需出咯', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/5a00051f9ea0491fbe1706fe9787e3d694a1939c30a2495a9ed11747ff5c132c_p1.png', '无需处理', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/e182105579d6467b9b8d9d9ef07ac6c680250c2107c841ff90022a45e9e0bfda_t1.png', 1, '2025-03-23 00:57:44', NULL, NULL, '5d1f6eed770f40dd9916098fb17934bc', NULL);
INSERT INTO `t_work_source` VALUES ('8011e8628a0d43939d762de218a1bbd3', '20250323010044', '上饶广信供电局', '广信一中10kV专线', '线路层级的问题导致停运，具体巡视原因描述为：线路发生故障', '计划停电现场无误', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/c312f587dd50437b83e07f8ec947599101.png', '处理完成', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250323/bd0274e74e5e44e8b1b14aeac523ba6094a1939c30a2495a9ed11747ff5c132c_p1.png', 1, '2025-03-23 01:00:44', NULL, NULL, '5d1f6eed770f40dd9916098fb17934bc', NULL);

SET FOREIGN_KEY_CHECKS = 1;
