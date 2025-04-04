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

 Date: 04/04/2025 11:25:10
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
INSERT INTO `t_cons_event` VALUES ('8f579c9744a84767a2672b88e275b914', '01220250222', '王文', '2025-04-02 10:18:00', 0.00, NULL, 4, 1, '用户王文目前已欠费超过10元，系统自动给予该用户断电处理！！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-04-02 10:18:00', '系统创建', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_cons_event` VALUES ('ad25baa8dfcb4e4dbc731fd6d5804514', '01120250222', '王小条', '2025-03-21 00:00:00', 134.68, '2025-03-23 00:48:41', 3, 2, '该用户户表停转了', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 13:44:03', '上饶广信供电局', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_cons_event` VALUES ('b7d7d10b-0737-11f0-8af5-005056c00001', '01120250222', '王小条', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 1, 2, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('b7d7e975-0737-11f0-8af5-005056c00001', '01220250222', '王文', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 1, 2, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('b7d8014b-0737-11f0-8af5-005056c00001', '01020250208', '胡为', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 1, 2, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', NULL, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_cons_event` VALUES ('bd72a807-0792-11f0-93c5-005056c00001', '01120250222', '王小条', '2025-03-23 10:57:28', 469.51, '2025-03-30 12:00:21', 2, 2, '广信区域中心01号公变在2025-03-23 10:57:28发生配变本身故障。变压器发生该类型停电的具体原因是配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 'c37d918124a24dafb5181f9d50d38145', NULL, NULL);
INSERT INTO `t_cons_event` VALUES ('bd7373ca-0792-11f0-93c5-005056c00001', '01020250208', '胡为', '2025-03-23 10:57:28', 469.51, '2025-03-30 12:00:21', 2, 2, '广信区域中心01号公变在2025-03-23 10:57:28发生配变本身故障。变压器发生该类型停电的具体原因是配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 'c37d918124a24dafb5181f9d50d38145', NULL, NULL);

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
INSERT INTO `t_cons_info` VALUES ('9bec2e8196254f879c29a08e46ab4810', '01120250222', '王小条', 1, NULL, '15478895421', '00036400', '2025-02-20', -5.23, 1, 409.45, NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-02-21 23:16:30', '上饶广信供电局', '2025-02-22 12:03:51', '上饶广信供电局', 0, NULL);
INSERT INTO `t_cons_info` VALUES ('bfe0771b9ad1433fb2fbc8a0635a2a0b', '00220250208', '广信一中', 4, '广信区中心高中一中', '911-9854-8754', '00036400', '2020-05-30', 9965.73, 1, 10053.99, '民生用户，随时做好保电措施', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:26:17', '上饶广信供电局', NULL, NULL, 0, '10036400');
INSERT INTO `t_cons_info` VALUES ('c14c3f6b575540f7961b2c8abc501f54', '01220250222', '王文', 1, '上饶广信区县中心小学对面', '12545521457', '00136400', '2025-02-22', 15.29, 1, 5698.98, '正常用户，但是用电量还挺大！', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-22 12:05:49', '上饶广信供电局', NULL, NULL, 0, NULL);
INSERT INTO `t_cons_info` VALUES ('cddfae83219840c385757275f6dcebee', '33414214', '测试', 4, '413', '12312', '00136400', '2025-02-14', 0.00, 2, 43.00, '134复电', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-07 16:45:40', '上饶广信供电局', '2025-02-07 17:07:55', '上饶广信供电局', 1, NULL);
INSERT INTO `t_cons_info` VALUES ('e74bcfb504a54ec29a5bac77a0c1a745', '01020250208', '胡为', 1, '广信区中心', '17872451245', '00036400', '2025-02-06', 365.45, 1, 1618.36, NULL, '5d1f6eed770f40dd9916098fb17934bc', '2025-02-08 11:38:41', '上饶广信供电局', NULL, NULL, 0, NULL);
INSERT INTO `t_cons_info` VALUES ('eacd8ac751ba4998a29e6bf71a2c24de', '00120250207', '广信人民医院', 4, '广信中心区人民医院', '120', '00036400', '2020-01-02', 9962.70, 1, 10059.72, '该用户为民生用户，不能停电，要随时做好保电措施！', '5d1f6eed770f40dd9916098fb17934bc', '2025-02-07 17:18:34', '上饶广信供电局', '2025-02-08 11:26:46', '上饶广信供电局', 0, '10136400');

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
-- Table structure for t_electricity_usage
-- ----------------------------
DROP TABLE IF EXISTS `t_electricity_usage`;
CREATE TABLE `t_electricity_usage`  (
                                        `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                        `cons_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `cons_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `record_time` timestamp(0) NULL DEFAULT NULL,
                                        `used_energy` decimal(10, 2) NULL DEFAULT NULL,
                                        `remaining_balance` decimal(10, 2) NULL DEFAULT NULL,
                                        `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                        `last_record_to_now_used_energy` decimal(10, 2) NULL DEFAULT NULL,
                                        `last_record_to_now_used_balance` decimal(10, 2) NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_electricity_usage
-- ----------------------------
INSERT INTO `t_electricity_usage` VALUES ('001cac6bf4904be88f389b18ad2d3eec', '01220250222', '王文', '2025-04-02 11:36:00', 5682.43, -24.75, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('002498adfe0949a0b30dc24192f8940d', '01220250222', '王文', '2025-04-02 12:45:00', 5687.23, -27.63, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('007314cdabbc497b8a3945177a74b68d', '00220250208', '广信一中', '2025-04-04 10:51:00', 10052.67, 9966.53, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('008b53e97fb448cfa3de9ace6899a85a', '01120250222', '王小条', '2025-04-02 11:48:00', 395.07, 3.37, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('008c9c072c9b4e418aaf8d818352373e', '00120250207', '广信人民医院', '2025-04-01 17:27:01', 10024.63, 9983.78, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('008f95a4100d45588293f505205d260b', '01120250222', '王小条', '2025-04-02 10:48:00', 388.58, 7.26, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('008ffc5e45b84bc383d973ca736ca9b7', '00120250207', '广信人民医院', '2025-04-04 10:57:00', 10058.91, 9963.19, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('00a6d72c976346f4881802af51d17ce3', '00220250208', '广信一中', '2025-04-02 11:57:00', 10042.26, 9972.75, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('010e4bf918dc4ca88987bce61c89e1a8', '00220250208', '广信一中', '2025-04-01 18:51:00', 10030.11, 9980.03, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('01147fbaa2d243e9b0b5b935cf9f2efc', '00220250208', '广信一中', '2025-03-31 22:15:00', 10015.67, 9988.69, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('01789d6b30434b3ba97b06f134b1b77a', '01120250222', '王小条', '2025-03-31 22:00:00', 367.66, 19.85, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('030823dafa0b47319bb91ebcfcad22fd', '00120250207', '广信人民医院', '2025-04-04 09:03:00', 10054.35, 9965.94, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('0386396e53ac468f849ad85d80cb064d', '01120250222', '王小条', '2025-04-04 11:06:00', 409.45, -5.23, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('039779df4e644c00a94c12f2eb79e8cd', '00120250207', '广信人民医院', '2025-04-01 18:51:00', 10033.45, 9978.51, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('03d111c3193247d99b6456df31f19003', '01020250208', '胡为', '2025-04-02 10:54:00', 1598.90, 377.16, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('043fd902cae741cca8021aef0024f86e', '01220250222', '王文', '2025-03-31 21:30:00', 5653.68, -7.52, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('047553e17f8b4705a0c722befbc55032', '01020250208', '胡为', '2025-03-31 21:39:00', 1575.19, 391.40, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('04b9abe9d79b441cb22a930d9694e385', '01120250222', '王小条', '2025-04-04 08:51:00', 403.40, -1.61, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('04ed51b0301246e482756cd71cd0edf1', '01220250222', '王文', '2025-04-02 11:21:00', 5681.33, -24.09, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('051cba5f5d4e42419e972e6d14b64fb5', '01020250208', '胡为', '2025-03-30 15:18:00', 1570.24, 394.37, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('0556354365004c199e824770787e8569', '00220250208', '广信一中', '2025-04-01 16:36:00', 10016.21, 9988.36, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('0676df9700484593be5354050f4128ef', '01120250222', '王小条', '2025-04-01 17:00:00', 371.48, 17.56, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('067ef0802613435887f1018a31dd829a', '01220250222', '王文', '2025-04-02 13:09:00', 5689.14, -28.79, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('06c49d78a38f4b4ba45dad6d73e314b3', '01020250208', '胡为', '2025-04-01 17:24:00', 1584.20, 385.99, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('073cb3c26b9846ae8a45c9dc07c3911c', '01120250222', '王小条', '2025-04-01 19:03:00', 383.06, 10.58, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('07f0fcf706ac4b3b9174d6bf26619a2d', '00120250207', '广信人民医院', '2025-04-02 11:15:00', 10041.99, 9973.37, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('080e4c1449b04aa0869a155eb42f5da7', '01020250208', '胡为', '2025-03-31 22:18:00', 1578.66, 389.31, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('08776e67f2814f6cb9437de20c0299f9', '00220250208', '广信一中', '2025-03-30 14:54:00', 10005.13, 9995.04, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('08950d5d45b44e15a5caea1a4944d5eb', '00220250208', '广信一中', '2025-03-31 21:39:00', 10012.51, 9990.60, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('08a6ab1f0a134449adc2e794380ab278', '00120250207', '广信人民医院', '2025-03-31 21:42:00', 10013.81, 9990.26, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('08a96e12433b4805aa737f3809d22948', '00220250208', '广信一中', '2025-04-04 08:51:00', 10048.80, 9968.84, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('08e789589eaf4e72a076a6118b520d1c', '01220250222', '王文', '2025-04-04 08:48:00', 5691.97, -30.50, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('091e39103f014205a6870014b55a56c8', '00220250208', '广信一中', '2025-04-01 17:03:00', 10018.64, 9986.92, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('09518e8d41c8413689969888b8a8233c', '01220250222', '王文', '2025-04-01 16:54:00', 5659.79, -11.19, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('09d64313b7454271800735db387cdb7c', '01120250222', '王小条', '2025-04-02 10:51:00', 389.06, 6.97, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('0a5a51d9815e4b44b080ad6e38ace430', '01120250222', '王小条', '2025-04-01 17:51:00', 376.94, 14.27, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('0a6e3cae816c4e1ab064b98123e79f77', '00120250207', '广信人民医院', '2025-04-01 19:03:00', 10034.78, 9977.71, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('0af2d4072b3c49218a27debc6b40f3b8', '01120250222', '王小条', '2025-04-02 11:45:00', 394.66, 3.61, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('0b265f65d7ac4139a736513e7f49bc04', '01120250222', '王小条', '2025-04-02 10:39:00', 387.31, 8.03, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('0b39fa6c18a3496d8fd438a071841eee', '01220250222', '王文', '2025-04-02 13:15:00', 5689.80, -29.19, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('0b9e978f62b34e0b9deadd90dc8775e1', '01220250222', '王文', '2025-04-04 10:54:00', 5698.13, 15.80, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('0ca64e1b92ee47d396bc06764c198ae3', '01220250222', '王文', '2025-03-31 21:39:00', 5654.69, -8.12, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('0cb06429b2974e8e828adc98f9a2b1d0', '00120250207', '广信人民医院', '2025-04-01 18:24:00', 10030.81, 9980.08, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('0d5a73b261764439bdb4fca3c3388b1c', '00220250208', '广信一中', '2025-04-02 13:15:00', 10046.49, 9970.22, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('0d65b39d8a3146c5991cae61e520b29f', '00120250207', '广信人民医院', '2025-04-04 08:57:00', 10053.90, 9966.21, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('0d70301403164e62a4d1ec3c6c06290e', '01220250222', '王文', '2025-04-01 19:00:00', 5672.91, -19.05, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('0da578879ab9489fbb0a8e5f9c3007ba', '00220250208', '广信一中', '2025-03-30 14:48:00', 10004.53, 9995.40, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('0db518fdde7845cead58b5dd116617dc', '00220250208', '广信一中', '2025-04-01 18:03:00', 10024.70, 9983.28, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('0dd1779255b64083872239ec2fe4a5e3', '01220250222', '王文', '2025-04-02 11:45:00', 5683.57, -25.43, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('0e61f3890b8d4ea5a9be47653f041582', '01020250208', '胡为', '2025-03-31 22:15:00', 1578.31, 389.52, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('0ec619815e444b83a9ad4c7b36471318', '01020250208', '胡为', '2025-04-01 17:57:00', 1587.70, 383.90, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('0ed0394ba0964743ab7b47eda67bd94c', '00220250208', '广信一中', '2025-04-01 17:27:00', 10021.50, 9985.19, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('0efaed49a83042f1ae9f611ed1387fd6', '01020250208', '胡为', '2025-04-01 17:18:00', 1583.38, 386.48, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('0f34454057c646559e3697cf99426418', '01020250208', '胡为', '2025-04-02 11:24:00', 1600.78, 376.02, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('0fe176e9d10c4716a3d6afef8faae227', '00220250208', '广信一中', '2025-04-02 12:39:00', 10043.12, 9972.24, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('1001f8b926724d0f8ad8b8d7ba8ecc81', '00120250207', '广信人民医院', '2025-04-01 17:36:00', 10025.32, 9983.36, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('1016aeec6bd94af28b2047762d1fa75e', '01020250208', '胡为', '2025-04-01 16:39:00', 1579.27, 388.95, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('1073e5c0a5754009b3b45704f0582564', '01220250222', '王文', '2025-04-01 19:03:00', 5673.27, -19.26, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('1091077c14a84142886a1b65a28e9947', '01020250208', '胡为', '2025-03-30 15:30:00', 1571.10, 393.85, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('10e3b25ed0ad4672bff22e5fc54bf011', '01220250222', '王文', '2025-04-04 08:54:00', 5692.76, -30.97, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('111dd5191f5844b1843ac27c9735a137', '01020250208', '胡为', '2025-04-02 10:48:00', 1598.31, 377.52, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('114450c72d3c4caf8ddd7af8e69cfd88', '01220250222', '王文', '2025-04-02 10:21:00', 5675.00, -20.30, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('11de15d624354508a89448cba048eba7', '01220250222', '王文', '2025-04-01 17:24:00', 5662.17, -12.61, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('1211cf1927804c61880a53f38a17e4f1', '00120250207', '广信人民医院', '2025-04-01 16:57:00', 10020.90, 9986.02, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('121dea0ad9514fcebed971ee476564c8', '01220250222', '王文', '2025-04-02 11:24:00', 5681.45, -24.16, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('12a9421cfd68461b8d5538ad7708eacd', '00220250208', '广信一中', '2025-04-04 10:54:00', 10053.10, 9966.27, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('12ee88dbe7ce4e2cb2f4c6ef5c9904f2', '00220250208', '广信一中', '2025-04-01 17:09:00', 10019.39, 9986.47, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('1360649b161c4d9097add156d6e320e1', '00120250207', '广信人民医院', '2025-04-04 09:12:00', 10055.24, 9965.39, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('13f8ff2e24f64a2894036edd89e5c1b7', '01020250208', '胡为', '2025-04-04 09:18:00', 1614.18, 367.95, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('141ff649df684feab0854a66684a1ded', '00220250208', '广信一中', '2025-04-01 17:48:00', 10023.23, 9984.16, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('14bd511c93ff4fefa7f9846b0018e9c3', '01220250222', '王文', '2025-04-01 17:06:00', 5661.00, -11.92, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('14c47ac452a14e5c994c2b42c76cec98', '01120250222', '王小条', '2025-04-01 18:36:00', 380.60, 12.07, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('14eecd993b74414aac08962391a87ebd', '01020250208', '胡为', '2025-04-04 09:00:00', 1612.40, 369.02, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('151b51c8b0e74fc69c69e465135daacb', '01020250208', '胡为', '2025-04-04 08:51:00', 1611.33, 369.66, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('1535c98b42f94fc09115053f49ea8cac', '01120250222', '王小条', '2025-03-31 22:15:00', 368.81, 19.15, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('155fe25e6a0a42b49da42671a40141df', '01120250222', '王小条', '2025-04-02 12:57:00', 399.38, 0.79, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('15ae0e215a3940208f8d2f70fc33956d', '00120250207', '广信人民医院', '2025-03-31 21:21:00', 10011.81, 9991.45, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('15c4b4086a7c40689f5da8f0976e26a7', '00220250208', '广信一中', '2025-04-01 16:45:00', 10017.15, 9987.81, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('162e34be06b44071a75ac142f4e2c742', '01120250222', '王小条', '2025-04-02 13:24:00', 401.59, -0.53, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('166cd11898574d00874a7a7951f8e5b5', '01120250222', '王小条', '2025-04-01 18:57:00', 382.43, 10.96, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('16f1ebaebfa640d59d6c8ae1c895b621', '01120250222', '王小条', '2025-04-01 17:33:00', 375.12, 15.36, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('1782bfe43d4c4a46b341445e3cd43e25', '00220250208', '广信一中', '2025-04-04 09:06:00', 10049.76, 9968.26, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('178467bf4cba4897b9a254b584206cce', '00120250207', '广信人民医院', '2025-04-04 08:54:00', 10053.60, 9966.39, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('18168063d86844b18eedea8465c877cd', '00220250208', '广信一中', '2025-03-31 22:18:00', 10015.98, 9988.50, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('184cf48ca19f452fa5d4ae4522cd181c', '01020250208', '胡为', '2025-04-04 09:03:00', 1612.60, 368.90, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('18763fbd412048198ddfa4ab43e67600', '01220250222', '王文', '2025-04-01 19:06:00', 5673.58, -19.45, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('1914ab21fff94cb2a6caae8f9535f7f8', '00220250208', '广信一中', '2025-04-02 11:21:00', 10038.84, 9974.81, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('1945f62f30dd479aa4d19df060668fd6', '01120250222', '王小条', '2025-04-02 11:09:00', 391.23, 5.66, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('19835c666be541b69a2bf1333478deb1', '01220250222', '王文', '2025-03-30 15:30:00', 5649.94, -5.27, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('19a2444bb98e42f2a6eaca7301ca8afb', '00220250208', '广信一中', '2025-03-30 14:42:00', 10004.17, 9995.62, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('19af155859314e9d9502deb7e68502bd', '00120250207', '广信人民医院', '2025-04-02 11:45:00', 10044.90, 9971.63, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('1b182cd3f76b4a3bbfe028b271ad7635', '01220250222', '王文', '2025-03-30 14:27:00', 5644.07, -1.77, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('1c00e20d449544e896b4fc58dbe236ee', '00220250208', '广信一中', '2025-04-01 18:12:00', 10025.57, 9982.76, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('1c62db2a42184b3195f85416356563d0', '00220250208', '广信一中', '2025-03-30 14:57:00', 10005.29, 9994.94, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('1c901d88180942d6919288e0e30f41be', '00120250207', '广信人民医院', '2025-04-01 18:30:00', 10031.26, 9979.81, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('1deea0907ba349b89ae27f50e802eafe', '01220250222', '王文', '2025-04-04 08:45:00', 5691.80, -30.40, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('1df9c7d10aa0426a83ba2448bd244b6f', '01220250222', '王文', '2025-04-01 18:00:00', 5666.31, -15.10, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('1df9db680a65442db4b045630a2b0f22', '01120250222', '王小条', '2025-03-30 15:00:00', 358.57, 25.30, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('1e4b6154c549457c81a08be5bf27815f', '01020250208', '胡为', '2025-03-31 22:09:00', 1577.75, 389.86, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('1e71da41803a48838d7aea6810e42a99', '00120250207', '广信人民医院', '2025-04-01 17:18:00', 10023.57, 9984.42, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('1ea8dd4fb9b8426a90b76f2fac4a1503', '00120250207', '广信人民医院', '2025-04-02 11:21:00', 10042.94, 9972.80, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('1efaba9693394533a3b873f2451b7c22', '01020250208', '胡为', '2025-04-01 18:27:00', 1590.64, 382.14, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('1f05457b864049a6b9eb6068c5c29415', '01220250222', '王文', '2025-04-02 10:30:00', 5675.70, -20.72, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('1f370a1bda354a578ff8507a78911cf1', '01020250208', '胡为', '2025-04-02 10:36:00', 1596.61, 378.54, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('1fc1a90fc0ac40da9cc12bd047cdeab6', '01220250222', '王文', '2025-03-30 14:21:00', 5643.68, -1.54, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('1fc419e4118949c2b2bd42ed93500aeb', '01020250208', '胡为', '2025-04-02 11:30:00', 1600.99, 375.89, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('1fc515d0074d418d81c31fc7be375c6e', '00220250208', '广信一中', '2025-04-02 10:36:00', 10033.67, 9977.90, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('2013e67b9a7c49babfecb38be700ac62', '01120250222', '王小条', '2025-03-31 21:51:00', 367.08, 20.20, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('207927cd5c73413fb3877422fefd7a8d', '01120250222', '王小条', '2025-04-04 09:18:00', 406.47, -3.45, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('20c2ae3d491242e28d1ca5a9c8ca48c6', '01120250222', '王小条', '2025-04-04 09:00:00', 404.31, -2.16, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('2169aeb266e544f3a13ec063e9d18535', '01020250208', '胡为', '2025-03-31 21:33:00', 1574.91, 391.57, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('217d202b88984cbd81835aa9592014d6', '00120250207', '广信人民医院', '2025-04-02 10:15:00', 10036.10, 9976.91, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('21a91af135614caca3ecd69327c7855d', '01120250222', '王小条', '2025-04-02 13:18:00', 401.14, -0.26, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('223512594d8a4ab798523c262168ac6d', '00220250208', '广信一中', '2025-04-01 16:48:00', 10017.27, 9987.74, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('224a01e568c54d1591e5a383beb67006', '01120250222', '王小条', '2025-04-02 11:00:00', 390.16, 6.31, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('2254d9dc48e548818694b6feceefca0c', '00120250207', '广信人民医院', '2025-04-01 16:45:00', 10019.60, 9986.80, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('22968d65141f48298c1be43b0b8a12a0', '00120250207', '广信人民医院', '2025-04-01 17:42:00', 10025.97, 9982.97, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('22a1873353f049aebf4fbeba3a327ec7', '01220250222', '王文', '2025-04-01 18:27:00', 5669.38, -16.94, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('23450bb489f54c7fa6fb2e1e04fcf07c', '00220250208', '广信一中', '2025-03-31 21:51:00', 10013.73, 9989.86, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('23f68a180acd425897adc2be9e1d38cd', '00120250207', '广信人民医院', '2025-04-04 08:42:00', 10052.65, 9966.95, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('23f915f932d847228e292d741cbe2c83', '01020250208', '胡为', '2025-04-04 10:51:00', 1616.73, 366.42, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('24048988f8954eb28739e5c78a32bada', '00220250208', '广信一中', '2025-04-02 11:36:00', 10040.04, 9974.09, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('2442fff867624656a706fca27fe524e1', '01220250222', '王文', '2025-04-02 11:51:00', 5684.40, -25.93, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('245468ad4945420385cdb892c59e4416', '01120250222', '王小条', '2025-03-31 21:27:00', 364.83, 21.54, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('24587deabd194090b33e25db997439e5', '01120250222', '王小条', '2025-03-31 21:48:00', 366.87, 20.32, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('2467c802d87f4a688bc55b8f0f020ec4', '01220250222', '王文', '2025-03-30 14:36:00', 5644.95, -2.29, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('24a192c19bb24f3994220c5cb3011ae4', '00120250207', '广信人民医院', '2025-04-04 09:24:00', 10056.84, 9964.43, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('24ac5fac1131457cad71618c5e2e92de', '01120250222', '王小条', '2025-04-02 13:06:00', 400.11, 0.35, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('24af604b3fac4cb694ffa5f6ac6584bc', '01020250208', '胡为', '2025-03-31 21:36:00', 1575.02, 391.50, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('258273b6e8a14cebac27256a8eb60609', '01220250222', '王文', '2025-03-31 21:15:00', 5652.05, -6.55, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('258beac19e414a28b7309a2c631b0b6a', '01120250222', '王小条', '2025-03-31 21:33:00', 365.39, 21.20, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('25a6bbff7abc44e7bf0e5acbd30c65ca', '00220250208', '广信一中', '2025-04-02 10:18:00', 10032.34, 9978.69, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('2658fc58c33540c3bf612b67597088de', '01020250208', '胡为', '2025-04-01 17:33:00', 1585.09, 385.47, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('2690eaa5ca8643dd805ab15f11fe4b33', '01220250222', '王文', '2025-04-02 10:00:00', 5674.23, -19.84, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('274748bdf2c34b9999adf02f91174960', '01020250208', '胡为', '2025-04-01 18:30:00', 1590.79, 382.05, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('274c1b98d5844dc89a68a08f91b2af64', '01120250222', '王小条', '2025-04-01 18:42:00', 381.17, 11.72, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('274e3017f9b44db789bfb3c40928777c', '00120250207', '广信人民医院', '2025-04-02 13:21:00', 10051.44, 9967.67, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('27e86f4ffd784e9ebc1d2bb5ddda3851', '01220250222', '王文', '2025-04-04 08:42:00', 5691.54, -30.24, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('2883069e17b34bfb94bf22442292f880', '01020250208', '胡为', '2025-04-02 11:06:00', 1599.82, 376.60, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('289f077f6270462a80ae2e5103131de2', '01020250208', '胡为', '2025-03-30 15:27:00', 1570.85, 394.00, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('28c3247452874aff912b3417f3efa77c', '01220250222', '王文', '2025-03-30 14:33:00', 5644.57, -2.06, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('28dad4cf7a434dd28a61c0f076cc7c80', '00120250207', '广信人民医院', '2025-04-04 09:30:00', 10057.42, 9964.08, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('29a62357a8454b679bad4900b0c78cf7', '01120250222', '王小条', '2025-03-31 21:00:00', 361.68, 23.42, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('29ccc2f2f4084e9eb0e34008f7ac4f76', '01220250222', '王文', '2025-03-31 21:00:00', 5650.57, -5.66, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('2a47ecf13f6f4c209d1ef5a091404fe3', '00120250207', '广信人民医院', '2025-04-01 17:00:00', 10021.32, 9985.77, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('2a6ddb6bd09b478f9ce7040ce632c203', '01020250208', '胡为', '2025-04-01 16:51:00', 1580.43, 388.26, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('2b64461bf2c3472fb264e4bd704fa819', '01220250222', '王文', '2025-04-02 11:48:00', 5683.99, -25.68, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('2b9697365a5c48de9a31b3defa873ad3', '00120250207', '广信人民医院', '2025-04-02 10:54:00', 10039.73, 9974.73, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('2be975ce9f15421eaae7641549b2b4a3', '01120250222', '王小条', '2025-03-30 14:48:00', 358.05, 25.61, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('2c58009dc1a14543ad56da079d2a019a', '01220250222', '王文', '2025-04-02 11:09:00', 5680.30, -23.47, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('2ca380c145994dd582e5f94f5215f880', '01020250208', '胡为', '2025-04-04 09:06:00', 1613.06, 368.62, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('2d3ce7d78a964227b3050ed94a6a5842', '01120250222', '王小条', '2025-04-02 13:00:00', 399.61, 0.65, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('2d3f984b1bbe4a7caa5b0bc253d7582e', '00220250208', '广信一中', '2025-04-02 12:54:00', 10044.65, 9971.33, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('2d407592a7774834a84074614350f59b', '01020250208', '胡为', '2025-04-01 17:30:00', 1584.88, 385.59, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('2d88da56954240f08dedd1155b918810', '00220250208', '广信一中', '2025-04-02 10:57:00', 10036.59, 9976.14, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('2dc210fa789c4da5a096dbba083daa5e', '01020250208', '胡为', '2025-04-04 08:54:00', 1611.71, 369.43, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('2dc4f006e91b496da1d8be89adb03cf5', '00220250208', '广信一中', '2025-04-02 12:45:00', 10043.48, 9972.03, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('2e1f5aea3d354e18848350de4c2fd1f9', '01220250222', '王文', '2025-04-01 17:15:00', 5661.52, -12.23, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('2e2e5129fcae40518d0a08f0df3d4400', '00120250207', '广信人民医院', '2025-04-01 18:48:00', 10033.05, 9978.75, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('2e91533d1c14465dafdba447e35c10a8', '01220250222', '王文', '2025-04-01 18:57:00', 5672.50, -18.81, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('2ebcecd8c5554c549f6b43a09ece464d', '01220250222', '王文', '2025-04-01 17:54:00', 5665.63, -14.69, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('2edb069d8e684872981c5349367a36bd', '00220250208', '广信一中', '2025-04-01 17:36:00', 10022.02, 9984.88, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('2f30ce80ae9a425f90d6667ca27b0000', '01120250222', '王小条', '2025-03-30 14:51:00', 358.15, 25.55, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('2fdcf3507e7f4eb28bcf5dfbc1f1340f', '01120250222', '王小条', '2025-03-31 21:45:00', 366.77, 20.38, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('2fdf841115634b03a27569515cf95a37', '00220250208', '广信一中', '2025-04-04 09:09:00', 10050.02, 9968.10, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('3026f849f13f4c9daf86446cc3425429', '01020250208', '胡为', '2025-04-02 13:21:00', 1609.35, 370.84, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('303aba8a39134b8281cb2f890acf29e5', '01220250222', '王文', '2025-03-31 21:27:00', 5653.19, -7.23, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('3077bc5357b24d11af1d84b47243fe6a', '01220250222', '王文', '2025-04-02 13:00:00', 5688.54, -28.42, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('30917985f0184cc49448df5396b6d992', '01020250208', '胡为', '2025-04-01 18:45:00', 1592.18, 381.21, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('30b9b950a642412c89d13adcc99e26dc', '00220250208', '广信一中', '2025-04-01 17:33:00', 10021.91, 9984.95, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('30d1f0173c3e41d6bc00925858407865', '00120250207', '广信人民医院', '2025-03-31 21:12:00', 10011.26, 9991.78, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('30df2fb197114e18a95619a4844cc62e', '00220250208', '广信一中', '2025-04-01 17:06:00', 10018.93, 9986.75, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('30fdc5ed058b4dc283a85658d7758139', '00220250208', '广信一中', '2025-03-30 15:21:00', 10007.86, 9993.40, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('315ebe2b6d5f46329377ffadd0c76737', '01120250222', '王小条', '2025-04-02 12:39:00', 397.57, 1.87, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('31621af504f14b88b3dee1cf2b618fd8', '01020250208', '胡为', '2025-03-30 14:21:00', 1564.62, 397.76, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('3172ed40425a4048978aaff6c6c2f56c', '00120250207', '广信人民医院', '2025-04-01 17:39:00', 10025.74, 9983.11, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('3197b2ffc39445cb819aa8cd83c1902f', '00220250208', '广信一中', '2025-04-01 17:42:00', 10022.61, 9984.53, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('31a7d531ac374115b454b44fa5f4004b', '01120250222', '王小条', '2025-03-31 21:57:00', 367.50, 19.95, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('31e8d52655b3400b9bf23898251eb985', '01220250222', '王文', '2025-04-04 08:39:00', 5691.14, -30.00, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('32819fa7f26343439c525622550334fa', '01020250208', '胡为', '2025-04-02 10:15:00', 1594.74, 379.65, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('328ba3bb9ecd4bd7ac694f2e1ba111e0', '00220250208', '广信一中', '2025-03-31 21:30:00', 10011.62, 9991.14, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('32998e2977a84dc5889923c1ef5ac026', '01020250208', '胡为', '2025-04-02 12:39:00', 1604.50, 373.77, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('3307b2be6dc64c74beb2906143355efc', '00120250207', '广信人民医院', '2025-03-31 21:51:00', 10014.91, 9989.60, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('337f9ae6416143e68b7e044f64816082', '01020250208', '胡为', '2025-04-01 17:39:00', 1585.52, 385.21, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('339bcaec8c7a46449fc9a1138148a0a8', '01020250208', '胡为', '2025-04-01 18:12:00', 1589.38, 382.89, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('33a0682e77a840ac86ad8269802a2ca1', '01120250222', '王小条', '2025-04-02 10:15:00', 384.34, 9.81, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('340fa13170ca4ecf80f7ebf49c7ec87f', '01120250222', '王小条', '2025-04-02 11:42:00', 394.33, 3.81, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('349bf4047f494489b5e63401fad27c30', '01020250208', '胡为', '2025-04-01 18:09:00', 1589.15, 383.03, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('34de7630da7045a99558dc1b54b0985e', '00220250208', '广信一中', '2025-03-31 22:06:00', 10015.04, 9989.07, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('34e3d2e1b84d410ba7ba9f5e330be4a8', '00220250208', '广信一中', '2025-03-30 15:18:00', 10007.42, 9993.66, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('355712c3964f48e6844168f35345506f', '01220250222', '王文', '2025-04-01 18:42:00', 5670.87, -17.83, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('35fd07db094847bd95b991b52a9db813', '00120250207', '广信人民医院', '2025-04-04 09:27:00', 10057.06, 9964.30, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('36217434b1e84fbeaf2fde2ac95e315d', '01120250222', '王小条', '2025-04-04 09:03:00', 404.57, -2.31, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('362d7f7b0ef2473fb21eb2eb55571082', '00220250208', '广信一中', '2025-04-02 13:09:00', 10045.95, 9970.55, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('3631cc68636042dbac1c75d7aba49e2d', '01020250208', '胡为', '2025-04-02 12:36:00', 1604.00, 374.07, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('3672793594504024abeada65fde4367a', '01220250222', '王文', '2025-04-02 10:36:00', 5676.50, -21.19, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('36847b2d656c4b16afeaece049c2cd7b', '01220250222', '王文', '2025-04-04 09:00:00', 5693.56, -31.45, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('377ec75556d146d5a130fa69d6c75187', '01120250222', '王小条', '2025-03-30 15:24:00', 360.76, 23.98, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('37ae6c5646a445869ce26a5f8532e38f', '00220250208', '广信一中', '2025-04-02 10:27:00', 10033.09, 9978.25, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('38055b5c891f43eca217f91dfdcb260e', '01120250222', '王小条', '2025-04-04 09:36:00', 407.46, -4.04, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('3810c49aee52467f8b2f79cf94b31a6a', '00220250208', '广信一中', '2025-04-01 19:00:00', 10030.73, 9979.66, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('382fae233db842a9892371c1178ff2ac', '01220250222', '王文', '2025-04-02 10:54:00', 5678.69, -22.50, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('383191b3d2b2403fb12877fed8a692dc', '00220250208', '广信一中', '2025-04-01 17:39:00', 10022.26, 9984.74, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('3841555bcdd44c7a894909b50dcef192', '01020250208', '胡为', '2025-04-02 10:45:00', 1597.83, 377.81, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('386f84d5c1b341a7813f6f78dfd0d1c2', '01220250222', '王文', '2025-04-04 09:30:00', 5696.53, 16.77, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('3878194594f046688f8da30889e57f3b', '01220250222', '王文', '2025-03-30 14:54:00', 5646.71, -3.34, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('389be9b3f2d14204a02e9acff0ff7bba', '01020250208', '胡为', '2025-04-01 17:51:00', 1587.07, 384.28, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('38b92cf18f9b496ba3db52b627bb9dd7', '01220250222', '王文', '2025-04-01 18:45:00', 5671.17, -18.01, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('38bdb5cafd2d40468be4fc7beba04bee', '01120250222', '王小条', '2025-04-04 09:12:00', 405.63, -2.94, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('38e3ed17584e48c5afed34dd53dd3f34', '01020250208', '胡为', '2025-03-30 14:54:00', 1567.68, 395.92, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('394ac25ed9304cc1992c404b729a887f', '01220250222', '王文', '2025-03-31 21:12:00', 5651.75, -6.37, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('39523c764fc5443f9a58182e921fe7da', '00220250208', '广信一中', '2025-04-02 11:39:00', 10040.15, 9974.02, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('396378e27ed14efd91665f1337eb676e', '00120250207', '广信人民医院', '2025-04-04 08:51:00', 10053.21, 9966.62, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('3987bfc4ae7748d7860096184a4300bf', '01020250208', '胡为', '2025-04-02 11:42:00', 1602.03, 375.26, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('39c5aeba0a164048903713861838043b', '00120250207', '广信人民医院', '2025-04-04 08:39:00', 10052.23, 9967.20, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('3a05e9dfd30d4aeb975377267e0c52c4', '01120250222', '王小条', '2025-04-01 17:39:00', 375.48, 15.15, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('3a8206e3757b4cefaa0070522aef45ec', '01220250222', '王文', '2025-04-02 10:42:00', 5677.20, -21.61, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('3abb361a669b4abeb8253b5aa8158a9a', '00120250207', '广信人民医院', '2025-04-02 11:36:00', 10044.19, 9972.05, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('3b0112e884034601a2ba222a43570a8c', '01020250208', '胡为', '2025-03-30 14:36:00', 1566.27, 396.77, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('3c77d5b06e6c4059a4ca9beefa38b6dd', '00120250207', '广信人民医院', '2025-04-02 13:24:00', 10051.74, 9967.49, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('3ccb18e938dd4320938728933f1a3ea8', '00120250207', '广信人民医院', '2025-03-30 15:03:00', 10006.32, 9994.75, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('3d6205be3f83490fa515c0f59101dfac', '00120250207', '广信人民医院', '2025-04-01 18:42:00', 10032.51, 9979.07, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('3d66edbd5fbe4d3d9c4b2dcbf320aca7', '01020250208', '胡为', '2025-04-02 10:30:00', 1596.12, 378.83, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('3daea75942f2452e81e8470f8544e1d1', '01020250208', '胡为', '2025-04-02 11:48:00', 1602.50, 374.98, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('3e88b46907f845cd84a282bbf36eb50f', '01220250222', '王文', '2025-04-04 09:06:00', 5693.93, -31.67, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('3ed6b6ba3604495980f1289bb7e387e9', '01120250222', '王小条', '2025-04-01 18:00:00', 377.96, 13.65, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('3edf5a3a638b4c978f9fd7ec5af8a87d', '01020250208', '胡为', '2025-04-04 10:54:00', 1617.08, 366.21, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('3fd8893f8d0e4319b04ea6be7f087934', '00120250207', '广信人民医院', '2025-03-30 14:27:00', 10003.44, 9996.49, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('40394db7dfbf41efa3458df29b374938', '01220250222', '王文', '2025-04-01 16:48:00', 5659.18, -10.82, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('403aca161eef4bf48e7f479c2f7125f1', '01120250222', '王小条', '2025-03-30 15:18:00', 360.41, 24.19, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('4088edd141d9464c82d0638a078e3697', '01120250222', '王小条', '2025-03-30 15:03:00', 358.81, 25.15, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('40eab62d66844f5e99a9042524edee9f', '00120250207', '广信人民医院', '2025-03-30 14:48:00', 10004.80, 9995.67, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('419ff1969a3e45d4a181ada414ff99fe', '01120250222', '王小条', '2025-03-31 22:09:00', 368.44, 19.38, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('41afff3bc63647ba9a18228801bd6741', '00220250208', '广信一中', '2025-04-02 10:42:00', 10034.59, 9977.35, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('41b1ac6328a94441aa81cb1b52c14a63', '00220250208', '广信一中', '2025-03-30 14:33:00', 10003.26, 9996.16, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('41c085540bd249b389bac4a12f0a8b3a', '01220250222', '王文', '2025-03-31 21:42:00', 5654.84, -8.21, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('41c8cb9c28d447ae8f3ee2e9f0e438a4', '01020250208', '胡为', '2025-03-30 14:51:00', 1567.40, 396.09, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('41d765e51fac49a9943465e81b939d81', '00120250207', '广信人民医院', '2025-04-01 18:54:00', 10033.87, 9978.26, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('42048f591eb444649b1423771f497597', '01120250222', '王小条', '2025-04-01 17:42:00', 375.93, 14.88, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('4218b660a67143bfabecc9760141e5c6', '01120250222', '王小条', '2025-04-01 18:12:00', 378.95, 13.06, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('4244a7a4831f44de959a7b47b7ee866d', '01220250222', '王文', '2025-04-04 08:51:00', 5692.39, -30.75, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('42b8ec47faf645a188195da83abe3379', '01220250222', '王文', '2025-04-01 17:39:00', 5664.06, -13.75, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('4304e75ac9bf4e9794b6789b38c8bab5', '01120250222', '王小条', '2025-04-02 11:24:00', 392.86, 4.69, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('43470cf57f684607821f674f42fc6bf9', '01120250222', '王小条', '2025-04-04 09:24:00', 406.76, -3.62, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('4351f909492f4113bd6a27535251f01f', '01120250222', '王小条', '2025-03-30 15:15:00', 359.91, 24.49, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('4354e86e1a1c462fa87716868088016d', '00120250207', '广信人民医院', '2025-04-02 10:39:00', 10038.20, 9975.65, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('435edbf924b0420ea2f8d51128bd5260', '00220250208', '广信一中', '2025-03-30 15:27:00', 10008.22, 9993.18, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('441295b40b544dcabf92c2d29b68bda3', '01220250222', '王文', '2025-04-02 10:24:00', 5675.21, -20.43, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('441695ff54bf46878cd6590fcaeb09e0', '00120250207', '广信人民医院', '2025-04-01 18:45:00', 10032.88, 9978.85, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('4499c2cabb5746e5b7cfe43a6c999696', '01220250222', '王文', '2025-03-31 22:03:00', 5656.60, -9.27, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('44c3b5a604984eada8a6002565d97428', '00120250207', '广信人民医院', '2025-03-30 15:30:00', 10009.23, 9993.00, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('44c7a53a2ebc4c0a91523ed1e248fc62', '01020250208', '胡为', '2025-03-31 21:27:00', 1574.46, 391.84, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('44ce6c7050724c90b3cc70791b14abf2', '01120250222', '王小条', '2025-04-01 18:18:00', 379.25, 12.88, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('44d55de4911f48a78d31e40126f8c201', '01120250222', '王小条', '2025-04-02 10:54:00', 389.55, 6.67, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('44df196576f649788e6e7442f0e54201', '00220250208', '广信一中', '2025-04-02 13:00:00', 10045.04, 9971.10, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('44edbf91728f47c380f959129f4a9d10', '00120250207', '广信人民医院', '2025-03-31 21:09:00', 10010.92, 9991.98, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('4553e182ba9b408cbe8434041772311a', '01020250208', '胡为', '2025-04-02 13:18:00', 1609.06, 371.01, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('45e74463011748d2a59bc5087144513d', '01120250222', '王小条', '2025-03-30 15:12:00', 359.51, 24.73, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('461c4589278d463d898b8238a2310356', '01020250208', '胡为', '2025-04-01 18:42:00', 1591.90, 381.38, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('4668818d7861466ebdc74811c57a09e5', '01020250208', '胡为', '2025-03-30 15:21:00', 1570.44, 394.25, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('46d8812d89854517bb03f9fb26aac6b5', '00120250207', '广信人民医院', '2025-03-31 21:54:00', 10015.03, 9989.53, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('46eae12b3b2344b9ad630134faf7e95f', '01120250222', '王小条', '2025-03-30 14:36:00', 356.98, 26.25, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('470155ed7ede4a4396aa40cec728f308', '00220250208', '广信一中', '2025-03-30 15:00:00', 10005.74, 9994.67, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('4758c5f4789c480e8faf6d20abdca409', '00220250208', '广信一中', '2025-04-04 08:45:00', 10048.12, 9969.24, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('476a4492ceb14a2e9f09f630240009d0', '00120250207', '广信人民医院', '2025-03-30 15:18:00', 10007.70, 9993.92, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('477bc7551bd34ae686e6871142c9d155', '00120250207', '广信人民医院', '2025-03-30 14:33:00', 10003.82, 9996.26, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('47e2c60efc8b4110bf9d44c797880661', '00220250208', '广信一中', '2025-04-02 11:06:00', 10037.57, 9975.56, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('492955cb5a3a425a8172ff94126fd882', '01120250222', '王小条', '2025-04-01 18:27:00', 379.95, 12.46, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('497a554ecfa149be88bb689d4b6bbe8f', '00220250208', '广信一中', '2025-04-01 18:06:00', 10024.95, 9983.13, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('4a8533cc323340c9a1cdfda9e2b9d784', '01020250208', '胡为', '2025-03-31 22:03:00', 1577.40, 390.07, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('4b016d1a4a954377a88323519b7d132a', '00220250208', '广信一中', '2025-04-02 13:06:00', 10045.84, 9970.62, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('4b061cc147ff4038b5c95ebb5a911eb7', '00120250207', '广信人民医院', '2025-04-01 17:21:00', 10023.88, 9984.23, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('4b4c3df069484a63bcc5b95497f99bb9', '01020250208', '胡为', '2025-04-02 11:03:00', 1599.67, 376.69, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('4b632ee6f1c64d048620b01688578608', '01020250208', '胡为', '2025-04-02 12:42:00', 1604.64, 373.69, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('4b7d383882df49ddaab0c0efde26253e', '00220250208', '广信一中', '2025-04-01 17:12:00', 10019.87, 9986.18, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('4b7ef125b2114503a0a408a66deb2018', '01120250222', '王小条', '2025-04-01 16:45:00', 370.18, 18.34, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('4c093af41fbe4c4d87fe114364d4b2e0', '01020250208', '胡为', '2025-04-02 11:09:00', 1599.96, 376.52, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('4c8510ffcb724a54a7f67e803fbd54f4', '01220250222', '王文', '2025-04-04 08:57:00', 5693.18, -31.22, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('4cab74778aa34802968b4ba5602b6aa5', '00120250207', '广信人民医院', '2025-04-02 11:18:00', 10042.47, 9973.08, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('4cd30348d4d84038b578fde0a7248940', '01120250222', '王小条', '2025-04-02 11:57:00', 396.38, 2.58, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('4d2d56554cad416db210233fdda65ae2', '00220250208', '广信一中', '2025-04-01 18:18:00', 10026.44, 9982.24, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('4d3cf093c1904317919bd8d96cf8bea9', '00120250207', '广信人民医院', '2025-04-01 18:06:00', 10028.84, 9981.25, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('4d54e034f5ef489aa22d2709cec4d9d6', '01120250222', '王小条', '2025-04-02 12:48:00', 398.45, 1.35, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('4d58eb48034740cbaf179eb4955d0f34', '00120250207', '广信人民医院', '2025-03-30 14:42:00', 10004.49, 9995.86, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('4d5c0e7f413a498199d5be507ec3464a', '01220250222', '王文', '2025-04-01 17:48:00', 5664.95, -14.28, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('4ebdc0c3c767400d8bc94d0033c9bfec', '01020250208', '胡为', '2025-04-01 17:12:00', 1582.60, 386.95, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('4ecbadcbe80142b3831bd24a2d67c446', '01220250222', '王文', '2025-03-30 15:03:00', 5647.57, -3.86, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('4ede289e7bb6475c8de6461dd4445ca2', '01120250222', '王小条', '2025-04-04 08:42:00', 402.21, -0.90, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('4f0d21d758c349539499e9e90cf5d10b', '01220250222', '王文', '2025-04-02 11:39:00', 5682.70, -24.91, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('4f142ad67ab643f098855d85ba470b5c', '01020250208', '胡为', '2025-04-02 10:27:00', 1595.90, 378.96, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('4f2a490281354132941b22609fd7ec5d', '01220250222', '王文', '2025-04-01 17:57:00', 5666.10, -14.97, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('4f32308c46964363bbb562a0ca9fa734', '00220250208', '广信一中', '2025-03-31 21:42:00', 10012.77, 9990.44, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('508bdd20a4f040fdae718ea39e2f4c70', '01020250208', '胡为', '2025-04-01 16:54:00', 1580.80, 388.04, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('50ee889f88034e7193c57715282dd51d', '00220250208', '广信一中', '2025-03-30 15:30:00', 10008.45, 9993.04, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('5250d675f34f4a6b8561d278951bf786', '01020250208', '胡为', '2025-04-02 10:24:00', 1595.59, 379.14, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('525a1627eef047e88d1bf498bc541542', '00220250208', '广信一中', '2025-04-01 18:45:00', 10029.41, 9980.46, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('5290f1fec3d049dca47839894aa54976', '01020250208', '胡为', '2025-04-02 11:54:00', 1602.85, 374.77, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('52a7dfe28ec540cd9a508ddbbd247617', '00120250207', '广信人民医院', '2025-04-02 12:36:00', 10046.81, 9970.47, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('52cc0a111c2d4463a23fe7605bd04775', '01120250222', '王小条', '2025-04-02 10:36:00', 387.18, 8.11, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('52dfebf5e096454f869d3def90dac343', '01020250208', '胡为', '2025-04-01 17:27:00', 1584.66, 385.72, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('5325ef0951154b68ab4b705df852fc1d', '01220250222', '王文', '2025-04-02 11:03:00', 5679.52, -23.00, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('532aeb567c2449ec92ff2380cd044a5c', '00220250208', '广信一中', '2025-03-31 21:27:00', 10011.35, 9991.30, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('53355439bab84163977283a9e0bd31f4', '01020250208', '胡为', '2025-03-31 21:45:00', 1575.67, 391.11, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('5350894a2c174ec684b4d3ad45233a1d', '00120250207', '广信人民医院', '2025-04-01 18:09:00', 10029.13, 9981.08, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('5370576163bc4ea38b2aa8a14cb4ab9e', '01120250222', '王小条', '2025-04-01 17:21:00', 373.35, 16.42, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('53a457b1672b4eceb50f22d044480741', '01220250222', '王文', '2025-04-02 10:48:00', 5678.00, -22.09, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('546df9629cd24e7aa5ec04501f88cb4d', '00120250207', '广信人民医院', '2025-04-01 16:54:00', 10020.63, 9986.18, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('54ce1d6d0430406682f31e3bf5c33ea0', '01220250222', '王文', '2025-04-02 11:00:00', 5679.27, -22.85, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('5546199748864bcd81f9b851b6ac0eb5', '01120250222', '王小条', '2025-04-02 12:54:00', 399.08, 0.97, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('55d7f6fe8c974a56988b69c70157edfb', '01220250222', '王文', '2025-04-01 18:06:00', 5667.04, -15.54, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('56ffb9a7926341199d5e0d8725cb8d3c', '00220250208', '广信一中', '2025-04-02 12:57:00', 10044.85, 9971.21, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('5821ef3eb4a0400681dcc1cf3d65583e', '00120250207', '广信人民医院', '2025-03-31 21:03:00', 10010.24, 9992.39, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('58703e151ab94277a8a410b1c696b861', '01020250208', '胡为', '2025-04-02 10:51:00', 1598.79, 377.23, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('589d121d067b4c45aaf06def249b42c3', '01220250222', '王文', '2025-04-02 12:57:00', 5688.40, -28.33, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('596c0f5ce929419eb9d2fe931ba35237', '00220250208', '广信一中', '2025-04-02 10:15:00', 10031.85, 9978.98, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('596c511177fb473dafd07aee2ab4cf6b', '01020250208', '胡为', '2025-04-04 11:00:00', 1617.70, 365.84, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('59fb7f2030b9414f8de987b8b72bf4f6', '00220250208', '广信一中', '2025-04-04 09:30:00', 10051.55, 9967.20, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('5afbcb2a940b458cb4f1f41ea2f4f13c', '01120250222', '王小条', '2025-03-30 15:30:00', 361.29, 23.66, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('5b33aef478c340d9940625dea325e9cb', '01020250208', '胡为', '2025-04-02 13:06:00', 1607.63, 371.88, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('5b87f4c327d746c5a4af8fd458e5b449', '01020250208', '胡为', '2025-03-31 22:06:00', 1577.53, 389.99, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('5b96a4751a3e445d8327068ca7c33234', '00120250207', '广信人民医院', '2025-04-02 13:03:00', 10049.63, 9968.77, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('5bbbe362c86646a5905a2ef6d973cee1', '01220250222', '王文', '2025-04-01 17:09:00', 5661.22, -12.05, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('5bea8ce8a5d843249e41d54c0204b62f', '01120250222', '王小条', '2025-04-04 11:00:00', 408.88, -4.89, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('5c5bb450a35f45dfbc229c90d160c358', '00220250208', '广信一中', '2025-04-01 17:21:00', 10020.89, 9985.56, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('5cce05fae8374dc4bf46d164e8096a95', '00120250207', '广信人民医院', '2025-04-02 13:00:00', 10049.29, 9968.98, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('5d8776a5f85145a19bb3c43f07f574d8', '01220250222', '王文', '2025-04-04 09:18:00', 5695.15, 17.60, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('5d9fe45953504715a8ca9e113ee25bcb', '00220250208', '广信一中', '2025-03-30 14:18:00', 10001.62, 9997.14, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('5e2fd599274343efb4d1a1cf26fee6f3', '00220250208', '广信一中', '2025-03-30 15:06:00', 10006.28, 9994.34, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('5e4027be8f9441a492ed2ff3a835c1cc', '01020250208', '胡为', '2025-03-31 21:03:00', 1571.94, 393.34, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('5e6cd64908af4cb8bd49c06d466b3940', '01120250222', '王小条', '2025-04-01 17:30:00', 374.68, 15.62, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('5eec955046644f52a759efd94912667e', '00220250208', '广信一中', '2025-03-31 21:15:00', 10010.26, 9991.96, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('6004dc8b379342a1b69a48026974cb07', '01220250222', '王文', '2025-03-31 21:06:00', 5650.88, -5.85, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('600e14abf4954f24b2efe1e0f7be171c', '01120250222', '王小条', '2025-03-30 15:27:00', 360.93, 23.88, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('602138ba396541149c254560c1241f08', '00220250208', '广信一中', '2025-04-04 09:03:00', 10049.62, 9968.35, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('6038bcc7d59c4379b9bcc560066d8bff', '01120250222', '王小条', '2025-04-04 08:45:00', 402.44, -1.04, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('60ad6a3047964537a7602ac6400028d7', '01020250208', '胡为', '2025-03-31 22:12:00', 1578.01, 389.70, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('60f65054f3ed438cae880ee32258646b', '01220250222', '王文', '2025-04-02 12:51:00', 5687.81, -27.98, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('611c913e84824dca96ad9682eae59cee', '00220250208', '广信一中', '2025-04-02 10:45:00', 10034.78, 9977.23, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('614b2b9d22364c76944fedc9dcbf4a7e', '01120250222', '王小条', '2025-04-01 18:03:00', 378.10, 13.57, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('6165cbe5ce6a4e7897164f9f36d13bd4', '01120250222', '王小条', '2025-03-31 21:54:00', 367.30, 20.07, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('61c3c6fd8340433cad5393720086e185', '00120250207', '广信人民医院', '2025-04-02 11:09:00', 10041.44, 9973.70, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('62346a56b82348a2901ffa18e05b21dd', '01120250222', '王小条', '2025-04-01 16:57:00', 371.35, 17.64, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('62cc301f197548bcb59890952fa2e550', '01020250208', '胡为', '2025-04-01 16:42:00', 1579.71, 388.69, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('630033d2c74243c9920e27ac51775e17', '00220250208', '广信一中', '2025-04-01 17:51:00', 10023.48, 9984.01, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('63039097392e4f21b629de4a3c20087d', '00120250207', '广信人民医院', '2025-04-02 13:09:00', 10050.23, 9968.41, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('632e3190ef534f0797c5f9164376d92a', '00220250208', '广信一中', '2025-03-31 22:00:00', 10014.62, 9989.33, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('6354b781a33e4f8ba5ee992a0a19f5b6', '01020250208', '胡为', '2025-04-02 11:00:00', 1599.51, 376.79, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('6392efd1f20344669a46a87f07140b08', '01120250222', '王小条', '2025-03-30 14:45:00', 357.63, 25.86, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('63a61acf49c441cdae7becd0b097ea4f', '00220250208', '广信一中', '2025-04-04 08:42:00', 10047.82, 9969.42, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('6400a70224374fb9ac0087d44edc55c6', '01120250222', '王小条', '2025-03-31 20:57:00', 361.45, 23.56, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('643d3e1ca97941d78cf6d32c8835509e', '01120250222', '王小条', '2025-04-01 17:03:00', 371.89, 17.31, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('644e231b347a4e95a44cd289a94c2dea', '01120250222', '王小条', '2025-04-02 11:15:00', 391.92, 5.25, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('649352b87abb4f6c89dc5805e3ca5ed5', '01220250222', '王文', '2025-04-01 16:39:00', 5658.31, -10.30, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('64fd047f73264ec6b2cc0e8c675803fb', '01220250222', '王文', '2025-04-02 11:30:00', 5681.78, -24.36, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('657c35aca2644314a41467db9319116e', '01020250208', '胡为', '2025-04-01 18:39:00', 1591.78, 381.45, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('65863b76ac4f4954a68f85c3d3b0f9d0', '00120250207', '广信人民医院', '2025-04-02 10:30:00', 10037.16, 9976.28, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('65a0d7465be7455ca05769bb1dc53767', '01020250208', '胡为', '2025-03-30 14:18:00', 1564.39, 397.90, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('65a2691c0de941e9b054b7d3aac8f974', '00120250207', '广信人民医院', '2025-04-02 12:51:00', 10048.39, 9969.52, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('65c7aa392b564e87948311a2ceac3fa5', '00220250208', '广信一中', '2025-03-31 22:09:00', 10015.21, 9988.97, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('65e65cb8573d4b1fb2174c9455a2e258', '00120250207', '广信人民医院', '2025-04-04 10:54:00', 10058.60, 9963.37, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('65ee3813e254450bbc1327295c93d92e', '01120250222', '王小条', '2025-03-30 14:18:00', 355.17, 27.33, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('66f8d12eea964abd82b27574981c16d9', '01120250222', '王小条', '2025-04-02 13:21:00', 401.26, -0.33, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('67188856e7864bc99a50c9877190f33d', '01120250222', '王小条', '2025-03-30 15:09:00', 359.36, 24.82, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('676b529e07fa49b292973e634fcc40cf', '01120250222', '王小条', '2025-04-04 09:21:00', 406.57, -3.51, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('67c8bf0a7d72464cbf0030a2be8788b7', '01020250208', '胡为', '2025-04-01 18:03:00', 1588.37, 383.50, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('68335c27510d462380faa1486c50fd2b', '01020250208', '胡为', '2025-03-31 20:57:00', 1571.21, 393.78, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('6885ec1842c94718ad1c2339ec0b1f52', '00220250208', '广信一中', '2025-04-04 09:33:00', 10051.96, 9966.96, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('68a308220b7e42bf891ad3e0fd693579', '00220250208', '广信一中', '2025-03-30 15:12:00', 10006.75, 9994.06, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('68d5bb9535324c9096a1a5ffef7a3ddf', '01020250208', '胡为', '2025-04-01 18:48:00', 1592.33, 381.12, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('692f1b5e1d3a4173bf87ccecfd3632d1', '01220250222', '王文', '2025-03-31 22:15:00', 5657.68, -9.92, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('693cb882dc8040889854a2eb88f950d7', '01020250208', '胡为', '2025-04-04 09:24:00', 1614.59, 367.70, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('696e5194206a430f9ece85833cface69', '01220250222', '王文', '2025-03-30 15:00:00', 5647.37, -3.74, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('698a270db3874a588d052bee3aef5af3', '00120250207', '广信人民医院', '2025-04-01 18:12:00', 10029.50, 9980.86, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('69bb3c0300a049d09227df65aa81e17f', '00120250207', '广信人民医院', '2025-03-30 15:00:00', 10005.94, 9994.98, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('69f39ea69352429bbcc6f08d8e4135f5', '00120250207', '广信人民医院', '2025-04-02 13:18:00', 10051.21, 9967.81, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('6a920490661b4f91abf6d82bcfe2d552', '01020250208', '胡为', '2025-04-01 17:36:00', 1585.29, 385.35, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('6a9ec7a222b44736950b20235605a5ae', '00120250207', '广信人民医院', '2025-04-02 13:06:00', 10049.90, 9968.61, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('6ae278bb904d44c7a53e5d763162012b', '00220250208', '广信一中', '2025-04-02 12:42:00', 10043.24, 9972.17, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('6b1e1dd8ea684c1cb775a9cdfa0b9ebf', '01020250208', '胡为', '2025-04-01 18:18:00', 1590.06, 382.49, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('6b1ec7feb3da4f549c3363e04d549bd0', '01120250222', '王小条', '2025-04-02 11:18:00', 392.40, 4.96, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('6b4a3ed275c54caebe9771fd39ab5d30', '00120250207', '广信人民医院', '2025-03-30 15:09:00', 10007.01, 9994.33, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('6bc77cea63724fd4a8b0332833e6f913', '01220250222', '王文', '2025-03-31 21:48:00', 5655.26, -8.47, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('6c077b8c12314475a092d744cbbee8c9', '01020250208', '胡为', '2025-04-01 17:21:00', 1583.86, 386.19, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('6c233e8388554e668b0e25e013266b3d', '01020250208', '胡为', '2025-03-30 15:00:00', 1568.30, 395.55, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('6cf51a724e274477ac90c0bf348e5c4b', '00120250207', '广信人民医院', '2025-03-31 21:33:00', 10012.85, 9990.83, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('6d07823c23274fbb9b5d9d3b1a6be5a6', '01020250208', '胡为', '2025-04-02 10:21:00', 1595.26, 379.34, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('6d4f0e5e5ade409a9ea33613d657d920', '00220250208', '广信一中', '2025-04-01 18:09:00', 10025.08, 9983.05, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('6d9ea6b40cf0476c88aa5da91c6ff819', '00120250207', '广信人民医院', '2025-04-01 16:48:00', 10019.99, 9986.56, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('6da0c84d423d49dda57cc58b76044a6c', '01120250222', '王小条', '2025-04-01 18:15:00', 379.11, 12.96, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('6dfe0a471b184fbda6d2a86f979fb433', '01020250208', '胡为', '2025-03-30 14:48:00', 1567.17, 396.23, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('6eb3cc878206408ebfa5dcdeecec0993', '01020250208', '胡为', '2025-03-30 14:30:00', 1565.87, 397.01, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('6f0eb768cb504b8f9b6c9052d6339fc1', '00120250207', '广信人民医院', '2025-04-02 11:42:00', 10044.51, 9971.86, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('6f70bc5d25e24491ac42980aecdc9843', '00120250207', '广信人民医院', '2025-04-02 12:54:00', 10048.75, 9969.30, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('6fc7fd87243c49928d4fafbb809c85f9', '00120250207', '广信人民医院', '2025-04-02 11:03:00', 10040.90, 9974.03, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('6fcefae025a54973ba91d02457f361a3', '00120250207', '广信人民医院', '2025-04-02 10:42:00', 10038.32, 9975.58, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('6fd41cfb13474fe68d8eaa8e95b154d2', '00220250208', '广信一中', '2025-04-02 10:24:00', 10032.93, 9978.34, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('7003d1668f0340b3a4c6c0abd229b9a1', '00220250208', '广信一中', '2025-03-31 21:24:00', 10011.02, 9991.50, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('7029f153e71944a39f5f76bbf8c442a7', '00120250207', '广信人民医院', '2025-04-01 18:39:00', 10032.11, 9979.31, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('7039b04f588e4ba5af808ceccf266983', '00220250208', '广信一中', '2025-04-04 09:18:00', 10050.61, 9967.75, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('70438c7ca9384ba0b735ca34aa2aa98f', '01220250222', '王文', '2025-04-02 12:36:00', 5686.40, -27.13, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('70bf4a8c9c3342e98673e109c965b670', '00220250208', '广信一中', '2025-04-04 10:48:00', 10052.34, 9966.73, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('71108238de2a49bfb4b0b9ed41ead0ce', '01220250222', '王文', '2025-04-02 12:48:00', 5687.70, -27.91, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('7119aac5ec3d4136b9be94ec04be5e0a', '00120250207', '广信人民医院', '2025-03-30 14:24:00', 10003.14, 9996.67, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('712a6d8a1ada4bc0bd71daa2b76db27c', '00220250208', '广信一中', '2025-03-31 20:57:00', 10008.64, 9992.93, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('72117e1c123042bc8722c1143cf03d00', '01020250208', '胡为', '2025-04-04 11:03:00', 1618.19, 365.55, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('72a9cdb435854a0da3fdcde67adfd5a2', '01020250208', '胡为', '2025-03-31 21:21:00', 1573.87, 392.19, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('72c36abdbbc6401880bb23f7a8082137', '00220250208', '广信一中', '2025-03-31 22:03:00', 10014.78, 9989.23, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('72decd47caf44a32a9d5efcd28d8a4c2', '00220250208', '广信一中', '2025-04-04 09:24:00', 10051.11, 9967.46, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('7357a38f96b0493a86b272d6eedac74f', '00120250207', '广信人民医院', '2025-04-01 18:21:00', 10030.61, 9980.20, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('738d0b7b88884cbc8f3762a630cf3b40', '00120250207', '广信人民医院', '2025-03-30 14:39:00', 10004.10, 9996.09, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('739a7cb9e7ac41e897efb8103913257d', '01020250208', '胡为', '2025-04-01 17:45:00', 1586.27, 384.76, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('73a932a533204780bfd70c7d5172198d', '01120250222', '王小条', '2025-03-31 22:12:00', 368.60, 19.28, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('73e841fcc7614f4e816bb4a49eb94cf2', '01220250222', '王文', '2025-04-01 18:24:00', 5668.94, -16.67, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('74029cf52aa04197b79ccd02f4a076eb', '01020250208', '胡为', '2025-04-01 18:33:00', 1591.14, 381.84, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('744d7809a68c48eab72aff2fd535302f', '00220250208', '广信一中', '2025-04-01 17:57:00', 10024.10, 9983.64, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('74eaf9d16eea49bd98aacff5ddefa8d3', '00120250207', '广信人民医院', '2025-04-02 11:06:00', 10041.21, 9973.84, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('7555fbf0343b4b6d882eb335dda18b46', '00120250207', '广信人民医院', '2025-03-30 14:51:00', 10005.18, 9995.44, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('756ab9315bdb42e19dbb821db6e39b93', '01220250222', '王文', '2025-04-01 17:12:00', 5661.35, -12.13, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('75a7d14dea864dd1b98cab1c6a683f59', '01120250222', '王小条', '2025-04-02 11:39:00', 394.12, 3.94, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('75dd93e4dde948f693a2639f4f0c20ff', '01020250208', '胡为', '2025-03-31 21:51:00', 1576.07, 390.87, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('762eb61a1aeb49d593f96d54f0ee428f', '01120250222', '王小条', '2025-04-01 16:42:00', 369.77, 18.58, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('7659bde6e96046c3993b9963312408cb', '00120250207', '广信人民医院', '2025-04-02 10:33:00', 10037.41, 9976.13, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('767ea72706b64711a3796b40f9d3299b', '00120250207', '广信人民医院', '2025-03-31 21:45:00', 10014.19, 9990.03, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('770f69136c5e4894ae4a5d72b0dce520', '00220250208', '广信一中', '2025-04-01 16:54:00', 10017.87, 9987.38, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('771652e1c83b418e8513b01c40047dd6', '00120250207', '广信人民医院', '2025-03-31 21:06:00', 10010.70, 9992.11, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('775317e8b65a40978546270d20dbe6eb', '01120250222', '王小条', '2025-04-02 11:30:00', 393.11, 4.54, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('7762ecddc650487d9d579036c7ba04ba', '00120250207', '广信人民医院', '2025-04-02 10:51:00', 10039.42, 9974.92, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('777b49537d7f4a17abbf21762b3bb323', '00120250207', '广信人民医院', '2025-04-01 19:09:00', 10035.52, 9977.26, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('77ba1adcbd9246c3aba858878db2ad3a', '01020250208', '胡为', '2025-04-01 16:57:00', 1581.22, 387.79, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('77cd360f4a0040ee92135cab247b0c2a', '00120250207', '广信人民医院', '2025-03-31 21:00:00', 10010.04, 9992.51, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('77eae4f822df4855b9e5832c1e42d5e2', '01120250222', '王小条', '2025-04-02 12:45:00', 398.28, 1.45, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('78df26620d7c4e4a8a64b7bb1c435a9f', '00120250207', '广信人民医院', '2025-04-01 17:57:00', 10027.78, 9981.88, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('793f3f9dd36f4f5a8d689491253d0a13', '00120250207', '广信人民医院', '2025-04-01 18:36:00', 10031.83, 9979.48, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('794aa81c3b2e497f8f1258bd2986a8fb', '01120250222', '王小条', '2025-03-31 21:06:00', 362.32, 23.04, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('795a8f40aacb431c886c88acfca3dbe9', '01120250222', '王小条', '2025-03-31 22:06:00', 368.18, 19.53, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('79b73ebd9bb54208bafea86b6a292e02', '01120250222', '王小条', '2025-04-01 18:51:00', 381.74, 11.38, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('79bf57e7d0b140cc864ad21dcf8bc3fe', '00120250207', '广信人民医院', '2025-03-31 20:57:00', 10009.62, 9992.76, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('79d41056671449e9bec8fc2eaad26556', '00220250208', '广信一中', '2025-04-02 12:51:00', 10044.29, 9971.54, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('7a28fd98c4f54b4aaa40d21c24de846a', '00220250208', '广信一中', '2025-03-31 21:09:00', 10009.90, 9992.18, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('7a4171242bed49fbb61e1f20fecdd32b', '00120250207', '广信人民医院', '2025-04-02 12:57:00', 10049.14, 9969.07, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('7aa0634eb9b9406e8a14a5e269a38e47', '01120250222', '王小条', '2025-04-01 16:51:00', 370.80, 17.97, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('7c312464b8214c3986aa3fc54dfe07de', '00120250207', '广信人民医院', '2025-04-01 17:03:00', 10021.76, 9985.51, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('7cb08e97faa9484c842691dad26e16aa', '01220250222', '王文', '2025-04-02 13:03:00', 5688.68, -28.51, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('7cb810681fb74d90877a87aaf853d4d7', '01120250222', '王小条', '2025-04-01 17:54:00', 377.22, 14.10, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('7cb8a5850a0a45f4a13ab5bba1b9236a', '00120250207', '广信人民医院', '2025-04-02 10:00:00', 10035.95, 9977.00, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('7cbccaec38ee4dbda7d5ee4fa5ae3036', '01220250222', '王文', '2025-04-04 09:03:00', 5693.75, -31.56, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('7cf9713b75b54261a998fc285bd0b308', '00220250208', '广信一中', '2025-03-31 21:03:00', 10009.07, 9992.68, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('7d8d6214bd314d6fa3af6ebbc02675e4', '00220250208', '广信一中', '2025-03-31 21:12:00', 10010.13, 9992.04, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('7da65bcd65f94e0cac905cc192c7f478', '01020250208', '胡为', '2025-04-01 16:48:00', 1580.11, 388.45, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('7e9affff4399471fabe77c4779691f2c', '01220250222', '王文', '2025-04-01 18:30:00', 5669.57, -17.05, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('7ef1e3132f6b4247bc857e6fb7ed0513', '01020250208', '胡为', '2025-03-30 15:24:00', 1570.60, 394.15, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('7f530f52f3544ef999d6650c9e034bc6', '01220250222', '王文', '2025-03-30 14:30:00', 5644.33, -1.92, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('7fa4d476262c4a2680dca6c1e3bb1a72', '01120250222', '王小条', '2025-03-30 15:06:00', 359.01, 25.03, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('7fb48dc01fb34c349e02ff3b9eaea0ae', '01020250208', '胡为', '2025-03-31 21:48:00', 1575.84, 391.01, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('7ff0bd8e3f7c4b63acb60ec13b1772f1', '00120250207', '广信人民医院', '2025-03-30 15:06:00', 10006.62, 9994.57, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('8003b84b608b4478bb5a9479f8c9323d', '00120250207', '广信人民医院', '2025-04-02 12:48:00', 10047.99, 9969.76, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('801084b9f8f64c97b86150e30ce5a044', '01220250222', '王文', '2025-03-30 14:57:00', 5646.94, -3.48, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('801c80760d9249f1842a85712937f7b7', '01020250208', '胡为', '2025-04-04 09:36:00', 1615.93, 366.90, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('8041cb17b4c945b5ab0b0962e60f43c5', '01120250222', '王小条', '2025-04-01 18:09:00', 378.62, 13.26, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('80437e299fae4259a58b7465b74b4f7c', '01120250222', '王小条', '2025-03-31 21:36:00', 365.81, 20.95, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('805006bb13194d29bb9d0f16bdd56cee', '01020250208', '胡为', '2025-03-31 21:09:00', 1572.58, 392.96, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('80cd0a36c06a4342bc397a1cc267e1d8', '01120250222', '王小条', '2025-03-31 22:18:00', 368.95, 19.07, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('80efa917f5cf4678871ef584528c306e', '01020250208', '胡为', '2025-04-01 16:36:00', 1579.13, 389.03, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('81217fa4528d4eadafc27315f584857e', '01120250222', '王小条', '2025-04-01 19:06:00', 383.48, 10.33, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('8197a13f0bc540bd9d7b316a9a6f3a7d', '00120250207', '广信人民医院', '2025-04-01 18:15:00', 10029.95, 9980.59, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('81a51360f4924b00a1148e35cb3a61e9', '01020250208', '胡为', '2025-04-04 09:12:00', 1613.61, 368.30, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('81b7ad87e8a243f390a1579335b558c8', '01120250222', '王小条', '2025-04-02 10:21:00', 385.14, 9.33, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('81d0e0c1b99e448fb5d6f479430296d8', '01220250222', '王文', '2025-04-02 11:42:00', 5683.18, -25.20, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('82dfaf02df4040c3b8bfd597158b5f36', '00120250207', '广信人民医院', '2025-04-01 18:33:00', 10031.37, 9979.75, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('83eee7c02b084303ab0325814c24ec0f', '01220250222', '王文', '2025-03-30 15:12:00', 5648.37, -4.33, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('8403d63030a745f99ca873f5117f2afb', '01120250222', '王小条', '2025-04-01 18:39:00', 380.91, 11.88, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('843f69c677b4410c997b098553f4d830', '01120250222', '王小条', '2025-04-04 08:54:00', 403.70, -1.79, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('84886168c4ba4c67b16637fceb829b5c', '00120250207', '广信人民医院', '2025-04-04 10:48:00', 10057.97, 9963.75, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('8497edc1d94949bf9c0723c7e490da0b', '01220250222', '王文', '2025-04-02 11:54:00', 5684.88, -26.22, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('84d6399f1ed24258b69310cef8191dd8', '00120250207', '广信人民医院', '2025-04-02 10:36:00', 10037.77, 9975.91, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('851cc6ce756343499e8cbc44d0331080', '01120250222', '王小条', '2025-04-01 16:36:00', 369.15, 18.95, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('852765012fe24d27a0d5bfe46e3582d3', '01020250208', '胡为', '2025-04-02 12:54:00', 1606.25, 372.72, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('852f3a4d1b0648a89d46fc622b46f94a', '01120250222', '王小条', '2025-04-01 17:36:00', 375.27, 15.27, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('853790a8bf3144bb908d20e302add8ae', '01120250222', '王小条', '2025-04-02 13:03:00', 399.71, 0.59, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('8565e6f000e34e39bf4dd512dc1f2498', '01220250222', '王文', '2025-03-31 22:06:00', 5657.00, -9.51, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('858956f638084a5d8a38e0a806a9ecb8', '01120250222', '王小条', '2025-03-30 14:57:00', 358.37, 25.42, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('85d1296dadba4262a86286d2d4ac7e32', '01120250222', '王小条', '2025-04-01 16:39:00', 369.37, 18.82, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('85ff794d48b442d1a1c1e44622f59708', '01020250208', '胡为', '2025-04-01 18:36:00', 1591.47, 381.64, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('8672f258edd74c869cd8728419c4b55c', '00220250208', '广信一中', '2025-04-01 17:00:00', 10018.39, 9987.07, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('86a6042371464dfb9a4abcf038ccbc2d', '01220250222', '王文', '2025-04-01 16:57:00', 5660.18, -11.42, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('86a87a00803148e29fd33248ae9a5a41', '01120250222', '王小条', '2025-04-02 13:09:00', 400.23, 0.28, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('86c39af1af7e4346bb40d9bd81b5814c', '01220250222', '王文', '2025-03-30 15:06:00', 5647.94, -4.08, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('86f3ef70dfbe49be84941f60ab52af38', '01020250208', '胡为', '2025-03-31 21:42:00', 1575.34, 391.31, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('870c36529abd4f0584df0586f74427a2', '00120250207', '广信人民医院', '2025-03-31 22:06:00', 10016.48, 9988.66, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('872048a781eb49f38212748221fb3510', '01220250222', '王文', '2025-04-04 09:12:00', 5694.65, -32.10, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('8722fa78210e40d38832abe687bc1246', '00220250208', '广信一中', '2025-04-01 18:36:00', 10028.52, 9980.99, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('8776bdb03186494b91960a245a412bbc', '01120250222', '王小条', '2025-04-01 17:12:00', 372.32, 17.04, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('88c2c79e436e4cf1946e81dd8045dcc0', '01120250222', '王小条', '2025-04-01 18:24:00', 379.82, 12.54, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('89136068ff7c43e091c93980072a9748', '01220250222', '王文', '2025-03-30 15:24:00', 5649.24, -4.85, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('897b81c665d249bdbd5e222ea341a65d', '01120250222', '王小条', '2025-04-02 11:06:00', 390.85, 5.89, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('89c96ceb41514c10ace3b4bb495fd2be', '01120250222', '王小条', '2025-04-04 09:27:00', 406.93, -3.72, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('89fd8be30bc14c02866ba14df870082b', '00220250208', '广信一中', '2025-04-02 10:39:00', 10034.09, 9977.65, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('8a0b49d2b3844faa9b3bf598cb4d1bda', '01120250222', '王小条', '2025-04-02 11:21:00', 392.52, 4.89, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('8a0b8cf7784a44c4b1beb2780c2d9b98', '01220250222', '王文', '2025-04-01 16:51:00', 5659.33, -10.91, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('8a1098fb39334bf68943a991b1f78b6a', '01020250208', '胡为', '2025-04-02 12:30:00', 1603.27, 374.51, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('8a30de414d82449b8c4d202341f59608', '00120250207', '广信人民医院', '2025-03-30 15:21:00', 10008.17, 9993.64, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('8a3c08fdbd0846f5a381fa332b78a0a2', '00220250208', '广信一中', '2025-03-30 14:27:00', 10002.45, 9996.65, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('8a4165c1eff448c0b0ee3d969ab09097', '00220250208', '广信一中', '2025-03-31 21:45:00', 10013.06, 9990.26, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('8a6b082fe3474913bc2db0466eb042a8', '01120250222', '王小条', '2025-04-02 10:18:00', 384.77, 9.55, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('8a9241561f9044a49d37b384c04158fc', '01220250222', '王文', '2025-04-04 09:36:00', 5697.17, 16.38, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('8afd0f1e39c442688283af3356bbdb99', '01220250222', '王文', '2025-04-01 18:51:00', 5671.89, -18.45, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('8bad326d0f514d87ba4810265108e33c', '01120250222', '王小条', '2025-04-02 10:45:00', 388.17, 7.51, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('8bfddbb7d79b485c8deec5b18b2f172e', '00120250207', '广信人民医院', '2025-03-31 21:15:00', 10011.40, 9991.70, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('8c0106a0b50d49a4bb1f10a7f7bbaf9a', '01120250222', '王小条', '2025-03-30 14:42:00', 357.38, 26.01, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('8c14c5b695a74b26ae557f1cdab26789', '01020250208', '胡为', '2025-04-02 13:09:00', 1608.05, 371.63, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('8c443bf09fd84cd4b05f78ccbcd67cef', '00220250208', '广信一中', '2025-04-01 18:48:00', 10029.75, 9980.25, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('8d001fb57f324bb3ad7f776bf95fb54a', '01220250222', '王文', '2025-03-31 21:57:00', 5655.90, -8.85, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('8d0285e3cc8441f3aaaa7616745200c3', '00220250208', '广信一中', '2025-03-30 14:36:00', 10003.53, 9996.00, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('8d0874c1a5ca4d469039804deb848d73', '00120250207', '广信人民医院', '2025-04-01 17:09:00', 10022.54, 9985.04, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('8d3022fccaf74ae6b04ba79938ab3b3d', '01220250222', '王文', '2025-04-01 17:00:00', 5660.36, -11.53, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('8d6c85fb5cf54b18976f7ad13697ad20', '01120250222', '王小条', '2025-04-01 17:18:00', 373.10, 16.57, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('8dc6a4aa011a4c579aa7c8fc3fdc4e57', '01220250222', '王文', '2025-04-04 09:24:00', 5696.00, 17.09, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('8dd141413a384cc0a1c4bfed4c8b19c1', '01220250222', '王文', '2025-04-02 13:12:00', 5689.30, -28.89, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('8dd56a4873df43cb9bbc26ff6f1343ac', '01120250222', '王小条', '2025-03-31 21:12:00', 363.08, 22.59, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('8ddf9873d12043bf88a95fdacbf5e275', '00120250207', '广信人民医院', '2025-03-31 21:48:00', 10014.51, 9989.84, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('8de11deb34af473993d823f9d17c31e9', '01020250208', '胡为', '2025-04-04 08:45:00', 1610.67, 370.05, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('8dfbb77bc0534e87b96abd22e3b2492e', '01020250208', '胡为', '2025-04-01 18:51:00', 1592.49, 381.02, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('8e300ee82d96468aad23ada85b24924e', '00220250208', '广信一中', '2025-04-02 10:33:00', 10033.49, 9978.01, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('8ec9658ff8b14fea94386c310973dac7', '01220250222', '王文', '2025-04-02 10:27:00', 5675.37, -20.52, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('8f4b6328021546c280282bab78782dfe', '01020250208', '胡为', '2025-04-02 11:36:00', 1601.45, 375.61, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('8faaa4ebd1114ddead3f90c6268a60d3', '01020250208', '胡为', '2025-04-02 10:18:00', 1595.08, 379.45, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('9003904a47a6480d8a0d7a9d17f5ee1b', '01120250222', '王小条', '2025-04-02 13:12:00', 400.55, 0.09, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('900aa21efd5948a686fc0e2d5c0739cd', '01220250222', '王文', '2025-03-31 21:51:00', 5655.43, -8.57, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('900e2550d095423aa1bc72f89c979331', '00120250207', '广信人民医院', '2025-04-02 13:12:00', 10050.57, 9968.20, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('9053c88bccce47718bc77749065e73c6', '01120250222', '王小条', '2025-04-01 18:06:00', 378.49, 13.34, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('90eb517ea1f844d6b027923266127bce', '01020250208', '胡为', '2025-04-02 11:45:00', 1602.34, 375.08, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('913e5fb333bd4d3b9e2af1a3963a9343', '01020250208', '胡为', '2025-03-31 21:54:00', 1576.54, 390.59, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('9190a41e9298499080764b4cc7db5fdd', '01120250222', '王小条', '2025-04-02 11:36:00', 393.87, 4.09, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('919a2b81e920463d8417c340d6a7450b', '01020250208', '胡为', '2025-04-02 11:39:00', 1601.88, 375.35, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('91b740fe9fcc46ce843237ace72b6d09', '01220250222', '王文', '2025-03-31 21:21:00', 5652.50, -6.82, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('91cdf4ba62524e67858225ce795988cf', '01120250222', '王小条', '2025-03-31 21:03:00', 362.12, 23.16, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('91d540436c2945439d0f3303f316eeef', '00120250207', '广信人民医院', '2025-04-02 11:54:00', 10045.59, 9971.21, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('91f4a1af51674a6bafc17794f70d601f', '01220250222', '王文', '2025-04-01 18:21:00', 5668.65, -16.50, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('9248aef7c9f1416ba0a7f6b30e2760bf', '01220250222', '王文', '2025-04-04 10:48:00', 5697.52, 16.17, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('9257ec64f0904fa58574b2ad8c7c900a', '01020250208', '胡为', '2025-03-30 14:27:00', 1565.45, 397.26, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('92c23fa51969470fb256a0dbd02ebc7c', '01020250208', '胡为', '2025-03-31 21:00:00', 1571.51, 393.60, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('92c6b5501ee94c6ba2607067002e5f3c', '01220250222', '王文', '2025-04-02 13:21:00', 5690.43, -29.57, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('93a3792e931b48849ed2896c02c4197e', '01020250208', '胡为', '2025-04-02 10:42:00', 1597.46, 378.03, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('9475e4554bf1435e9d7d2375c5445553', '00120250207', '广信人民医院', '2025-04-02 13:15:00', 10050.81, 9968.05, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('9500eee2d667462fb05126bdadcc6b0a', '01120250222', '王小条', '2025-04-02 11:51:00', 395.46, 3.13, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('9511db594df14892b044e1b9c8572cfb', '00220250208', '广信一中', '2025-04-02 10:54:00', 10036.12, 9976.42, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('951e8bd279a04251a28d137c62bcdb11', '00220250208', '广信一中', '2025-04-04 08:39:00', 10047.33, 9969.72, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('953b585bdabb40d8ad6c35d466deef7d', '00220250208', '广信一中', '2025-04-01 17:45:00', 10022.74, 9984.45, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('95401c55a8f14c04b06c3d510ea78f5d', '01020250208', '胡为', '2025-03-31 21:24:00', 1574.26, 391.96, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('963a749c0cc3413e81cac2498f3adfc3', '01220250222', '王文', '2025-04-01 18:39:00', 5670.54, -17.63, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('9674900f69dd4695961d6761d6455802', '01120250222', '王小条', '2025-04-04 09:30:00', 407.16, -3.86, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('96cd3739e82c48ae99b0e6441f181520', '00120250207', '广信人民医院', '2025-04-02 10:48:00', 10039.03, 9975.16, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('96fb225da5504e13a1195536d4416310', '01220250222', '王文', '2025-03-31 21:54:00', 5655.62, -8.68, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('973515a5688a478a9ead1b5b197de256', '01220250222', '王文', '2025-04-02 13:24:00', 5690.83, -29.81, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('977e176774874cc190d2fe671e22a3b8', '00220250208', '广信一中', '2025-04-04 09:12:00', 10050.16, 9968.02, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('97a7faf039dc4836b2b042645caddc91', '01120250222', '王小条', '2025-04-02 10:27:00', 386.11, 8.75, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('97db7baa771241f180eb77039b731631', '01220250222', '王文', '2025-03-30 14:51:00', 5646.24, -3.06, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('97fd2322a2814d388bca2254e05d9be1', '00220250208', '广信一中', '2025-04-02 11:48:00', 10041.15, 9973.42, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('98704416efcd4eb7a4494da8c56d0fae', '01020250208', '胡为', '2025-04-01 19:09:00', 1593.93, 380.14, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('98d165d951c74bad8c6be9b7dabce134', '01220250222', '王文', '2025-04-01 17:27:00', 5662.65, -12.90, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('990efbbb05094259a1e0820ecdcf7b4c', '01120250222', '王小条', '2025-04-04 09:33:00', 407.28, -3.93, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('9948084af8ef4f64afa58736e563a693', '00220250208', '广信一中', '2025-04-01 18:21:00', 10026.90, 9981.96, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('99a373723d05485d8e1315fb450b93d8', '00120250207', '广信人民医院', '2025-04-04 09:18:00', 10056.18, 9964.83, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('99d5d604aad34a1a873d5c1952251dcb', '00220250208', '广信一中', '2025-04-02 13:12:00', 10046.26, 9970.36, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('9a3ebfc824d548e4a4b8ba9d1ae5828f', '00220250208', '广信一中', '2025-04-01 18:30:00', 10028.10, 9981.24, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('9aa9bfe84b2d44a886aeb991b7f145e8', '00220250208', '广信一中', '2025-04-01 18:00:00', 10024.26, 9983.54, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('9ad261d0a935480ebd237322dc40f0b3', '00220250208', '广信一中', '2025-04-01 19:06:00', 10031.08, 9979.45, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('9aedde93cb064dee8d97cfde6bff9090', '01020250208', '胡为', '2025-04-01 17:15:00', 1583.04, 386.69, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('9af9aaa58d074e108d6869ffcba751b2', '00220250208', '广信一中', '2025-03-30 15:24:00', 10008.10, 9993.25, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('9b89fb2462d3447ebe88e54e71eb03fd', '01220250222', '王文', '2025-04-04 10:51:00', 5697.68, 16.07, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('9c3a96e52a7141af8bf99fa8eb9b5d19', '01220250222', '王文', '2025-04-01 16:36:00', 5658.16, -10.21, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('9cfb59c06dd94d1a93c2865d41ae4ed7', '01120250222', '王小条', '2025-03-30 14:39:00', 357.20, 26.12, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('9d6d2e26518d44a0911fad4d5c58147f', '00120250207', '广信人民医院', '2025-04-02 11:39:00', 10044.36, 9971.95, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('9dd85aef6649439ba70ef3331ad48557', '01120250222', '王小条', '2025-03-31 21:39:00', 366.10, 20.78, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('9e2e2f7b3c924501b08af5551b19d54c', '01020250208', '胡为', '2025-04-01 17:00:00', 1581.59, 387.57, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('9e904c40a2304e6a99a9ff80e6515d01', '01120250222', '王小条', '2025-04-01 19:00:00', 382.71, 10.79, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('9e9b25a6e2af49499aa54eea4cd81b09', '01020250208', '胡为', '2025-04-02 10:00:00', 1594.33, 379.90, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('9f1ad716ecbf426bb3aa584a8f42062c', '00120250207', '广信人民医院', '2025-04-01 18:57:00', 10034.03, 9978.16, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('9f64f75791224114bc32c6a16ecc9747', '01220250222', '王文', '2025-03-30 14:39:00', 5645.10, -2.38, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('9f74dcdfecb04a95a8ab72b5f9553f69', '01120250222', '王小条', '2025-04-01 16:48:00', 370.59, 18.10, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('a0a6e82e190b4763af509932723a3bf6', '01020250208', '胡为', '2025-04-01 18:54:00', 1592.68, 380.90, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('a1c1790bb7d24e11a43d5c974b876b35', '00120250207', '广信人民医院', '2025-04-01 17:45:00', 10026.37, 9982.73, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('a24a9cad1957432e9e505cf74c7ebded', '00220250208', '广信一中', '2025-04-01 16:57:00', 10018.02, 9987.29, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('a2faba676d4f4d4781b2e2f5a9b2870e', '00220250208', '广信一中', '2025-03-30 14:30:00', 10002.89, 9996.38, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('a32fede3d7194a3ea03341b5320868d8', '00120250207', '广信人民医院', '2025-04-02 11:57:00', 10045.71, 9971.14, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('a34e0e339a7c403da611d8ee908975ad', '01120250222', '王小条', '2025-04-04 08:57:00', 403.95, -1.94, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('a3d14101f7034ae5b0e776ff162c75b6', '00220250208', '广信一中', '2025-04-02 11:30:00', 10039.45, 9974.44, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('a43b01fc837c4b51835ae3f101b807cf', '01220250222', '王文', '2025-03-31 21:24:00', 5652.73, -6.96, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('a448a4b2687f4d54806d743a1ba1c160', '01020250208', '胡为', '2025-03-31 21:12:00', 1572.85, 392.80, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('a48a4614bb5e4abd907bbae874bbaa43', '01020250208', '胡为', '2025-03-31 21:18:00', 1573.53, 392.39, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('a49c4608b9bd4ae6ac9aad069b81f5b2', '01120250222', '王小条', '2025-04-01 18:21:00', 379.53, 12.71, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('a51b23145e9e436fa8bfed5e07ef3167', '00120250207', '广信人民医院', '2025-04-02 10:45:00', 10038.79, 9975.30, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('a592728c0cd548c2a09eb9ffcea38b85', '01220250222', '王文', '2025-04-04 09:33:00', 5696.77, 16.62, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('a5c13fec7a3e4ae5afa46421c4aaf8ec', '01220250222', '王文', '2025-03-30 14:42:00', 5645.20, -2.44, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('a5faca3ac92b4600b96afab48ec3efaa', '01120250222', '王小条', '2025-04-02 12:42:00', 397.87, 1.69, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('a6e9bba0e63d45f0a756a9f86f22fd0e', '01020250208', '胡为', '2025-04-01 19:06:00', 1593.77, 380.24, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('a7671228bba845078fda34385c8ca98b', '01220250222', '王文', '2025-03-31 20:57:00', 5650.13, -5.39, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('a76aade641ff43c89459d4ababbd4912', '01020250208', '胡为', '2025-03-31 22:00:00', 1577.20, 390.19, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('a76ff888d5f44edc8dcaf7c9de60f880', '00220250208', '广信一中', '2025-04-01 17:30:00', 10021.75, 9985.04, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('a795bf25861a4c37b684213db8575731', '01120250222', '王小条', '2025-04-04 09:06:00', 404.74, -2.41, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('a797da2a0eb8411997487d871ef7baed', '01220250222', '王文', '2025-04-02 10:45:00', 5677.55, -21.82, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('a81e7d8608dd4ee58f9ef90b00cb36d1', '00220250208', '广信一中', '2025-04-02 11:51:00', 10041.60, 9973.15, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('a8400e6c5077484d8d115b8834474b97', '00220250208', '广信一中', '2025-04-02 11:42:00', 10040.41, 9973.86, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('a84406b820ec4d9ca18dd9d77850589a', '01020250208', '胡为', '2025-04-01 18:00:00', 1587.99, 383.73, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('a85276291f7f4fada94d310792cf2d0e', '01220250222', '王文', '2025-04-04 10:57:00', 5698.30, 15.70, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('a8b12821a1e54dbf90ad986b2b732e55', '00120250207', '广信人民医院', '2025-04-02 11:12:00', 10041.79, 9973.49, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('a922affc9c42436c988d73ef5b5e2dd1', '00120250207', '广信人民医院', '2025-03-31 22:15:00', 10017.64, 9987.97, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('a932f0956a474dec899031095375c17c', '00120250207', '广信人民医院', '2025-04-04 11:03:00', 10059.42, 9962.88, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('a95afaa3f4894757b4a7d5955c5bbf52', '00220250208', '广信一中', '2025-03-31 21:57:00', 10014.40, 9989.46, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('a985545f3ad545f9902aa37b1cbc700b', '00120250207', '广信人民医院', '2025-04-04 09:21:00', 10056.43, 9964.68, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('a99c498d5088425aa121a10ad963f29a', '01220250222', '王文', '2025-04-01 17:18:00', 5661.68, -12.32, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('a9bea6d8601e4e889c5da0ea2fe6b31e', '00220250208', '广信一中', '2025-03-30 15:03:00', 10006.00, 9994.51, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('a9e600779e9b47fcb6851b00a7d6ba41', '01220250222', '王文', '2025-04-02 12:54:00', 5687.96, -28.07, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('aa1ac63f8402453988c9db15691a7904', '00120250207', '广信人民医院', '2025-04-01 19:06:00', 10035.08, 9977.53, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('aa2636692ac746d4a05c258248e536c2', '01020250208', '胡为', '2025-03-31 21:30:00', 1574.60, 391.76, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('aace28bac80e459fa1938e860cbeb671', '00220250208', '广信一中', '2025-04-02 12:48:00', 10043.91, 9971.77, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('ab0a6be071564252b7ddc339fca595a2', '00220250208', '广信一中', '2025-04-02 12:30:00', 10042.37, 9972.68, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('ab37b914380b4b86aaa081fcda6fc336', '01120250222', '王小条', '2025-03-31 21:18:00', 363.86, 22.12, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('ab9bcfeb5dda438e9954a2695708521f', '01120250222', '王小条', '2025-04-01 19:09:00', 383.76, 10.16, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('acac46ce07c34f21a24014657838c190', '01120250222', '王小条', '2025-03-31 21:15:00', 363.55, 22.31, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('ad00ed8fdbe9447e82f602966828c137', '00120250207', '广信人民医院', '2025-04-01 18:03:00', 10028.67, 9981.35, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('adb4b305dd7b49d299a70196d2077d10', '00120250207', '广信人民医院', '2025-03-31 21:27:00', 10012.17, 9991.24, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('ae1c697701c441a2abeff2533762a63d', '00120250207', '广信人民医院', '2025-04-02 12:45:00', 10047.78, 9969.89, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('ae3b1ac5099d44e4b36b755cf7bf633e', '00120250207', '广信人民医院', '2025-03-30 14:45:00', 10004.65, 9995.76, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('af2e45a54f8048709951ec6a82f47f40', '01020250208', '胡为', '2025-04-02 12:51:00', 1605.86, 372.95, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('aff2ccc350534e7785f33a7437a8d615', '01220250222', '王文', '2025-04-04 11:00:00', 5698.46, 15.60, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('b065d87b1d3c411fbd3c225379c5f1ff', '00120250207', '广信人民医院', '2025-04-01 16:39:00', 10018.85, 9987.25, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('b0ade3a81b4b47af81650543e4a12218', '00120250207', '广信人民医院', '2025-04-02 11:51:00', 10045.41, 9971.32, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('b0c09676e8c44536897e700319d33857', '00220250208', '广信一中', '2025-04-02 11:24:00', 10039.22, 9974.58, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('b0e84ec65dc0412e8459fcc765e3739f', '00220250208', '广信一中', '2025-03-30 15:15:00', 10007.20, 9993.79, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('b106375f740d4190b57d4cbf62382912', '01020250208', '胡为', '2025-03-30 14:39:00', 1566.43, 396.68, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('b1b37450657a491f9b7b5135d20a53cc', '01120250222', '王小条', '2025-04-01 17:09:00', 372.21, 17.11, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('b1f1a50187284c20a9c7c49bf3cd7fe7', '00220250208', '广信一中', '2025-04-02 13:18:00', 10046.59, 9970.16, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('b202bf7faa474dc6a1b9d0bd9cbd5cbd', '01120250222', '王小条', '2025-04-02 10:42:00', 387.71, 7.79, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('b20d489ddf4b4db4bd4a910a3dee939a', '00220250208', '广信一中', '2025-03-31 21:00:00', 10008.76, 9992.86, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('b26109491a6d4499a1974a985ca3fe4f', '01220250222', '王文', '2025-04-04 09:09:00', 5694.24, -31.86, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('b26701274f3e4977b8cafce4b579fae9', '01020250208', '胡为', '2025-04-02 11:51:00', 1602.72, 374.85, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('b28a7e819c5d4b03a79c47eb6c155a12', '00220250208', '广信一中', '2025-04-02 10:48:00', 10035.21, 9976.97, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('b2bdeaf2fa3d47489bdb313d5e10bc61', '01020250208', '胡为', '2025-04-01 18:06:00', 1588.70, 383.30, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('b3f87f733c764f34ae12bd52bc0a524a', '00120250207', '广信人民医院', '2025-04-02 12:42:00', 10047.46, 9970.08, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('b430513aaf6f44158b5956132e67992e', '01120250222', '王小条', '2025-04-02 11:33:00', 393.40, 4.37, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('b439dc4403c44f4d90e5b97b76410ed2', '00220250208', '广信一中', '2025-03-31 21:21:00', 10010.85, 9991.60, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('b47078ae66ac42da90891f47137a9b0c', '01220250222', '王文', '2025-04-01 18:12:00', 5667.99, -16.11, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('b4896e1b37ee40b09380f86b97f884cc', '00120250207', '广信人民医院', '2025-04-02 12:30:00', 10046.12, 9970.89, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('b55f01ab2d7347468ef735e87fcddd4e', '01020250208', '胡为', '2025-04-02 13:24:00', 1609.85, 370.54, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('b5adc269c14b4610ac3f47ed01b2e8e1', '01220250222', '王文', '2025-04-01 17:33:00', 5663.49, -13.41, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('b642968cbe44442285221604f14ccb95', '01120250222', '王小条', '2025-04-04 10:57:00', 408.53, -4.68, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('b6604d2e9d4b4d6c9e5ffe0fd3037acf', '00120250207', '广信人民医院', '2025-03-30 14:30:00', 10003.59, 9996.40, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('b66b60a8ccb74091ab23daa68a5f4be5', '01220250222', '王文', '2025-04-01 18:18:00', 5668.21, -16.24, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('b6b41dec7fff4124a91955396b8987fa', '01220250222', '王文', '2025-04-02 10:33:00', 5676.11, -20.96, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('b759c39f7fb2418e95b09de0914be2af', '01020250208', '胡为', '2025-03-31 21:06:00', 1572.29, 393.13, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('b75cd89be8af425aa4010703af440b9e', '00220250208', '广信一中', '2025-04-02 12:36:00', 10042.75, 9972.46, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('b7d2881a9ebf4ce29c457947140087d1', '00120250207', '广信人民医院', '2025-04-01 17:30:00', 10024.96, 9983.58, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('b835198723754cbe867adfbf955208be', '00120250207', '广信人民医院', '2025-04-02 10:57:00', 10040.07, 9974.52, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('b8742e5a1c3d4a91911ee6532a0ff1ea', '00120250207', '广信人民医院', '2025-04-01 18:18:00', 10030.34, 9980.36, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('b89f1ea9aac847ae9dffe290a2fe06f8', '00220250208', '广信一中', '2025-04-04 09:27:00', 10051.31, 9967.34, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('b8ecbb2ef845472e8afd5e68809c1660', '00220250208', '广信一中', '2025-04-01 16:39:00', 10016.67, 9988.09, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('b8f59a2c77674235900265e93c5f7654', '01120250222', '王小条', '2025-03-30 15:21:00', 360.55, 24.11, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('b8fdc066a2a84d9c8b2d7f9a8da48052', '00220250208', '广信一中', '2025-04-04 11:06:00', 10053.99, 9965.73, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('b9052908b8604232869011534dfaa681', '00120250207', '广信人民医院', '2025-04-04 10:51:00', 10058.28, 9963.56, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('b9311150dc414b4ab1e3540b682a4759', '01020250208', '胡为', '2025-04-04 09:30:00', 1615.30, 367.28, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('b9417e39550d498691b94c30ce48d695', '00120250207', '广信人民医院', '2025-04-01 17:54:00', 10027.62, 9981.98, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('b94c1e8055884294b9f7e787409a3251', '01220250222', '王文', '2025-03-31 21:33:00', 5654.05, -7.74, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('b96202c552844bafb3d026f7ca5382fb', '01120250222', '王小条', '2025-04-01 18:45:00', 381.29, 11.65, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('b9920a8077ab44cfb7af9acfcd351009', '01020250208', '胡为', '2025-04-01 17:06:00', 1582.23, 387.18, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('b9a6540e11a040c692b908bca061a7ab', '00220250208', '广信一中', '2025-04-01 18:27:00', 10027.71, 9981.48, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('b9bc4302f8fa49239dfce9566332b9b6', '01220250222', '王文', '2025-04-04 09:15:00', 5695.00, -32.31, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('b9e21059bb894014a4c62114aec1855c', '01120250222', '王小条', '2025-04-02 10:24:00', 385.64, 9.03, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('b9fe7c3e509b49868fadc6efad4679dd', '00220250208', '广信一中', '2025-04-01 17:24:00', 10021.26, 9985.34, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('ba5d787e9fb441139ea3d3fd4503e11c', '01020250208', '胡为', '2025-03-31 21:57:00', 1576.86, 390.40, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('ba686e236b074de890a8e356044c4cf5', '01020250208', '胡为', '2025-04-01 17:48:00', 1586.61, 384.56, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('bbda81ec4b5c4c159f00b1b55f9c0495', '01120250222', '王小条', '2025-03-30 14:30:00', 356.09, 26.78, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('bbefa72da3134f41bc8e058e9320c574', '00120250207', '广信人民医院', '2025-03-30 14:18:00', 10002.46, 9997.08, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('bc052ab4a6f84327a56f12da2c6a12a1', '01220250222', '王文', '2025-04-04 11:03:00', 5698.72, 15.44, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('bc3e3f20b092469fbecc9eac0403b931', '01220250222', '王文', '2025-04-01 16:45:00', 5658.92, -10.67, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('bc72709c6aa948f4bca6b2fff920cd67', '01020250208', '胡为', '2025-03-30 15:03:00', 1568.44, 395.46, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('bd5bf17fb0654ee3b9871b11b166b95d', '01020250208', '胡为', '2025-04-04 09:09:00', 1613.45, 368.39, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('bdf2bf169da544938c0b74cabdecaaab', '00120250207', '广信人民医院', '2025-04-01 17:51:00', 10027.12, 9982.28, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('beaad7fe16e641b795e10baa6c863260', '00220250208', '广信一中', '2025-04-02 13:21:00', 10046.86, 9970.00, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('bee825918b8649ce9fbdfdb76765caa3', '01120250222', '王小条', '2025-03-30 14:27:00', 355.98, 26.85, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('bf0e0e8b5a8940ba9ff092e00f20eacc', '00120250207', '广信人民医院', '2025-04-04 11:06:00', 10059.72, 9962.70, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('bf2463797b114f85956d8ddb5b497c31', '01220250222', '王文', '2025-03-31 21:09:00', 5651.37, -6.14, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('bfcaebe50d0142b7b0058047ad957238', '01020250208', '胡为', '2025-04-01 16:45:00', 1579.85, 388.60, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('c001adfba0dd4051b54379fb75d553e9', '01020250208', '胡为', '2025-04-01 18:57:00', 1592.91, 380.76, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('c11f138e05374dc79aac5334d1680352', '01220250222', '王文', '2025-04-02 10:51:00', 5678.32, -22.28, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('c13f86bfaf934344989051d04b0de50e', '01120250222', '王小条', '2025-04-01 17:24:00', 373.78, 16.16, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('c14f7576b6a640b6aa0719ea0f10dfd1', '01120250222', '王小条', '2025-04-04 10:51:00', 407.90, -4.30, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('c25bb0ddb5d7403babb204ac1a27b8f1', '00120250207', '广信人民医院', '2025-03-31 22:09:00', 10016.81, 9988.46, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('c29d11283f0547d186f427915444d77c', '01020250208', '胡为', '2025-04-02 10:57:00', 1599.15, 377.01, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('c2d9a9b30a7645a09413e067d60b128f', '01120250222', '王小条', '2025-04-04 10:48:00', 407.72, -4.19, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('c306d1c48746484fa7ed38ad6e1baf2a', '01120250222', '王小条', '2025-04-01 17:06:00', 372.02, 17.23, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('c37037c8cb4342a39ffadd55eb096b38', '00220250208', '广信一中', '2025-04-02 11:12:00', 10038.22, 9975.18, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('c38a9a07b7c943fda655307493929032', '01020250208', '胡为', '2025-04-02 12:45:00', 1605.03, 373.45, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('c38ca7405a484328bdfc3aba1db06cf3', '01120250222', '王小条', '2025-03-31 21:42:00', 366.52, 20.53, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('c3f0537101f24f32b1fde7c32f968f85', '01020250208', '胡为', '2025-04-04 08:39:00', 1610.25, 370.30, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('c48ba49bf060473986f7068af9c1b376', '00120250207', '广信人民医院', '2025-04-02 11:00:00', 10040.44, 9974.30, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('c4f41a7433c84e89883616ee8b3bfb5c', '00120250207', '广信人民医院', '2025-04-01 17:12:00', 10022.67, 9984.96, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('c5b751e098e446198707482ba9379f97', '01220250222', '王文', '2025-04-02 13:06:00', 5688.97, -28.69, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('c5d0104dfad44c37a0c60a70c27261e0', '01220250222', '王文', '2025-04-01 18:36:00', 5670.31, -17.49, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('c5fcf889b853414b88bff9c4d80028c9', '00220250208', '广信一中', '2025-03-31 22:12:00', 10015.34, 9988.89, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('c6446bb0a4d1424392e968c1189a3bdf', '00120250207', '广信人民医院', '2025-04-04 09:36:00', 10057.81, 9963.85, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('c69090f2d9214ee8bb4169dbce2145dc', '00120250207', '广信人民医院', '2025-04-04 09:06:00', 10054.64, 9965.76, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('c69d904acd2f4977b6a0ebc79beefcea', '00220250208', '广信一中', '2025-04-01 17:54:00', 10023.87, 9983.78, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('c6f33afdc0c044e7905cdfe05554f63d', '01220250222', '王文', '2025-03-30 15:27:00', 5649.59, -5.06, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('c753579efe2e494aadce66e74f337679', '00220250208', '广信一中', '2025-04-02 11:33:00', 10039.60, 9974.35, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('c7abcb909871433bbaf7ccfa09170aee', '01020250208', '胡为', '2025-04-04 09:15:00', 1614.04, 368.04, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('c821bcafe4804d9e9d08fae1646fbf3a', '01220250222', '王文', '2025-03-31 22:09:00', 5657.26, -9.67, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('c8626d00f57541fc8bfcdf4c8e06086f', '01120250222', '王小条', '2025-04-01 17:27:00', 374.21, 15.90, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('c89a8c7caf7d4610acac3c5650ff6f2a', '01020250208', '胡为', '2025-03-30 15:15:00', 1569.79, 394.64, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('c99d45d9ef2f460292714d606ffb5bb6', '01120250222', '王小条', '2025-03-30 14:21:00', 355.34, 27.23, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('c9fb522d99ca4a528d9e1daf20d2c906', '01220250222', '王文', '2025-04-02 10:18:00', 5674.72, -20.13, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('ca09ad28b714413d964ee02f6a5dec9f', '00220250208', '广信一中', '2025-04-01 18:57:00', 10030.43, 9979.84, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('ca0dc5bb8c034044948be6054e87c478', '01020250208', '胡为', '2025-04-04 08:42:00', 1610.40, 370.21, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('ca227fb479084c4ea43fc98e5b1515d6', '00120250207', '广信人民医院', '2025-03-31 21:39:00', 10013.42, 9990.49, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('ca28350ede054caeabaa863d81d12680', '01120250222', '王小条', '2025-04-01 18:33:00', 380.30, 12.25, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('ca7c1252ca6d40c493403f7b7668c5e8', '00220250208', '广信一中', '2025-03-31 21:06:00', 10009.51, 9992.41, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('caa0085691a34465a3224597ff449f9c', '01220250222', '王文', '2025-03-30 14:24:00', 5643.92, -1.68, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('cafcd89f672048a1928c68091c743f84', '00120250207', '广信人民医院', '2025-04-04 09:33:00', 10057.55, 9964.00, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('cb0c39f00eed4daca687dad68a59ae99', '01020250208', '胡为', '2025-04-01 17:54:00', 1587.42, 384.07, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('cb14335d70d54719861cde4093233e20', '01020250208', '胡为', '2025-04-02 13:12:00', 1608.31, 371.47, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('cb2b626dc3c44ab99b7c792700881523', '00120250207', '广信人民医院', '2025-03-31 22:03:00', 10016.06, 9988.91, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('cb4ddd22953d43a4a7a5e5d13c37fa91', '00220250208', '广信一中', '2025-04-04 08:54:00', 10049.15, 9968.63, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('cb6aa739c3664711963b0338c174d6c7', '01120250222', '王小条', '2025-03-30 14:33:00', 356.54, 26.51, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('cb824319fd3f40378a4fcceb3c00ceb2', '01220250222', '王文', '2025-04-01 17:30:00', 5663.06, -13.15, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('cbfacb893fa443f2a516f2928d437a4b', '00220250208', '广信一中', '2025-03-30 14:24:00', 10002.16, 9996.82, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('cc2b328abed842e2b45731611233beb4', '00120250207', '广信人民医院', '2025-03-30 15:27:00', 10009.04, 9993.12, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('cc7c45cc8098472eb173a40d24c2f105', '01020250208', '胡为', '2025-04-04 08:48:00', 1611.16, 369.76, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('ccc160bef81c43338d8c7d8aff43a202', '00120250207', '广信人民医院', '2025-04-01 16:51:00', 10020.39, 9986.32, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('ccf9bacb487549709b9e76097f7a65e7', '01220250222', '王文', '2025-04-04 09:27:00', 5696.40, 16.85, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('cd631e7f54894826aa081a00493f8af7', '00220250208', '广信一中', '2025-04-04 11:03:00', 10053.84, 9965.82, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('cd7b31ac809e4454813da8424b06002d', '00120250207', '广信人民医院', '2025-03-31 21:18:00', 10011.66, 9991.54, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('cdd0390db67c47a29ea58d3e9dbfaed4', '01120250222', '王小条', '2025-04-02 11:12:00', 391.48, 5.51, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('ce4617148e1f487b8aa8711ac9a1b65e', '01020250208', '胡为', '2025-03-30 15:12:00', 1569.55, 394.78, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('ce5e8da040984d93bfe397271df1a047', '01220250222', '王文', '2025-04-01 17:03:00', 5660.71, -11.74, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('ce622df71e78475d9a281e3bfa335d9f', '00120250207', '广信人民医院', '2025-04-02 12:39:00', 10047.24, 9970.21, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('cf2782df42e842a9a2057d3988a748d2', '00120250207', '广信人民医院', '2025-04-02 10:18:00', 10036.25, 9976.82, '5d1f6eed770f40dd9916098fb17934bc', 0.15, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('cf5db6ac35294a14ae05c3ea4bb481d5', '01220250222', '王文', '2025-04-02 11:15:00', 5680.65, -23.68, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('cf81934425fa497caeea44d3260188a2', '01120250222', '王小条', '2025-03-30 14:24:00', 355.73, 27.00, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('cfc24093f7c14907b2fd801ef968dc86', '01120250222', '王小条', '2025-04-04 10:54:00', 408.06, -4.40, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('d01b85f7fb154ed6aaab17a2334206cf', '00120250207', '广信人民医院', '2025-04-04 09:15:00', 10055.69, 9965.12, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('d04ea6edabcf4bb7983348c2c24a1906', '01120250222', '王小条', '2025-04-01 17:45:00', 376.36, 14.62, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('d0b1110c19df4fa9bdd3eaf1c219c48d', '01120250222', '王小条', '2025-04-02 11:54:00', 395.94, 2.84, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('d0f4050cf47f4b34b45dde10257da048', '00220250208', '广信一中', '2025-03-31 21:48:00', 10013.24, 9990.15, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('d17064ed30d843cf9b8d81ab33bfbf6e', '01120250222', '王小条', '2025-04-01 18:54:00', 382.19, 11.11, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('d1c17b8eb50e480b91e646b52058e241', '01020250208', '胡为', '2025-04-02 13:00:00', 1606.97, 372.28, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('d1c191576ad14b97b6e16af81522c114', '00120250207', '广信人民医院', '2025-04-02 11:24:00', 10043.34, 9972.56, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('d1d74c0bae574bcdbc987f723eeef3af', '01120250222', '王小条', '2025-04-01 16:54:00', 371.15, 17.76, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d1e94e0e51b14cd3bb76fe25f9688185', '00120250207', '广信人民医院', '2025-04-01 17:15:00', 10023.11, 9984.70, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('d21d1f0babb34e1989bf97076d1e9b52', '01020250208', '胡为', '2025-04-01 19:00:00', 1593.05, 380.67, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('d28c74a54bf9438c9a7df0fbd38216ab', '01020250208', '胡为', '2025-04-01 17:09:00', 1582.46, 387.04, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('d2990f19c73d4e63a4a008c8de3ad186', '01220250222', '王文', '2025-04-01 17:51:00', 5665.30, -14.49, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d2e11f2083774fba99abf79714b7707b', '00220250208', '广信一中', '2025-03-30 14:39:00', 10003.88, 9995.79, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d3101a672e6c4da58734fba9fbb73a70', '01120250222', '王小条', '2025-03-31 21:30:00', 365.17, 21.33, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d33809ffae654a3d87257baabb2c370e', '00220250208', '广信一中', '2025-04-04 10:57:00', 10053.49, 9966.03, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('d40cc5970a27493992fa50a837b2231b', '00220250208', '广信一中', '2025-03-30 14:21:00', 10001.83, 9997.02, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('d4123138c0154e48ad77237e29edc482', '01020250208', '胡为', '2025-04-02 12:57:00', 1606.59, 372.51, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d418f4f7597649efa04c25727ded47f4', '01220250222', '王文', '2025-03-30 14:48:00', 5645.95, -2.89, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('d431c5b0df2d458d967d636647373763', '01020250208', '胡为', '2025-04-02 13:03:00', 1607.34, 372.06, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('d46e4528c522442088ba197a1723b272', '00120250207', '广信人民医院', '2025-03-31 21:36:00', 10012.97, 9990.76, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('d4cd5d979b004e2d817ba10d37ed2a9d', '01120250222', '王小条', '2025-03-31 21:21:00', 364.24, 21.89, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('d4eafb66dfeb492f890e512b59b4a3d9', '00120250207', '广信人民医院', '2025-04-02 10:27:00', 10037.05, 9976.34, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('d4fa6bea657141dea273d83de5b564ef', '00220250208', '广信一中', '2025-04-01 17:15:00', 10020.35, 9985.89, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('d51c96e876ce476db262bb84848cd1d5', '01220250222', '王文', '2025-04-01 18:33:00', 5669.89, -17.24, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('d5579b9eee2f4c9a928c722b157a134a', '01220250222', '王文', '2025-04-02 12:42:00', 5687.00, -27.49, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('d572bc35953d4eacb82f78c4f3b68541', '01020250208', '胡为', '2025-04-01 18:21:00', 1590.28, 382.36, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('d5a339f4ca684744a6c1489c2bcc8c34', '01120250222', '王小条', '2025-04-02 10:33:00', 386.91, 8.27, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('d5c222f3ad9f404abcc60793cc365b34', '01220250222', '王文', '2025-04-01 19:09:00', 5673.93, -19.66, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d6391619b78c44ffaf3bb56ca78476f2', '01220250222', '王文', '2025-03-30 15:09:00', 5648.13, -4.19, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('d6e076253bbd42ce90d3274ff97d5193', '00120250207', '广信人民医院', '2025-04-02 10:21:00', 10036.73, 9976.53, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('d722ce6637c44ebbbf73cec611dbb4fd', '00120250207', '广信人民医院', '2025-04-01 17:24:00', 10024.13, 9984.08, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('d75161c11bd9495e94676d1f03199668', '01220250222', '王文', '2025-03-31 21:36:00', 5654.22, -7.84, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('d7bc002896284cc68b508485e3044e48', '01020250208', '胡为', '2025-04-04 10:48:00', 1616.36, 366.64, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('d7d19d6bcb2441fba1a9e76b96ec3554', '01120250222', '王小条', '2025-03-31 21:09:00', 362.77, 22.77, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('d7ffb71042b244d8b6b6d48b902ed95b', '00120250207', '广信人民医院', '2025-03-30 14:36:00', 10003.95, 9996.18, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('d82f7a0189f04904ad9a660b64b2468d', '00220250208', '广信一中', '2025-04-01 18:15:00', 10026.07, 9982.46, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('d8f94fad642245f08af39de573297619', '00120250207', '广信人民医院', '2025-04-01 18:27:00', 10031.03, 9979.95, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('d8fec3ac186c41ef9f3304a341be7ac2', '01120250222', '王小条', '2025-04-04 11:03:00', 409.23, -5.10, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('d90bdf6480504789b7cefa9a97731b0c', '01220250222', '王文', '2025-03-31 22:12:00', 5657.38, -9.74, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('d91a7550abe84695bf3f2eba1b5d80fb', '00220250208', '广信一中', '2025-04-01 18:39:00', 10028.73, 9980.87, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('d921c0ea2d3d4fb7a021a324058b1ecd', '01020250208', '胡为', '2025-04-04 10:57:00', 1617.30, 366.08, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('d954904283b44073b4c55f8fb86ad253', '00220250208', '广信一中', '2025-04-04 09:15:00', 10050.39, 9967.88, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('d9598614a3df438da9b1276eeaa83a0c', '00220250208', '广信一中', '2025-04-02 12:33:00', 10042.54, 9972.58, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('d97e429e8af94309865ab16b4eff15b1', '01120250222', '王小条', '2025-04-01 17:48:00', 376.49, 14.54, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('d9ddc73e7d554d5ab26f3d7519e4a030', '00220250208', '广信一中', '2025-04-02 13:03:00', 10045.48, 9970.84, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('dad0a70c07ed4d49b14fc2b5223f020f', '00120250207', '广信人民医院', '2025-03-30 14:57:00', 10005.81, 9995.06, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('db6eaa809f754e1c995adfb29d6a2ee5', '00120250207', '广信人民医院', '2025-03-30 15:24:00', 10008.67, 9993.34, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('dbaf8b2e21e8407480a5c44f2897d401', '01020250208', '胡为', '2025-04-04 09:27:00', 1615.06, 367.42, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('dbe78e606c964bf8bd896f39fdc942f2', '00120250207', '广信人民医院', '2025-03-31 21:57:00', 10015.40, 9989.31, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('dc010dd3dda245929fb9b21b88c32b80', '00120250207', '广信人民医院', '2025-04-04 11:00:00', 10059.16, 9963.04, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('dc0612ea2696445d8e2b5653147c28fb', '01120250222', '王小条', '2025-03-31 22:03:00', 367.77, 19.78, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('dc54055e115941a98768d0767921720a', '00120250207', '广信人民医院', '2025-04-02 11:48:00', 10045.13, 9971.49, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('dc93ddde52ea4f0ea3e47a8a977d961c', '01020250208', '胡为', '2025-04-02 12:48:00', 1605.51, 373.16, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('dd01c7f2d6124d2fbf49b3d7ed0f596c', '01220250222', '王文', '2025-04-02 10:57:00', 5679.16, -22.78, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('dd614286c39c4e89af5a5d215f9d8827', '01120250222', '王小条', '2025-04-01 17:15:00', 372.75, 16.78, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('ddba2adedafe44d4b7fa8ebcce1f895a', '00220250208', '广信一中', '2025-03-30 14:51:00', 10004.70, 9995.30, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('ddbb947ec2b3442eb4af679a53c11e1d', '00220250208', '广信一中', '2025-03-31 21:33:00', 10011.93, 9990.95, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('ddf4358f99a74220a8bc29e8fa1f22f3', '01120250222', '王小条', '2025-04-04 09:15:00', 406.02, -3.18, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('de1d2d20e29e452ba2734ef371a9cd71', '00220250208', '广信一中', '2025-04-02 11:15:00', 10038.34, 9975.11, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('de5aa942a6e746b9883bc9650624f742', '01020250208', '胡为', '2025-03-30 14:45:00', 1566.87, 396.41, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('df223fd725074c5cacd1444ed716b5eb', '01220250222', '王文', '2025-04-02 13:18:00', 5690.11, -29.38, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('df26f582e9b4436c9596b7a68860ca98', '00220250208', '广信一中', '2025-04-04 08:57:00', 10049.25, 9968.57, '5d1f6eed770f40dd9916098fb17934bc', 0.10, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('df35118020324b48b6a2db53976c50f7', '01220250222', '王文', '2025-04-02 11:06:00', 5680.00, -23.29, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('df52b1a5bd6d4c58bb04c520719ee65f', '01220250222', '王文', '2025-03-30 15:18:00', 5648.71, -4.54, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.09);
INSERT INTO `t_electricity_usage` VALUES ('dfbc76d8f76048439ccce330d1a157cc', '01120250222', '王小条', '2025-04-04 08:48:00', 402.90, -1.31, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('dff7685a8448452f869e91130ab484d1', '00220250208', '广信一中', '2025-04-01 19:09:00', 10031.24, 9979.35, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('e02dc55076f9476f8705288fa9e3d157', '01220250222', '王文', '2025-03-31 22:00:00', 5656.34, -9.11, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('e05fe66cf7e84cfaa762ccec74038670', '00220250208', '广信一中', '2025-03-31 21:18:00', 10010.71, 9991.69, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('e0a17d9277c14f1d90b6efc5879e8f97', '00220250208', '广信一中', '2025-03-30 15:09:00', 10006.44, 9994.24, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('e0b501f8504745f7b11563f6a19a1761', '01020250208', '胡为', '2025-04-01 19:03:00', 1593.28, 380.53, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('e10d91d14d044be8a725a7109865b2bd', '00220250208', '广信一中', '2025-03-30 14:45:00', 10004.40, 9995.48, '5d1f6eed770f40dd9916098fb17934bc', 0.23, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('e10f4f46f7754880ab93f3cf40dadf2b', '01120250222', '王小条', '2025-04-01 18:48:00', 381.50, 11.52, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('e1263ac7c60b463cbda508c17addcc49', '01120250222', '王小条', '2025-04-01 18:30:00', 380.17, 12.33, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('e144c6bdfab34043945824c5311a69d4', '01220250222', '王文', '2025-04-01 18:15:00', 5668.11, -16.18, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('e14bf1cef497415aad950c8278965f28', '01020250208', '胡为', '2025-04-02 13:15:00', 1608.80, 371.17, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('e1622df51ed94483802e91fc9fd97b97', '00220250208', '广信一中', '2025-04-01 16:51:00', 10017.74, 9987.46, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('e17cfe89c1004208a6466656c5705ef4', '00120250207', '广信人民医院', '2025-04-02 11:30:00', 10043.82, 9972.27, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('e19a3cb0693a402a962a852a2ed68b07', '01220250222', '王文', '2025-04-02 11:18:00', 5681.04, -23.92, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('e1a9d0c8d775429c8f1afbdf8926c3cd', '01020250208', '胡为', '2025-04-02 11:33:00', 1601.10, 375.82, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('e2082dafde824b9f9a0310b4dd214985', '00120250207', '广信人民医院', '2025-03-31 21:30:00', 10012.47, 9991.06, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('e23a3d39b8a84a6ba28ee26323a3c18a', '01020250208', '胡为', '2025-04-02 11:21:00', 1600.67, 376.09, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('e25a255635db4140a9eb653d5ac7379c', '01120250222', '王小条', '2025-04-02 10:00:00', 384.14, 9.93, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('e27f7eae19884dba9c6b70ef0fa3edcc', '00220250208', '广信一中', '2025-04-02 11:45:00', 10040.91, 9973.56, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('e3a24d370c11453d8655a45cce245256', '00120250207', '广信人民医院', '2025-03-31 21:24:00', 10011.95, 9991.37, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('e3dc561e993344e4aa4b42d36b66a7ed', '01020250208', '胡为', '2025-03-30 14:42:00', 1566.76, 396.48, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('e4078bc586064f29a40bff6ddf86d965', '00120250207', '广信人民医院', '2025-04-01 17:06:00', 10022.09, 9985.31, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('e47f88757a344c59a663d05cc7280235', '01220250222', '王文', '2025-03-31 21:18:00', 5652.25, -6.67, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('e4b9f983d62243a2a861eb1587a4ad0c', '00220250208', '广信一中', '2025-04-01 18:54:00', 10030.32, 9979.90, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('e4c6593159144ca7b9e1cbd8c0524bbc', '01220250222', '王文', '2025-03-31 21:03:00', 5650.69, -5.73, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('e4d80fbcac6a4e4dafc6b309e624def6', '00220250208', '广信一中', '2025-04-02 11:09:00', 10038.01, 9975.30, '5d1f6eed770f40dd9916098fb17934bc', 0.44, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('e4dc63ffc5024326b475b2080c27524f', '01220250222', '王文', '2025-04-02 11:12:00', 5680.52, -23.60, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('e56566d25d80462b878ca67ec63b1880', '01020250208', '胡为', '2025-04-02 11:18:00', 1600.49, 376.20, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('e587538c90f34ef6b4bba4828ebc8693', '00120250207', '广信人民医院', '2025-03-30 15:12:00', 10007.13, 9994.26, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('e5c4f568d6f545bc836674a836c7d295', '01020250208', '胡为', '2025-04-04 11:06:00', 1618.36, 365.45, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('e644ff29614c459e87fa07d1ebdd56af', '01220250222', '王文', '2025-04-04 11:06:00', 5698.98, 15.29, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('e726ae375d924b11a2828980898b7345', '00220250208', '广信一中', '2025-04-01 18:24:00', 10027.27, 9981.74, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('e72bafc3696a404893b033123b7aef4a', '01220250222', '王文', '2025-04-01 16:42:00', 5658.47, -10.40, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('e7324366a8674ce98b10cc53ce63bed9', '00220250208', '广信一中', '2025-04-02 11:03:00', 10037.32, 9975.71, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('e73ec1a6336849949a12de157c9e28d6', '01020250208', '胡为', '2025-03-30 14:33:00', 1566.07, 396.89, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('e7612dd273944b2fb56ab8fae3ab480f', '00220250208', '广信一中', '2025-04-04 09:00:00', 10049.41, 9968.47, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('e7b88221d7ee4c7f965ced7bafc5879a', '00220250208', '广信一中', '2025-04-01 17:18:00', 10020.70, 9985.68, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('e839a989e4374a4b8d0e3a9ab1ecee94', '00220250208', '广信一中', '2025-04-01 18:33:00', 10028.39, 9981.07, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('e8b4ac33fbd74e67b795c07de3386506', '00220250208', '广信一中', '2025-04-02 10:21:00', 10032.66, 9978.50, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('e9250dfa61c143319cb6b3b5445910a4', '01020250208', '胡为', '2025-03-30 14:24:00', 1564.96, 397.56, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('e95d872696014f9aabc6e695bc6ff0ce', '00120250207', '广信人民医院', '2025-04-01 16:36:00', 10018.60, 9987.40, '5d1f6eed770f40dd9916098fb17934bc', 0.46, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('ea09b61a1a4b457ab71ff59e75828be6', '01020250208', '胡为', '2025-04-02 11:57:00', 1603.06, 374.64, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('ea3b7ef94eab41a7bbd69752528bed4c', '00120250207', '广信人民医院', '2025-04-04 09:09:00', 10054.98, 9965.55, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('ea5d267ed6f84a39bdac95d089448a61', '01020250208', '胡为', '2025-04-04 09:21:00', 1614.46, 367.78, '5d1f6eed770f40dd9916098fb17934bc', 0.28, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('ea6576c3c1954fc6985b1f9d3bdf86bb', '01120250222', '王小条', '2025-04-02 12:30:00', 396.80, 2.33, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('ea6711d43b414d43ab89ddf742c0e760', '01020250208', '胡为', '2025-03-30 15:06:00', 1568.63, 395.34, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('eaa29a9d69194d9dbbc93fd103e9c15b', '00220250208', '广信一中', '2025-03-31 21:36:00', 10012.09, 9990.85, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('eac3baa1aa86472ab2c8db1eb2e83a1a', '00120250207', '广信人民医院', '2025-04-04 08:48:00', 10053.04, 9966.72, '5d1f6eed770f40dd9916098fb17934bc', 0.14, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('eb0b3f56be2c4efba2e51eab5074bddd', '00220250208', '广信一中', '2025-04-01 18:42:00', 10029.11, 9980.64, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('eb4520c81bd24a979236787b91a0e1ed', '01020250208', '胡为', '2025-04-01 18:15:00', 1589.79, 382.65, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('ebb13beae2bb4bfeae7da990208d7ae8', '01120250222', '王小条', '2025-04-02 12:33:00', 396.98, 2.22, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('ebe69a633ddf43849f625ec40787ba34', '01220250222', '王文', '2025-03-30 14:18:00', 5643.22, -1.26, '5d1f6eed770f40dd9916098fb17934bc', 0.30, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('ec06bcb8d9aa4e309c2baa374eca3645', '01220250222', '王文', '2025-04-02 12:39:00', 5686.78, -27.36, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('ec44a0ab4a0f4500b163969f49be5161', '00120250207', '广信人民医院', '2025-03-31 22:00:00', 10015.88, 9989.02, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('ed0cc32f10a1466f8bbfb1728d9d3064', '00120250207', '广信人民医院', '2025-04-02 12:33:00', 10046.55, 9970.63, '5d1f6eed770f40dd9916098fb17934bc', 0.43, 0.26);
INSERT INTO `t_electricity_usage` VALUES ('ed4f6056bda94e9e82fd0c1459c687a9', '01120250222', '王小条', '2025-04-02 13:15:00', 400.82, -0.07, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('edcc3604752a4bd092902d5a606169dc', '00120250207', '广信人民医院', '2025-04-04 09:00:00', 10054.10, 9966.09, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('ee6bdd6457594e15957de86d36858818', '01220250222', '王文', '2025-04-02 12:30:00', 5685.59, -26.64, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('ee8dfca93362458fb5a54107f62092dc', '00220250208', '广信一中', '2025-04-02 13:24:00', 10047.06, 9969.88, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('eebf11a0a6044fa2a3aee15d445a01a2', '01220250222', '王文', '2025-04-01 18:48:00', 5671.46, -18.19, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('eec4dc4906d248a9a8d458439ea23934', '00120250207', '广信人民医院', '2025-03-31 22:12:00', 10017.22, 9988.22, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('eee04dcab7a84732990977e970f99acf', '01220250222', '王文', '2025-04-04 09:21:00', 5695.64, 17.31, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('efa272e54d754480bdb62971cada445c', '01220250222', '王文', '2025-04-01 17:45:00', 5664.71, -14.14, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('f010004bd14a462f891494adcabcadc4', '01220250222', '王文', '2025-03-30 15:15:00', 5648.57, -4.45, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('f0acc50435f84fdba8d9d48d0fc52722', '01220250222', '王文', '2025-04-02 11:33:00', 5682.18, -24.60, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('f0ce087c7de84243aa4d50909ccfb3bd', '00220250208', '广信一中', '2025-04-04 09:21:00', 10050.90, 9967.58, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('f0d33e7c8d39427aa910fccb353a2bcc', '01220250222', '王文', '2025-04-01 18:03:00', 5666.55, -15.24, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('f0dc725f66984c6fa10d470351e350f0', '00120250207', '广信人民医院', '2025-03-31 22:18:00', 10018.14, 9987.67, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('f104b0e9193d45e699e1c1df21a774d5', '00220250208', '广信一中', '2025-04-02 11:54:00', 10041.85, 9973.00, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('f117ba53d356437fbb0cea0db9ecacea', '01020250208', '胡为', '2025-03-31 21:15:00', 1573.25, 392.56, '5d1f6eed770f40dd9916098fb17934bc', 0.40, 0.24);
INSERT INTO `t_electricity_usage` VALUES ('f17fe7a788654a4c9d4155633896726b', '00120250207', '广信人民医院', '2025-03-30 15:15:00', 10007.39, 9994.11, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('f1f7a9f717f749e29c33a0fb6c06b988', '01120250222', '王小条', '2025-04-01 17:57:00', 377.63, 13.85, '5d1f6eed770f40dd9916098fb17934bc', 0.41, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('f27c62a3f5cb49299dcff7029605ea6e', '00120250207', '广信人民医院', '2025-04-01 19:00:00', 10034.37, 9977.95, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('f29e91f29b694429ac5265ba39256203', '01220250222', '王文', '2025-04-01 18:09:00', 5667.49, -15.81, '5d1f6eed770f40dd9916098fb17934bc', 0.45, 0.27);
INSERT INTO `t_electricity_usage` VALUES ('f355e63c72f548eda363d058e7d46476', '01220250222', '王文', '2025-04-02 10:39:00', 5676.92, -21.44, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('f3a47c86b05c4a478ab6db0193bc83a4', '01020250208', '胡为', '2025-04-02 10:39:00', 1596.99, 378.31, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('f3c205f339ea4f0090f49c716dd33ef4', '01220250222', '王文', '2025-03-30 15:21:00', 5649.02, -4.72, '5d1f6eed770f40dd9916098fb17934bc', 0.31, 0.18);
INSERT INTO `t_electricity_usage` VALUES ('f3d7e92ad086467ebaa63b6c437a01f7', '01020250208', '胡为', '2025-03-30 15:09:00', 1569.12, 395.04, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('f3e5c41bc5604357bd5c3b9b67e294d6', '01020250208', '胡为', '2025-04-02 12:33:00', 1603.59, 374.32, '5d1f6eed770f40dd9916098fb17934bc', 0.32, 0.19);
INSERT INTO `t_electricity_usage` VALUES ('f479d8a2d53246099d3841422a68b8e2', '00220250208', '广信一中', '2025-04-02 10:00:00', 10031.73, 9979.05, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('f4c6335e7e46421b80dc63dcf5894090', '01220250222', '王文', '2025-03-30 14:45:00', 5645.46, -2.60, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('f4e9fb9dbde54a97ad414d1c3baf5cce', '01220250222', '王文', '2025-04-02 10:15:00', 5674.45, -19.97, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('f52217c1d20a4183a58a66c1070d466e', '00220250208', '广信一中', '2025-04-02 10:51:00', 10035.71, 9976.67, '5d1f6eed770f40dd9916098fb17934bc', 0.50, 0.30);
INSERT INTO `t_electricity_usage` VALUES ('f52da8fd18b84cc780c2fade653bc726', '01120250222', '王小条', '2025-03-30 14:54:00', 358.26, 25.49, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.06);
INSERT INTO `t_electricity_usage` VALUES ('f54167f046774773843182c6a13daca4', '01120250222', '王小条', '2025-04-04 08:39:00', 401.75, -0.63, '5d1f6eed770f40dd9916098fb17934bc', 0.16, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('f5b5d86143c444099d1a9257a4830cc6', '01020250208', '胡为', '2025-04-01 18:24:00', 1590.46, 382.25, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('f5dbc3cc365344de92eaef3930f92ad8', '01220250222', '王文', '2025-03-31 22:18:00', 5657.93, -10.07, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('f6ab692cc5164e2aafbb01a3bee6037d', '00120250207', '广信人民医院', '2025-04-01 17:48:00', 10026.71, 9982.53, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('f6b6e62dbca94c3d9f81cf203e6c2b32', '00120250207', '广信人民医院', '2025-04-04 08:45:00', 10052.90, 9966.80, '5d1f6eed770f40dd9916098fb17934bc', 0.25, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('f6f249c08d4a466a925ac965926ef771', '00120250207', '广信人民医院', '2025-04-01 17:33:00', 10025.14, 9983.47, '5d1f6eed770f40dd9916098fb17934bc', 0.18, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('f7010aa5712a43e3a6b5583d190bdc03', '01020250208', '胡为', '2025-04-01 17:03:00', 1582.07, 387.28, '5d1f6eed770f40dd9916098fb17934bc', 0.48, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('f73a6f6e6c064a72ab53a4ed703873cb', '01020250208', '胡为', '2025-04-02 11:15:00', 1600.29, 376.32, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('f8192d7e722e490bbe11b20eebfb256b', '01020250208', '胡为', '2025-04-01 17:42:00', 1585.79, 385.05, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('f8619959dbf441748303193676e25d07', '01020250208', '胡为', '2025-04-04 08:57:00', 1611.95, 369.29, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('f8b05a3a21db4848a7dba62c58544b72', '00120250207', '广信人民医院', '2025-03-30 14:21:00', 10002.88, 9996.83, '5d1f6eed770f40dd9916098fb17934bc', 0.42, 0.25);
INSERT INTO `t_electricity_usage` VALUES ('f8dc610e2f884dbd87ca40f4d8b3cee5', '01220250222', '王文', '2025-04-01 18:54:00', 5672.13, -18.59, '5d1f6eed770f40dd9916098fb17934bc', 0.24, 0.14);
INSERT INTO `t_electricity_usage` VALUES ('f90f45a9a31d4a50a6347ff46de4e880', '01020250208', '胡为', '2025-04-02 11:12:00', 1600.07, 376.45, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('f95c45bb80664c2b9a9bc31834cc11ac', '01220250222', '王文', '2025-04-02 11:57:00', 5685.10, -26.35, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('f9719a3c37ed4098908cbc3d72216229', '01020250208', '胡为', '2025-03-30 14:57:00', 1568.04, 395.71, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('f98218316ef44caf912c8f878c6c4fd6', '01220250222', '王文', '2025-04-01 17:36:00', 5663.76, -13.57, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('f9bfb055c886413d90ad858c72e32f9c', '01120250222', '王小条', '2025-04-02 10:57:00', 389.94, 6.44, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('f9f5ac3cdaf744dcaaad47b971b4690e', '00120250207', '广信人民医院', '2025-04-01 18:00:00', 10028.25, 9981.60, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('fa26809d480a4883ad290bbdb1b19e1e', '00220250208', '广信一中', '2025-04-01 16:42:00', 10017.01, 9987.89, '5d1f6eed770f40dd9916098fb17934bc', 0.34, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('fa7b5798c4d34840ac4e0afe77594c9d', '01220250222', '王文', '2025-04-01 17:42:00', 5664.53, -14.03, '5d1f6eed770f40dd9916098fb17934bc', 0.47, 0.28);
INSERT INTO `t_electricity_usage` VALUES ('faabdaabda1d4f0eb2b1de3500854c47', '01120250222', '王小条', '2025-04-02 10:30:00', 386.46, 8.54, '5d1f6eed770f40dd9916098fb17934bc', 0.35, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('fab6204c30364944a50e41ff2dcc89ee', '00120250207', '广信人民医院', '2025-04-01 16:42:00', 10019.14, 9987.08, '5d1f6eed770f40dd9916098fb17934bc', 0.29, 0.17);
INSERT INTO `t_electricity_usage` VALUES ('fac2c4a1c5da4807ae3c588fcaf47a72', '00220250208', '广信一中', '2025-04-02 10:30:00', 10033.28, 9978.14, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('fad4d2e99d864c90aa987c1300a8aeb4', '00220250208', '广信一中', '2025-04-04 11:00:00', 10053.68, 9965.92, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('fafaa25644c444a59be750dea8fd5252', '01220250222', '王文', '2025-04-01 17:21:00', 5661.85, -12.42, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);
INSERT INTO `t_electricity_usage` VALUES ('fb0f489c7bfd4f008007d9782ef80cb3', '01120250222', '王小条', '2025-03-31 21:24:00', 364.50, 21.74, '5d1f6eed770f40dd9916098fb17934bc', 0.26, 0.15);
INSERT INTO `t_electricity_usage` VALUES ('fb511cade5d84b6fa5fa6eb159d400df', '00220250208', '广信一中', '2025-04-02 11:00:00', 10037.08, 9975.85, '5d1f6eed770f40dd9916098fb17934bc', 0.49, 0.29);
INSERT INTO `t_electricity_usage` VALUES ('fb59cc659ace47cd9fa4a301c0edba07', '01020250208', '胡为', '2025-04-04 09:33:00', 1615.68, 367.05, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('fb7e970510ba4d12a65e945d566d3cd8', '01120250222', '王小条', '2025-04-02 11:03:00', 390.49, 6.11, '5d1f6eed770f40dd9916098fb17934bc', 0.33, 0.20);
INSERT INTO `t_electricity_usage` VALUES ('fbe9b62409a840429d41f54f65bc9b34', '01120250222', '王小条', '2025-04-02 12:36:00', 397.10, 2.15, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('fc2e43a6fbb441c69b207867e20cdca1', '01020250208', '胡为', '2025-04-02 10:33:00', 1596.49, 378.61, '5d1f6eed770f40dd9916098fb17934bc', 0.37, 0.22);
INSERT INTO `t_electricity_usage` VALUES ('fc87d75011164754a543c63cefc1213b', '00220250208', '广信一中', '2025-04-02 11:18:00', 10038.45, 9975.04, '5d1f6eed770f40dd9916098fb17934bc', 0.11, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('fc8f1a7d435e44b989c1bf06a61c653c', '01220250222', '王文', '2025-04-02 12:33:00', 5685.97, -26.87, '5d1f6eed770f40dd9916098fb17934bc', 0.38, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('fcb1675a84734e78942cf6dbe8f46491', '01220250222', '王文', '2025-03-31 21:45:00', 5655.05, -8.34, '5d1f6eed770f40dd9916098fb17934bc', 0.21, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('fccf0f60eb6547579dde858e2ae86e33', '00220250208', '广信一中', '2025-04-04 09:36:00', 10052.09, 9966.88, '5d1f6eed770f40dd9916098fb17934bc', 0.13, 0.08);
INSERT INTO `t_electricity_usage` VALUES ('fcf5afdc9d884940abecb1308e31066f', '00220250208', '广信一中', '2025-03-31 21:54:00', 10013.92, 9989.75, '5d1f6eed770f40dd9916098fb17934bc', 0.19, 0.11);
INSERT INTO `t_electricity_usage` VALUES ('fd1389c5b1fa408ca20aba62b16c6210', '00120250207', '广信人民医院', '2025-04-02 10:24:00', 10036.85, 9976.46, '5d1f6eed770f40dd9916098fb17934bc', 0.12, 0.07);
INSERT INTO `t_electricity_usage` VALUES ('fd694408b79d47358527215cde1f2bd1', '01120250222', '王小条', '2025-04-04 09:09:00', 405.13, -2.64, '5d1f6eed770f40dd9916098fb17934bc', 0.39, 0.23);
INSERT INTO `t_electricity_usage` VALUES ('fd717fca5fbb4d6ab5d3e2d2482cefe3', '01120250222', '王小条', '2025-04-02 12:51:00', 398.72, 1.19, '5d1f6eed770f40dd9916098fb17934bc', 0.27, 0.16);
INSERT INTO `t_electricity_usage` VALUES ('fd8f7fb2e1a14dc5af450c4a52d37519', '00220250208', '广信一中', '2025-04-01 19:03:00', 10030.95, 9979.53, '5d1f6eed770f40dd9916098fb17934bc', 0.22, 0.13);
INSERT INTO `t_electricity_usage` VALUES ('fdbfcd9e702f4fe3a260eae8bd32619a', '00120250207', '广信人民医院', '2025-03-30 14:54:00', 10005.38, 9995.32, '5d1f6eed770f40dd9916098fb17934bc', 0.20, 0.12);
INSERT INTO `t_electricity_usage` VALUES ('ff001f33fec74feea146bd93deb9992c', '00220250208', '广信一中', '2025-04-04 08:48:00', 10048.48, 9969.03, '5d1f6eed770f40dd9916098fb17934bc', 0.36, 0.21);
INSERT INTO `t_electricity_usage` VALUES ('ffcf5a5f840246d3b2793187a9bcb889', '00120250207', '广信人民医院', '2025-04-02 11:33:00', 10043.99, 9972.17, '5d1f6eed770f40dd9916098fb17934bc', 0.17, 0.10);

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
INSERT INTO `t_line_event` VALUES ('84e6ff237048445da2f0c80e86569b20', '65653dde05fd4a3aa7483ec6563cfad0', '广信区110kV源端母线I线', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 1, 2, '线路层级的问题导致停运，具体巡视原因描述为：null', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', 2, 5, NULL);
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
INSERT INTO `t_person_accept` VALUES ('b64b521c0df54dae9c0926e285650310', '上饶广信供电局', '2025-03-23 01:02:22', '2025032219', 2, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-30 12:03:31', NULL, NULL, '主动抢修工单发生停电事件，出现了相关问题，问题描述：配变故障', 'ada618247d6c4e6f9cf5caa4b9ce8bf7', 2, 1, 2, 5, '2025-03-30 12:02:51', '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('df705f8a70064532aa065df35ba0103c', '上饶广信供电局', '2025-03-23 00:48:13', '202503220303', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:48:16', '2025-03-23 00:48:41', '2025-03-23 00:48:49', '该用户的户表好像出了问题，目前用户已在催处理，请接单督办！', 'ad25baa8dfcb4e4dbc731fd6d5804514', 3, 3, 3, NULL, NULL, '5d1f6eed770f40dd9916098fb17934bc');
INSERT INTO `t_person_accept` VALUES ('e71efcae20c34c49a4b23f529872b7ba', '李力', '2025-03-30 11:58:56', '2025032369', 6, '5d1f6eed770f40dd9916098fb17934bc', '2025-03-30 11:59:18', '2025-03-30 12:00:21', '2025-03-30 12:01:14', '故障报修工单发生停电事件，出现了相关问题，问题描述：变压器因为老化产生停运！', 'c37d918124a24dafb5181f9d50d38145', 2, 1, 1, 1, '2025-03-30 11:59:10', 'a1a0c84fb7274a5289cde4e7ec6df71f');

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
INSERT INTO `t_recharge_record` VALUES ('胡小倩', '2025-03-29', '01020250208', '胡为', 200.00, NULL, '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '2025-03-29 16:27:05', '父女', '8b6c4886fca34f9d8f0fe706e1f4e37f');
INSERT INTO `t_recharge_record` VALUES ('天使', '2025-04-04', '01220250222', '王文', 50.00, '没钱了', '5d1f6eed770f40dd9916098fb17934bc', '上饶广信供电局', '2025-04-04 09:17:27', '父子', '4e9e95fa635441968e3038dec1a8f764');

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
INSERT INTO `t_transformer_event` VALUES ('b7d68401-0737-11f0-8af5-005056c00001', '00036400', '广信区域中心01号公变', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 3, 2, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', 4, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_transformer_event` VALUES ('b7d6a002-0737-11f0-8af5-005056c00001', '00136400', '广信中心区02号公变', '2025-03-23 00:07:05', 179.97, '2025-03-30 12:05:31', 3, 2, '广信区110kV源端母线I线在2025-03-23 00:07:05发生计划停运。线路发生该类型停电的具体原因是线路层级的问题导致停运，具体巡视原因描述为：null！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 00:07:13', '上饶广信供电局', '2025-03-30 12:05:32', '上饶广信供电局', 1, '84e6ff237048445da2f0c80e86569b20', NULL);
INSERT INTO `t_transformer_event` VALUES ('c37d918124a24dafb5181f9d50d38145', '00036400', '广信区域中心01号公变', '2025-03-23 10:57:28', 469.51, '2025-03-30 12:00:21', 1, 2, '配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-23 10:58:47', '上饶广信供电局', NULL, NULL, 4, NULL, NULL);

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
INSERT INTO `t_work_order` VALUES ('963a3ec7bf5a4f3ea29bda575a985c24', '2025032369', 1, 'c37d918124a24dafb5181f9d50d38145', '故障报修工单发生停电事件，出现了相关问题，问题描述：变压器因为老化产生停运！', 1, 6, '上饶广信区县中心小巷灾', 1, '2025-03-30 11:57:08', 1, '2025-03-30 11:58:52', 1, '2025-03-30 11:59:10', '2025-03-30 11:58:37', '上饶广信供电局', '2025-03-30 11:58:56', '李力', '2025-03-30 12:02:13', '李力', '2025-03-23 10:58:47', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 2, '20250330120021');
INSERT INTO `t_work_order` VALUES ('9a478ec7a5084e1b987395f1b2a8c469', '20250301150401010101010101', 2, '8247a048df69407e95eddbfcebae9553', '母线发生故障，请及时抢修！！！', 3, 1, '广信中心区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-01 15:06:11', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-01 17:18:15', '上饶广信供电局', 1, 1, NULL);
INSERT INTO `t_work_order` VALUES ('a873b5e4fa9f499097a6ea8a8402fe29', '20250301171801', 1, '8247a048df69407e95eddbfcebae9553', '线路老旧导致线路故障!', 3, 6, '上饶广信区中心区域', 1, '2025-03-15 14:23:15', 1, '2025-03-15 14:23:26', 7, '2025-03-16 15:51:36', '2025-03-15 14:23:21', '上饶广信供电局', '2025-03-15 14:23:31', '上饶广信供电局', '2025-03-16 16:29:35', '上饶广信供电局', '2025-03-01 17:19:42', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-15 14:14:25', '上饶广信供电局', 1, 1, '20250315143827');
INSERT INTO `t_work_order` VALUES ('b8317bb4e676487488d80822763ee54a', '20250301213602', 2, '714a4a11-f659-11ef-b1e0-005056c00001', NULL, 3, 5, NULL, 1, '2025-03-15 14:23:16', 1, '2025-03-15 14:23:27', 15, '2025-03-17 19:27:49', '2025-03-15 14:23:23', '上饶广信供电局', '2025-03-15 14:23:33', '上饶广信供电局', NULL, NULL, '2025-03-01 21:36:38', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-15 14:22:39', '上饶广信供电局', 1, 2, NULL);
INSERT INTO `t_work_order` VALUES ('b926c3faf67d4073820deb63a6eed22d', '202503220303', 3, 'ad25baa8dfcb4e4dbc731fd6d5804514', '该用户的户表好像出了问题，目前用户已在催处理，请接单督办！', 3, 6, '广信区北湖小学', 1, '2025-03-23 00:42:44', NULL, NULL, NULL, NULL, '2025-03-23 00:48:07', '上饶广信供电局', '2025-03-23 00:48:13', '上饶广信供电局', '2025-03-23 00:49:07', '上饶广信供电局', '2025-03-22 13:45:44', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-22 14:01:43', '上饶广信供电局', 0, 3, '20250323004841');
INSERT INTO `t_work_order` VALUES ('c586978a9cbf4723a782555306fd5d8a', '2025032219', 2, 'ada618247d6c4e6f9cf5caa4b9ce8bf7', '主动抢修工单发生停电事件，出现了相关问题，问题描述：配变故障', 1, 4, '广信区中心一中高中', 1, '2025-03-23 01:02:08', 1, '2025-03-23 01:02:16', 5, '2025-03-30 12:02:51', '2025-03-23 01:02:13', '上饶广信供电局', '2025-03-23 01:02:22', '上饶广信供电局', NULL, NULL, '2025-03-22 23:22:15', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', NULL, NULL, 0, 2, NULL);
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
INSERT INTO `t_work_source` VALUES ('e71efcae20c34c49a4b23f529872b7ba', '20250330120021', '李力', '广信区域中心01号公变', '配变层级的问题导致停运，具体巡视原因描述为：变压器因为老化产生停运！', '变压器老化导致短路', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250330/da7724519acd4c5685597f87a92892c229b5f80e36a745efb9fd8522b3b2acf5_d1.png', '变压器已更换', 'http://127.0.0.1:9000/gdfwzhxt-bucket/20250330/68680d4e033449a99f67cf859b46b8feu=92874499,748355427&fm=253&fmt=auto&app=138&f=JPEG.webp', 1, '2025-03-30 12:00:21', '换张图', '上饶广信供电局', '5d1f6eed770f40dd9916098fb17934bc', '2025-03-30 12:00:55');

SET FOREIGN_KEY_CHECKS = 1;
