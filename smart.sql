/*
Navicat MySQL Data Transfer

Source Server         : lxy
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : smart

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-04-12 20:35:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for curtain_motor
-- ----------------------------
DROP TABLE IF EXISTS `curtain_motor`;
CREATE TABLE `curtain_motor` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` varchar(255) DEFAULT NULL COMMENT '运行时间',
  `user` varchar(255) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='窗帘控制';

-- ----------------------------
-- Records of curtain_motor
-- ----------------------------

-- ----------------------------
-- Table structure for dung_motor
-- ----------------------------
DROP TABLE IF EXISTS `dung_motor`;
CREATE TABLE `dung_motor` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL COMMENT '开始运行',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` varchar(255) DEFAULT NULL COMMENT '运行时间',
  `user` varchar(255) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='刮粪板控制';

-- ----------------------------
-- Records of dung_motor
-- ----------------------------

-- ----------------------------
-- Table structure for facility_motor
-- ----------------------------
DROP TABLE IF EXISTS `facility_motor`;
CREATE TABLE `facility_motor` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` datetime DEFAULT NULL COMMENT '运行时间',
  `d_name` varchar(6) DEFAULT NULL COMMENT '设备名称',
  `user` varchar(255) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='风扇控制';

-- ----------------------------
-- Records of facility_motor
-- ----------------------------
INSERT INTO `facility_motor` VALUES ('1', '2019-04-03 16:56:38', '2019-04-03 16:56:38', null, '1', null);
INSERT INTO `facility_motor` VALUES ('2', '2018-11-06 19:28:27', '2018-11-06 19:28:27', null, '2', null);

-- ----------------------------
-- Table structure for motor
-- ----------------------------
DROP TABLE IF EXISTS `motor`;
CREATE TABLE `motor` (
  `oid` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作记录id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` time DEFAULT NULL COMMENT '运行时间',
  `d_name` varchar(40) DEFAULT NULL COMMENT '设备名称',
  `user` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='远程控制表';

-- ----------------------------
-- Records of motor
-- ----------------------------
INSERT INTO `motor` VALUES ('1.00', '2018-07-20 18:46:51', null, '00:46:57', '水帘', null);
INSERT INTO `motor` VALUES ('2.00', '2018-07-20 18:47:57', '2018-07-20 18:48:00', '00:48:02', '水帘', null);
INSERT INTO `motor` VALUES ('3.00', '2018-07-21 12:04:39', '2018-07-21 12:04:41', '00:00:02', 'ZET6', null);
INSERT INTO `motor` VALUES ('4.00', '2018-07-21 12:04:47', '2018-07-21 12:04:48', '00:00:01', 'ZET6', null);
INSERT INTO `motor` VALUES ('5.00', '2018-07-21 12:05:23', '2018-07-21 12:05:27', '00:00:04', 'ZET6', null);
INSERT INTO `motor` VALUES ('6.00', '2018-07-21 12:14:09', '2018-07-21 12:14:15', '00:00:05', 'ZET6', null);
INSERT INTO `motor` VALUES ('7.00', '2018-07-21 12:20:39', '2018-07-21 12:20:42', '00:00:03', 'ZET6', null);
INSERT INTO `motor` VALUES ('8.00', '2018-07-21 12:55:59', '2018-07-21 12:56:01', '00:00:02', 'ZET6', null);
INSERT INTO `motor` VALUES ('9.00', '2018-07-21 15:26:01', '2018-07-21 15:26:03', '00:00:02', 'ZET6', null);

-- ----------------------------
-- Table structure for pigstyinfo
-- ----------------------------
DROP TABLE IF EXISTS `pigstyinfo`;
CREATE TABLE `pigstyinfo` (
  `uid` int(11) NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `d_name` varchar(255) DEFAULT NULL,
  `rec_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `temp_v` int(255) DEFAULT NULL,
  `humi_v` int(255) DEFAULT NULL,
  `light_v` varchar(255) DEFAULT NULL,
  `air_v` float DEFAULT NULL,
  `flame_v` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pigstyinfo
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('hunauScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('hunauScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('hunauScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.hunau.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E68756E61752E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E68756E61752E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('hunauScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.hunau.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E68756E61752E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E68756E61752E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('hunauScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('hunauScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('hunauScheduler', 'lxy1586694484649', '1586694833020', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('hunauScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1586694490000', '-1', '5', 'PAUSED', 'CRON', '1586694485000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('hunauScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1586694500000', '-1', '5', 'PAUSED', 'CRON', '1586694485000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-01 09:53:48', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '修改主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-04-01 09:56:30', 'admin', '2020-04-01 09:56:55', '深色主题theme-dark 浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父类id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '班级名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '班主任',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '班级状态（0正常 1毕业）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '学校', '0', '校长', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '小学', '1', '班主任', '15777777777', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:08:54');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '初中', '2', '班主任', '15888888866', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:00');
INSERT INTO `sys_dept` VALUES ('103', '100', '0,100', '高中', '3', '班主任', '15888888811', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:08');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '一年级', '1', '年级主任', '15888888822', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:19');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '二年级', '2', '年级主任', '15888888833', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:27');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '三年级', '3', '年级主任', '15888888844', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:39');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '四年级', '4', '年级主任', '15888888876', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-29 18:09:59');
INSERT INTO `sys_dept` VALUES ('108', '101', '0,100,101', '五年级', '5', '年级主任', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '初一', '1', '年级主任', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '102', '0,100,102', '初二', '2', '年级主任', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('111', '103', '0,100,103', '高一', '2', '年级主任', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('112', '103', '0,100,103', '高二', '1', '年级主任', '15888888888', 'hunau@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('113', '100', '0,100', '部门', '4', null, null, null, '0', '0', 'admin', '2020-04-12 14:12:34', '', null);
INSERT INTO `sys_dept` VALUES ('114', '113', '0,100,113', '技术部', '1', null, null, null, '0', '0', 'admin', '2020-04-12 14:12:55', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_domain
-- ----------------------------
DROP TABLE IF EXISTS `sys_domain`;
CREATE TABLE `sys_domain` (
  `domain_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分区id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `domain_name` varchar(30) DEFAULT '' COMMENT '分区名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '分区状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`domain_id`),
  KEY `sys_domain_ancestors` (`ancestors`) USING BTREE,
  KEY `sys_domain_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100013 DEFAULT CHARSET=utf8 COMMENT='终端分区表';

-- ----------------------------
-- Records of sys_domain
-- ----------------------------
INSERT INTO `sys_domain` VALUES ('100000', '0', '0', '总分区', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:47:01');
INSERT INTO `sys_domain` VALUES ('100001', '100000', '0,100000', '子分区', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:47:01');
INSERT INTO `sys_domain` VALUES ('100002', '100000', '0,100000', '子分区2', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_domain` VALUES ('100003', '100001', '0,100000,100001', '高一', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:43:56');
INSERT INTO `sys_domain` VALUES ('100004', '100001', '0,100000,100001', '高二', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:57:52');
INSERT INTO `sys_domain` VALUES ('100005', '100001', '0,100000,100001', '高三', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:44:03');
INSERT INTO `sys_domain` VALUES ('100006', '100001', '0,100000,100001', '室外', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:44:06');
INSERT INTO `sys_domain` VALUES ('100007', '100001', '0,100000,100001', '办公室', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-09 15:44:09');
INSERT INTO `sys_domain` VALUES ('100008', '100002', '0,100000,100002', '校门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_domain` VALUES ('100009', '100002', '0,100000,100002', '测试', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_domain` VALUES ('100010', '100003', '0,100000,100001,100003', '后台', '1', null, null, null, '1', '2', 'admin', '2019-12-10 09:12:44', '', null);
INSERT INTO `sys_domain` VALUES ('100011', '100000', '0,100000', '高一', '2', '测试', '18711978116', '1015510750@qq.com', '0', '2', 'admin', '2019-12-12 16:57:05', '', null);
INSERT INTO `sys_domain` VALUES ('100012', '100003', '0,100000,100001,100003', 'shuofang', '1', 'ry', '18711978116', 'yuanyishuofangyu@gmail.com', '1', '2', 'admin', '2020-03-04 15:18:37', '', null);

-- ----------------------------
-- Table structure for sys_domains
-- ----------------------------
DROP TABLE IF EXISTS `sys_domains`;
CREATE TABLE `sys_domains` (
  `ParentDomainId` int(50) NOT NULL,
  `DomainId` int(50) NOT NULL COMMENT '区域ID号',
  `DomainName` varchar(50) NOT NULL COMMENT '区域的名字',
  `isuse` bit(1) NOT NULL,
  PRIMARY KEY (`DomainId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_domains
-- ----------------------------
INSERT INTO `sys_domains` VALUES ('0', '1', '班级', '\0');
INSERT INTO `sys_domains` VALUES ('0', '2', '初中', '');
INSERT INTO `sys_domains` VALUES ('0', '3', '高中', '');
INSERT INTO `sys_domains` VALUES ('0', '4', '高三', '\0');
INSERT INTO `sys_domains` VALUES ('2', '201', '初一', '');
INSERT INTO `sys_domains` VALUES ('2', '202', '初二', '');
INSERT INTO `sys_domains` VALUES ('2', '203', '初三', '');
INSERT INTO `sys_domains` VALUES ('3', '301', '高一', '');
INSERT INTO `sys_domains` VALUES ('3', '302', '高二', '');
INSERT INTO `sys_domains` VALUES ('3', '303', '高三', '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=999 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', null, 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-15 15:34:40');
INSERT INTO `sys_job_log` VALUES ('2', 'ryTask', '系统默认（无参）', 'ryNoParams', null, 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-15 15:34:50');
INSERT INTO `sys_job_log` VALUES ('3', 'ryTask', '系统默认（无参）', 'ryNoParams', null, 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-15 15:35:00');
INSERT INTO `sys_job_log` VALUES ('4', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:03:20');
INSERT INTO `sys_job_log` VALUES ('5', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:03:40');
INSERT INTO `sys_job_log` VALUES ('6', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:04:00');
INSERT INTO `sys_job_log` VALUES ('7', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:04:20');
INSERT INTO `sys_job_log` VALUES ('8', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:04:40');
INSERT INTO `sys_job_log` VALUES ('9', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:05:00');
INSERT INTO `sys_job_log` VALUES ('10', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:05:20');
INSERT INTO `sys_job_log` VALUES ('11', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:05:40');
INSERT INTO `sys_job_log` VALUES ('12', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:06:00');
INSERT INTO `sys_job_log` VALUES ('13', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:06:20');
INSERT INTO `sys_job_log` VALUES ('14', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:06:40');
INSERT INTO `sys_job_log` VALUES ('15', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:07:00');
INSERT INTO `sys_job_log` VALUES ('16', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:07:20');
INSERT INTO `sys_job_log` VALUES ('17', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:07:40');
INSERT INTO `sys_job_log` VALUES ('18', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:08:00');
INSERT INTO `sys_job_log` VALUES ('19', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:08:20');
INSERT INTO `sys_job_log` VALUES ('20', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:08:40');
INSERT INTO `sys_job_log` VALUES ('21', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:09:00');
INSERT INTO `sys_job_log` VALUES ('22', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:09:20');
INSERT INTO `sys_job_log` VALUES ('23', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:09:40');
INSERT INTO `sys_job_log` VALUES ('24', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:10:00');
INSERT INTO `sys_job_log` VALUES ('25', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:10:20');
INSERT INTO `sys_job_log` VALUES ('26', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:10:40');
INSERT INTO `sys_job_log` VALUES ('27', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:11:00');
INSERT INTO `sys_job_log` VALUES ('28', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:11:20');
INSERT INTO `sys_job_log` VALUES ('29', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:11:40');
INSERT INTO `sys_job_log` VALUES ('30', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:12:00');
INSERT INTO `sys_job_log` VALUES ('31', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:12:20');
INSERT INTO `sys_job_log` VALUES ('32', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:12:40');
INSERT INTO `sys_job_log` VALUES ('33', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:13:00');
INSERT INTO `sys_job_log` VALUES ('34', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:13:20');
INSERT INTO `sys_job_log` VALUES ('35', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:13:40');
INSERT INTO `sys_job_log` VALUES ('36', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:14:00');
INSERT INTO `sys_job_log` VALUES ('37', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:14:20');
INSERT INTO `sys_job_log` VALUES ('38', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:14:40');
INSERT INTO `sys_job_log` VALUES ('39', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:15:00');
INSERT INTO `sys_job_log` VALUES ('40', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:15:20');
INSERT INTO `sys_job_log` VALUES ('41', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:15:40');
INSERT INTO `sys_job_log` VALUES ('42', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:16:00');
INSERT INTO `sys_job_log` VALUES ('43', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:16:20');
INSERT INTO `sys_job_log` VALUES ('44', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:16:40');
INSERT INTO `sys_job_log` VALUES ('45', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:17:00');
INSERT INTO `sys_job_log` VALUES ('46', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:17:20');
INSERT INTO `sys_job_log` VALUES ('47', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:17:40');
INSERT INTO `sys_job_log` VALUES ('48', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:18:00');
INSERT INTO `sys_job_log` VALUES ('49', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:18:20');
INSERT INTO `sys_job_log` VALUES ('50', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:18:40');
INSERT INTO `sys_job_log` VALUES ('51', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:19:00');
INSERT INTO `sys_job_log` VALUES ('52', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:19:20');
INSERT INTO `sys_job_log` VALUES ('53', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:19:40');
INSERT INTO `sys_job_log` VALUES ('54', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:20:00');
INSERT INTO `sys_job_log` VALUES ('55', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:20:20');
INSERT INTO `sys_job_log` VALUES ('56', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:20:40');
INSERT INTO `sys_job_log` VALUES ('57', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:21:00');
INSERT INTO `sys_job_log` VALUES ('58', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:21:20');
INSERT INTO `sys_job_log` VALUES ('59', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:21:40');
INSERT INTO `sys_job_log` VALUES ('60', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:22:00');
INSERT INTO `sys_job_log` VALUES ('61', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:22:20');
INSERT INTO `sys_job_log` VALUES ('62', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:22:40');
INSERT INTO `sys_job_log` VALUES ('63', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:23:00');
INSERT INTO `sys_job_log` VALUES ('64', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:23:20');
INSERT INTO `sys_job_log` VALUES ('65', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:23:40');
INSERT INTO `sys_job_log` VALUES ('66', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:24:00');
INSERT INTO `sys_job_log` VALUES ('67', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:24:20');
INSERT INTO `sys_job_log` VALUES ('68', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:24:40');
INSERT INTO `sys_job_log` VALUES ('69', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:25:00');
INSERT INTO `sys_job_log` VALUES ('70', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:25:20');
INSERT INTO `sys_job_log` VALUES ('71', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:25:40');
INSERT INTO `sys_job_log` VALUES ('72', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:26:00');
INSERT INTO `sys_job_log` VALUES ('73', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:26:20');
INSERT INTO `sys_job_log` VALUES ('74', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:26:40');
INSERT INTO `sys_job_log` VALUES ('75', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:27:00');
INSERT INTO `sys_job_log` VALUES ('76', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:27:20');
INSERT INTO `sys_job_log` VALUES ('77', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:27:40');
INSERT INTO `sys_job_log` VALUES ('78', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:28:00');
INSERT INTO `sys_job_log` VALUES ('79', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:28:20');
INSERT INTO `sys_job_log` VALUES ('80', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:28:40');
INSERT INTO `sys_job_log` VALUES ('81', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:29:00');
INSERT INTO `sys_job_log` VALUES ('82', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:29:20');
INSERT INTO `sys_job_log` VALUES ('83', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:29:40');
INSERT INTO `sys_job_log` VALUES ('84', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:30:00');
INSERT INTO `sys_job_log` VALUES ('85', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:30:20');
INSERT INTO `sys_job_log` VALUES ('86', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:30:40');
INSERT INTO `sys_job_log` VALUES ('87', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:31:00');
INSERT INTO `sys_job_log` VALUES ('88', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:31:20');
INSERT INTO `sys_job_log` VALUES ('89', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:31:40');
INSERT INTO `sys_job_log` VALUES ('90', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:32:00');
INSERT INTO `sys_job_log` VALUES ('91', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:32:20');
INSERT INTO `sys_job_log` VALUES ('92', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:32:40');
INSERT INTO `sys_job_log` VALUES ('93', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:33:00');
INSERT INTO `sys_job_log` VALUES ('94', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:33:20');
INSERT INTO `sys_job_log` VALUES ('95', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:33:40');
INSERT INTO `sys_job_log` VALUES ('96', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:34:00');
INSERT INTO `sys_job_log` VALUES ('97', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:34:20');
INSERT INTO `sys_job_log` VALUES ('98', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:34:40');
INSERT INTO `sys_job_log` VALUES ('99', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:35:00');
INSERT INTO `sys_job_log` VALUES ('100', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:35:20');
INSERT INTO `sys_job_log` VALUES ('101', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:35:40');
INSERT INTO `sys_job_log` VALUES ('102', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:36:00');
INSERT INTO `sys_job_log` VALUES ('103', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:36:20');
INSERT INTO `sys_job_log` VALUES ('104', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:36:40');
INSERT INTO `sys_job_log` VALUES ('105', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:37:00');
INSERT INTO `sys_job_log` VALUES ('106', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:37:20');
INSERT INTO `sys_job_log` VALUES ('107', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:37:40');
INSERT INTO `sys_job_log` VALUES ('108', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:38:00');
INSERT INTO `sys_job_log` VALUES ('109', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:38:20');
INSERT INTO `sys_job_log` VALUES ('110', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:38:40');
INSERT INTO `sys_job_log` VALUES ('111', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:39:00');
INSERT INTO `sys_job_log` VALUES ('112', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:39:20');
INSERT INTO `sys_job_log` VALUES ('113', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:39:40');
INSERT INTO `sys_job_log` VALUES ('114', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:40:00');
INSERT INTO `sys_job_log` VALUES ('115', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:40:20');
INSERT INTO `sys_job_log` VALUES ('116', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:40:40');
INSERT INTO `sys_job_log` VALUES ('117', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:41:00');
INSERT INTO `sys_job_log` VALUES ('118', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:41:20');
INSERT INTO `sys_job_log` VALUES ('119', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:41:40');
INSERT INTO `sys_job_log` VALUES ('120', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:42:00');
INSERT INTO `sys_job_log` VALUES ('121', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:42:20');
INSERT INTO `sys_job_log` VALUES ('122', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:42:40');
INSERT INTO `sys_job_log` VALUES ('123', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:43:00');
INSERT INTO `sys_job_log` VALUES ('124', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:43:20');
INSERT INTO `sys_job_log` VALUES ('125', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:43:40');
INSERT INTO `sys_job_log` VALUES ('126', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:44:00');
INSERT INTO `sys_job_log` VALUES ('127', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:44:20');
INSERT INTO `sys_job_log` VALUES ('128', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:44:40');
INSERT INTO `sys_job_log` VALUES ('129', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:45:00');
INSERT INTO `sys_job_log` VALUES ('130', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:45:20');
INSERT INTO `sys_job_log` VALUES ('131', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:45:40');
INSERT INTO `sys_job_log` VALUES ('132', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:46:00');
INSERT INTO `sys_job_log` VALUES ('133', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:46:20');
INSERT INTO `sys_job_log` VALUES ('134', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:46:40');
INSERT INTO `sys_job_log` VALUES ('135', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:47:00');
INSERT INTO `sys_job_log` VALUES ('136', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:47:20');
INSERT INTO `sys_job_log` VALUES ('137', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:47:40');
INSERT INTO `sys_job_log` VALUES ('138', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:48:00');
INSERT INTO `sys_job_log` VALUES ('139', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:48:20');
INSERT INTO `sys_job_log` VALUES ('140', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:48:40');
INSERT INTO `sys_job_log` VALUES ('141', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:49:00');
INSERT INTO `sys_job_log` VALUES ('142', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:49:20');
INSERT INTO `sys_job_log` VALUES ('143', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:49:40');
INSERT INTO `sys_job_log` VALUES ('144', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:50:00');
INSERT INTO `sys_job_log` VALUES ('145', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:50:20');
INSERT INTO `sys_job_log` VALUES ('146', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:50:40');
INSERT INTO `sys_job_log` VALUES ('147', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:51:00');
INSERT INTO `sys_job_log` VALUES ('148', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:51:20');
INSERT INTO `sys_job_log` VALUES ('149', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:51:40');
INSERT INTO `sys_job_log` VALUES ('150', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:52:00');
INSERT INTO `sys_job_log` VALUES ('151', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:52:20');
INSERT INTO `sys_job_log` VALUES ('152', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:52:40');
INSERT INTO `sys_job_log` VALUES ('153', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:53:00');
INSERT INTO `sys_job_log` VALUES ('154', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 11:53:20');
INSERT INTO `sys_job_log` VALUES ('155', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:53:40');
INSERT INTO `sys_job_log` VALUES ('156', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:54:00');
INSERT INTO `sys_job_log` VALUES ('157', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:54:20');
INSERT INTO `sys_job_log` VALUES ('158', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:54:40');
INSERT INTO `sys_job_log` VALUES ('159', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:55:00');
INSERT INTO `sys_job_log` VALUES ('160', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:55:20');
INSERT INTO `sys_job_log` VALUES ('161', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:55:40');
INSERT INTO `sys_job_log` VALUES ('162', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:56:00');
INSERT INTO `sys_job_log` VALUES ('163', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:56:20');
INSERT INTO `sys_job_log` VALUES ('164', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:56:40');
INSERT INTO `sys_job_log` VALUES ('165', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:57:00');
INSERT INTO `sys_job_log` VALUES ('166', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:57:20');
INSERT INTO `sys_job_log` VALUES ('167', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:57:40');
INSERT INTO `sys_job_log` VALUES ('168', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:58:00');
INSERT INTO `sys_job_log` VALUES ('169', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:58:20');
INSERT INTO `sys_job_log` VALUES ('170', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:58:40');
INSERT INTO `sys_job_log` VALUES ('171', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:59:00');
INSERT INTO `sys_job_log` VALUES ('172', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:59:20');
INSERT INTO `sys_job_log` VALUES ('173', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 11:59:40');
INSERT INTO `sys_job_log` VALUES ('174', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:00:00');
INSERT INTO `sys_job_log` VALUES ('175', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:00:20');
INSERT INTO `sys_job_log` VALUES ('176', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:00:40');
INSERT INTO `sys_job_log` VALUES ('177', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:01:00');
INSERT INTO `sys_job_log` VALUES ('178', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:01:20');
INSERT INTO `sys_job_log` VALUES ('179', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:01:40');
INSERT INTO `sys_job_log` VALUES ('180', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:02:00');
INSERT INTO `sys_job_log` VALUES ('181', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:02:20');
INSERT INTO `sys_job_log` VALUES ('182', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:02:40');
INSERT INTO `sys_job_log` VALUES ('183', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:03:00');
INSERT INTO `sys_job_log` VALUES ('184', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:03:20');
INSERT INTO `sys_job_log` VALUES ('185', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:03:40');
INSERT INTO `sys_job_log` VALUES ('186', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:04:00');
INSERT INTO `sys_job_log` VALUES ('187', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:04:20');
INSERT INTO `sys_job_log` VALUES ('188', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:04:40');
INSERT INTO `sys_job_log` VALUES ('189', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:05:00');
INSERT INTO `sys_job_log` VALUES ('190', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:05:20');
INSERT INTO `sys_job_log` VALUES ('191', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:05:40');
INSERT INTO `sys_job_log` VALUES ('192', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:06:00');
INSERT INTO `sys_job_log` VALUES ('193', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:06:20');
INSERT INTO `sys_job_log` VALUES ('194', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:06:40');
INSERT INTO `sys_job_log` VALUES ('195', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:07:00');
INSERT INTO `sys_job_log` VALUES ('196', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:07:20');
INSERT INTO `sys_job_log` VALUES ('197', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:07:40');
INSERT INTO `sys_job_log` VALUES ('198', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:08:00');
INSERT INTO `sys_job_log` VALUES ('199', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:08:20');
INSERT INTO `sys_job_log` VALUES ('200', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:08:40');
INSERT INTO `sys_job_log` VALUES ('201', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:09:00');
INSERT INTO `sys_job_log` VALUES ('202', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:09:20');
INSERT INTO `sys_job_log` VALUES ('203', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:09:40');
INSERT INTO `sys_job_log` VALUES ('204', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:10:00');
INSERT INTO `sys_job_log` VALUES ('205', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:10:20');
INSERT INTO `sys_job_log` VALUES ('206', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:10:40');
INSERT INTO `sys_job_log` VALUES ('207', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:11:00');
INSERT INTO `sys_job_log` VALUES ('208', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:11:20');
INSERT INTO `sys_job_log` VALUES ('209', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:11:40');
INSERT INTO `sys_job_log` VALUES ('210', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:12:00');
INSERT INTO `sys_job_log` VALUES ('211', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:12:20');
INSERT INTO `sys_job_log` VALUES ('212', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:12:40');
INSERT INTO `sys_job_log` VALUES ('213', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:13:00');
INSERT INTO `sys_job_log` VALUES ('214', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:13:20');
INSERT INTO `sys_job_log` VALUES ('215', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:13:40');
INSERT INTO `sys_job_log` VALUES ('216', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:14:00');
INSERT INTO `sys_job_log` VALUES ('217', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:14:20');
INSERT INTO `sys_job_log` VALUES ('218', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:14:40');
INSERT INTO `sys_job_log` VALUES ('219', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:15:00');
INSERT INTO `sys_job_log` VALUES ('220', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:15:20');
INSERT INTO `sys_job_log` VALUES ('221', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:15:40');
INSERT INTO `sys_job_log` VALUES ('222', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:16:00');
INSERT INTO `sys_job_log` VALUES ('223', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:16:20');
INSERT INTO `sys_job_log` VALUES ('224', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:16:40');
INSERT INTO `sys_job_log` VALUES ('225', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:17:00');
INSERT INTO `sys_job_log` VALUES ('226', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:17:20');
INSERT INTO `sys_job_log` VALUES ('227', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:17:40');
INSERT INTO `sys_job_log` VALUES ('228', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:18:00');
INSERT INTO `sys_job_log` VALUES ('229', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:18:20');
INSERT INTO `sys_job_log` VALUES ('230', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:18:40');
INSERT INTO `sys_job_log` VALUES ('231', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:19:00');
INSERT INTO `sys_job_log` VALUES ('232', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:19:20');
INSERT INTO `sys_job_log` VALUES ('233', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:19:40');
INSERT INTO `sys_job_log` VALUES ('234', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:20:00');
INSERT INTO `sys_job_log` VALUES ('235', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:20:20');
INSERT INTO `sys_job_log` VALUES ('236', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:20:40');
INSERT INTO `sys_job_log` VALUES ('237', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:21:00');
INSERT INTO `sys_job_log` VALUES ('238', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:21:20');
INSERT INTO `sys_job_log` VALUES ('239', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:21:40');
INSERT INTO `sys_job_log` VALUES ('240', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:22:00');
INSERT INTO `sys_job_log` VALUES ('241', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:22:20');
INSERT INTO `sys_job_log` VALUES ('242', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:22:40');
INSERT INTO `sys_job_log` VALUES ('243', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:23:00');
INSERT INTO `sys_job_log` VALUES ('244', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:23:20');
INSERT INTO `sys_job_log` VALUES ('245', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:23:40');
INSERT INTO `sys_job_log` VALUES ('246', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:24:00');
INSERT INTO `sys_job_log` VALUES ('247', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:24:20');
INSERT INTO `sys_job_log` VALUES ('248', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:24:40');
INSERT INTO `sys_job_log` VALUES ('249', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:25:00');
INSERT INTO `sys_job_log` VALUES ('250', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:25:20');
INSERT INTO `sys_job_log` VALUES ('251', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:25:40');
INSERT INTO `sys_job_log` VALUES ('252', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:26:00');
INSERT INTO `sys_job_log` VALUES ('253', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:26:20');
INSERT INTO `sys_job_log` VALUES ('254', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:26:40');
INSERT INTO `sys_job_log` VALUES ('255', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:27:00');
INSERT INTO `sys_job_log` VALUES ('256', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:27:20');
INSERT INTO `sys_job_log` VALUES ('257', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:27:40');
INSERT INTO `sys_job_log` VALUES ('258', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:28:00');
INSERT INTO `sys_job_log` VALUES ('259', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:28:20');
INSERT INTO `sys_job_log` VALUES ('260', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:28:40');
INSERT INTO `sys_job_log` VALUES ('261', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:29:00');
INSERT INTO `sys_job_log` VALUES ('262', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:29:20');
INSERT INTO `sys_job_log` VALUES ('263', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:29:40');
INSERT INTO `sys_job_log` VALUES ('264', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:30:00');
INSERT INTO `sys_job_log` VALUES ('265', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:30:20');
INSERT INTO `sys_job_log` VALUES ('266', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:30:40');
INSERT INTO `sys_job_log` VALUES ('267', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:31:00');
INSERT INTO `sys_job_log` VALUES ('268', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:31:20');
INSERT INTO `sys_job_log` VALUES ('269', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:31:40');
INSERT INTO `sys_job_log` VALUES ('270', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:32:00');
INSERT INTO `sys_job_log` VALUES ('271', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:32:20');
INSERT INTO `sys_job_log` VALUES ('272', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:32:40');
INSERT INTO `sys_job_log` VALUES ('273', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:33:00');
INSERT INTO `sys_job_log` VALUES ('274', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:33:20');
INSERT INTO `sys_job_log` VALUES ('275', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:33:40');
INSERT INTO `sys_job_log` VALUES ('276', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:34:00');
INSERT INTO `sys_job_log` VALUES ('277', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:34:20');
INSERT INTO `sys_job_log` VALUES ('278', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:34:40');
INSERT INTO `sys_job_log` VALUES ('279', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:35:00');
INSERT INTO `sys_job_log` VALUES ('280', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:35:20');
INSERT INTO `sys_job_log` VALUES ('281', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:35:40');
INSERT INTO `sys_job_log` VALUES ('282', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:36:00');
INSERT INTO `sys_job_log` VALUES ('283', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:36:20');
INSERT INTO `sys_job_log` VALUES ('284', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:36:40');
INSERT INTO `sys_job_log` VALUES ('285', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:37:00');
INSERT INTO `sys_job_log` VALUES ('286', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:37:20');
INSERT INTO `sys_job_log` VALUES ('287', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:37:40');
INSERT INTO `sys_job_log` VALUES ('288', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:38:00');
INSERT INTO `sys_job_log` VALUES ('289', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:38:20');
INSERT INTO `sys_job_log` VALUES ('290', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:38:40');
INSERT INTO `sys_job_log` VALUES ('291', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:39:00');
INSERT INTO `sys_job_log` VALUES ('292', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:39:20');
INSERT INTO `sys_job_log` VALUES ('293', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:39:40');
INSERT INTO `sys_job_log` VALUES ('294', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:40:00');
INSERT INTO `sys_job_log` VALUES ('295', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:40:20');
INSERT INTO `sys_job_log` VALUES ('296', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:40:40');
INSERT INTO `sys_job_log` VALUES ('297', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:41:00');
INSERT INTO `sys_job_log` VALUES ('298', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:41:20');
INSERT INTO `sys_job_log` VALUES ('299', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:41:40');
INSERT INTO `sys_job_log` VALUES ('300', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:42:00');
INSERT INTO `sys_job_log` VALUES ('301', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:42:20');
INSERT INTO `sys_job_log` VALUES ('302', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:42:40');
INSERT INTO `sys_job_log` VALUES ('303', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:43:00');
INSERT INTO `sys_job_log` VALUES ('304', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:43:20');
INSERT INTO `sys_job_log` VALUES ('305', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:43:40');
INSERT INTO `sys_job_log` VALUES ('306', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:44:00');
INSERT INTO `sys_job_log` VALUES ('307', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:44:20');
INSERT INTO `sys_job_log` VALUES ('308', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:44:40');
INSERT INTO `sys_job_log` VALUES ('309', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:45:00');
INSERT INTO `sys_job_log` VALUES ('310', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:45:20');
INSERT INTO `sys_job_log` VALUES ('311', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:45:40');
INSERT INTO `sys_job_log` VALUES ('312', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:46:00');
INSERT INTO `sys_job_log` VALUES ('313', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:46:20');
INSERT INTO `sys_job_log` VALUES ('314', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:46:40');
INSERT INTO `sys_job_log` VALUES ('315', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:47:00');
INSERT INTO `sys_job_log` VALUES ('316', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:47:20');
INSERT INTO `sys_job_log` VALUES ('317', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:47:40');
INSERT INTO `sys_job_log` VALUES ('318', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:48:00');
INSERT INTO `sys_job_log` VALUES ('319', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:48:20');
INSERT INTO `sys_job_log` VALUES ('320', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:48:40');
INSERT INTO `sys_job_log` VALUES ('321', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:49:00');
INSERT INTO `sys_job_log` VALUES ('322', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:49:20');
INSERT INTO `sys_job_log` VALUES ('323', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:49:40');
INSERT INTO `sys_job_log` VALUES ('324', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:50:00');
INSERT INTO `sys_job_log` VALUES ('325', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:50:20');
INSERT INTO `sys_job_log` VALUES ('326', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:50:40');
INSERT INTO `sys_job_log` VALUES ('327', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:51:00');
INSERT INTO `sys_job_log` VALUES ('328', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:51:20');
INSERT INTO `sys_job_log` VALUES ('329', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:51:40');
INSERT INTO `sys_job_log` VALUES ('330', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:52:00');
INSERT INTO `sys_job_log` VALUES ('331', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:52:20');
INSERT INTO `sys_job_log` VALUES ('332', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:52:40');
INSERT INTO `sys_job_log` VALUES ('333', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:53:00');
INSERT INTO `sys_job_log` VALUES ('334', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:53:20');
INSERT INTO `sys_job_log` VALUES ('335', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:53:40');
INSERT INTO `sys_job_log` VALUES ('336', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:54:00');
INSERT INTO `sys_job_log` VALUES ('337', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:54:20');
INSERT INTO `sys_job_log` VALUES ('338', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:54:40');
INSERT INTO `sys_job_log` VALUES ('339', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:55:00');
INSERT INTO `sys_job_log` VALUES ('340', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:55:20');
INSERT INTO `sys_job_log` VALUES ('341', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:55:40');
INSERT INTO `sys_job_log` VALUES ('342', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:56:00');
INSERT INTO `sys_job_log` VALUES ('343', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:56:20');
INSERT INTO `sys_job_log` VALUES ('344', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:56:40');
INSERT INTO `sys_job_log` VALUES ('345', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:57:00');
INSERT INTO `sys_job_log` VALUES ('346', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:57:20');
INSERT INTO `sys_job_log` VALUES ('347', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:57:40');
INSERT INTO `sys_job_log` VALUES ('348', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:58:00');
INSERT INTO `sys_job_log` VALUES ('349', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:58:20');
INSERT INTO `sys_job_log` VALUES ('350', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:58:40');
INSERT INTO `sys_job_log` VALUES ('351', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:59:00');
INSERT INTO `sys_job_log` VALUES ('352', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 12:59:20');
INSERT INTO `sys_job_log` VALUES ('353', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 12:59:40');
INSERT INTO `sys_job_log` VALUES ('354', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:00:00');
INSERT INTO `sys_job_log` VALUES ('355', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:00:20');
INSERT INTO `sys_job_log` VALUES ('356', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:00:40');
INSERT INTO `sys_job_log` VALUES ('357', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:01:00');
INSERT INTO `sys_job_log` VALUES ('358', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:01:20');
INSERT INTO `sys_job_log` VALUES ('359', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:01:40');
INSERT INTO `sys_job_log` VALUES ('360', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:02:00');
INSERT INTO `sys_job_log` VALUES ('361', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:02:20');
INSERT INTO `sys_job_log` VALUES ('362', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:02:40');
INSERT INTO `sys_job_log` VALUES ('363', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:03:00');
INSERT INTO `sys_job_log` VALUES ('364', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:03:20');
INSERT INTO `sys_job_log` VALUES ('365', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:03:40');
INSERT INTO `sys_job_log` VALUES ('366', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:04:00');
INSERT INTO `sys_job_log` VALUES ('367', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:04:20');
INSERT INTO `sys_job_log` VALUES ('368', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:04:40');
INSERT INTO `sys_job_log` VALUES ('369', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:05:00');
INSERT INTO `sys_job_log` VALUES ('370', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:05:20');
INSERT INTO `sys_job_log` VALUES ('371', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:05:40');
INSERT INTO `sys_job_log` VALUES ('372', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:06:00');
INSERT INTO `sys_job_log` VALUES ('373', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:06:20');
INSERT INTO `sys_job_log` VALUES ('374', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:06:40');
INSERT INTO `sys_job_log` VALUES ('375', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:07:00');
INSERT INTO `sys_job_log` VALUES ('376', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:07:20');
INSERT INTO `sys_job_log` VALUES ('377', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:07:40');
INSERT INTO `sys_job_log` VALUES ('378', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:08:00');
INSERT INTO `sys_job_log` VALUES ('379', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:08:20');
INSERT INTO `sys_job_log` VALUES ('380', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:08:40');
INSERT INTO `sys_job_log` VALUES ('381', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:09:00');
INSERT INTO `sys_job_log` VALUES ('382', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:09:20');
INSERT INTO `sys_job_log` VALUES ('383', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:09:40');
INSERT INTO `sys_job_log` VALUES ('384', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:10:00');
INSERT INTO `sys_job_log` VALUES ('385', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:10:20');
INSERT INTO `sys_job_log` VALUES ('386', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:10:40');
INSERT INTO `sys_job_log` VALUES ('387', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:11:00');
INSERT INTO `sys_job_log` VALUES ('388', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:11:20');
INSERT INTO `sys_job_log` VALUES ('389', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:11:40');
INSERT INTO `sys_job_log` VALUES ('390', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:12:00');
INSERT INTO `sys_job_log` VALUES ('391', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:12:20');
INSERT INTO `sys_job_log` VALUES ('392', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:12:40');
INSERT INTO `sys_job_log` VALUES ('393', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:13:00');
INSERT INTO `sys_job_log` VALUES ('394', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:13:20');
INSERT INTO `sys_job_log` VALUES ('395', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:13:40');
INSERT INTO `sys_job_log` VALUES ('396', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:14:00');
INSERT INTO `sys_job_log` VALUES ('397', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:14:20');
INSERT INTO `sys_job_log` VALUES ('398', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:14:40');
INSERT INTO `sys_job_log` VALUES ('399', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:15:00');
INSERT INTO `sys_job_log` VALUES ('400', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:15:20');
INSERT INTO `sys_job_log` VALUES ('401', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:15:40');
INSERT INTO `sys_job_log` VALUES ('402', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:16:00');
INSERT INTO `sys_job_log` VALUES ('403', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:16:20');
INSERT INTO `sys_job_log` VALUES ('404', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:16:40');
INSERT INTO `sys_job_log` VALUES ('405', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:17:00');
INSERT INTO `sys_job_log` VALUES ('406', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:17:20');
INSERT INTO `sys_job_log` VALUES ('407', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:17:40');
INSERT INTO `sys_job_log` VALUES ('408', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:18:00');
INSERT INTO `sys_job_log` VALUES ('409', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:18:20');
INSERT INTO `sys_job_log` VALUES ('410', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:18:40');
INSERT INTO `sys_job_log` VALUES ('411', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:19:00');
INSERT INTO `sys_job_log` VALUES ('412', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:19:20');
INSERT INTO `sys_job_log` VALUES ('413', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:19:40');
INSERT INTO `sys_job_log` VALUES ('414', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:20:00');
INSERT INTO `sys_job_log` VALUES ('415', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:20:20');
INSERT INTO `sys_job_log` VALUES ('416', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:20:40');
INSERT INTO `sys_job_log` VALUES ('417', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:21:00');
INSERT INTO `sys_job_log` VALUES ('418', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:21:20');
INSERT INTO `sys_job_log` VALUES ('419', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:21:40');
INSERT INTO `sys_job_log` VALUES ('420', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:22:00');
INSERT INTO `sys_job_log` VALUES ('421', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:22:20');
INSERT INTO `sys_job_log` VALUES ('422', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:22:40');
INSERT INTO `sys_job_log` VALUES ('423', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:23:00');
INSERT INTO `sys_job_log` VALUES ('424', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:23:20');
INSERT INTO `sys_job_log` VALUES ('425', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:23:40');
INSERT INTO `sys_job_log` VALUES ('426', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:24:00');
INSERT INTO `sys_job_log` VALUES ('427', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:24:20');
INSERT INTO `sys_job_log` VALUES ('428', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:24:40');
INSERT INTO `sys_job_log` VALUES ('429', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:25:00');
INSERT INTO `sys_job_log` VALUES ('430', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:25:20');
INSERT INTO `sys_job_log` VALUES ('431', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:25:40');
INSERT INTO `sys_job_log` VALUES ('432', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:26:00');
INSERT INTO `sys_job_log` VALUES ('433', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:26:20');
INSERT INTO `sys_job_log` VALUES ('434', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:26:40');
INSERT INTO `sys_job_log` VALUES ('435', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:27:00');
INSERT INTO `sys_job_log` VALUES ('436', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:27:20');
INSERT INTO `sys_job_log` VALUES ('437', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:27:40');
INSERT INTO `sys_job_log` VALUES ('438', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:28:00');
INSERT INTO `sys_job_log` VALUES ('439', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:28:20');
INSERT INTO `sys_job_log` VALUES ('440', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:28:40');
INSERT INTO `sys_job_log` VALUES ('441', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:29:00');
INSERT INTO `sys_job_log` VALUES ('442', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:29:20');
INSERT INTO `sys_job_log` VALUES ('443', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:29:40');
INSERT INTO `sys_job_log` VALUES ('444', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:30:00');
INSERT INTO `sys_job_log` VALUES ('445', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:30:20');
INSERT INTO `sys_job_log` VALUES ('446', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:30:40');
INSERT INTO `sys_job_log` VALUES ('447', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:31:00');
INSERT INTO `sys_job_log` VALUES ('448', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:31:20');
INSERT INTO `sys_job_log` VALUES ('449', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:31:40');
INSERT INTO `sys_job_log` VALUES ('450', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:32:00');
INSERT INTO `sys_job_log` VALUES ('451', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:32:20');
INSERT INTO `sys_job_log` VALUES ('452', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:32:40');
INSERT INTO `sys_job_log` VALUES ('453', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:33:00');
INSERT INTO `sys_job_log` VALUES ('454', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:33:20');
INSERT INTO `sys_job_log` VALUES ('455', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:33:40');
INSERT INTO `sys_job_log` VALUES ('456', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:34:00');
INSERT INTO `sys_job_log` VALUES ('457', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:34:20');
INSERT INTO `sys_job_log` VALUES ('458', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:34:40');
INSERT INTO `sys_job_log` VALUES ('459', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:35:00');
INSERT INTO `sys_job_log` VALUES ('460', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:35:20');
INSERT INTO `sys_job_log` VALUES ('461', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:35:40');
INSERT INTO `sys_job_log` VALUES ('462', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:36:00');
INSERT INTO `sys_job_log` VALUES ('463', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:36:20');
INSERT INTO `sys_job_log` VALUES ('464', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:36:40');
INSERT INTO `sys_job_log` VALUES ('465', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:37:00');
INSERT INTO `sys_job_log` VALUES ('466', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:37:20');
INSERT INTO `sys_job_log` VALUES ('467', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:37:40');
INSERT INTO `sys_job_log` VALUES ('468', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:38:00');
INSERT INTO `sys_job_log` VALUES ('469', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:38:20');
INSERT INTO `sys_job_log` VALUES ('470', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:38:40');
INSERT INTO `sys_job_log` VALUES ('471', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:39:00');
INSERT INTO `sys_job_log` VALUES ('472', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:39:20');
INSERT INTO `sys_job_log` VALUES ('473', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:39:40');
INSERT INTO `sys_job_log` VALUES ('474', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:40:00');
INSERT INTO `sys_job_log` VALUES ('475', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:40:20');
INSERT INTO `sys_job_log` VALUES ('476', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:40:40');
INSERT INTO `sys_job_log` VALUES ('477', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:41:00');
INSERT INTO `sys_job_log` VALUES ('478', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:41:20');
INSERT INTO `sys_job_log` VALUES ('479', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:41:40');
INSERT INTO `sys_job_log` VALUES ('480', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:42:00');
INSERT INTO `sys_job_log` VALUES ('481', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:42:20');
INSERT INTO `sys_job_log` VALUES ('482', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:42:40');
INSERT INTO `sys_job_log` VALUES ('483', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:43:00');
INSERT INTO `sys_job_log` VALUES ('484', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:43:20');
INSERT INTO `sys_job_log` VALUES ('485', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:43:40');
INSERT INTO `sys_job_log` VALUES ('486', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:44:00');
INSERT INTO `sys_job_log` VALUES ('487', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:44:20');
INSERT INTO `sys_job_log` VALUES ('488', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:44:40');
INSERT INTO `sys_job_log` VALUES ('489', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:45:00');
INSERT INTO `sys_job_log` VALUES ('490', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:45:20');
INSERT INTO `sys_job_log` VALUES ('491', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:45:40');
INSERT INTO `sys_job_log` VALUES ('492', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:46:00');
INSERT INTO `sys_job_log` VALUES ('493', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:46:20');
INSERT INTO `sys_job_log` VALUES ('494', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:46:40');
INSERT INTO `sys_job_log` VALUES ('495', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:47:00');
INSERT INTO `sys_job_log` VALUES ('496', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:47:20');
INSERT INTO `sys_job_log` VALUES ('497', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:47:40');
INSERT INTO `sys_job_log` VALUES ('498', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:48:00');
INSERT INTO `sys_job_log` VALUES ('499', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:48:20');
INSERT INTO `sys_job_log` VALUES ('500', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:48:40');
INSERT INTO `sys_job_log` VALUES ('501', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:49:00');
INSERT INTO `sys_job_log` VALUES ('502', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:49:20');
INSERT INTO `sys_job_log` VALUES ('503', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:49:40');
INSERT INTO `sys_job_log` VALUES ('504', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:50:00');
INSERT INTO `sys_job_log` VALUES ('505', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:50:20');
INSERT INTO `sys_job_log` VALUES ('506', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:50:40');
INSERT INTO `sys_job_log` VALUES ('507', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:51:00');
INSERT INTO `sys_job_log` VALUES ('508', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:51:20');
INSERT INTO `sys_job_log` VALUES ('509', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:51:40');
INSERT INTO `sys_job_log` VALUES ('510', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:52:00');
INSERT INTO `sys_job_log` VALUES ('511', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:52:20');
INSERT INTO `sys_job_log` VALUES ('512', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:52:40');
INSERT INTO `sys_job_log` VALUES ('513', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:53:00');
INSERT INTO `sys_job_log` VALUES ('514', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:53:20');
INSERT INTO `sys_job_log` VALUES ('515', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:53:40');
INSERT INTO `sys_job_log` VALUES ('516', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:54:00');
INSERT INTO `sys_job_log` VALUES ('517', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:54:20');
INSERT INTO `sys_job_log` VALUES ('518', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:54:40');
INSERT INTO `sys_job_log` VALUES ('519', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:55:00');
INSERT INTO `sys_job_log` VALUES ('520', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:55:20');
INSERT INTO `sys_job_log` VALUES ('521', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:55:40');
INSERT INTO `sys_job_log` VALUES ('522', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:56:00');
INSERT INTO `sys_job_log` VALUES ('523', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:56:20');
INSERT INTO `sys_job_log` VALUES ('524', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 13:56:40');
INSERT INTO `sys_job_log` VALUES ('525', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:57:00');
INSERT INTO `sys_job_log` VALUES ('526', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:57:20');
INSERT INTO `sys_job_log` VALUES ('527', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:57:40');
INSERT INTO `sys_job_log` VALUES ('528', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:58:00');
INSERT INTO `sys_job_log` VALUES ('529', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:58:20');
INSERT INTO `sys_job_log` VALUES ('530', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:58:40');
INSERT INTO `sys_job_log` VALUES ('531', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:59:00');
INSERT INTO `sys_job_log` VALUES ('532', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:59:20');
INSERT INTO `sys_job_log` VALUES ('533', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 13:59:40');
INSERT INTO `sys_job_log` VALUES ('534', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:00:00');
INSERT INTO `sys_job_log` VALUES ('535', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:00:20');
INSERT INTO `sys_job_log` VALUES ('536', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:00:40');
INSERT INTO `sys_job_log` VALUES ('537', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:01:00');
INSERT INTO `sys_job_log` VALUES ('538', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:01:20');
INSERT INTO `sys_job_log` VALUES ('539', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:01:40');
INSERT INTO `sys_job_log` VALUES ('540', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:02:00');
INSERT INTO `sys_job_log` VALUES ('541', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:02:20');
INSERT INTO `sys_job_log` VALUES ('542', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:02:40');
INSERT INTO `sys_job_log` VALUES ('543', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:03:00');
INSERT INTO `sys_job_log` VALUES ('544', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:03:20');
INSERT INTO `sys_job_log` VALUES ('545', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:03:40');
INSERT INTO `sys_job_log` VALUES ('546', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:04:00');
INSERT INTO `sys_job_log` VALUES ('547', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:04:20');
INSERT INTO `sys_job_log` VALUES ('548', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:04:40');
INSERT INTO `sys_job_log` VALUES ('549', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:05:00');
INSERT INTO `sys_job_log` VALUES ('550', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:05:20');
INSERT INTO `sys_job_log` VALUES ('551', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:05:40');
INSERT INTO `sys_job_log` VALUES ('552', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:06:00');
INSERT INTO `sys_job_log` VALUES ('553', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:06:20');
INSERT INTO `sys_job_log` VALUES ('554', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:06:40');
INSERT INTO `sys_job_log` VALUES ('555', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:07:00');
INSERT INTO `sys_job_log` VALUES ('556', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:07:20');
INSERT INTO `sys_job_log` VALUES ('557', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:07:40');
INSERT INTO `sys_job_log` VALUES ('558', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:08:00');
INSERT INTO `sys_job_log` VALUES ('559', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:08:20');
INSERT INTO `sys_job_log` VALUES ('560', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:08:40');
INSERT INTO `sys_job_log` VALUES ('561', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:09:00');
INSERT INTO `sys_job_log` VALUES ('562', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:09:20');
INSERT INTO `sys_job_log` VALUES ('563', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:09:40');
INSERT INTO `sys_job_log` VALUES ('564', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:10:00');
INSERT INTO `sys_job_log` VALUES ('565', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:10:20');
INSERT INTO `sys_job_log` VALUES ('566', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:10:40');
INSERT INTO `sys_job_log` VALUES ('567', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:11:00');
INSERT INTO `sys_job_log` VALUES ('568', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:11:20');
INSERT INTO `sys_job_log` VALUES ('569', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:11:40');
INSERT INTO `sys_job_log` VALUES ('570', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:12:00');
INSERT INTO `sys_job_log` VALUES ('571', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:12:20');
INSERT INTO `sys_job_log` VALUES ('572', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:12:40');
INSERT INTO `sys_job_log` VALUES ('573', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:13:00');
INSERT INTO `sys_job_log` VALUES ('574', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:13:20');
INSERT INTO `sys_job_log` VALUES ('575', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:13:40');
INSERT INTO `sys_job_log` VALUES ('576', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:14:00');
INSERT INTO `sys_job_log` VALUES ('577', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:14:20');
INSERT INTO `sys_job_log` VALUES ('578', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:14:40');
INSERT INTO `sys_job_log` VALUES ('579', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:15:00');
INSERT INTO `sys_job_log` VALUES ('580', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:15:20');
INSERT INTO `sys_job_log` VALUES ('581', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:15:40');
INSERT INTO `sys_job_log` VALUES ('582', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:16:00');
INSERT INTO `sys_job_log` VALUES ('583', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:16:20');
INSERT INTO `sys_job_log` VALUES ('584', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:16:40');
INSERT INTO `sys_job_log` VALUES ('585', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:17:00');
INSERT INTO `sys_job_log` VALUES ('586', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:17:20');
INSERT INTO `sys_job_log` VALUES ('587', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:17:40');
INSERT INTO `sys_job_log` VALUES ('588', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:18:00');
INSERT INTO `sys_job_log` VALUES ('589', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:18:20');
INSERT INTO `sys_job_log` VALUES ('590', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:18:40');
INSERT INTO `sys_job_log` VALUES ('591', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:19:00');
INSERT INTO `sys_job_log` VALUES ('592', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:19:20');
INSERT INTO `sys_job_log` VALUES ('593', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:19:40');
INSERT INTO `sys_job_log` VALUES ('594', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:20:00');
INSERT INTO `sys_job_log` VALUES ('595', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:20:20');
INSERT INTO `sys_job_log` VALUES ('596', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:20:40');
INSERT INTO `sys_job_log` VALUES ('597', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:21:00');
INSERT INTO `sys_job_log` VALUES ('598', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:21:20');
INSERT INTO `sys_job_log` VALUES ('599', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:21:40');
INSERT INTO `sys_job_log` VALUES ('600', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:22:00');
INSERT INTO `sys_job_log` VALUES ('601', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:22:20');
INSERT INTO `sys_job_log` VALUES ('602', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:22:40');
INSERT INTO `sys_job_log` VALUES ('603', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:23:00');
INSERT INTO `sys_job_log` VALUES ('604', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:23:20');
INSERT INTO `sys_job_log` VALUES ('605', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:23:40');
INSERT INTO `sys_job_log` VALUES ('606', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:24:00');
INSERT INTO `sys_job_log` VALUES ('607', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:24:20');
INSERT INTO `sys_job_log` VALUES ('608', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:24:40');
INSERT INTO `sys_job_log` VALUES ('609', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:25:00');
INSERT INTO `sys_job_log` VALUES ('610', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:25:20');
INSERT INTO `sys_job_log` VALUES ('611', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:25:40');
INSERT INTO `sys_job_log` VALUES ('612', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:26:00');
INSERT INTO `sys_job_log` VALUES ('613', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:26:20');
INSERT INTO `sys_job_log` VALUES ('614', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:26:40');
INSERT INTO `sys_job_log` VALUES ('615', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:27:00');
INSERT INTO `sys_job_log` VALUES ('616', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:27:20');
INSERT INTO `sys_job_log` VALUES ('617', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:27:40');
INSERT INTO `sys_job_log` VALUES ('618', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:28:00');
INSERT INTO `sys_job_log` VALUES ('619', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:28:20');
INSERT INTO `sys_job_log` VALUES ('620', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:28:40');
INSERT INTO `sys_job_log` VALUES ('621', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:29:00');
INSERT INTO `sys_job_log` VALUES ('622', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:29:20');
INSERT INTO `sys_job_log` VALUES ('623', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:29:40');
INSERT INTO `sys_job_log` VALUES ('624', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:30:00');
INSERT INTO `sys_job_log` VALUES ('625', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:30:20');
INSERT INTO `sys_job_log` VALUES ('626', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:30:40');
INSERT INTO `sys_job_log` VALUES ('627', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:31:00');
INSERT INTO `sys_job_log` VALUES ('628', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:31:20');
INSERT INTO `sys_job_log` VALUES ('629', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:31:40');
INSERT INTO `sys_job_log` VALUES ('630', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:32:00');
INSERT INTO `sys_job_log` VALUES ('631', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:32:20');
INSERT INTO `sys_job_log` VALUES ('632', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:32:40');
INSERT INTO `sys_job_log` VALUES ('633', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:33:00');
INSERT INTO `sys_job_log` VALUES ('634', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:33:20');
INSERT INTO `sys_job_log` VALUES ('635', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:33:40');
INSERT INTO `sys_job_log` VALUES ('636', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:34:00');
INSERT INTO `sys_job_log` VALUES ('637', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:34:20');
INSERT INTO `sys_job_log` VALUES ('638', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:34:40');
INSERT INTO `sys_job_log` VALUES ('639', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:35:00');
INSERT INTO `sys_job_log` VALUES ('640', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:35:20');
INSERT INTO `sys_job_log` VALUES ('641', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:35:40');
INSERT INTO `sys_job_log` VALUES ('642', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:36:00');
INSERT INTO `sys_job_log` VALUES ('643', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:36:20');
INSERT INTO `sys_job_log` VALUES ('644', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:36:40');
INSERT INTO `sys_job_log` VALUES ('645', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:37:00');
INSERT INTO `sys_job_log` VALUES ('646', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:37:20');
INSERT INTO `sys_job_log` VALUES ('647', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:37:40');
INSERT INTO `sys_job_log` VALUES ('648', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:38:00');
INSERT INTO `sys_job_log` VALUES ('649', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:38:20');
INSERT INTO `sys_job_log` VALUES ('650', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:38:40');
INSERT INTO `sys_job_log` VALUES ('651', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:39:00');
INSERT INTO `sys_job_log` VALUES ('652', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:39:20');
INSERT INTO `sys_job_log` VALUES ('653', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:39:40');
INSERT INTO `sys_job_log` VALUES ('654', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:40:00');
INSERT INTO `sys_job_log` VALUES ('655', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:40:20');
INSERT INTO `sys_job_log` VALUES ('656', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:40:40');
INSERT INTO `sys_job_log` VALUES ('657', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:41:00');
INSERT INTO `sys_job_log` VALUES ('658', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:41:20');
INSERT INTO `sys_job_log` VALUES ('659', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:41:40');
INSERT INTO `sys_job_log` VALUES ('660', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:42:00');
INSERT INTO `sys_job_log` VALUES ('661', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:42:20');
INSERT INTO `sys_job_log` VALUES ('662', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:42:40');
INSERT INTO `sys_job_log` VALUES ('663', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:43:00');
INSERT INTO `sys_job_log` VALUES ('664', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:43:20');
INSERT INTO `sys_job_log` VALUES ('665', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:43:40');
INSERT INTO `sys_job_log` VALUES ('666', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:44:00');
INSERT INTO `sys_job_log` VALUES ('667', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:44:20');
INSERT INTO `sys_job_log` VALUES ('668', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:44:40');
INSERT INTO `sys_job_log` VALUES ('669', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:45:00');
INSERT INTO `sys_job_log` VALUES ('670', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:45:20');
INSERT INTO `sys_job_log` VALUES ('671', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:45:40');
INSERT INTO `sys_job_log` VALUES ('672', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:46:00');
INSERT INTO `sys_job_log` VALUES ('673', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:46:20');
INSERT INTO `sys_job_log` VALUES ('674', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:46:40');
INSERT INTO `sys_job_log` VALUES ('675', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:47:00');
INSERT INTO `sys_job_log` VALUES ('676', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:47:20');
INSERT INTO `sys_job_log` VALUES ('677', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:47:40');
INSERT INTO `sys_job_log` VALUES ('678', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:48:00');
INSERT INTO `sys_job_log` VALUES ('679', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:48:20');
INSERT INTO `sys_job_log` VALUES ('680', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:48:40');
INSERT INTO `sys_job_log` VALUES ('681', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:49:00');
INSERT INTO `sys_job_log` VALUES ('682', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:49:20');
INSERT INTO `sys_job_log` VALUES ('683', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:49:40');
INSERT INTO `sys_job_log` VALUES ('684', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:50:00');
INSERT INTO `sys_job_log` VALUES ('685', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:50:20');
INSERT INTO `sys_job_log` VALUES ('686', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:50:40');
INSERT INTO `sys_job_log` VALUES ('687', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:51:00');
INSERT INTO `sys_job_log` VALUES ('688', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:51:20');
INSERT INTO `sys_job_log` VALUES ('689', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:51:40');
INSERT INTO `sys_job_log` VALUES ('690', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:52:00');
INSERT INTO `sys_job_log` VALUES ('691', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:52:20');
INSERT INTO `sys_job_log` VALUES ('692', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:52:40');
INSERT INTO `sys_job_log` VALUES ('693', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:53:00');
INSERT INTO `sys_job_log` VALUES ('694', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:53:20');
INSERT INTO `sys_job_log` VALUES ('695', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:53:40');
INSERT INTO `sys_job_log` VALUES ('696', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:54:00');
INSERT INTO `sys_job_log` VALUES ('697', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:54:20');
INSERT INTO `sys_job_log` VALUES ('698', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:54:40');
INSERT INTO `sys_job_log` VALUES ('699', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:55:00');
INSERT INTO `sys_job_log` VALUES ('700', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:55:20');
INSERT INTO `sys_job_log` VALUES ('701', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:55:40');
INSERT INTO `sys_job_log` VALUES ('702', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:56:00');
INSERT INTO `sys_job_log` VALUES ('703', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:56:20');
INSERT INTO `sys_job_log` VALUES ('704', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 14:56:40');
INSERT INTO `sys_job_log` VALUES ('705', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:57:00');
INSERT INTO `sys_job_log` VALUES ('706', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:57:20');
INSERT INTO `sys_job_log` VALUES ('707', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:57:40');
INSERT INTO `sys_job_log` VALUES ('708', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:58:00');
INSERT INTO `sys_job_log` VALUES ('709', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:58:20');
INSERT INTO `sys_job_log` VALUES ('710', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:58:40');
INSERT INTO `sys_job_log` VALUES ('711', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:59:00');
INSERT INTO `sys_job_log` VALUES ('712', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:59:20');
INSERT INTO `sys_job_log` VALUES ('713', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 14:59:40');
INSERT INTO `sys_job_log` VALUES ('714', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:00:00');
INSERT INTO `sys_job_log` VALUES ('715', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:00:20');
INSERT INTO `sys_job_log` VALUES ('716', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:00:40');
INSERT INTO `sys_job_log` VALUES ('717', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:01:00');
INSERT INTO `sys_job_log` VALUES ('718', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:01:20');
INSERT INTO `sys_job_log` VALUES ('719', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:01:40');
INSERT INTO `sys_job_log` VALUES ('720', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:02:00');
INSERT INTO `sys_job_log` VALUES ('721', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:02:20');
INSERT INTO `sys_job_log` VALUES ('722', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:02:40');
INSERT INTO `sys_job_log` VALUES ('723', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:03:00');
INSERT INTO `sys_job_log` VALUES ('724', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:03:20');
INSERT INTO `sys_job_log` VALUES ('725', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:03:40');
INSERT INTO `sys_job_log` VALUES ('726', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:04:00');
INSERT INTO `sys_job_log` VALUES ('727', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:04:20');
INSERT INTO `sys_job_log` VALUES ('728', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:04:40');
INSERT INTO `sys_job_log` VALUES ('729', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:05:00');
INSERT INTO `sys_job_log` VALUES ('730', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:05:20');
INSERT INTO `sys_job_log` VALUES ('731', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:05:40');
INSERT INTO `sys_job_log` VALUES ('732', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:06:00');
INSERT INTO `sys_job_log` VALUES ('733', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:06:20');
INSERT INTO `sys_job_log` VALUES ('734', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:06:40');
INSERT INTO `sys_job_log` VALUES ('735', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:07:00');
INSERT INTO `sys_job_log` VALUES ('736', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:07:20');
INSERT INTO `sys_job_log` VALUES ('737', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:07:40');
INSERT INTO `sys_job_log` VALUES ('738', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:08:00');
INSERT INTO `sys_job_log` VALUES ('739', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:08:20');
INSERT INTO `sys_job_log` VALUES ('740', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:08:40');
INSERT INTO `sys_job_log` VALUES ('741', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:09:00');
INSERT INTO `sys_job_log` VALUES ('742', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:09:20');
INSERT INTO `sys_job_log` VALUES ('743', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:09:40');
INSERT INTO `sys_job_log` VALUES ('744', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:10:00');
INSERT INTO `sys_job_log` VALUES ('745', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:10:20');
INSERT INTO `sys_job_log` VALUES ('746', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:10:40');
INSERT INTO `sys_job_log` VALUES ('747', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:11:00');
INSERT INTO `sys_job_log` VALUES ('748', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:11:20');
INSERT INTO `sys_job_log` VALUES ('749', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:11:40');
INSERT INTO `sys_job_log` VALUES ('750', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:12:00');
INSERT INTO `sys_job_log` VALUES ('751', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:12:20');
INSERT INTO `sys_job_log` VALUES ('752', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:12:40');
INSERT INTO `sys_job_log` VALUES ('753', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:13:00');
INSERT INTO `sys_job_log` VALUES ('754', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:13:20');
INSERT INTO `sys_job_log` VALUES ('755', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:13:40');
INSERT INTO `sys_job_log` VALUES ('756', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:14:00');
INSERT INTO `sys_job_log` VALUES ('757', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:14:20');
INSERT INTO `sys_job_log` VALUES ('758', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:14:40');
INSERT INTO `sys_job_log` VALUES ('759', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:15:00');
INSERT INTO `sys_job_log` VALUES ('760', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:15:20');
INSERT INTO `sys_job_log` VALUES ('761', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:15:40');
INSERT INTO `sys_job_log` VALUES ('762', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:16:00');
INSERT INTO `sys_job_log` VALUES ('763', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:16:20');
INSERT INTO `sys_job_log` VALUES ('764', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:16:40');
INSERT INTO `sys_job_log` VALUES ('765', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:17:00');
INSERT INTO `sys_job_log` VALUES ('766', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:17:20');
INSERT INTO `sys_job_log` VALUES ('767', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:17:40');
INSERT INTO `sys_job_log` VALUES ('768', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:18:00');
INSERT INTO `sys_job_log` VALUES ('769', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:18:20');
INSERT INTO `sys_job_log` VALUES ('770', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:18:40');
INSERT INTO `sys_job_log` VALUES ('771', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:19:00');
INSERT INTO `sys_job_log` VALUES ('772', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:19:20');
INSERT INTO `sys_job_log` VALUES ('773', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:19:40');
INSERT INTO `sys_job_log` VALUES ('774', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:20:00');
INSERT INTO `sys_job_log` VALUES ('775', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:20:20');
INSERT INTO `sys_job_log` VALUES ('776', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:20:40');
INSERT INTO `sys_job_log` VALUES ('777', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:21:00');
INSERT INTO `sys_job_log` VALUES ('778', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:21:20');
INSERT INTO `sys_job_log` VALUES ('779', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:21:40');
INSERT INTO `sys_job_log` VALUES ('780', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:22:00');
INSERT INTO `sys_job_log` VALUES ('781', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:22:20');
INSERT INTO `sys_job_log` VALUES ('782', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:22:40');
INSERT INTO `sys_job_log` VALUES ('783', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:23:00');
INSERT INTO `sys_job_log` VALUES ('784', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:23:20');
INSERT INTO `sys_job_log` VALUES ('785', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:23:40');
INSERT INTO `sys_job_log` VALUES ('786', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:24:00');
INSERT INTO `sys_job_log` VALUES ('787', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:24:20');
INSERT INTO `sys_job_log` VALUES ('788', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:24:40');
INSERT INTO `sys_job_log` VALUES ('789', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:25:00');
INSERT INTO `sys_job_log` VALUES ('790', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:25:20');
INSERT INTO `sys_job_log` VALUES ('791', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:25:40');
INSERT INTO `sys_job_log` VALUES ('792', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:26:00');
INSERT INTO `sys_job_log` VALUES ('793', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:26:20');
INSERT INTO `sys_job_log` VALUES ('794', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:26:40');
INSERT INTO `sys_job_log` VALUES ('795', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:27:00');
INSERT INTO `sys_job_log` VALUES ('796', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:27:20');
INSERT INTO `sys_job_log` VALUES ('797', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:27:40');
INSERT INTO `sys_job_log` VALUES ('798', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:28:00');
INSERT INTO `sys_job_log` VALUES ('799', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:28:20');
INSERT INTO `sys_job_log` VALUES ('800', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:28:40');
INSERT INTO `sys_job_log` VALUES ('801', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:29:00');
INSERT INTO `sys_job_log` VALUES ('802', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:29:20');
INSERT INTO `sys_job_log` VALUES ('803', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:29:40');
INSERT INTO `sys_job_log` VALUES ('804', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:30:00');
INSERT INTO `sys_job_log` VALUES ('805', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:30:20');
INSERT INTO `sys_job_log` VALUES ('806', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:30:40');
INSERT INTO `sys_job_log` VALUES ('807', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:31:00');
INSERT INTO `sys_job_log` VALUES ('808', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:31:20');
INSERT INTO `sys_job_log` VALUES ('809', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:31:40');
INSERT INTO `sys_job_log` VALUES ('810', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:32:00');
INSERT INTO `sys_job_log` VALUES ('811', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:32:20');
INSERT INTO `sys_job_log` VALUES ('812', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:32:40');
INSERT INTO `sys_job_log` VALUES ('813', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:33:00');
INSERT INTO `sys_job_log` VALUES ('814', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:33:20');
INSERT INTO `sys_job_log` VALUES ('815', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:33:40');
INSERT INTO `sys_job_log` VALUES ('816', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:34:00');
INSERT INTO `sys_job_log` VALUES ('817', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:34:20');
INSERT INTO `sys_job_log` VALUES ('818', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:34:40');
INSERT INTO `sys_job_log` VALUES ('819', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:35:00');
INSERT INTO `sys_job_log` VALUES ('820', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:35:20');
INSERT INTO `sys_job_log` VALUES ('821', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:35:40');
INSERT INTO `sys_job_log` VALUES ('822', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:36:00');
INSERT INTO `sys_job_log` VALUES ('823', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:36:20');
INSERT INTO `sys_job_log` VALUES ('824', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:36:40');
INSERT INTO `sys_job_log` VALUES ('825', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:37:00');
INSERT INTO `sys_job_log` VALUES ('826', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:37:20');
INSERT INTO `sys_job_log` VALUES ('827', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:37:40');
INSERT INTO `sys_job_log` VALUES ('828', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:38:00');
INSERT INTO `sys_job_log` VALUES ('829', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:38:20');
INSERT INTO `sys_job_log` VALUES ('830', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:38:40');
INSERT INTO `sys_job_log` VALUES ('831', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:39:00');
INSERT INTO `sys_job_log` VALUES ('832', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:39:20');
INSERT INTO `sys_job_log` VALUES ('833', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:39:40');
INSERT INTO `sys_job_log` VALUES ('834', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:40:00');
INSERT INTO `sys_job_log` VALUES ('835', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:40:20');
INSERT INTO `sys_job_log` VALUES ('836', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:40:40');
INSERT INTO `sys_job_log` VALUES ('837', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:41:00');
INSERT INTO `sys_job_log` VALUES ('838', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:41:20');
INSERT INTO `sys_job_log` VALUES ('839', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:41:40');
INSERT INTO `sys_job_log` VALUES ('840', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:42:00');
INSERT INTO `sys_job_log` VALUES ('841', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:42:20');
INSERT INTO `sys_job_log` VALUES ('842', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:42:40');
INSERT INTO `sys_job_log` VALUES ('843', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:43:00');
INSERT INTO `sys_job_log` VALUES ('844', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:43:20');
INSERT INTO `sys_job_log` VALUES ('845', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:43:40');
INSERT INTO `sys_job_log` VALUES ('846', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:44:00');
INSERT INTO `sys_job_log` VALUES ('847', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:44:20');
INSERT INTO `sys_job_log` VALUES ('848', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:44:40');
INSERT INTO `sys_job_log` VALUES ('849', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:45:00');
INSERT INTO `sys_job_log` VALUES ('850', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:45:20');
INSERT INTO `sys_job_log` VALUES ('851', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:45:40');
INSERT INTO `sys_job_log` VALUES ('852', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:46:00');
INSERT INTO `sys_job_log` VALUES ('853', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:46:20');
INSERT INTO `sys_job_log` VALUES ('854', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:46:40');
INSERT INTO `sys_job_log` VALUES ('855', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:47:00');
INSERT INTO `sys_job_log` VALUES ('856', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:47:20');
INSERT INTO `sys_job_log` VALUES ('857', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:47:40');
INSERT INTO `sys_job_log` VALUES ('858', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:48:00');
INSERT INTO `sys_job_log` VALUES ('859', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:48:20');
INSERT INTO `sys_job_log` VALUES ('860', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:48:40');
INSERT INTO `sys_job_log` VALUES ('861', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:49:00');
INSERT INTO `sys_job_log` VALUES ('862', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 15:49:20');
INSERT INTO `sys_job_log` VALUES ('863', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:49:40');
INSERT INTO `sys_job_log` VALUES ('864', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:50:00');
INSERT INTO `sys_job_log` VALUES ('865', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:50:20');
INSERT INTO `sys_job_log` VALUES ('866', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:50:40');
INSERT INTO `sys_job_log` VALUES ('867', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:51:00');
INSERT INTO `sys_job_log` VALUES ('868', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:51:20');
INSERT INTO `sys_job_log` VALUES ('869', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:51:40');
INSERT INTO `sys_job_log` VALUES ('870', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:52:00');
INSERT INTO `sys_job_log` VALUES ('871', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:52:20');
INSERT INTO `sys_job_log` VALUES ('872', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:52:40');
INSERT INTO `sys_job_log` VALUES ('873', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:53:00');
INSERT INTO `sys_job_log` VALUES ('874', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:53:20');
INSERT INTO `sys_job_log` VALUES ('875', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:53:40');
INSERT INTO `sys_job_log` VALUES ('876', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:54:00');
INSERT INTO `sys_job_log` VALUES ('877', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:54:20');
INSERT INTO `sys_job_log` VALUES ('878', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:54:40');
INSERT INTO `sys_job_log` VALUES ('879', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:55:00');
INSERT INTO `sys_job_log` VALUES ('880', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:55:20');
INSERT INTO `sys_job_log` VALUES ('881', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:55:40');
INSERT INTO `sys_job_log` VALUES ('882', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:56:00');
INSERT INTO `sys_job_log` VALUES ('883', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:56:20');
INSERT INTO `sys_job_log` VALUES ('884', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:56:40');
INSERT INTO `sys_job_log` VALUES ('885', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:57:00');
INSERT INTO `sys_job_log` VALUES ('886', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:57:20');
INSERT INTO `sys_job_log` VALUES ('887', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:57:40');
INSERT INTO `sys_job_log` VALUES ('888', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:58:00');
INSERT INTO `sys_job_log` VALUES ('889', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:58:20');
INSERT INTO `sys_job_log` VALUES ('890', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:58:40');
INSERT INTO `sys_job_log` VALUES ('891', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:59:00');
INSERT INTO `sys_job_log` VALUES ('892', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:59:20');
INSERT INTO `sys_job_log` VALUES ('893', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 15:59:40');
INSERT INTO `sys_job_log` VALUES ('894', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:00:00');
INSERT INTO `sys_job_log` VALUES ('895', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:00:20');
INSERT INTO `sys_job_log` VALUES ('896', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:00:40');
INSERT INTO `sys_job_log` VALUES ('897', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:01:00');
INSERT INTO `sys_job_log` VALUES ('898', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:01:20');
INSERT INTO `sys_job_log` VALUES ('899', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:01:40');
INSERT INTO `sys_job_log` VALUES ('900', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:02:00');
INSERT INTO `sys_job_log` VALUES ('901', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:02:20');
INSERT INTO `sys_job_log` VALUES ('902', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:02:40');
INSERT INTO `sys_job_log` VALUES ('903', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:03:00');
INSERT INTO `sys_job_log` VALUES ('904', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:03:20');
INSERT INTO `sys_job_log` VALUES ('905', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:03:40');
INSERT INTO `sys_job_log` VALUES ('906', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:04:00');
INSERT INTO `sys_job_log` VALUES ('907', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:04:20');
INSERT INTO `sys_job_log` VALUES ('908', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:04:40');
INSERT INTO `sys_job_log` VALUES ('909', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:05:00');
INSERT INTO `sys_job_log` VALUES ('910', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:05:20');
INSERT INTO `sys_job_log` VALUES ('911', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:05:40');
INSERT INTO `sys_job_log` VALUES ('912', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:06:00');
INSERT INTO `sys_job_log` VALUES ('913', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:06:20');
INSERT INTO `sys_job_log` VALUES ('914', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:06:40');
INSERT INTO `sys_job_log` VALUES ('915', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:07:00');
INSERT INTO `sys_job_log` VALUES ('916', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:07:20');
INSERT INTO `sys_job_log` VALUES ('917', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:07:40');
INSERT INTO `sys_job_log` VALUES ('918', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:08:00');
INSERT INTO `sys_job_log` VALUES ('919', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:08:20');
INSERT INTO `sys_job_log` VALUES ('920', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:08:40');
INSERT INTO `sys_job_log` VALUES ('921', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:09:00');
INSERT INTO `sys_job_log` VALUES ('922', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:09:20');
INSERT INTO `sys_job_log` VALUES ('923', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:09:40');
INSERT INTO `sys_job_log` VALUES ('924', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:10:00');
INSERT INTO `sys_job_log` VALUES ('925', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:10:20');
INSERT INTO `sys_job_log` VALUES ('926', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 16:10:40');
INSERT INTO `sys_job_log` VALUES ('927', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:11:00');
INSERT INTO `sys_job_log` VALUES ('928', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:11:20');
INSERT INTO `sys_job_log` VALUES ('929', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:11:40');
INSERT INTO `sys_job_log` VALUES ('930', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:12:00');
INSERT INTO `sys_job_log` VALUES ('931', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:12:20');
INSERT INTO `sys_job_log` VALUES ('932', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:12:40');
INSERT INTO `sys_job_log` VALUES ('933', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:13:00');
INSERT INTO `sys_job_log` VALUES ('934', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:13:20');
INSERT INTO `sys_job_log` VALUES ('935', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:13:40');
INSERT INTO `sys_job_log` VALUES ('936', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:14:00');
INSERT INTO `sys_job_log` VALUES ('937', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:14:20');
INSERT INTO `sys_job_log` VALUES ('938', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:14:40');
INSERT INTO `sys_job_log` VALUES ('939', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:15:00');
INSERT INTO `sys_job_log` VALUES ('940', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:15:20');
INSERT INTO `sys_job_log` VALUES ('941', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:15:40');
INSERT INTO `sys_job_log` VALUES ('942', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:16:00');
INSERT INTO `sys_job_log` VALUES ('943', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:16:20');
INSERT INTO `sys_job_log` VALUES ('944', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:16:40');
INSERT INTO `sys_job_log` VALUES ('945', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:17:00');
INSERT INTO `sys_job_log` VALUES ('946', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:17:20');
INSERT INTO `sys_job_log` VALUES ('947', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:17:40');
INSERT INTO `sys_job_log` VALUES ('948', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:18:00');
INSERT INTO `sys_job_log` VALUES ('949', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:18:20');
INSERT INTO `sys_job_log` VALUES ('950', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:18:40');
INSERT INTO `sys_job_log` VALUES ('951', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:19:00');
INSERT INTO `sys_job_log` VALUES ('952', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:19:20');
INSERT INTO `sys_job_log` VALUES ('953', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:19:40');
INSERT INTO `sys_job_log` VALUES ('954', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:20:00');
INSERT INTO `sys_job_log` VALUES ('955', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:20:20');
INSERT INTO `sys_job_log` VALUES ('956', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:20:40');
INSERT INTO `sys_job_log` VALUES ('957', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:21:00');
INSERT INTO `sys_job_log` VALUES ('958', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:21:20');
INSERT INTO `sys_job_log` VALUES ('959', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:21:40');
INSERT INTO `sys_job_log` VALUES ('960', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:22:00');
INSERT INTO `sys_job_log` VALUES ('961', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:22:20');
INSERT INTO `sys_job_log` VALUES ('962', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:22:40');
INSERT INTO `sys_job_log` VALUES ('963', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:23:00');
INSERT INTO `sys_job_log` VALUES ('964', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:23:20');
INSERT INTO `sys_job_log` VALUES ('965', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:23:40');
INSERT INTO `sys_job_log` VALUES ('966', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:24:00');
INSERT INTO `sys_job_log` VALUES ('967', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:24:20');
INSERT INTO `sys_job_log` VALUES ('968', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:24:40');
INSERT INTO `sys_job_log` VALUES ('969', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:25:00');
INSERT INTO `sys_job_log` VALUES ('970', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 16:25:20');
INSERT INTO `sys_job_log` VALUES ('971', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:25:40');
INSERT INTO `sys_job_log` VALUES ('972', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:26:00');
INSERT INTO `sys_job_log` VALUES ('973', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:26:20');
INSERT INTO `sys_job_log` VALUES ('974', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:26:40');
INSERT INTO `sys_job_log` VALUES ('975', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:27:00');
INSERT INTO `sys_job_log` VALUES ('976', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:27:20');
INSERT INTO `sys_job_log` VALUES ('977', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:27:40');
INSERT INTO `sys_job_log` VALUES ('978', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:28:00');
INSERT INTO `sys_job_log` VALUES ('979', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:28:20');
INSERT INTO `sys_job_log` VALUES ('980', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:28:40');
INSERT INTO `sys_job_log` VALUES ('981', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:29:00');
INSERT INTO `sys_job_log` VALUES ('982', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:29:20');
INSERT INTO `sys_job_log` VALUES ('983', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:29:40');
INSERT INTO `sys_job_log` VALUES ('984', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:30:00');
INSERT INTO `sys_job_log` VALUES ('985', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:30:20');
INSERT INTO `sys_job_log` VALUES ('986', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:30:40');
INSERT INTO `sys_job_log` VALUES ('987', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:31:00');
INSERT INTO `sys_job_log` VALUES ('988', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:31:20');
INSERT INTO `sys_job_log` VALUES ('989', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:31:40');
INSERT INTO `sys_job_log` VALUES ('990', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:32:00');
INSERT INTO `sys_job_log` VALUES ('991', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:32:20');
INSERT INTO `sys_job_log` VALUES ('992', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:32:40');
INSERT INTO `sys_job_log` VALUES ('993', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 16:33:00');
INSERT INTO `sys_job_log` VALUES ('994', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:33:20');
INSERT INTO `sys_job_log` VALUES ('995', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-05-26 16:33:40');
INSERT INTO `sys_job_log` VALUES ('996', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:34:00');
INSERT INTO `sys_job_log` VALUES ('997', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:34:20');
INSERT INTO `sys_job_log` VALUES ('998', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-05-26 16:34:40');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-08 20:46:17');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-04-08 20:46:25');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-08 20:47:27');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 13:12:47');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-09 13:31:38');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 13:31:46');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 13:36:44');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:07:47');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:13:33');
INSERT INTO `sys_logininfor` VALUES ('109', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:31:19');
INSERT INTO `sys_logininfor` VALUES ('110', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 14:31:33');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:31:43');
INSERT INTO `sys_logininfor` VALUES ('112', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:40:32');
INSERT INTO `sys_logininfor` VALUES ('113', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 14:40:40');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:40:49');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-04-09 14:41:22');
INSERT INTO `sys_logininfor` VALUES ('116', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:41:33');
INSERT INTO `sys_logininfor` VALUES ('117', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-09 14:49:13');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-09 18:13:02');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-04-09 18:29:15');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-04-09 18:29:37');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-09 18:29:40');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-09 18:30:38');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-09 18:54:11');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-09 19:35:26');
INSERT INTO `sys_logininfor` VALUES ('125', 'tj', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-10 13:20:26');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-10 17:14:16');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-04-10 17:43:58');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-10 17:44:07');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-10 19:29:41');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-11 15:04:15');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-04-11 16:23:22');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-11 17:56:38');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-11 18:02:08');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-11 18:25:05');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-11 18:55:52');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:23:34');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:25:22');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:28:42');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:36:54');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:54:59');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 19:58:00');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:00:38');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:04:48');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:09:47');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:14:49');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:20:03');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:24:58');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:26:50');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:28:43');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:30:10');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-18 20:34:00');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:14:36');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:23:10');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:25:28');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:30:07');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:38:15');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:40:30');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-19 18:42:48');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 18:42:54');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:02:23');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:07:53');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:13:33');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:14:48');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:17:43');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:20:26');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:21:53');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:25:47');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:35:25');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:37:21');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:40:08');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-19 19:51:20');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-20 15:18:36');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-20 15:35:06');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-20 15:49:43');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-20 19:10:22');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-21 15:54:52');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-21 17:16:29');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-21 17:19:54');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-21 19:11:43');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-21 19:11:49');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-22 16:45:15');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-23 17:25:41');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-23 17:48:00');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-23 17:59:42');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 17:00:31');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 17:06:38');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 17:08:51');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 17:55:50');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 20:08:39');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 20:11:15');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 20:28:07');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-04-25 20:38:03');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 20:38:21');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-25 20:57:06');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 15:17:24');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 15:21:48');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 15:35:58');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 15:44:56');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:19:19');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:23:01');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:40:25');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-26 16:41:20');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:49:15');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:55:32');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 16:58:19');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 17:17:30');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 18:27:32');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 18:33:25');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 18:42:42');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-26 18:49:04');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 18:49:07');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 19:08:51');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 19:55:48');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-26 20:24:36');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 20:24:42');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-26 20:45:24');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 14:54:28');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 15:42:02');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 15:53:21');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 16:16:10');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 16:20:30');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 16:22:41');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-27 16:40:22');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 12:05:32');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 12:37:15');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 13:12:17');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 13:18:31');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 13:26:15');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 13:50:25');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 13:54:53');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 14:32:55');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 15:36:15');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-28 15:39:50');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 15:39:55');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 15:49:06');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 15:53:28');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 15:57:25');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-04-28 15:58:17');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-28 16:01:58');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-29 18:31:29');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-29 18:31:34');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-29 18:31:38');
INSERT INTO `sys_logininfor` VALUES ('243', '13055174100', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '用户不存在/密码错误', '2019-04-29 18:32:08');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-04-29 18:35:12');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误2次', '2019-04-29 18:35:20');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-29 18:43:26');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-30 11:35:21');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 16:11:19');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 16:21:19');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 16:24:18');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 16:27:23');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 16:30:16');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-02 17:15:31');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-02 17:15:39');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-04 15:48:33');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-04 15:48:40');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-04 16:50:10');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-04 16:57:21');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-06 16:07:10');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-06 16:12:31');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-06 16:32:23');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-06 16:47:56');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 15:18:19');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 15:55:42');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 16:04:54');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 16:18:15');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 16:28:07');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 16:39:52');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 16:55:04');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 17:00:49');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 17:07:49');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-07 17:12:49');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 13:18:37');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 13:21:37');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 14:10:30');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 15:09:35');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 16:02:14');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 17:05:10');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 17:24:35');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 17:25:22');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 17:35:44');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 17:44:50');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 18:40:39');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-09 18:48:55');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-09 18:49:00');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 18:49:08');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 19:05:17');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 20:06:31');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-09 20:49:51');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 12:13:30');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 12:48:25');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 14:26:51');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 14:52:53');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 14:56:39');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 15:48:20');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-10 16:13:58');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 16:14:01');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 16:25:38');
INSERT INTO `sys_logininfor` VALUES ('299', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 16:53:27');
INSERT INTO `sys_logininfor` VALUES ('300', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 16:58:02');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:02:48');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:03:11');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:08:46');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:18:55');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:34:14');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:36:31');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:54:20');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 17:58:08');
INSERT INTO `sys_logininfor` VALUES ('309', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 18:05:55');
INSERT INTO `sys_logininfor` VALUES ('310', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 18:06:42');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '183.214.207.182', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-10 20:09:19');
INSERT INTO `sys_logininfor` VALUES ('312', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-11 16:07:16');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-11 16:25:03');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '117.136.89.84', '湖南 长沙', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2019-05-11 21:19:21');
INSERT INTO `sys_logininfor` VALUES ('315', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 13:58:48');
INSERT INTO `sys_logininfor` VALUES ('316', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 15:48:28');
INSERT INTO `sys_logininfor` VALUES ('317', 'admin', '119.39.127.107', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 16:03:07');
INSERT INTO `sys_logininfor` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-05-12 16:05:21');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 16:05:26');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 16:11:05');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '117.136.89.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 16:19:17');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 16:22:28');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 16:24:43');
INSERT INTO `sys_logininfor` VALUES ('324', 'admin', '117.136.89.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 17:00:18');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 17:06:55');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-12 17:13:04');
INSERT INTO `sys_logininfor` VALUES ('327', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-12 17:42:40');
INSERT INTO `sys_logininfor` VALUES ('328', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 11:32:52');
INSERT INTO `sys_logininfor` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 11:38:25');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 13:36:47');
INSERT INTO `sys_logininfor` VALUES ('331', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-05-13 13:38:32');
INSERT INTO `sys_logininfor` VALUES ('332', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 13:38:41');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 14:43:47');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 14:47:39');
INSERT INTO `sys_logininfor` VALUES ('335', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 14:49:57');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-05-13 14:57:26');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 14:57:30');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 15:07:46');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 15:12:40');
INSERT INTO `sys_logininfor` VALUES ('340', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 15:20:51');
INSERT INTO `sys_logininfor` VALUES ('341', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-13 15:28:57');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 15:55:24');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 16:12:36');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 16:38:11');
INSERT INTO `sys_logininfor` VALUES ('345', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-13 16:53:15');
INSERT INTO `sys_logininfor` VALUES ('346', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 12:07:04');
INSERT INTO `sys_logininfor` VALUES ('347', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 13:04:09');
INSERT INTO `sys_logininfor` VALUES ('348', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 13:24:52');
INSERT INTO `sys_logininfor` VALUES ('349', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 13:40:07');
INSERT INTO `sys_logininfor` VALUES ('350', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 13:47:52');
INSERT INTO `sys_logininfor` VALUES ('351', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 14:28:27');
INSERT INTO `sys_logininfor` VALUES ('352', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-14 14:48:34');
INSERT INTO `sys_logininfor` VALUES ('353', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-15 15:39:40');
INSERT INTO `sys_logininfor` VALUES ('354', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-16 15:06:36');
INSERT INTO `sys_logininfor` VALUES ('355', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-16 15:07:34');
INSERT INTO `sys_logininfor` VALUES ('356', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-17 17:15:19');
INSERT INTO `sys_logininfor` VALUES ('357', 'admin', '117.136.88.45', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-19 16:26:47');
INSERT INTO `sys_logininfor` VALUES ('358', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-19 16:38:46');
INSERT INTO `sys_logininfor` VALUES ('359', 'admin', '117.136.88.45', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-19 17:11:16');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-19 17:11:38');
INSERT INTO `sys_logininfor` VALUES ('361', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-19 17:16:42');
INSERT INTO `sys_logininfor` VALUES ('362', 'admin', '117.136.88.45', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-19 17:18:53');
INSERT INTO `sys_logininfor` VALUES ('363', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-20 15:08:22');
INSERT INTO `sys_logininfor` VALUES ('364', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-20 15:09:49');
INSERT INTO `sys_logininfor` VALUES ('365', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-20 15:12:12');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-20 15:58:43');
INSERT INTO `sys_logininfor` VALUES ('367', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-20 16:17:52');
INSERT INTO `sys_logininfor` VALUES ('368', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-20 16:23:24');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-21 13:44:46');
INSERT INTO `sys_logininfor` VALUES ('370', 'admin', '183.214.207.182', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-21 13:58:53');
INSERT INTO `sys_logininfor` VALUES ('371', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-22 13:59:08');
INSERT INTO `sys_logininfor` VALUES ('372', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-22 14:02:02');
INSERT INTO `sys_logininfor` VALUES ('373', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-22 16:41:18');
INSERT INTO `sys_logininfor` VALUES ('374', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-22 17:02:34');
INSERT INTO `sys_logininfor` VALUES ('375', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-22 17:13:22');
INSERT INTO `sys_logininfor` VALUES ('376', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-23 16:00:42');
INSERT INTO `sys_logininfor` VALUES ('377', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-23 16:05:36');
INSERT INTO `sys_logininfor` VALUES ('378', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-23 16:17:50');
INSERT INTO `sys_logininfor` VALUES ('379', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-23 16:36:49');
INSERT INTO `sys_logininfor` VALUES ('380', 'admin', '223.104.131.167', '湖南 长沙', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2019-05-23 16:48:51');
INSERT INTO `sys_logininfor` VALUES ('381', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 11:16:36');
INSERT INTO `sys_logininfor` VALUES ('382', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 11:20:15');
INSERT INTO `sys_logininfor` VALUES ('383', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 11:35:44');
INSERT INTO `sys_logininfor` VALUES ('384', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 11:37:57');
INSERT INTO `sys_logininfor` VALUES ('385', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 11:39:52');
INSERT INTO `sys_logininfor` VALUES ('386', 'admin', '220.202.152.3', '湖南 长沙', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-24 11:42:32');
INSERT INTO `sys_logininfor` VALUES ('387', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 11:43:25');
INSERT INTO `sys_logininfor` VALUES ('388', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 11:57:12');
INSERT INTO `sys_logininfor` VALUES ('389', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 12:24:32');
INSERT INTO `sys_logininfor` VALUES ('390', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:26:20');
INSERT INTO `sys_logininfor` VALUES ('391', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:32:31');
INSERT INTO `sys_logininfor` VALUES ('392', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:35:54');
INSERT INTO `sys_logininfor` VALUES ('393', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:45:00');
INSERT INTO `sys_logininfor` VALUES ('394', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:49:48');
INSERT INTO `sys_logininfor` VALUES ('395', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 12:50:15');
INSERT INTO `sys_logininfor` VALUES ('396', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 12:50:59');
INSERT INTO `sys_logininfor` VALUES ('397', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:53:32');
INSERT INTO `sys_logininfor` VALUES ('398', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 12:57:46');
INSERT INTO `sys_logininfor` VALUES ('399', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 13:15:38');
INSERT INTO `sys_logininfor` VALUES ('400', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 13:43:57');
INSERT INTO `sys_logininfor` VALUES ('401', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 13:55:08');
INSERT INTO `sys_logininfor` VALUES ('402', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 13:56:18');
INSERT INTO `sys_logininfor` VALUES ('403', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 13:57:24');
INSERT INTO `sys_logininfor` VALUES ('404', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 14:01:54');
INSERT INTO `sys_logininfor` VALUES ('405', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 14:15:38');
INSERT INTO `sys_logininfor` VALUES ('406', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-24 14:17:27');
INSERT INTO `sys_logininfor` VALUES ('407', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 14:17:30');
INSERT INTO `sys_logininfor` VALUES ('408', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-24 14:20:31');
INSERT INTO `sys_logininfor` VALUES ('409', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 14:22:07');
INSERT INTO `sys_logininfor` VALUES ('410', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-24 14:22:33');
INSERT INTO `sys_logininfor` VALUES ('411', 'admin', '119.39.127.107', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-24 14:25:26');
INSERT INTO `sys_logininfor` VALUES ('412', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 16:39:33');
INSERT INTO `sys_logininfor` VALUES ('413', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 16:54:13');
INSERT INTO `sys_logininfor` VALUES ('414', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 16:59:32');
INSERT INTO `sys_logininfor` VALUES ('415', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 17:01:48');
INSERT INTO `sys_logininfor` VALUES ('416', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-25 17:06:48');
INSERT INTO `sys_logininfor` VALUES ('417', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 17:06:53');
INSERT INTO `sys_logininfor` VALUES ('418', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 17:11:11');
INSERT INTO `sys_logininfor` VALUES ('419', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 17:13:23');
INSERT INTO `sys_logininfor` VALUES ('420', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 17:18:18');
INSERT INTO `sys_logininfor` VALUES ('421', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 18:47:40');
INSERT INTO `sys_logininfor` VALUES ('422', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 18:52:22');
INSERT INTO `sys_logininfor` VALUES ('423', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-25 18:53:41');
INSERT INTO `sys_logininfor` VALUES ('424', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 18:53:45');
INSERT INTO `sys_logininfor` VALUES ('425', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 18:55:57');
INSERT INTO `sys_logininfor` VALUES ('426', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 20:19:15');
INSERT INTO `sys_logininfor` VALUES ('427', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 20:23:22');
INSERT INTO `sys_logininfor` VALUES ('428', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 20:26:38');
INSERT INTO `sys_logininfor` VALUES ('429', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-25 20:49:30');
INSERT INTO `sys_logininfor` VALUES ('430', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 12:38:03');
INSERT INTO `sys_logininfor` VALUES ('431', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-05-27 12:39:00');
INSERT INTO `sys_logininfor` VALUES ('432', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 12:39:03');
INSERT INTO `sys_logininfor` VALUES ('433', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 12:40:32');
INSERT INTO `sys_logininfor` VALUES ('434', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 12:59:53');
INSERT INTO `sys_logininfor` VALUES ('435', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 13:01:42');
INSERT INTO `sys_logininfor` VALUES ('436', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 13:05:59');
INSERT INTO `sys_logininfor` VALUES ('437', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 13:12:40');
INSERT INTO `sys_logininfor` VALUES ('438', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 13:15:27');
INSERT INTO `sys_logininfor` VALUES ('439', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 13:45:26');
INSERT INTO `sys_logininfor` VALUES ('440', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 13:57:41');
INSERT INTO `sys_logininfor` VALUES ('441', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 14:20:36');
INSERT INTO `sys_logininfor` VALUES ('442', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 14:29:23');
INSERT INTO `sys_logininfor` VALUES ('443', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 14:40:36');
INSERT INTO `sys_logininfor` VALUES ('444', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 14:44:46');
INSERT INTO `sys_logininfor` VALUES ('445', 'admin', '117.136.89.125', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 17:48:54');
INSERT INTO `sys_logininfor` VALUES ('446', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 17:49:43');
INSERT INTO `sys_logininfor` VALUES ('447', 'admin', '117.136.89.125', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 18:10:41');
INSERT INTO `sys_logininfor` VALUES ('448', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 18:55:44');
INSERT INTO `sys_logininfor` VALUES ('449', 'admin', '10.50.23.215', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 18:58:39');
INSERT INTO `sys_logininfor` VALUES ('450', 'admin', '10.50.23.215', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 19:12:29');
INSERT INTO `sys_logininfor` VALUES ('451', 'admin', '10.50.23.215', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 19:13:57');
INSERT INTO `sys_logininfor` VALUES ('452', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 19:15:21');
INSERT INTO `sys_logininfor` VALUES ('453', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-27 19:16:15');
INSERT INTO `sys_logininfor` VALUES ('454', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-05-27 19:16:38');
INSERT INTO `sys_logininfor` VALUES ('455', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-28 12:01:13');
INSERT INTO `sys_logininfor` VALUES ('456', 'admin', '110.52.210.78', '湖南 长沙', 'Firefox', 'Windows 10', '0', '登录成功', '2019-05-28 12:59:10');
INSERT INTO `sys_logininfor` VALUES ('457', 'admin', '110.52.210.78', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-28 13:47:48');
INSERT INTO `sys_logininfor` VALUES ('458', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-28 14:21:38');
INSERT INTO `sys_logininfor` VALUES ('459', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-28 14:45:40');
INSERT INTO `sys_logininfor` VALUES ('460', 'admin', '110.52.210.78', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-28 15:17:23');
INSERT INTO `sys_logininfor` VALUES ('461', 'admin', '110.52.210.78', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-28 15:48:33');
INSERT INTO `sys_logininfor` VALUES ('462', 'admin', '110.52.210.78', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-28 16:08:57');
INSERT INTO `sys_logininfor` VALUES ('463', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-28 16:11:42');
INSERT INTO `sys_logininfor` VALUES ('464', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 16:10:52');
INSERT INTO `sys_logininfor` VALUES ('465', 'admin', '117.136.89.122', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 16:15:47');
INSERT INTO `sys_logininfor` VALUES ('466', 'admin', '117.136.89.122', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-29 16:20:04');
INSERT INTO `sys_logininfor` VALUES ('467', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 16:59:49');
INSERT INTO `sys_logininfor` VALUES ('468', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:04:48');
INSERT INTO `sys_logininfor` VALUES ('469', 'admin', '117.136.89.122', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:10:08');
INSERT INTO `sys_logininfor` VALUES ('470', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-05-29 17:14:15');
INSERT INTO `sys_logininfor` VALUES ('471', 'tj', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-05-29 17:14:25');
INSERT INTO `sys_logininfor` VALUES ('472', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-05-29 17:14:33');
INSERT INTO `sys_logininfor` VALUES ('473', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:14:40');
INSERT INTO `sys_logininfor` VALUES ('474', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-05-29 17:19:35');
INSERT INTO `sys_logininfor` VALUES ('475', 'tujun', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:19:46');
INSERT INTO `sys_logininfor` VALUES ('476', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:38:13');
INSERT INTO `sys_logininfor` VALUES ('477', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 17:39:04');
INSERT INTO `sys_logininfor` VALUES ('478', 'admin', '117.136.89.122', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-05-29 17:48:39');
INSERT INTO `sys_logininfor` VALUES ('479', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-29 18:10:59');
INSERT INTO `sys_logininfor` VALUES ('480', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-31 15:47:08');
INSERT INTO `sys_logininfor` VALUES ('481', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-05-31 16:29:58');
INSERT INTO `sys_logininfor` VALUES ('482', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-01 11:00:52');
INSERT INTO `sys_logininfor` VALUES ('483', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 16:31:27');
INSERT INTO `sys_logininfor` VALUES ('484', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 16:56:58');
INSERT INTO `sys_logininfor` VALUES ('485', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:09:44');
INSERT INTO `sys_logininfor` VALUES ('486', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:11:37');
INSERT INTO `sys_logininfor` VALUES ('487', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:29:46');
INSERT INTO `sys_logininfor` VALUES ('488', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:41:35');
INSERT INTO `sys_logininfor` VALUES ('489', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:42:11');
INSERT INTO `sys_logininfor` VALUES ('490', 'admin', '117.136.89.77', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-02 17:43:57');
INSERT INTO `sys_logininfor` VALUES ('491', 'admin', '117.136.89.77', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:44:06');
INSERT INTO `sys_logininfor` VALUES ('492', 'admin', '218.104.146.109', '湖南 长沙', 'Firefox', 'Windows 10', '0', '登录成功', '2019-06-02 17:44:18');
INSERT INTO `sys_logininfor` VALUES ('493', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 17:56:54');
INSERT INTO `sys_logininfor` VALUES ('494', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-02 18:02:39');
INSERT INTO `sys_logininfor` VALUES ('495', 'admin', '223.104.21.38', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-09 17:07:00');
INSERT INTO `sys_logininfor` VALUES ('496', 'zb', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-10 19:57:46');
INSERT INTO `sys_logininfor` VALUES ('497', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-12 15:50:54');
INSERT INTO `sys_logininfor` VALUES ('498', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-12 15:51:13');
INSERT INTO `sys_logininfor` VALUES ('499', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-12 16:09:29');
INSERT INTO `sys_logininfor` VALUES ('500', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-12 16:10:01');
INSERT INTO `sys_logininfor` VALUES ('501', 'admin', '119.39.127.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-13 17:39:09');
INSERT INTO `sys_logininfor` VALUES ('502', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-17 18:38:54');
INSERT INTO `sys_logininfor` VALUES ('503', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 21:36:54');
INSERT INTO `sys_logininfor` VALUES ('504', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 21:47:22');
INSERT INTO `sys_logininfor` VALUES ('505', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 21:52:53');
INSERT INTO `sys_logininfor` VALUES ('506', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 21:56:04');
INSERT INTO `sys_logininfor` VALUES ('507', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 22:08:24');
INSERT INTO `sys_logininfor` VALUES ('508', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 22:20:44');
INSERT INTO `sys_logininfor` VALUES ('509', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 22:29:09');
INSERT INTO `sys_logininfor` VALUES ('510', 'zb', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 22:36:19');
INSERT INTO `sys_logininfor` VALUES ('511', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 22:39:52');
INSERT INTO `sys_logininfor` VALUES ('512', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-18 23:00:56');
INSERT INTO `sys_logininfor` VALUES ('513', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:00:59');
INSERT INTO `sys_logininfor` VALUES ('514', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:11:23');
INSERT INTO `sys_logininfor` VALUES ('515', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:19:36');
INSERT INTO `sys_logininfor` VALUES ('516', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:21:01');
INSERT INTO `sys_logininfor` VALUES ('517', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-18 23:22:14');
INSERT INTO `sys_logininfor` VALUES ('518', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-18 23:22:18');
INSERT INTO `sys_logininfor` VALUES ('519', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:22:22');
INSERT INTO `sys_logininfor` VALUES ('520', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:24:11');
INSERT INTO `sys_logininfor` VALUES ('521', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:24:55');
INSERT INTO `sys_logininfor` VALUES ('522', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-18 23:52:59');
INSERT INTO `sys_logininfor` VALUES ('523', 'admin', '43.250.201.113', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 00:23:39');
INSERT INTO `sys_logininfor` VALUES ('524', 'admin', '220.202.152.32', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 15:11:05');
INSERT INTO `sys_logininfor` VALUES ('525', 'admin', '220.202.152.32', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 15:11:05');
INSERT INTO `sys_logininfor` VALUES ('526', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 16:30:52');
INSERT INTO `sys_logininfor` VALUES ('527', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 17:28:51');
INSERT INTO `sys_logininfor` VALUES ('528', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 17:35:26');
INSERT INTO `sys_logininfor` VALUES ('529', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 17:49:46');
INSERT INTO `sys_logininfor` VALUES ('530', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 19:40:38');
INSERT INTO `sys_logininfor` VALUES ('531', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 20:29:47');
INSERT INTO `sys_logininfor` VALUES ('532', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 20:36:49');
INSERT INTO `sys_logininfor` VALUES ('533', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 20:41:34');
INSERT INTO `sys_logininfor` VALUES ('534', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 21:00:05');
INSERT INTO `sys_logininfor` VALUES ('535', 'admin', '36.157.198.246', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-19 23:11:46');
INSERT INTO `sys_logininfor` VALUES ('536', 'admin', '36.157.198.246', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-20 03:05:30');
INSERT INTO `sys_logininfor` VALUES ('537', 'admin', '36.157.198.246', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-20 03:30:23');
INSERT INTO `sys_logininfor` VALUES ('538', 'admin', '36.157.198.246', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-20 03:46:03');
INSERT INTO `sys_logininfor` VALUES ('539', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 11:26:06');
INSERT INTO `sys_logininfor` VALUES ('540', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 11:45:19');
INSERT INTO `sys_logininfor` VALUES ('541', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 11:53:26');
INSERT INTO `sys_logininfor` VALUES ('542', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 11:54:26');
INSERT INTO `sys_logininfor` VALUES ('543', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 11:54:35');
INSERT INTO `sys_logininfor` VALUES ('544', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 11:57:33');
INSERT INTO `sys_logininfor` VALUES ('545', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 12:19:50');
INSERT INTO `sys_logininfor` VALUES ('546', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 12:49:28');
INSERT INTO `sys_logininfor` VALUES ('547', 'admin', '117.136.89.117', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-06-25 12:53:55');
INSERT INTO `sys_logininfor` VALUES ('548', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 12:57:46');
INSERT INTO `sys_logininfor` VALUES ('549', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 13:00:09');
INSERT INTO `sys_logininfor` VALUES ('550', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 13:01:21');
INSERT INTO `sys_logininfor` VALUES ('551', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 13:02:35');
INSERT INTO `sys_logininfor` VALUES ('552', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 13:07:00');
INSERT INTO `sys_logininfor` VALUES ('553', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:00:37');
INSERT INTO `sys_logininfor` VALUES ('554', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 14:34:16');
INSERT INTO `sys_logininfor` VALUES ('555', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:34:19');
INSERT INTO `sys_logininfor` VALUES ('556', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:40:12');
INSERT INTO `sys_logininfor` VALUES ('557', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 14:42:10');
INSERT INTO `sys_logininfor` VALUES ('558', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:42:13');
INSERT INTO `sys_logininfor` VALUES ('559', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:43:22');
INSERT INTO `sys_logininfor` VALUES ('560', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:44:44');
INSERT INTO `sys_logininfor` VALUES ('561', 'admin', '117.136.89.117', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:46:53');
INSERT INTO `sys_logininfor` VALUES ('562', 'admin', '117.136.89.117', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:48:51');
INSERT INTO `sys_logininfor` VALUES ('563', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 14:51:04');
INSERT INTO `sys_logininfor` VALUES ('564', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 16:03:55');
INSERT INTO `sys_logininfor` VALUES ('565', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 14:53:31');
INSERT INTO `sys_logininfor` VALUES ('566', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 16:52:32');
INSERT INTO `sys_logininfor` VALUES ('567', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 17:59:29');
INSERT INTO `sys_logininfor` VALUES ('568', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 18:16:38');
INSERT INTO `sys_logininfor` VALUES ('569', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 18:18:14');
INSERT INTO `sys_logininfor` VALUES ('570', 'admin', '192.168.43.132', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 18:25:29');
INSERT INTO `sys_logininfor` VALUES ('571', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 20:37:23');
INSERT INTO `sys_logininfor` VALUES ('572', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 20:59:37');
INSERT INTO `sys_logininfor` VALUES ('573', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-28 18:52:21');
INSERT INTO `sys_logininfor` VALUES ('574', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-28 18:52:25');
INSERT INTO `sys_logininfor` VALUES ('575', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-28 18:52:30');
INSERT INTO `sys_logininfor` VALUES ('576', 'admin', '110.52.210.78', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 18:52:33');
INSERT INTO `sys_logininfor` VALUES ('577', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-30 16:22:00');
INSERT INTO `sys_logininfor` VALUES ('578', 'admin', '43.250.201.5', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-30 16:41:13');
INSERT INTO `sys_logininfor` VALUES ('579', 'admin', '43.250.201.5', 'XX XX', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-06-30 16:53:55');
INSERT INTO `sys_logininfor` VALUES ('580', 'admin', '43.250.201.5', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-06-30 16:54:43');
INSERT INTO `sys_logininfor` VALUES ('581', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-30 17:00:04');
INSERT INTO `sys_logininfor` VALUES ('582', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-30 17:00:19');
INSERT INTO `sys_logininfor` VALUES ('583', 'admin', '117.136.88.23', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-30 17:00:51');
INSERT INTO `sys_logininfor` VALUES ('584', 'admin', '117.136.88.28', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 14:34:18');
INSERT INTO `sys_logininfor` VALUES ('585', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 15:49:50');
INSERT INTO `sys_logininfor` VALUES ('586', 'admin', '119.39.127.107', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 16:25:02');
INSERT INTO `sys_logininfor` VALUES ('587', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 16:25:34');
INSERT INTO `sys_logininfor` VALUES ('588', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 16:31:58');
INSERT INTO `sys_logininfor` VALUES ('589', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 16:36:33');
INSERT INTO `sys_logininfor` VALUES ('590', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-07 16:36:25');
INSERT INTO `sys_logininfor` VALUES ('591', 'admin', '222.240.147.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-28 10:21:04');
INSERT INTO `sys_logininfor` VALUES ('592', 'admin', '117.136.89.94', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-28 16:57:00');
INSERT INTO `sys_logininfor` VALUES ('593', 'admin', '117.136.89.127', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-07-28 23:23:15');
INSERT INTO `sys_logininfor` VALUES ('594', 'admin', '117.136.89.127', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-28 23:24:07');
INSERT INTO `sys_logininfor` VALUES ('595', 'admin', '117.136.89.127', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-28 23:48:06');
INSERT INTO `sys_logininfor` VALUES ('596', 'admin', '117.136.89.127', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-07-28 23:48:06');
INSERT INTO `sys_logininfor` VALUES ('597', 'admin', '117.136.89.127', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 12:53:40');
INSERT INTO `sys_logininfor` VALUES ('598', 'admin', '117.136.89.127', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-07-29 13:22:26');
INSERT INTO `sys_logininfor` VALUES ('599', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-07-29 15:15:08');
INSERT INTO `sys_logininfor` VALUES ('600', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-07-29 15:15:11');
INSERT INTO `sys_logininfor` VALUES ('601', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 15:15:17');
INSERT INTO `sys_logininfor` VALUES ('602', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 15:21:39');
INSERT INTO `sys_logininfor` VALUES ('603', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 16:20:31');
INSERT INTO `sys_logininfor` VALUES ('604', 'admin', '117.136.89.127', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-07-29 17:02:07');
INSERT INTO `sys_logininfor` VALUES ('605', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 20:33:44');
INSERT INTO `sys_logininfor` VALUES ('606', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 20:36:31');
INSERT INTO `sys_logininfor` VALUES ('607', 'admin', '111.22.118.47', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 20:43:44');
INSERT INTO `sys_logininfor` VALUES ('608', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-29 22:35:12');
INSERT INTO `sys_logininfor` VALUES ('609', 'admin', '117.136.89.71', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 11:57:05');
INSERT INTO `sys_logininfor` VALUES ('610', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:37:48');
INSERT INTO `sys_logininfor` VALUES ('611', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:39:18');
INSERT INTO `sys_logininfor` VALUES ('612', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:48:48');
INSERT INTO `sys_logininfor` VALUES ('613', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:50:47');
INSERT INTO `sys_logininfor` VALUES ('614', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:55:04');
INSERT INTO `sys_logininfor` VALUES ('615', 'admin', '43.250.201.8', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-07-30 14:55:35');
INSERT INTO `sys_logininfor` VALUES ('616', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 14:56:03');
INSERT INTO `sys_logininfor` VALUES ('617', 'admin', '43.250.201.8', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 15:01:51');
INSERT INTO `sys_logininfor` VALUES ('618', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 16:34:53');
INSERT INTO `sys_logininfor` VALUES ('619', 'admin', '43.250.201.8', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 17:21:44');
INSERT INTO `sys_logininfor` VALUES ('620', 'admin', '43.250.201.8', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 17:28:02');
INSERT INTO `sys_logininfor` VALUES ('621', 'admin', '43.250.201.8', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-30 17:47:05');
INSERT INTO `sys_logininfor` VALUES ('622', 'admin', '43.250.201.111', '湖南 长沙', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-07-31 23:30:43');
INSERT INTO `sys_logininfor` VALUES ('623', 'admin', '43.250.201.111', '湖南 长沙', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-07-31 23:30:46');
INSERT INTO `sys_logininfor` VALUES ('624', 'admin', '117.136.89.108', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-31 23:35:45');
INSERT INTO `sys_logininfor` VALUES ('625', 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-08-01 00:28:50');
INSERT INTO `sys_logininfor` VALUES ('626', 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-08-01 00:30:30');
INSERT INTO `sys_logininfor` VALUES ('627', 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-08-01 00:35:33');
INSERT INTO `sys_logininfor` VALUES ('628', 'admin', '223.104.21.30', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 08:57:13');
INSERT INTO `sys_logininfor` VALUES ('629', 'admin', '223.104.21.30', 'XX XX', 'Safari', 'Windows 7', '0', '登录成功', '2019-08-01 09:11:04');
INSERT INTO `sys_logininfor` VALUES ('630', 'admin', '119.39.248.106', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:27:22');
INSERT INTO `sys_logininfor` VALUES ('631', 'admin', '119.39.248.106', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:29:34');
INSERT INTO `sys_logininfor` VALUES ('632', 'admin', '119.39.248.106', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:35:22');
INSERT INTO `sys_logininfor` VALUES ('633', 'admin', '119.39.248.106', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:47:37');
INSERT INTO `sys_logininfor` VALUES ('634', 'admin', '220.202.152.87', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:49:21');
INSERT INTO `sys_logininfor` VALUES ('635', 'admin', '220.202.152.87', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 09:59:14');
INSERT INTO `sys_logininfor` VALUES ('636', 'admin', '220.202.152.87', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-01 10:01:40');
INSERT INTO `sys_logininfor` VALUES ('637', 'admin', '117.136.89.100', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-15 14:48:09');
INSERT INTO `sys_logininfor` VALUES ('638', 'admin', '117.136.89.100', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-15 15:30:43');
INSERT INTO `sys_logininfor` VALUES ('639', 'admin', '223.104.21.61', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-15 19:02:51');
INSERT INTO `sys_logininfor` VALUES ('640', 'admin', '117.136.88.22', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-16 12:38:51');
INSERT INTO `sys_logininfor` VALUES ('641', 'admin', '223.104.21.56', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-17 13:09:48');
INSERT INTO `sys_logininfor` VALUES ('642', 'admin', '223.104.21.56', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-17 13:25:25');
INSERT INTO `sys_logininfor` VALUES ('643', 'admin', '223.104.21.56', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-17 14:24:03');
INSERT INTO `sys_logininfor` VALUES ('644', 'admin', '117.136.88.19', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-17 19:10:04');
INSERT INTO `sys_logininfor` VALUES ('645', 'admin', '117.136.88.19', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-17 19:12:13');
INSERT INTO `sys_logininfor` VALUES ('646', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 15:05:17');
INSERT INTO `sys_logininfor` VALUES ('647', 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-08-18 15:05:56');
INSERT INTO `sys_logininfor` VALUES ('648', 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-08-18 15:19:20');
INSERT INTO `sys_logininfor` VALUES ('649', 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-08-18 15:25:30');
INSERT INTO `sys_logininfor` VALUES ('650', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-18 15:36:04');
INSERT INTO `sys_logininfor` VALUES ('651', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 15:36:13');
INSERT INTO `sys_logininfor` VALUES ('652', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 15:47:37');
INSERT INTO `sys_logininfor` VALUES ('653', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 16:46:54');
INSERT INTO `sys_logininfor` VALUES ('654', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 16:48:11');
INSERT INTO `sys_logininfor` VALUES ('655', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 16:54:57');
INSERT INTO `sys_logininfor` VALUES ('656', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 18:08:16');
INSERT INTO `sys_logininfor` VALUES ('657', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 18:19:48');
INSERT INTO `sys_logininfor` VALUES ('658', 'admin', '223.104.21.53', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-18 19:31:41');
INSERT INTO `sys_logininfor` VALUES ('659', 'admin', '43.250.201.86', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-19 15:46:01');
INSERT INTO `sys_logininfor` VALUES ('660', 'admin', '43.250.201.86', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-19 16:00:22');
INSERT INTO `sys_logininfor` VALUES ('661', 'admin', '43.250.201.86', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-19 16:00:24');
INSERT INTO `sys_logininfor` VALUES ('662', 'admin', '43.250.201.86', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-19 16:04:05');
INSERT INTO `sys_logininfor` VALUES ('663', 'admin', '43.250.201.86', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-19 16:25:29');
INSERT INTO `sys_logininfor` VALUES ('664', 'admin', '43.250.201.86', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-19 16:27:49');
INSERT INTO `sys_logininfor` VALUES ('665', 'admin', '117.136.88.16', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 09:46:55');
INSERT INTO `sys_logininfor` VALUES ('666', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 10:24:05');
INSERT INTO `sys_logininfor` VALUES ('667', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 14:45:08');
INSERT INTO `sys_logininfor` VALUES ('668', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 14:46:11');
INSERT INTO `sys_logininfor` VALUES ('669', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 14:48:45');
INSERT INTO `sys_logininfor` VALUES ('670', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 14:52:37');
INSERT INTO `sys_logininfor` VALUES ('671', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 15:04:05');
INSERT INTO `sys_logininfor` VALUES ('672', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 15:04:07');
INSERT INTO `sys_logininfor` VALUES ('673', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 15:07:28');
INSERT INTO `sys_logininfor` VALUES ('674', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 15:09:13');
INSERT INTO `sys_logininfor` VALUES ('675', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 15:56:33');
INSERT INTO `sys_logininfor` VALUES ('676', 'admin', '220.202.152.88', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 16:35:59');
INSERT INTO `sys_logininfor` VALUES ('677', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-20 16:38:39');
INSERT INTO `sys_logininfor` VALUES ('678', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 16:38:44');
INSERT INTO `sys_logininfor` VALUES ('679', 'admin', '220.202.152.88', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 17:57:26');
INSERT INTO `sys_logininfor` VALUES ('680', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 18:01:54');
INSERT INTO `sys_logininfor` VALUES ('681', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-20 18:17:40');
INSERT INTO `sys_logininfor` VALUES ('682', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 18:17:42');
INSERT INTO `sys_logininfor` VALUES ('683', 'admin', '117.136.88.16', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 18:44:46');
INSERT INTO `sys_logininfor` VALUES ('684', 'admin', '220.202.152.88', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 18:45:05');
INSERT INTO `sys_logininfor` VALUES ('685', 'admin', '220.202.152.88', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-20 18:51:40');
INSERT INTO `sys_logininfor` VALUES ('686', 'admin', '117.136.64.110', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-21 18:15:25');
INSERT INTO `sys_logininfor` VALUES ('687', 'admin', '117.136.64.110', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-21 18:18:11');
INSERT INTO `sys_logininfor` VALUES ('688', 'admin', '117.136.64.110', '四川 成都', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-21 18:24:32');
INSERT INTO `sys_logininfor` VALUES ('689', 'admin', '117.136.64.110', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-21 18:24:35');
INSERT INTO `sys_logininfor` VALUES ('690', 'admin', '223.129.4.94', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:03:56');
INSERT INTO `sys_logininfor` VALUES ('691', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:09:26');
INSERT INTO `sys_logininfor` VALUES ('692', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:13:28');
INSERT INTO `sys_logininfor` VALUES ('693', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-22 10:14:17');
INSERT INTO `sys_logininfor` VALUES ('694', 'admin', '223.129.4.94', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:14:23');
INSERT INTO `sys_logininfor` VALUES ('695', 'admin', '223.129.4.94', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 11:26:27');
INSERT INTO `sys_logininfor` VALUES ('696', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 12:28:33');
INSERT INTO `sys_logininfor` VALUES ('697', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 12:36:53');
INSERT INTO `sys_logininfor` VALUES ('698', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 12:40:26');
INSERT INTO `sys_logininfor` VALUES ('699', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 13:44:06');
INSERT INTO `sys_logininfor` VALUES ('700', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 13:48:22');
INSERT INTO `sys_logininfor` VALUES ('701', 'admin', '223.129.4.94', '四川 成都', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 13:51:53');
INSERT INTO `sys_logininfor` VALUES ('702', 'admin', '223.129.4.94', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 13:56:13');
INSERT INTO `sys_logininfor` VALUES ('703', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:40:48');
INSERT INTO `sys_logininfor` VALUES ('704', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:41:57');
INSERT INTO `sys_logininfor` VALUES ('705', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-03 12:53:00');
INSERT INTO `sys_logininfor` VALUES ('706', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-03 12:54:02');
INSERT INTO `sys_logininfor` VALUES ('707', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-05 14:49:27');
INSERT INTO `sys_logininfor` VALUES ('708', 'admin', '117.136.89.90', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-05 14:59:34');
INSERT INTO `sys_logininfor` VALUES ('709', 'admin', '117.136.89.90', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-05 15:37:49');
INSERT INTO `sys_logininfor` VALUES ('710', 'admin', '117.136.89.90', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-05 15:42:52');
INSERT INTO `sys_logininfor` VALUES ('711', 'admin', '117.136.89.90', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-05 15:42:55');
INSERT INTO `sys_logininfor` VALUES ('712', 'admin', '117.136.89.90', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-05 15:46:54');
INSERT INTO `sys_logininfor` VALUES ('713', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-08 13:32:10');
INSERT INTO `sys_logininfor` VALUES ('714', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-08 13:36:59');
INSERT INTO `sys_logininfor` VALUES ('715', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-08 13:45:39');
INSERT INTO `sys_logininfor` VALUES ('716', 'admin', '117.136.88.61', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-08 13:54:29');
INSERT INTO `sys_logininfor` VALUES ('717', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-08 13:56:32');
INSERT INTO `sys_logininfor` VALUES ('718', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 09:35:48');
INSERT INTO `sys_logininfor` VALUES ('719', 'admin', '106.19.205.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 10:00:06');
INSERT INTO `sys_logininfor` VALUES ('720', 'admin', '106.19.205.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 10:03:22');
INSERT INTO `sys_logininfor` VALUES ('721', 'admin', '106.19.205.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 10:07:16');
INSERT INTO `sys_logininfor` VALUES ('722', 'admin', '106.19.205.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 10:31:11');
INSERT INTO `sys_logininfor` VALUES ('723', 'admin', '106.19.205.5', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 10:40:28');
INSERT INTO `sys_logininfor` VALUES ('724', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 13:27:22');
INSERT INTO `sys_logininfor` VALUES ('725', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 13:29:23');
INSERT INTO `sys_logininfor` VALUES ('726', 'admin', '223.104.131.212', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 14:44:12');
INSERT INTO `sys_logininfor` VALUES ('727', 'admin', '223.104.131.212', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 15:12:50');
INSERT INTO `sys_logininfor` VALUES ('728', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 22:10:39');
INSERT INTO `sys_logininfor` VALUES ('729', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:14:29');
INSERT INTO `sys_logininfor` VALUES ('730', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:17:57');
INSERT INTO `sys_logininfor` VALUES ('731', 'admin', '113.218.52.231', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:24:50');
INSERT INTO `sys_logininfor` VALUES ('732', 'admin', '113.218.52.231', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:31:39');
INSERT INTO `sys_logininfor` VALUES ('733', 'admin', '113.218.52.231', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:32:38');
INSERT INTO `sys_logininfor` VALUES ('734', 'admin', '113.218.52.231', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:35:28');
INSERT INTO `sys_logininfor` VALUES ('735', 'admin', '113.218.52.231', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 12:40:37');
INSERT INTO `sys_logininfor` VALUES ('736', 'admin', '106.17.216.179', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 18:56:25');
INSERT INTO `sys_logininfor` VALUES ('737', 'admin', '106.17.216.179', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-29 19:43:12');
INSERT INTO `sys_logininfor` VALUES ('738', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:18:55');
INSERT INTO `sys_logininfor` VALUES ('739', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 13:33:56');
INSERT INTO `sys_logininfor` VALUES ('740', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 14:32:41');
INSERT INTO `sys_logininfor` VALUES ('741', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-13 14:37:01');
INSERT INTO `sys_logininfor` VALUES ('742', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 14:37:04');
INSERT INTO `sys_logininfor` VALUES ('743', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 15:39:27');
INSERT INTO `sys_logininfor` VALUES ('744', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-13 15:58:34');
INSERT INTO `sys_logininfor` VALUES ('745', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 15:58:40');
INSERT INTO `sys_logininfor` VALUES ('746', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 16:02:20');
INSERT INTO `sys_logininfor` VALUES ('747', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-13 16:20:37');
INSERT INTO `sys_logininfor` VALUES ('748', 'admin', '43.250.200.110', '湖南 长沙', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-10-14 08:34:56');
INSERT INTO `sys_logininfor` VALUES ('749', 'admin', '43.250.200.110', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 08:41:08');
INSERT INTO `sys_logininfor` VALUES ('750', 'admin', '43.250.200.110', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 09:03:59');
INSERT INTO `sys_logininfor` VALUES ('751', 'admin', '43.250.200.110', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 09:12:08');
INSERT INTO `sys_logininfor` VALUES ('752', 'admin', '43.250.200.110', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 09:13:55');
INSERT INTO `sys_logininfor` VALUES ('753', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:07:36');
INSERT INTO `sys_logininfor` VALUES ('754', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:12:44');
INSERT INTO `sys_logininfor` VALUES ('755', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:24:15');
INSERT INTO `sys_logininfor` VALUES ('756', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-17 15:33:51');
INSERT INTO `sys_logininfor` VALUES ('757', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:33:55');
INSERT INTO `sys_logininfor` VALUES ('758', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:43:31');
INSERT INTO `sys_logininfor` VALUES ('759', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:45:51');
INSERT INTO `sys_logininfor` VALUES ('760', 'admin', '113.218.40.134', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:49:09');
INSERT INTO `sys_logininfor` VALUES ('761', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-20 15:50:36');
INSERT INTO `sys_logininfor` VALUES ('762', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-20 15:57:19');
INSERT INTO `sys_logininfor` VALUES ('763', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-20 15:57:22');
INSERT INTO `sys_logininfor` VALUES ('764', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-20 16:00:59');
INSERT INTO `sys_logininfor` VALUES ('765', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-20 16:01:02');
INSERT INTO `sys_logininfor` VALUES ('766', 'admin', '106.19.169.157', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-20 16:06:16');
INSERT INTO `sys_logininfor` VALUES ('767', 'admin', '218.104.146.106', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-10-25 13:44:06');
INSERT INTO `sys_logininfor` VALUES ('768', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-25 16:26:49');
INSERT INTO `sys_logininfor` VALUES ('769', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-26 15:05:53');
INSERT INTO `sys_logininfor` VALUES ('770', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-26 15:12:15');
INSERT INTO `sys_logininfor` VALUES ('771', 'admin', '218.104.146.106', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-10-26 19:30:50');
INSERT INTO `sys_logininfor` VALUES ('772', 'admin', '43.250.201.19', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-27 17:12:56');
INSERT INTO `sys_logininfor` VALUES ('773', 'admin', '106.18.145.1', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-01 14:53:10');
INSERT INTO `sys_logininfor` VALUES ('774', 'admin', '106.18.145.1', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-01 15:37:28');
INSERT INTO `sys_logininfor` VALUES ('775', 'admin', '106.18.145.1', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-01 15:42:41');
INSERT INTO `sys_logininfor` VALUES ('776', 'admin', '106.18.145.1', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-01 15:42:47');
INSERT INTO `sys_logininfor` VALUES ('777', 'admin', '222.240.147.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-02 12:55:30');
INSERT INTO `sys_logininfor` VALUES ('778', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-02 13:00:17');
INSERT INTO `sys_logininfor` VALUES ('779', 'admin', '222.240.147.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-02 13:10:51');
INSERT INTO `sys_logininfor` VALUES ('780', 'admin', '222.240.147.5', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-02 13:25:58');
INSERT INTO `sys_logininfor` VALUES ('781', 'admin', '106.17.249.43', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-03 11:40:29');
INSERT INTO `sys_logininfor` VALUES ('782', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-06 12:13:19');
INSERT INTO `sys_logininfor` VALUES ('783', 'admin', '106.19.4.11', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-06 18:07:16');
INSERT INTO `sys_logininfor` VALUES ('784', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 16:08:01');
INSERT INTO `sys_logininfor` VALUES ('785', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 16:11:55');
INSERT INTO `sys_logininfor` VALUES ('786', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 16:31:17');
INSERT INTO `sys_logininfor` VALUES ('787', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 16:42:24');
INSERT INTO `sys_logininfor` VALUES ('788', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 17:13:18');
INSERT INTO `sys_logininfor` VALUES ('789', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 17:28:45');
INSERT INTO `sys_logininfor` VALUES ('790', 'admin', '110.52.210.78', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-08 18:05:17');
INSERT INTO `sys_logininfor` VALUES ('791', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 10:48:31');
INSERT INTO `sys_logininfor` VALUES ('792', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 11:01:20');
INSERT INTO `sys_logininfor` VALUES ('793', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 11:35:14');
INSERT INTO `sys_logininfor` VALUES ('794', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 11:47:02');
INSERT INTO `sys_logininfor` VALUES ('795', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 12:03:25');
INSERT INTO `sys_logininfor` VALUES ('796', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 13:24:12');
INSERT INTO `sys_logininfor` VALUES ('797', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 14:09:41');
INSERT INTO `sys_logininfor` VALUES ('798', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 14:13:21');
INSERT INTO `sys_logininfor` VALUES ('799', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 14:16:21');
INSERT INTO `sys_logininfor` VALUES ('800', 'admin', '43.250.201.111', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 15:57:43');
INSERT INTO `sys_logininfor` VALUES ('801', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 19:36:50');
INSERT INTO `sys_logininfor` VALUES ('802', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-10 19:58:32');
INSERT INTO `sys_logininfor` VALUES ('803', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 15:00:46');
INSERT INTO `sys_logininfor` VALUES ('804', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 15:26:14');
INSERT INTO `sys_logininfor` VALUES ('805', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 15:27:28');
INSERT INTO `sys_logininfor` VALUES ('806', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 15:36:50');
INSERT INTO `sys_logininfor` VALUES ('807', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 15:47:31');
INSERT INTO `sys_logininfor` VALUES ('808', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-11 16:20:14');
INSERT INTO `sys_logininfor` VALUES ('809', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-11-14 16:52:16');
INSERT INTO `sys_logininfor` VALUES ('810', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-15 14:04:48');
INSERT INTO `sys_logininfor` VALUES ('811', 'admin', '119.39.127.109', '湖南 长沙', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-11-15 14:09:13');
INSERT INTO `sys_logininfor` VALUES ('812', 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-11-15 14:47:39');
INSERT INTO `sys_logininfor` VALUES ('813', 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-11-15 14:56:29');
INSERT INTO `sys_logininfor` VALUES ('814', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-15 15:41:03');
INSERT INTO `sys_logininfor` VALUES ('815', 'admin', '119.39.127.109', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-15 15:45:03');
INSERT INTO `sys_logininfor` VALUES ('816', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-11-15 15:45:08');
INSERT INTO `sys_logininfor` VALUES ('817', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-15 15:45:11');
INSERT INTO `sys_logininfor` VALUES ('818', 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-11-15 15:48:05');
INSERT INTO `sys_logininfor` VALUES ('819', 'admin', '119.39.127.109', '湖南 长沙', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-11-15 15:54:20');
INSERT INTO `sys_logininfor` VALUES ('820', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-15 17:06:23');
INSERT INTO `sys_logininfor` VALUES ('821', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-15 17:34:08');
INSERT INTO `sys_logininfor` VALUES ('822', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 10:32:00');
INSERT INTO `sys_logininfor` VALUES ('823', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:03:00');
INSERT INTO `sys_logininfor` VALUES ('824', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:18:25');
INSERT INTO `sys_logininfor` VALUES ('825', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:21:32');
INSERT INTO `sys_logininfor` VALUES ('826', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:33:02');
INSERT INTO `sys_logininfor` VALUES ('827', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:56:06');
INSERT INTO `sys_logininfor` VALUES ('828', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 16:59:02');
INSERT INTO `sys_logininfor` VALUES ('829', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 17:03:06');
INSERT INTO `sys_logininfor` VALUES ('830', 'admin', '106.17.228.83', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-17 17:15:48');
INSERT INTO `sys_logininfor` VALUES ('831', 'admin', '106.18.114.98', '湖南 衡阳', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 10:40:08');
INSERT INTO `sys_logininfor` VALUES ('832', 'admin', '106.18.114.98', '湖南 衡阳', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 10:42:13');
INSERT INTO `sys_logininfor` VALUES ('833', 'admin', '106.18.114.98', '湖南 衡阳', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 11:23:07');
INSERT INTO `sys_logininfor` VALUES ('834', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 11:58:23');
INSERT INTO `sys_logininfor` VALUES ('835', 'admin', '119.39.127.109', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 12:42:38');
INSERT INTO `sys_logininfor` VALUES ('836', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 12:57:08');
INSERT INTO `sys_logininfor` VALUES ('837', 'admin', '106.18.114.98', '湖南 衡阳', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 14:17:42');
INSERT INTO `sys_logininfor` VALUES ('838', 'admin', '106.18.114.98', '湖南 衡阳', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-19 14:21:23');
INSERT INTO `sys_logininfor` VALUES ('839', 'admin', '119.39.127.108', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-11-21 17:51:16');
INSERT INTO `sys_logininfor` VALUES ('840', 'admin', '119.39.127.107', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-11-27 14:47:28');
INSERT INTO `sys_logininfor` VALUES ('841', 'admin', '119.39.127.107', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-11-27 14:47:35');
INSERT INTO `sys_logininfor` VALUES ('842', 'admin', '119.39.127.107', '湖南 长沙', 'Microsoft Edge', 'Windows 10', '1', '验证码错误', '2019-11-27 14:47:56');
INSERT INTO `sys_logininfor` VALUES ('843', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-11 16:50:07');
INSERT INTO `sys_logininfor` VALUES ('844', 'admin', '110.52.210.78', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-12 17:44:16');
INSERT INTO `sys_logininfor` VALUES ('845', 'admin', '43.250.200.103', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-17 15:18:23');
INSERT INTO `sys_logininfor` VALUES ('846', 'admin', '218.104.146.101', '湖南 长沙', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-01-05 15:25:00');
INSERT INTO `sys_logininfor` VALUES ('847', 'admin', '218.104.146.101', '湖南 长沙', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-05 15:25:03');
INSERT INTO `sys_logininfor` VALUES ('848', 'admin', '120.228.190.4', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:10:32');
INSERT INTO `sys_logininfor` VALUES ('849', 'admin', '120.228.190.4', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:16:25');
INSERT INTO `sys_logininfor` VALUES ('850', 'admin', '120.228.190.4', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:18:47');
INSERT INTO `sys_logininfor` VALUES ('851', 'admin', '120.228.190.4', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:21:05');
INSERT INTO `sys_logininfor` VALUES ('852', 'admin', '120.228.190.4', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:22:25');
INSERT INTO `sys_logininfor` VALUES ('853', 'admin', '120.228.190.4', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:32:36');
INSERT INTO `sys_logininfor` VALUES ('854', 'admin', '120.228.190.4', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-01-26 19:34:35');
INSERT INTO `sys_logininfor` VALUES ('855', 'admin', '120.228.190.163', '湖南 常德', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-05 15:05:30');
INSERT INTO `sys_logininfor` VALUES ('856', 'admin', '120.228.100.91', '湖南 XX', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-25 21:47:48');
INSERT INTO `sys_logininfor` VALUES ('857', 'admin', '120.228.100.91', '湖南 XX', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-25 22:01:30');
INSERT INTO `sys_logininfor` VALUES ('858', 'admin', '120.228.102.43', '湖南 XX', 'Chrome', 'Windows 10', '0', '登录成功', '2020-02-26 20:28:08');
INSERT INTO `sys_logininfor` VALUES ('859', 'admin', '120.228.102.43', '湖南 XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-02-27 21:19:37');
INSERT INTO `sys_logininfor` VALUES ('860', 'admin', '120.228.102.43', '湖南 XX', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-02-27 21:20:00');
INSERT INTO `sys_logininfor` VALUES ('861', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-14 15:21:53');
INSERT INTO `sys_logininfor` VALUES ('862', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-03-15 18:53:44');
INSERT INTO `sys_logininfor` VALUES ('863', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 19:09:44');
INSERT INTO `sys_logininfor` VALUES ('864', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 19:19:25');
INSERT INTO `sys_logininfor` VALUES ('865', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 20:32:57');
INSERT INTO `sys_logininfor` VALUES ('866', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 20:45:22');
INSERT INTO `sys_logininfor` VALUES ('867', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 20:47:44');
INSERT INTO `sys_logininfor` VALUES ('868', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 20:56:44');
INSERT INTO `sys_logininfor` VALUES ('869', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 21:02:47');
INSERT INTO `sys_logininfor` VALUES ('870', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 21:14:03');
INSERT INTO `sys_logininfor` VALUES ('871', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 21:30:52');
INSERT INTO `sys_logininfor` VALUES ('872', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-15 21:37:47');
INSERT INTO `sys_logininfor` VALUES ('873', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 09:46:33');
INSERT INTO `sys_logininfor` VALUES ('874', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 09:52:03');
INSERT INTO `sys_logininfor` VALUES ('875', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 10:11:32');
INSERT INTO `sys_logininfor` VALUES ('876', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 10:14:24');
INSERT INTO `sys_logininfor` VALUES ('877', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 15:59:28');
INSERT INTO `sys_logininfor` VALUES ('878', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-03-21 16:13:10');
INSERT INTO `sys_logininfor` VALUES ('879', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2020-03-21 16:13:15');
INSERT INTO `sys_logininfor` VALUES ('880', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2020-03-21 16:13:30');
INSERT INTO `sys_logininfor` VALUES ('881', '201840511315', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2020-03-21 16:13:42');
INSERT INTO `sys_logininfor` VALUES ('882', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2020-03-21 16:13:51');
INSERT INTO `sys_logininfor` VALUES ('883', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 16:15:43');
INSERT INTO `sys_logininfor` VALUES ('884', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 16:20:51');
INSERT INTO `sys_logininfor` VALUES ('885', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-21 16:28:04');
INSERT INTO `sys_logininfor` VALUES ('886', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-03-28 16:20:50');
INSERT INTO `sys_logininfor` VALUES ('887', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2020-03-28 16:21:03');
INSERT INTO `sys_logininfor` VALUES ('888', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2020-03-28 16:21:16');
INSERT INTO `sys_logininfor` VALUES ('889', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-28 16:21:31');
INSERT INTO `sys_logininfor` VALUES ('890', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-31 13:12:10');
INSERT INTO `sys_logininfor` VALUES ('891', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-31 21:48:08');
INSERT INTO `sys_logininfor` VALUES ('892', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-31 23:34:28');
INSERT INTO `sys_logininfor` VALUES ('893', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-31 23:37:02');
INSERT INTO `sys_logininfor` VALUES ('894', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-03-31 23:52:15');
INSERT INTO `sys_logininfor` VALUES ('895', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-03-31 23:52:19');
INSERT INTO `sys_logininfor` VALUES ('896', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 00:34:07');
INSERT INTO `sys_logininfor` VALUES ('897', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 08:48:13');
INSERT INTO `sys_logininfor` VALUES ('898', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 08:49:23');
INSERT INTO `sys_logininfor` VALUES ('899', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-01 09:02:49');
INSERT INTO `sys_logininfor` VALUES ('900', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:02:56');
INSERT INTO `sys_logininfor` VALUES ('901', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:04:03');
INSERT INTO `sys_logininfor` VALUES ('902', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:05:25');
INSERT INTO `sys_logininfor` VALUES ('903', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:09:41');
INSERT INTO `sys_logininfor` VALUES ('904', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:12:52');
INSERT INTO `sys_logininfor` VALUES ('905', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:25:32');
INSERT INTO `sys_logininfor` VALUES ('906', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:36:47');
INSERT INTO `sys_logininfor` VALUES ('907', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:39:20');
INSERT INTO `sys_logininfor` VALUES ('908', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-01 09:41:26');
INSERT INTO `sys_logininfor` VALUES ('909', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:41:35');
INSERT INTO `sys_logininfor` VALUES ('910', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-01 09:52:44');
INSERT INTO `sys_logininfor` VALUES ('911', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-04-05 10:12:24');
INSERT INTO `sys_logininfor` VALUES ('912', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2020-04-05 10:12:36');
INSERT INTO `sys_logininfor` VALUES ('913', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2020-04-05 10:12:42');
INSERT INTO `sys_logininfor` VALUES ('914', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2020-04-05 10:12:59');
INSERT INTO `sys_logininfor` VALUES ('915', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 10:13:17');
INSERT INTO `sys_logininfor` VALUES ('916', 'lxy', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 10:34:36');
INSERT INTO `sys_logininfor` VALUES ('917', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 14:27:11');
INSERT INTO `sys_logininfor` VALUES ('918', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 16:08:54');
INSERT INTO `sys_logininfor` VALUES ('919', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 16:52:28');
INSERT INTO `sys_logininfor` VALUES ('920', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 17:25:16');
INSERT INTO `sys_logininfor` VALUES ('921', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 17:33:58');
INSERT INTO `sys_logininfor` VALUES ('922', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 17:39:07');
INSERT INTO `sys_logininfor` VALUES ('923', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 17:56:04');
INSERT INTO `sys_logininfor` VALUES ('924', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 18:09:50');
INSERT INTO `sys_logininfor` VALUES ('925', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 18:30:13');
INSERT INTO `sys_logininfor` VALUES ('926', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 19:39:27');
INSERT INTO `sys_logininfor` VALUES ('927', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-05 20:56:10');
INSERT INTO `sys_logininfor` VALUES ('928', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 15:34:15');
INSERT INTO `sys_logininfor` VALUES ('929', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-11 16:39:38');
INSERT INTO `sys_logininfor` VALUES ('930', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 16:39:43');
INSERT INTO `sys_logininfor` VALUES ('931', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 20:26:51');
INSERT INTO `sys_logininfor` VALUES ('932', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 21:41:33');
INSERT INTO `sys_logininfor` VALUES ('933', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 21:44:32');
INSERT INTO `sys_logininfor` VALUES ('934', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 21:50:59');
INSERT INTO `sys_logininfor` VALUES ('935', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 21:57:23');
INSERT INTO `sys_logininfor` VALUES ('936', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 22:15:43');
INSERT INTO `sys_logininfor` VALUES ('937', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 22:18:44');
INSERT INTO `sys_logininfor` VALUES ('938', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 22:28:48');
INSERT INTO `sys_logininfor` VALUES ('939', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 22:34:16');
INSERT INTO `sys_logininfor` VALUES ('940', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 23:03:35');
INSERT INTO `sys_logininfor` VALUES ('941', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 23:11:56');
INSERT INTO `sys_logininfor` VALUES ('942', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 23:14:41');
INSERT INTO `sys_logininfor` VALUES ('943', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 23:24:54');
INSERT INTO `sys_logininfor` VALUES ('944', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-11 23:31:16');
INSERT INTO `sys_logininfor` VALUES ('945', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 09:30:43');
INSERT INTO `sys_logininfor` VALUES ('946', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 09:36:42');
INSERT INTO `sys_logininfor` VALUES ('947', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 09:54:36');
INSERT INTO `sys_logininfor` VALUES ('948', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 10:35:00');
INSERT INTO `sys_logininfor` VALUES ('949', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 10:36:47');
INSERT INTO `sys_logininfor` VALUES ('950', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 10:56:39');
INSERT INTO `sys_logininfor` VALUES ('951', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 12:58:38');
INSERT INTO `sys_logininfor` VALUES ('952', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-04-12 13:16:30');
INSERT INTO `sys_logininfor` VALUES ('953', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-12 13:16:34');
INSERT INTO `sys_logininfor` VALUES ('954', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2020-04-12 13:16:37');
INSERT INTO `sys_logininfor` VALUES ('955', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 13:16:53');
INSERT INTO `sys_logininfor` VALUES ('956', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 13:38:15');
INSERT INTO `sys_logininfor` VALUES ('957', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 14:08:13');
INSERT INTO `sys_logininfor` VALUES ('958', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 14:10:21');
INSERT INTO `sys_logininfor` VALUES ('959', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-12 14:32:48');
INSERT INTO `sys_logininfor` VALUES ('960', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-04-12 14:32:52');
INSERT INTO `sys_logininfor` VALUES ('961', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 14:32:59');
INSERT INTO `sys_logininfor` VALUES ('962', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 14:50:49');
INSERT INTO `sys_logininfor` VALUES ('963', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 15:11:06');
INSERT INTO `sys_logininfor` VALUES ('964', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 15:19:51');
INSERT INTO `sys_logininfor` VALUES ('965', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 15:29:42');
INSERT INTO `sys_logininfor` VALUES ('966', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 15:56:44');
INSERT INTO `sys_logininfor` VALUES ('967', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 16:28:27');
INSERT INTO `sys_logininfor` VALUES ('968', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 16:43:09');
INSERT INTO `sys_logininfor` VALUES ('969', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 16:51:19');
INSERT INTO `sys_logininfor` VALUES ('970', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-04-12 18:35:11');
INSERT INTO `sys_logininfor` VALUES ('971', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 18:35:20');
INSERT INTO `sys_logininfor` VALUES ('972', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-04-12 19:38:16');
INSERT INTO `sys_logininfor` VALUES ('973', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 19:38:28');
INSERT INTO `sys_logininfor` VALUES ('974', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 19:48:52');
INSERT INTO `sys_logininfor` VALUES ('975', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2020-04-12 20:28:40');
INSERT INTO `sys_logininfor` VALUES ('976', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-04-12 20:28:50');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2020 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '10', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-09 14:17:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '8', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-09 14:17:11', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '9', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-09 14:17:05', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '系统广播', '0', '9', '#', 'M', '0', '', 'fa fa-bullhorn', 'admin', null, 'admin', '2020-03-31 21:50:42', '');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '班级管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 09:37:53', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-20 19:12:01', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '业务模块', '0', '2', '#', 'M', '0', '', 'fa fa-moon-o', 'admin', '2019-04-09 14:16:16', 'admin', '2019-04-11 15:16:28', '');
INSERT INTO `sys_menu` VALUES ('2001', '远程控制', '2000', '1', '/service/motor', 'C', '0', 'service:motor:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '远程控制菜单');
INSERT INTO `sys_menu` VALUES ('2002', '远程控制查询', '2001', '1', '#', 'F', '0', 'service:motor:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2003', '远程控制新增', '2001', '2', '#', 'F', '0', 'service:motor:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2004', '远程控制修改', '2001', '3', '#', 'F', '0', 'service:motor:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2005', '远程控制删除', '2001', '4', '#', 'F', '0', 'service:motor:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2006', '传感器数据', '2000', '2', '/service/pigstyinfo', 'C', '1', 'service:pigstyinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-01 09:10:13', '传感器数据菜单');
INSERT INTO `sys_menu` VALUES ('2007', '传感器数据查询', '2006', '1', '#', 'F', '0', 'service:pigstyinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2008', '传感器数据新增', '2006', '2', '#', 'F', '0', 'service:pigstyinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2009', '传感器数据修改', '2006', '3', '#', 'F', '0', 'service:pigstyinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2010', '传感器数据删除', '2006', '4', '#', 'F', '0', 'service:pigstyinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2011', '控制中心', '0', '1', '#', 'M', '0', null, 'fa fa-bullseye', 'admin', '2019-04-09 18:44:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '教室监控', '2011', '1', '/operation/monitoring', 'C', '0', '', '#', 'admin', '2019-04-11 15:54:26', 'admin', '2019-05-07 16:28:42', '');
INSERT INTO `sys_menu` VALUES ('2013', '空调控制', '2011', '2', '/operation/dung', 'C', '0', '', '#', 'admin', '2019-04-11 15:54:46', 'admin', '2019-04-27 16:40:54', '');
INSERT INTO `sys_menu` VALUES ('2014', '风扇控制', '2011', '3', '/operation/facility', 'C', '0', '', '#', 'admin', '2019-04-11 15:55:24', 'admin', '2019-04-25 17:56:51', '');
INSERT INTO `sys_menu` VALUES ('2015', '窗帘控制', '2011', '4', '/operation/curtain', 'C', '0', '', '#', 'admin', '2019-04-11 15:58:39', 'admin', '2019-04-27 15:42:50', '');
INSERT INTO `sys_menu` VALUES ('2016', '终端', '4', '1', '/sbroad/domains', 'C', '0', 'sbroad:domains:view', '#', 'admin', '2020-03-31 23:37:54', 'admin', '2020-04-05 17:46:35', '');
INSERT INTO `sys_menu` VALUES ('2017', '班级管理', '4', '2', '/sbroad/class', 'C', '1', 'sbroad:class:view', '#', 'admin', '2020-04-01 00:35:17', 'admin', '2020-04-12 09:37:28', '');
INSERT INTO `sys_menu` VALUES ('2018', '广播控制', '4', '1', '#', 'M', '0', '', 'fa fa-cog', 'admin', '2020-04-05 14:28:05', 'admin', '2020-04-05 16:10:39', '');
INSERT INTO `sys_menu` VALUES ('2019', '终端控制', '2018', '1', '/system/domain', 'C', '0', 'system:domain:view', '#', 'admin', '2020-04-05 16:20:40', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-green\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '0', null, '2019-04-08 20:48:26');
INSERT INTO `sys_oper_log` VALUES ('101', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-red\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '0', null, '2019-04-08 20:48:59');
INSERT INTO `sys_oper_log` VALUES ('102', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '792324', '0', null, '2019-04-08 20:49:38');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"motor,pigstyinfo\" ]\r\n}', '0', null, '2019-04-09 13:13:21');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"motor,pigstyinfo\" ]\r\n}', '0', null, '2019-04-09 13:59:32');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"motor,pigstyinfo\" ]\r\n}', '0', null, '2019-04-09 14:07:58');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"motor,pigstyinfo\" ]\r\n}', '0', null, '2019-04-09 14:13:48');
INSERT INTO `sys_oper_log` VALUES ('107', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"屠郡\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"13099999999\" ],\r\n  \"email\" : [ \"tj@qq.com\" ],\r\n  \"loginName\" : [ \"tj\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-04-09 14:15:25');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:17');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:22');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:26');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:29');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:46');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"14\" ],\r\n  \"icon\" : [ \"fa fa-gear\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:16:51');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"10\" ],\r\n  \"icon\" : [ \"fa fa-gear\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:17:00');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"9\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:17:05');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统监控\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"fa fa-video-camera\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 14:17:11');
INSERT INTO `sys_oper_log` VALUES ('117', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-09 14:41:20');
INSERT INTO `sys_oper_log` VALUES ('118', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-09 14:41:21');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"控制中心\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-bullseye\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-09 18:44:01');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-moon-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-11 15:16:29');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"猪栏监控\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-11 15:54:26');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"刮粪板控制\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-11 15:54:46');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"风扇控制\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-11 15:55:24');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"窗帘控制\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-11 15:58:39');
INSERT INTO `sys_oper_log` VALUES ('125', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-04-18 19:25:47');
INSERT INTO `sys_oper_log` VALUES ('126', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '0', null, '2019-04-18 19:25:51');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"107\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"通知公告\" ],\r\n  \"url\" : [ \"/system/notice\" ],\r\n  \"perms\" : [ \"system:notice:view\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-20 19:12:01');
INSERT INTO `sys_oper_log` VALUES ('128', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-04-20 19:12:33');
INSERT INTO `sys_oper_log` VALUES ('129', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-04-20 19:12:58');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2014\" ],\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"风扇控制\" ],\r\n  \"url\" : [ \"/operation/facility\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-25 17:56:51');
INSERT INTO `sys_oper_log` VALUES ('131', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"2011,2012,2013,2014,2015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-25 17:57:16');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2015\" ],\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"窗帘控制\" ],\r\n  \"url\" : [ \"/operation/curtain\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-27 15:42:50');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2013\" ],\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"刮粪板控制\" ],\r\n  \"url\" : [ \"/operation/dung\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-27 16:40:54');
INSERT INTO `sys_oper_log` VALUES ('134', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2011,2012,2013,2014,2015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-28 16:20:34');
INSERT INTO `sys_oper_log` VALUES ('135', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2011,2012,2013,2014,2015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-28 16:20:35');
INSERT INTO `sys_oper_log` VALUES ('136', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2011,2012,2013,2014,2015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-28 16:20:36');
INSERT INTO `sys_oper_log` VALUES ('137', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2011,2012,2013,2014,2015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\" ]\r\n}', '0', null, '2019-04-28 16:20:37');
INSERT INTO `sys_oper_log` VALUES ('138', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"用户\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-04-28 16:21:03');
INSERT INTO `sys_oper_log` VALUES ('139', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"用户\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-04-28 16:21:16');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2012\" ],\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"猪栏监控\" ],\r\n  \"url\" : [ \"/operation/monitoring\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-05-07 16:28:42');
INSERT INTO `sys_oper_log` VALUES ('141', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-09 16:02:44');
INSERT INTO `sys_oper_log` VALUES ('142', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-09 16:03:20');
INSERT INTO `sys_oper_log` VALUES ('143', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-05-27 13:06:27');
INSERT INTO `sys_oper_log` VALUES ('144', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '0', null, '2019-05-27 13:06:31');
INSERT INTO `sys_oper_log` VALUES ('145', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '110.52.210.78', '湖南 长沙', '{\n  \"id\" : [ \"\" ],\n  \"userName\" : [ \"若依\" ],\n  \"phonenumber\" : [ \"15888888888\" ],\n  \"email\" : [ \"ry@163.com\" ],\n  \"sex\" : [ \"1\" ]\n}', '0', null, '2019-05-28 14:05:56');
INSERT INTO `sys_oper_log` VALUES ('146', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:06:23');
INSERT INTO `sys_oper_log` VALUES ('147', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:06:25');
INSERT INTO `sys_oper_log` VALUES ('148', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:23:02');
INSERT INTO `sys_oper_log` VALUES ('149', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:24:04');
INSERT INTO `sys_oper_log` VALUES ('150', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:24:04');
INSERT INTO `sys_oper_log` VALUES ('151', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 14:24:04');
INSERT INTO `sys_oper_log` VALUES ('152', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 15:53:11');
INSERT INTO `sys_oper_log` VALUES ('153', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 15:53:11');
INSERT INTO `sys_oper_log` VALUES ('154', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 15:53:12');
INSERT INTO `sys_oper_log` VALUES ('155', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', 'XX XX', '{ }', '0', null, '2019-05-28 15:53:13');
INSERT INTO `sys_oper_log` VALUES ('156', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 15:53:13');
INSERT INTO `sys_oper_log` VALUES ('157', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '110.52.210.78', '湖南 长沙', '{ }', '0', null, '2019-05-28 15:53:14');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"admin\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-05-29 17:13:40');
INSERT INTO `sys_oper_log` VALUES ('159', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"100\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"屠郡\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"13099999999\" ],\r\n  \"email\" : [ \"tj@qq.com\" ],\r\n  \"loginName\" : [ \"tj\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-05-29 17:14:08');
INSERT INTO `sys_oper_log` VALUES ('160', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"100\" ]\r\n}', '0', null, '2019-05-29 17:14:51');
INSERT INTO `sys_oper_log` VALUES ('161', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"TUJUN\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"13896423569\" ],\r\n  \"email\" : [ \"123456879@qq.com\" ],\r\n  \"loginName\" : [ \"tujun\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', '0', null, '2019-05-29 17:16:00');
INSERT INTO `sys_oper_log` VALUES ('162', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-05-29 17:16:20');
INSERT INTO `sys_oper_log` VALUES ('163', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"101\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"若依科技\" ],\r\n  \"deptName\" : [ \"岗位\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-05-29 17:16:50');
INSERT INTO `sys_oper_log` VALUES ('164', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-05-29 17:16:55');
INSERT INTO `sys_oper_log` VALUES ('165', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-05-29 17:16:59');
INSERT INTO `sys_oper_log` VALUES ('166', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-05-29 17:17:01');
INSERT INTO `sys_oper_log` VALUES ('167', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"周博\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"17670618404\" ],\r\n  \"email\" : [ \"bobasyu@qq.com\" ],\r\n  \"loginName\" : [ \"zb\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '0', null, '2019-06-18 22:31:36');
INSERT INTO `sys_oper_log` VALUES ('168', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/107', '43.250.201.5', '湖南 长沙', '{ }', '0', null, '2019-06-30 17:23:01');
INSERT INTO `sys_oper_log` VALUES ('169', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/106', '43.250.201.5', 'XX XX', '{ }', '0', null, '2019-06-30 17:23:09');
INSERT INTO `sys_oper_log` VALUES ('170', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '43.250.201.5', 'XX XX', '{\n  \"deptId\" : [ \"105\" ],\n  \"parentId\" : [ \"101\" ],\n  \"parentName\" : [ \"岗位\" ],\n  \"deptName\" : [ \"测试\" ],\n  \"orderNum\" : [ \"3\" ],\n  \"leader\" : [ \"若依\" ],\n  \"phone\" : [ \"15888888888\" ],\n  \"email\" : [ \"ry@qq.com\" ],\n  \"status\" : [ \"0\" ]\n}', '0', null, '2019-06-30 17:23:21');
INSERT INTO `sys_oper_log` VALUES ('171', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/104', '43.250.201.5', 'XX XX', '{ }', '0', null, '2019-06-30 17:23:27');
INSERT INTO `sys_oper_log` VALUES ('172', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '43.250.201.5', '湖南 长沙', '{\n  \"deptId\" : [ \"103\" ],\n  \"parentId\" : [ \"101\" ],\n  \"parentName\" : [ \"岗位\" ],\n  \"deptName\" : [ \"研发\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"leader\" : [ \"若依\" ],\n  \"phone\" : [ \"15888888888\" ],\n  \"email\" : [ \"ry@qq.com\" ],\n  \"status\" : [ \"0\" ]\n}', '0', null, '2019-06-30 17:23:35');
INSERT INTO `sys_oper_log` VALUES ('173', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发', '/system/user/edit', '106.19.205.5', '湖南 长沙', '{\n  \"userId\" : [ \"102\" ],\n  \"deptId\" : [ \"103\" ],\n  \"userName\" : [ \"周博\" ],\n  \"dept.deptName\" : [ \"研发\" ],\n  \"phonenumber\" : [ \"17670618404\" ],\n  \"email\" : [ \"bobasyu@qq.com\" ],\n  \"loginName\" : [ \"zb\" ],\n  \"sex\" : [ \"0\" ],\n  \"role\" : [ \"1\" ],\n  \"remark\" : [ \"\" ],\n  \"status\" : [ \"0\" ],\n  \"roleIds\" : [ \"1\" ],\n  \"postIds\" : [ \"\" ]\n}', '0', null, '2019-09-17 10:03:45');
INSERT INTO `sys_oper_log` VALUES ('174', '远程控制', '2', 'com.ruoyi.web.controller.service.MotorController.editSave()', '1', 'admin', '研发', '/service/motor/edit', '120.228.190.163', '湖南 常德', '{\n  \"oid\" : [ \"1\" ],\n  \"startTime\" : [ \"Fri Jul 20 18:46:51 CST 2018\" ],\n  \"endTime\" : [ \"Fri Jul 20 18:46:46 CST 2018\" ],\n  \"duration\" : [ \"Thu Jan 01 00:46:57 CST 1970\" ],\n  \"dName\" : [ \"水帘\" ]\n}', '0', null, '2020-02-05 15:07:40');
INSERT INTO `sys_oper_log` VALUES ('175', '远程控制', '2', 'com.ruoyi.web.controller.service.MotorController.editSave()', '1', 'admin', '研发', '/service/motor/edit', '120.228.190.163', '湖南 常德', '{\n  \"oid\" : [ \"1\" ],\n  \"startTime\" : [ \"Fri Jul 20 18:46:51 CST 2018\" ],\n  \"endTime\" : [ \"Fri Jul 20 18:46:46 CST 2018\" ],\n  \"duration\" : [ \"Thu Jan 01 00:46:57 CST 1970\" ],\n  \"dName\" : [ \"水帘\" ]\n}', '0', null, '2020-02-05 15:07:51');
INSERT INTO `sys_oper_log` VALUES ('176', '远程控制', '2', 'com.ruoyi.web.controller.service.MotorController.editSave()', '1', 'admin', '研发', '/service/motor/edit', '120.228.190.163', '湖南 常德', '{\n  \"oid\" : [ \"1\" ],\n  \"startTime\" : [ \"Fri Jul 20 18:46:51 CST 2018\" ],\n  \"endTime\" : [ \"Fri Jul 20 18:46:46 CST 2018\" ],\n  \"duration\" : [ \"00:46:57 CST 1970\" ],\n  \"dName\" : [ \"水帘\" ]\n}', '0', null, '2020-02-05 15:08:02');
INSERT INTO `sys_oper_log` VALUES ('177', '远程控制', '1', 'com.ruoyi.web.controller.service.MotorController.addSave()', '1', 'admin', '研发', '/service/motor/add', '120.228.190.163', '湖南 常德', '{\n  \"startTime\" : [ \"2019-07-20 18:46:51\" ],\n  \"endTime\" : [ \"2019-07-20 18:47:51\" ],\n  \"duration\" : [ \"00:01:00\" ],\n  \"dName\" : [ \"水帘\" ]\n}', '0', null, '2020-02-05 15:08:41');
INSERT INTO `sys_oper_log` VALUES ('178', '远程控制', '2', 'com.ruoyi.web.controller.service.MotorController.editSave()', '1', 'admin', '研发', '/service/motor/edit', '120.228.190.163', '湖南 常德', '{\n  \"oid\" : [ \"1\" ],\n  \"startTime\" : [ \"Fri Jul 20 18:46:51 CST 2018\" ],\n  \"endTime\" : [ \"Fri Jul 20 18:46:46 CST 2018\" ],\n  \"duration\" : [ \"Thu Jan 01 00:46:57 CST 1970\" ],\n  \"dName\" : [ \"1\" ]\n}', '0', null, '2020-02-05 15:09:16');
INSERT INTO `sys_oper_log` VALUES ('179', '远程控制', '2', 'com.ruoyi.web.controller.service.MotorController.editSave()', '1', 'admin', '研发', '/service/motor/edit', '120.228.190.163', '湖南 常德', '{\n  \"oid\" : [ \"1\" ],\n  \"startTime\" : [ \"Fri Jul 20 18:46:51 CST 2018\" ],\n  \"endTime\" : [ \"Fri Jul 20 18:46:46 CST 2018\" ],\n  \"duration\" : [ \"Thu Jan 01 00:46:57 CST 1970\" ],\n  \"dName\" : [ \"Thu Jan 01 00:46:57 CST 1970\" ]\n}', '0', null, '2020-02-05 15:09:27');
INSERT INTO `sys_oper_log` VALUES ('180', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"李雪滢\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '0', null, '2020-03-15 21:15:36');
INSERT INTO `sys_oper_log` VALUES ('181', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发', '/tool/gen/genCode/temperature', '127.0.0.1', '内网IP', '{ }', '0', null, '2020-03-21 16:16:24');
INSERT INTO `sys_oper_log` VALUES ('182', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发', '/tool/gen/genCode/temperature', '127.0.0.1', '内网IP', '{ }', '0', null, '2020-03-21 16:21:38');
INSERT INTO `sys_oper_log` VALUES ('183', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"李雪滢\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"2650163223@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '0', null, '2020-03-21 16:22:29');
INSERT INTO `sys_oper_log` VALUES ('184', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统广播\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"11\" ],\r\n  \"icon\" : [ \"fa fa-bullhorn\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-03-31 21:50:14');
INSERT INTO `sys_oper_log` VALUES ('185', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统广播\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"9\" ],\r\n  \"icon\" : [ \"fa fa-bullhorn\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-03-31 21:50:42');
INSERT INTO `sys_oper_log` VALUES ('186', '菜单管理', '1', 'com.hunau.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"终端\" ],\r\n  \"url\" : [ \"/sbroad/domains\" ],\r\n  \"perms\" : [ \"sbroad:domains:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-03-31 23:37:54');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '1', 'com.hunau.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2016\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"班级管理\" ],\r\n  \"url\" : [ \"/sbroad/class\" ],\r\n  \"perms\" : [ \"sbroad:class:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-01 00:35:17');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2017\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"班级管理\" ],\r\n  \"url\" : [ \"/sbroad/class\" ],\r\n  \"perms\" : [ \"sbroad:class:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-01 00:35:55');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2006\" ],\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"传感器数据\" ],\r\n  \"url\" : [ \"/service/pigstyinfo\" ],\r\n  \"perms\" : [ \"service:pigstyinfo:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2020-04-01 09:10:13');
INSERT INTO `sys_oper_log` VALUES ('190', '用户管理', '3', 'com.hunau.web.controller.system.SysUserController.remove()', '1', 'admin', '研发', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"102\" ]\r\n}', '0', null, '2020-04-01 09:53:17');
INSERT INTO `sys_oper_log` VALUES ('191', '用户管理', '3', 'com.hunau.web.controller.system.SysUserController.remove()', '1', 'admin', '研发', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"101\" ]\r\n}', '0', null, '2020-04-01 09:53:19');
INSERT INTO `sys_oper_log` VALUES ('192', '参数管理', '2', 'com.hunau.web.controller.system.SysConfigController.editSave()', '1', 'admin', '研发', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '0', null, '2020-04-01 09:53:48');
INSERT INTO `sys_oper_log` VALUES ('193', '参数管理', '1', 'com.hunau.web.controller.system.SysConfigController.addSave()', '1', 'admin', '研发', '/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"修改主框架页-侧边栏主题\" ],\r\n  \"configKey\" : [ \"sys.index.sideTheme\" ],\r\n  \"configValue\" : [ \"theme-light\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"深色主题theme-dark\\r\\n浅色主题theme-light\" ]\r\n}', '0', null, '2020-04-01 09:56:30');
INSERT INTO `sys_oper_log` VALUES ('194', '参数管理', '2', 'com.hunau.web.controller.system.SysConfigController.editSave()', '1', 'admin', '研发', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"3\" ],\r\n  \"configName\" : [ \"修改主框架页-侧边栏主题\" ],\r\n  \"configKey\" : [ \"sys.index.sideTheme\" ],\r\n  \"configValue\" : [ \"theme-dark\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"深色主题theme-dark 浅色主题theme-light\" ]\r\n}', '0', null, '2020-04-01 09:56:55');
INSERT INTO `sys_oper_log` VALUES ('195', '用户管理', '1', 'com.hunau.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"lxy\" ],\r\n  \"deptName\" : [ \"研发\" ],\r\n  \"phonenumber\" : [ \"18188924253\" ],\r\n  \"email\" : [ \"2650163223@qq.com\" ],\r\n  \"loginName\" : [ \"lxy\" ],\r\n  \"password\" : [ \"lxy123\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2020-04-05 10:16:24');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '1', 'com.hunau.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"广播终端管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-cog\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 14:28:05');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2018\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"广播终端管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \" \" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 14:28:52');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2018\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"广播控制\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 16:10:40');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '1', 'com.hunau.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2018\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"终端控制\" ],\r\n  \"url\" : [ \"/system/domain\" ],\r\n  \"perms\" : [ \"system:domain:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 16:20:40');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2016\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"终端\" ],\r\n  \"url\" : [ \"/sbroad/domains\" ],\r\n  \"perms\" : [ \"sbroad:domains:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2020-04-05 16:21:08');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2016\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"终端\" ],\r\n  \"url\" : [ \"/sbroad/domains\" ],\r\n  \"perms\" : [ \"sbroad:domains:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 17:46:35');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2017\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"班级管理\" ],\r\n  \"url\" : [ \"/sbroad/class\" ],\r\n  \"perms\" : [ \"sbroad:class:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-05 18:10:21');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '高中', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2017\" ],\r\n  \"parentId\" : [ \"4\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"班级管理\" ],\r\n  \"url\" : [ \"/sbroad/class\" ],\r\n  \"perms\" : [ \"sbroad:class:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2020-04-12 09:37:28');
INSERT INTO `sys_oper_log` VALUES ('204', '菜单管理', '2', 'com.hunau.web.controller.system.SysMenuController.editSave()', '1', 'admin', '高中', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"103\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"班级管理\" ],\r\n  \"url\" : [ \"/system/dept\" ],\r\n  \"perms\" : [ \"system:dept:view\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2020-04-12 09:37:53');
INSERT INTO `sys_oper_log` VALUES ('205', '用户管理', '5', 'com.hunau.web.controller.system.SysUserController.export()', '1', 'admin', '高中', '/system/user/export', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"userName\" : [ \"ry\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:18:41');
INSERT INTO `sys_oper_log` VALUES ('206', '用户管理', '2', 'com.hunau.web.controller.system.SysUserController.changeStatus()', '1', 'admin', '高中', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', '0', null, '2020-04-12 13:19:58');
INSERT INTO `sys_oper_log` VALUES ('207', '岗位管理', '2', 'com.hunau.web.controller.system.SysPostController.editSave()', '1', 'admin', '高中', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"1\" ],\r\n  \"postName\" : [ \"校长\" ],\r\n  \"postCode\" : [ \"ceo\" ],\r\n  \"postSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:39:24');
INSERT INTO `sys_oper_log` VALUES ('208', '岗位管理', '2', 'com.hunau.web.controller.system.SysPostController.editSave()', '1', 'admin', '高中', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"2\" ],\r\n  \"postName\" : [ \"年级主任\" ],\r\n  \"postCode\" : [ \"se\" ],\r\n  \"postSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:39:44');
INSERT INTO `sys_oper_log` VALUES ('209', '岗位管理', '2', 'com.hunau.web.controller.system.SysPostController.editSave()', '1', 'admin', '高中', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"3\" ],\r\n  \"postName\" : [ \"班主任\" ],\r\n  \"postCode\" : [ \"hr\" ],\r\n  \"postSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:39:53');
INSERT INTO `sys_oper_log` VALUES ('210', '岗位管理', '2', 'com.hunau.web.controller.system.SysPostController.editSave()', '1', 'admin', '高中', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"4\" ],\r\n  \"postName\" : [ \"学生\" ],\r\n  \"postCode\" : [ \"user\" ],\r\n  \"postSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:40:02');
INSERT INTO `sys_oper_log` VALUES ('211', '岗位管理', '2', 'com.hunau.web.controller.system.SysPostController.editSave()', '1', 'admin', '高中', '/system/post/edit', '127.0.0.1', '内网IP', '{\r\n  \"postId\" : [ \"4\" ],\r\n  \"postName\" : [ \"普通员工\" ],\r\n  \"postCode\" : [ \"user\" ],\r\n  \"postSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2020-04-12 13:40:26');
INSERT INTO `sys_oper_log` VALUES ('212', '部门管理', '1', 'com.hunau.web.controller.system.SysDeptController.addSave()', '1', 'admin', '高中', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"deptName\" : [ \"部门\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2020-04-12 14:12:34');
INSERT INTO `sys_oper_log` VALUES ('213', '部门管理', '1', 'com.hunau.web.controller.system.SysDeptController.addSave()', '1', 'admin', '高中', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"113\" ],\r\n  \"deptName\" : [ \"技术部\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2020-04-12 14:12:55');
INSERT INTO `sys_oper_log` VALUES ('214', '用户管理', '2', 'com.hunau.web.controller.system.SysUserController.editSave()', '1', 'admin', '高中', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"114\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"技术部\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2020-04-12 14:18:13');
INSERT INTO `sys_oper_log` VALUES ('215', '个人信息', '2', 'com.hunau.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '高中', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '0', null, '2020-04-12 14:19:08');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '校长', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 13:39:24', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '年级主任', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 13:39:44', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '班主任', '3', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 13:39:53', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 13:40:26', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-25 17:57:16', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-28 16:20:36', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('1', '2003');
INSERT INTO `sys_role_menu` VALUES ('1', '2004');
INSERT INTO `sys_role_menu` VALUES ('1', '2005');
INSERT INTO `sys_role_menu` VALUES ('1', '2006');
INSERT INTO `sys_role_menu` VALUES ('1', '2007');
INSERT INTO `sys_role_menu` VALUES ('1', '2008');
INSERT INTO `sys_role_menu` VALUES ('1', '2009');
INSERT INTO `sys_role_menu` VALUES ('1', '2010');
INSERT INTO `sys_role_menu` VALUES ('1', '2011');
INSERT INTO `sys_role_menu` VALUES ('1', '2012');
INSERT INTO `sys_role_menu` VALUES ('1', '2013');
INSERT INTO `sys_role_menu` VALUES ('1', '2014');
INSERT INTO `sys_role_menu` VALUES ('1', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '2005');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '李雪滢', '00', '2650163223@163.com', '15888888888', '1', '2020/04/12/2362301fae46986d629a3531fba3f1ab.jpg', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-04-12 20:28:51', 'admin', '2018-03-16 11:33:00', 'ry', '2020-04-12 20:28:50', '管理员');
INSERT INTO `sys_user` VALUES ('2', '114', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '1', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-12 14:18:13', '测试员');
INSERT INTO `sys_user` VALUES ('100', '103', 'tj', '屠郡', '00', 'tj@qq.com', '13099999999', '1', '', '31f50336e7e84e65df0ff7c5d31d3ffb', '13fffc', '0', '2', '127.0.0.1', '2019-04-10 13:20:28', 'admin', '2019-04-09 14:15:25', 'admin', '2019-05-29 17:14:07', '');
INSERT INTO `sys_user` VALUES ('101', '103', 'tujun', 'TUJUN', '00', '123456879@qq.com', '13896423569', '1', '', 'f80bc613b4a974d1e987308267363a42', 'cdb2a8', '0', '2', '127.0.0.1', '2019-05-29 17:19:50', 'admin', '2019-05-29 17:16:00', '', '2019-05-29 17:19:46', '');
INSERT INTO `sys_user` VALUES ('102', '103', 'zb', '周博', '00', 'bobasyu@qq.com', '17670618404', '0', '', '04ebec348e1d444176161aff3e10d8c6', '5e2136', '0', '2', '127.0.0.1', '2019-06-18 22:36:18', 'admin', '2019-06-18 22:31:36', 'admin', '2019-09-17 10:03:44', '');
INSERT INTO `sys_user` VALUES ('103', '103', 'lxy', 'lxy', '00', '2650163223@qq.com', '18188924253', '1', '', 'a9736b24230ee7b4af18b012ebbeedcc', '312547', '0', '0', '127.0.0.1', '2020-04-05 10:34:36', 'admin', '2020-04-05 10:16:24', '', '2020-04-05 10:34:36', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('411cc1d3-e750-4e51-b738-bda7b3ff43e6', 'admin', '高中', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-04-12 20:28:14', '2020-04-12 20:33:14', '1800000');
INSERT INTO `sys_user_online` VALUES ('b904ccbc-051b-4b70-a2c8-a1390c38a268', 'admin', '高中', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-04-12 19:48:42', '2020-04-12 20:06:54', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '1');
INSERT INTO `sys_user_post` VALUES ('101', '1');
INSERT INTO `sys_user_post` VALUES ('103', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '1');
INSERT INTO `sys_user_role` VALUES ('101', '1');
INSERT INTO `sys_user_role` VALUES ('102', '1');
INSERT INTO `sys_user_role` VALUES ('103', '1');

-- ----------------------------
-- Table structure for temperature
-- ----------------------------
DROP TABLE IF EXISTS `temperature`;
CREATE TABLE `temperature` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `numbe` int(11) DEFAULT NULL,
  `temp_pig` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='体温';

-- ----------------------------
-- Records of temperature
-- ----------------------------
INSERT INTO `temperature` VALUES ('1', null, null, null);
INSERT INTO `temperature` VALUES ('2', null, null, null);
INSERT INTO `temperature` VALUES ('3', null, null, null);
INSERT INTO `temperature` VALUES ('4', null, null, null);

-- ----------------------------
-- Table structure for work_terminal
-- ----------------------------
DROP TABLE IF EXISTS `work_terminal`;
CREATE TABLE `work_terminal` (
  `ter_real_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '终端表实际ID',
  `terminal_id` varchar(10) NOT NULL COMMENT '终端ID',
  `terminal_name` varchar(255) DEFAULT NULL COMMENT '终端名称',
  `terminal_ip` varchar(40) DEFAULT NULL COMMENT 'IP',
  `is_cmic` char(1) DEFAULT '0' COMMENT '寻呼话筒（0正常 1停用）',
  `is_auto_cast` char(1) DEFAULT '0' COMMENT '自动采播（0正常 1停用）',
  `domain_id` bigint(20) DEFAULT NULL COMMENT '所在分区',
  `status` char(1) DEFAULT '0' COMMENT '终端状态（0正常 1停用）',
  `login_time` datetime DEFAULT NULL COMMENT '终端最后登录时间',
  `precinct` varchar(1000) DEFAULT NULL COMMENT '终端管理分区',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `is_online` tinyint(1) DEFAULT '2' COMMENT '是否在线 0,1在线，2为离线',
  `terminal_vol` int(11) DEFAULT NULL COMMENT '终端音量',
  PRIMARY KEY (`ter_real_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000420 DEFAULT CHARSET=utf8 COMMENT='终端表';

-- ----------------------------
-- Records of work_terminal
-- ----------------------------
INSERT INTO `work_terminal` VALUES ('1000000000', '0001', '测试1号', '127.0.0.1', '0', '1', '100003', '0', null, '100009,100008,100002,_100000', '0', 'admin', '2020-03-29 15:49:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000001', '0002', '测试2号', '127.0.0.2', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000002', '0003', '测试3号', '127.0.0.3', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000003', '0004', '测试4号', '127.0.0.4', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000004', '0005', '测试5号', '127.0.0.5', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000005', '0006', '测试6号', '127.0.0.6', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000006', '0007', '测试7号', '127.0.0.7', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000007', '0008', '测试8号', '127.0.0.8', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000008', '0009', '测试9号', '127.0.0.9', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000009', '0010', '测试10号', '127.0.0.10', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000010', '0011', '测试11号', '127.0.0.11', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000011', '0012', '测试12号', '127.0.0.12', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000012', '0013', '测试13号', '127.0.0.13', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000013', '0014', '测试14号', '127.0.0.14', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000014', '0015', '测试15号', '127.0.0.15', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000015', '0016', '测试16号', '127.0.0.16', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000016', '0017', '测试17号', '127.0.0.17', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000017', '0018', '测试18号', '127.0.0.18', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000018', '0019', '测试19号', '127.0.0.19', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000019', '0020', '测试20号', '127.0.0.20', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000020', '0021', '测试21号', '127.0.0.21', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000021', '0022', '测试22号', '127.0.0.22', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000022', '0023', '测试23号', '127.0.0.23', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000023', '0024', '测试24号', '127.0.0.24', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000024', '0025', '测试25号', '127.0.0.25', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000025', '0026', '测试26号', '127.0.0.26', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000026', '0027', '测试27号', '127.0.0.27', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000027', '0028', '测试28号', '127.0.0.28', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000028', '0029', '测试29号', '127.0.0.29', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000029', '0030', '测试30号', '127.0.0.30', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000030', '0031', '测试31号', '127.0.0.31', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000031', '0032', '测试32号', '127.0.0.32', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000032', '0033', '测试33号', '127.0.0.33', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000033', '0034', '测试34号', '127.0.0.34', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000034', '0035', '测试35号', '127.0.0.35', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000035', '0036', '测试36号', '127.0.0.36', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000036', '0037', '测试37号', '127.0.0.37', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000037', '0038', '测试38号', '127.0.0.38', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000038', '0039', '测试39号', '127.0.0.39', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000039', '0040', '测试40号', '127.0.0.40', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000040', '0041', '测试41号', '127.0.0.41', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000041', '0042', '测试42号', '127.0.0.42', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000042', '0043', '测试43号', '127.0.0.43', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000043', '0044', '测试44号', '127.0.0.44', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000044', '0045', '测试45号', '127.0.0.45', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000045', '0046', '测试46号', '127.0.0.46', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000046', '0047', '测试47号', '127.0.0.47', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000047', '0048', '测试48号', '127.0.0.48', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000048', '0049', '测试49号', '127.0.0.49', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000049', '0050', '测试50号', '127.0.0.50', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000050', '0051', '测试51号', '127.0.0.51', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000051', '0052', '测试52号', '127.0.0.52', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000052', '0053', '测试53号', '127.0.0.53', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000053', '0054', '测试54号', '127.0.0.54', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000054', '0055', '测试55号', '127.0.0.55', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000055', '0056', '测试56号', '127.0.0.56', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000056', '0057', '测试57号', '127.0.0.57', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000057', '0058', '测试58号', '127.0.0.58', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000058', '0059', '测试59号', '127.0.0.59', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000059', '0060', '测试60号', '127.0.0.60', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000060', '0061', '测试61号', '127.0.0.61', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000061', '0062', '测试62号', '127.0.0.62', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:58', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000062', '0063', '测试63号', '127.0.0.63', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000063', '0064', '测试64号', '127.0.0.64', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000064', '0065', '测试65号', '127.0.0.65', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000065', '0066', '测试66号', '127.0.0.66', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000066', '0067', '测试67号', '127.0.0.67', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000067', '0068', '测试68号', '127.0.0.68', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000068', '0069', '测试69号', '127.0.0.69', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000069', '0070', '测试70号', '127.0.0.70', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000070', '0071', '测试71号', '127.0.0.71', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:49:59', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000071', '0072', '测试72号', '127.0.0.72', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000072', '0073', '测试73号', '127.0.0.73', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000073', '0074', '测试74号', '127.0.0.74', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000074', '0075', '测试75号', '127.0.0.75', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000075', '0076', '测试76号', '127.0.0.76', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000076', '0077', '测试77号', '127.0.0.77', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000077', '0078', '测试78号', '127.0.0.78', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000078', '0079', '测试79号', '127.0.0.79', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:00', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000079', '0080', '测试80号', '127.0.0.80', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000080', '0081', '测试81号', '127.0.0.81', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000081', '0082', '测试82号', '127.0.0.82', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000082', '0083', '测试83号', '127.0.0.83', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000083', '0084', '测试84号', '127.0.0.84', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000084', '0085', '测试85号', '127.0.0.85', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000085', '0086', '测试86号', '127.0.0.86', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000086', '0087', '测试87号', '127.0.0.87', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:01', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000087', '0088', '测试88号', '127.0.0.88', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000088', '0089', '测试89号', '127.0.0.89', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000089', '0090', '测试90号', '127.0.0.90', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000090', '0091', '测试91号', '127.0.0.91', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000091', '0092', '测试92号', '127.0.0.92', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000092', '0093', '测试93号', '127.0.0.93', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000093', '0094', '测试94号', '127.0.0.94', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000094', '0095', '测试95号', '127.0.0.95', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:02', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000095', '0096', '测试96号', '127.0.0.96', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:03', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000096', '0097', '测试97号', '127.0.0.97', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:03', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000097', '0098', '测试98号', '127.0.0.98', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:03', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000098', '0099', '测试99号', '127.0.0.99', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:03', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000099', '0100', '测试100号', '127.0.0.100', '1', '1', '100003', '0', null, null, '0', 'admin', '2020-03-29 15:50:03', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000100', '0101', '测试101号', '127.0.0.101', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000101', '0102', '测试102号', '127.0.0.102', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000102', '0103', '测试103号', '127.0.0.103', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000103', '0104', '测试104号', '127.0.0.104', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000104', '0105', '测试105号', '127.0.0.105', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000105', '0106', '测试106号', '127.0.0.106', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:45', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000106', '0107', '测试107号', '127.0.0.107', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000107', '0108', '测试108号', '127.0.0.108', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000108', '0109', '测试109号', '127.0.0.109', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000109', '0110', '测试110号', '127.0.0.110', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000110', '0111', '测试111号', '127.0.0.111', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000111', '0112', '测试112号', '127.0.0.112', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000112', '0113', '测试113号', '127.0.0.113', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000113', '0114', '测试114号', '127.0.0.114', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:46', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000114', '0115', '测试115号', '127.0.0.115', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000115', '0116', '测试116号', '127.0.0.116', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000116', '0117', '测试117号', '127.0.0.117', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000117', '0118', '测试118号', '127.0.0.118', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000118', '0119', '测试119号', '127.0.0.119', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000119', '0120', '测试120号', '127.0.0.120', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000120', '0121', '测试121号', '127.0.0.121', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000121', '0122', '测试122号', '127.0.0.122', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000122', '0123', '测试123号', '127.0.0.123', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:47', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000123', '0124', '测试124号', '127.0.0.124', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000124', '0125', '测试125号', '127.0.0.125', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000125', '0126', '测试126号', '127.0.0.126', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000126', '0127', '测试127号', '127.0.0.127', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000127', '0128', '测试128号', '127.0.0.128', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000128', '0129', '测试129号', '127.0.0.129', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000129', '0130', '测试130号', '127.0.0.130', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000130', '0131', '测试131号', '127.0.0.131', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:48', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000131', '0132', '测试132号', '127.0.0.132', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000132', '0133', '测试133号', '127.0.0.133', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000133', '0134', '测试134号', '127.0.0.134', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000134', '0135', '测试135号', '127.0.0.135', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000135', '0136', '测试136号', '127.0.0.136', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000136', '0137', '测试137号', '127.0.0.137', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000137', '0138', '测试138号', '127.0.0.138', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000138', '0139', '测试139号', '127.0.0.139', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000139', '0140', '测试140号', '127.0.0.140', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:49', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000140', '0141', '测试141号', '127.0.0.141', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000141', '0142', '测试142号', '127.0.0.142', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000142', '0143', '测试143号', '127.0.0.143', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000143', '0144', '测试144号', '127.0.0.144', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000144', '0145', '测试145号', '127.0.0.145', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000145', '0146', '测试146号', '127.0.0.146', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000146', '0147', '测试147号', '127.0.0.147', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000147', '0148', '测试148号', '127.0.0.148', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:50', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000148', '0149', '测试149号', '127.0.0.149', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000149', '0150', '测试150号', '127.0.0.150', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000150', '0151', '测试151号', '127.0.0.151', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000151', '0152', '测试152号', '127.0.0.152', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000152', '0153', '测试153号', '127.0.0.153', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000153', '0154', '测试154号', '127.0.0.154', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000154', '0155', '测试155号', '127.0.0.155', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000155', '0156', '测试156号', '127.0.0.156', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:51', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000156', '0157', '测试157号', '127.0.0.157', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000157', '0158', '测试158号', '127.0.0.158', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000158', '0159', '测试159号', '127.0.0.159', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000159', '0160', '测试160号', '127.0.0.160', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000160', '0161', '测试161号', '127.0.0.161', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000161', '0162', '测试162号', '127.0.0.162', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000162', '0163', '测试163号', '127.0.0.163', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000163', '0164', '测试164号', '127.0.0.164', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000164', '0165', '测试165号', '127.0.0.165', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:52', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000165', '0166', '测试166号', '127.0.0.166', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000166', '0167', '测试167号', '127.0.0.167', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000167', '0168', '测试168号', '127.0.0.168', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000168', '0169', '测试169号', '127.0.0.169', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000169', '0170', '测试170号', '127.0.0.170', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000170', '0171', '测试171号', '127.0.0.171', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000171', '0172', '测试172号', '127.0.0.172', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000172', '0173', '测试173号', '127.0.0.173', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000173', '0174', '测试174号', '127.0.0.174', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:53', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000174', '0175', '测试175号', '127.0.0.175', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000175', '0176', '测试176号', '127.0.0.176', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000176', '0177', '测试177号', '127.0.0.177', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000177', '0178', '测试178号', '127.0.0.178', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000178', '0179', '测试179号', '127.0.0.179', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000179', '0180', '测试180号', '127.0.0.180', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000180', '0181', '测试181号', '127.0.0.181', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:54', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000181', '0182', '测试182号', '127.0.0.182', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000182', '0183', '测试183号', '127.0.0.183', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000183', '0184', '测试184号', '127.0.0.184', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000184', '0185', '测试185号', '127.0.0.185', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000185', '0186', '测试186号', '127.0.0.186', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000186', '0187', '测试187号', '127.0.0.187', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000187', '0188', '测试188号', '127.0.0.188', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000188', '0189', '测试189号', '127.0.0.189', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000189', '0190', '测试190号', '127.0.0.190', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:55', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000190', '0191', '测试191号', '127.0.0.191', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000191', '0192', '测试192号', '127.0.0.192', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000192', '0193', '测试193号', '127.0.0.193', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000193', '0194', '测试194号', '127.0.0.194', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000194', '0195', '测试195号', '127.0.0.195', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000195', '0196', '测试196号', '127.0.0.196', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000196', '0197', '测试197号', '127.0.0.197', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000197', '0198', '测试198号', '127.0.0.198', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:56', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000198', '0199', '测试199号', '127.0.0.199', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000199', '0200', '测试200号', '127.0.0.200', '1', '1', '100008', '0', null, null, '0', 'admin', '2020-03-29 15:50:57', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000200', '0201', '测试1号', '127.0.1.1', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:18', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000201', '0202', '测试2号', '127.0.1.2', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:18', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000202', '0203', '测试3号', '127.0.1.3', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:18', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000203', '0204', '测试4号', '127.0.1.4', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:18', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000204', '0205', '测试5号', '127.0.1.5', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000205', '0206', '测试6号', '127.0.1.6', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000206', '0207', '测试7号', '127.0.1.7', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000207', '0208', '测试8号', '127.0.1.8', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000208', '0209', '测试9号', '127.0.1.9', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000209', '0210', '测试10号', '127.0.1.10', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000210', '0211', '测试11号', '127.0.1.11', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000211', '0212', '测试12号', '127.0.1.12', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000212', '0213', '测试13号', '127.0.1.13', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:19', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000213', '0214', '测试14号', '127.0.1.14', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000214', '0215', '测试15号', '127.0.1.15', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000215', '0216', '测试16号', '127.0.1.16', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000216', '0217', '测试17号', '127.0.1.17', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000217', '0218', '测试18号', '127.0.1.18', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000218', '0219', '测试19号', '127.0.1.19', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000219', '0220', '测试20号', '127.0.1.20', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000220', '0221', '测试21号', '127.0.1.21', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000221', '0222', '测试22号', '127.0.1.22', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:20', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000222', '0223', '测试23号', '127.0.1.23', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000223', '0224', '测试24号', '127.0.1.24', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000224', '0225', '测试25号', '127.0.1.25', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000225', '0226', '测试26号', '127.0.1.26', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000226', '0227', '测试27号', '127.0.1.27', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000227', '0228', '测试28号', '127.0.1.28', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000228', '0229', '测试29号', '127.0.1.29', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000229', '0230', '测试30号', '127.0.1.30', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000230', '0231', '测试31号', '127.0.1.31', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:21', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000231', '0232', '测试32号', '127.0.1.32', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000232', '0233', '测试33号', '127.0.1.33', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000233', '0234', '测试34号', '127.0.1.34', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000234', '0235', '测试35号', '127.0.1.35', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000235', '0236', '测试36号', '127.0.1.36', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000236', '0237', '测试37号', '127.0.1.37', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000237', '0238', '测试38号', '127.0.1.38', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000238', '0239', '测试39号', '127.0.1.39', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000239', '0240', '测试40号', '127.0.1.40', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:22', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000240', '0241', '测试41号', '127.0.1.41', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000241', '0242', '测试42号', '127.0.1.42', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000242', '0243', '测试43号', '127.0.1.43', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000243', '0244', '测试44号', '127.0.1.44', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000244', '0245', '测试45号', '127.0.1.45', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000245', '0246', '测试46号', '127.0.1.46', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000246', '0247', '测试47号', '127.0.1.47', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000247', '0248', '测试48号', '127.0.1.48', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:23', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000248', '0249', '测试49号', '127.0.1.49', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000249', '0250', '测试50号', '127.0.1.50', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000250', '0251', '测试51号', '127.0.1.51', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000251', '0252', '测试52号', '127.0.1.52', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000252', '0253', '测试53号', '127.0.1.53', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000253', '0254', '测试54号', '127.0.1.54', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000254', '0255', '测试55号', '127.0.1.55', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000255', '0256', '测试56号', '127.0.1.56', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000256', '0257', '测试57号', '127.0.1.57', '1', '0', '100006', '0', null, '100007,100006,100005,100003,100001,_100000', '0', 'admin', '2020-03-29 15:52:24', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000257', '0258', '测试58号', '127.0.1.58', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000258', '0259', '测试59号', '127.0.1.59', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000259', '0260', '测试60号', '127.0.1.60', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000260', '0261', '测试61号', '127.0.1.61', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000261', '0262', '测试62号', '127.0.1.62', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000262', '0263', '测试63号', '127.0.1.63', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000263', '0264', '测试64号', '127.0.1.64', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000264', '0265', '测试65号', '127.0.1.65', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:25', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000265', '0266', '测试66号', '127.0.1.66', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000266', '0267', '测试67号', '127.0.1.67', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000267', '0268', '测试68号', '127.0.1.68', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000268', '0269', '测试69号', '127.0.1.69', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000269', '0270', '测试70号', '127.0.1.70', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000270', '0271', '测试71号', '127.0.1.71', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000271', '0272', '测试72号', '127.0.1.72', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:26', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000272', '0273', '测试73号', '127.0.1.73', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000273', '0274', '测试74号', '127.0.1.74', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000274', '0275', '测试75号', '127.0.1.75', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000275', '0276', '测试76号', '127.0.1.76', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000276', '0277', '测试77号', '127.0.1.77', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000277', '0278', '测试78号', '127.0.1.78', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:27', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000278', '0279', '测试79号', '127.0.1.79', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:28', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000279', '0280', '测试80号', '127.0.1.80', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:28', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000280', '0281', '测试81号', '127.0.1.81', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:28', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000281', '0282', '测试82号', '127.0.1.82', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:28', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000282', '0283', '测试83号', '127.0.1.83', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:28', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000283', '0284', '测试84号', '127.0.1.84', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000284', '0285', '测试85号', '127.0.1.85', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000285', '0286', '测试86号', '127.0.1.86', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000286', '0287', '测试87号', '127.0.1.87', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000287', '0288', '测试88号', '127.0.1.88', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000288', '0289', '测试89号', '127.0.1.89', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:29', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000289', '0290', '测试90号', '127.0.1.90', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000290', '0291', '测试91号', '127.0.1.91', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000291', '0292', '测试92号', '127.0.1.92', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000292', '0293', '测试93号', '127.0.1.93', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000293', '0294', '测试94号', '127.0.1.94', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000294', '0295', '测试95号', '127.0.1.95', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:30', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000295', '0296', '测试96号', '127.0.1.96', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000296', '0297', '测试97号', '127.0.1.97', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000297', '0298', '测试98号', '127.0.1.98', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000298', '0299', '测试99号', '127.0.1.99', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000299', '0300', '测试100号', '127.0.1.100', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000300', '0301', '测试101号', '127.0.1.101', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:31', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000301', '0302', '测试102号', '127.0.1.102', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000302', '0303', '测试103号', '127.0.1.103', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000303', '0304', '测试104号', '127.0.1.104', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000304', '0305', '测试105号', '127.0.1.105', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000305', '0306', '测试106号', '127.0.1.106', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000306', '0307', '测试107号', '127.0.1.107', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:32', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000307', '0308', '测试108号', '127.0.1.108', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000308', '0309', '测试109号', '127.0.1.109', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000309', '0310', '测试110号', '127.0.1.110', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000310', '0311', '测试111号', '127.0.1.111', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000311', '0312', '测试112号', '127.0.1.112', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000312', '0313', '测试113号', '127.0.1.113', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:33', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000313', '0314', '测试114号', '127.0.1.114', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000314', '0315', '测试115号', '127.0.1.115', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000315', '0316', '测试116号', '127.0.1.116', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000316', '0317', '测试117号', '127.0.1.117', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000317', '0318', '测试118号', '127.0.1.118', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000318', '0319', '测试119号', '127.0.1.119', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:34', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000319', '0320', '测试120号', '127.0.1.120', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000320', '0321', '测试121号', '127.0.1.121', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000321', '0322', '测试122号', '127.0.1.122', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000322', '0323', '测试123号', '127.0.1.123', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000323', '0324', '测试124号', '127.0.1.124', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000324', '0325', '测试125号', '127.0.1.125', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:35', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000325', '0326', '测试126号', '127.0.1.126', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000326', '0327', '测试127号', '127.0.1.127', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000327', '0328', '测试128号', '127.0.1.128', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000328', '0329', '测试129号', '127.0.1.129', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000329', '0330', '测试130号', '127.0.1.130', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000330', '0331', '测试131号', '127.0.1.131', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000331', '0332', '测试132号', '127.0.1.132', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:36', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000332', '0333', '测试133号', '127.0.1.133', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000333', '0334', '测试134号', '127.0.1.134', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000334', '0335', '测试135号', '127.0.1.135', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000335', '0336', '测试136号', '127.0.1.136', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000336', '0337', '测试137号', '127.0.1.137', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000337', '0338', '测试138号', '127.0.1.138', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000338', '0339', '测试139号', '127.0.1.139', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000339', '0340', '测试140号', '127.0.1.140', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000340', '0341', '测试141号', '127.0.1.141', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:37', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000341', '0342', '测试142号', '127.0.1.142', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000342', '0343', '测试143号', '127.0.1.143', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000343', '0344', '测试144号', '127.0.1.144', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000344', '0345', '测试145号', '127.0.1.145', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000345', '0346', '测试146号', '127.0.1.146', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000346', '0347', '测试147号', '127.0.1.147', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000347', '0348', '测试148号', '127.0.1.148', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000348', '0349', '测试149号', '127.0.1.149', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000349', '0350', '测试150号', '127.0.1.150', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:38', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000350', '0351', '测试151号', '127.0.1.151', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000351', '0352', '测试152号', '127.0.1.152', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000352', '0353', '测试153号', '127.0.1.153', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000353', '0354', '测试154号', '127.0.1.154', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000354', '0355', '测试155号', '127.0.1.155', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000355', '0356', '测试156号', '127.0.1.156', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000356', '0357', '测试157号', '127.0.1.157', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000357', '0358', '测试158号', '127.0.1.158', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000358', '0359', '测试159号', '127.0.1.159', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:39', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000359', '0360', '测试160号', '127.0.1.160', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000360', '0361', '测试161号', '127.0.1.161', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000361', '0362', '测试162号', '127.0.1.162', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000362', '0363', '测试163号', '127.0.1.163', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000363', '0364', '测试164号', '127.0.1.164', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000364', '0365', '测试165号', '127.0.1.165', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000365', '0366', '测试166号', '127.0.1.166', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000366', '0367', '测试167号', '127.0.1.167', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:40', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000367', '0368', '测试168号', '127.0.1.168', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000368', '0369', '测试169号', '127.0.1.169', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000369', '0370', '测试170号', '127.0.1.170', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000370', '0371', '测试171号', '127.0.1.171', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000371', '0372', '测试172号', '127.0.1.172', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000372', '0373', '测试173号', '127.0.1.173', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000373', '0374', '测试174号', '127.0.1.174', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000374', '0375', '测试175号', '127.0.1.175', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000375', '0376', '测试176号', '127.0.1.176', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:41', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000376', '0377', '测试177号', '127.0.1.177', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000377', '0378', '测试178号', '127.0.1.178', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000378', '0379', '测试179号', '127.0.1.179', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000379', '0380', '测试180号', '127.0.1.180', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000380', '0381', '测试181号', '127.0.1.181', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000381', '0382', '测试182号', '127.0.1.182', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000382', '0383', '测试183号', '127.0.1.183', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000383', '0384', '测试184号', '127.0.1.184', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000384', '0385', '测试185号', '127.0.1.185', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:42', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000385', '0386', '测试186号', '127.0.1.186', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000386', '0387', '测试187号', '127.0.1.187', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000387', '0388', '测试188号', '127.0.1.188', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000388', '0389', '测试189号', '127.0.1.189', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000389', '0390', '测试190号', '127.0.1.190', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000390', '0391', '测试191号', '127.0.1.191', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000391', '0392', '测试192号', '127.0.1.192', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000392', '0393', '测试193号', '127.0.1.193', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000393', '0394', '测试194号', '127.0.1.194', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:43', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000394', '0395', '测试195号', '127.0.1.195', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000395', '0396', '测试196号', '127.0.1.196', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000396', '0397', '测试197号', '127.0.1.197', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000397', '0398', '测试198号', '127.0.1.198', '1', '1', '100005', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000398', '0399', '测试199号', '127.0.1.199', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000399', '0400', '测试200号', '127.0.1.200', '1', '1', '100006', '0', null, null, '0', 'admin', '2020-03-29 15:52:44', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000400', '1234', '测试601', '127.0.2.1', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:12', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000401', '1235', '测试602', '127.0.2.2', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:12', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000402', '1236', '测试603', '127.0.2.3', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:12', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000403', '1237', '测试604', '127.0.2.4', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:12', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000404', '1238', '测试605', '127.0.2.5', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:12', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000405', '1239', '测试606', '127.0.2.6', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000406', '1240', '测试607', '127.0.2.7', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000407', '1241', '测试608', '127.0.2.8', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000408', '1242', '测试609', '127.0.2.9', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000409', '1243', '测试610', '127.0.2.10', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000410', '1244', '测试611', '127.0.2.11', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000411', '1245', '测试612', '127.0.2.12', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000412', '1246', '测试613', '127.0.2.13', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000413', '1247', '测试614', '127.0.2.14', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:13', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000414', '1248', '测试615', '127.0.2.15', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000415', '1249', '测试616', '127.0.2.16', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000416', '1250', '测试617', '127.0.2.17', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000417', '1251', '测试618', '127.0.2.18', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000418', '1252', '测试619', '127.0.2.19', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
INSERT INTO `work_terminal` VALUES ('1000000419', '1253', '测试620', '127.0.2.20', '1', '1', '100002', '0', null, null, '0', 'admin', '2020-03-29 15:54:14', null, '2', null);
