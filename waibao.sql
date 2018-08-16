/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : waibao

Target Server Type    : MYSQL
Target Server Version : 100119
File Encoding         : 65001

Date: 2018-08-16 10:21:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hisi_admin_annex
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_annex`;
CREATE TABLE `hisi_admin_annex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的数据ID',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `group` varchar(100) NOT NULL DEFAULT 'sys' COMMENT '文件分组',
  `file` varchar(255) NOT NULL COMMENT '上传文件',
  `hash` varchar(64) NOT NULL COMMENT '文件hash值',
  `size` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '附件大小KB',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用，1已使用)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[系统] 上传附件';

-- ----------------------------
-- Records of hisi_admin_annex
-- ----------------------------

-- ----------------------------
-- Table structure for hisi_admin_annex_group
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_annex_group`;
CREATE TABLE `hisi_admin_annex_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '附件分组',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `size` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '附件大小kb',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 附件分组';

-- ----------------------------
-- Records of hisi_admin_annex_group
-- ----------------------------
INSERT INTO `hisi_admin_annex_group` VALUES ('1', 'sys', '0', '0.00');

-- ----------------------------
-- Table structure for hisi_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_config`;
CREATE TABLE `hisi_admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统配置(1是，0否)',
  `group` varchar(20) NOT NULL DEFAULT 'base' COMMENT '分组',
  `title` varchar(20) NOT NULL COMMENT '配置标题',
  `name` varchar(50) NOT NULL COMMENT '配置名称，由英文字母和下划线组成',
  `value` text NOT NULL COMMENT '配置值',
  `type` varchar(20) NOT NULL DEFAULT 'input' COMMENT '配置类型()',
  `options` text NOT NULL COMMENT '配置项(选项名:选项值)',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件上传接口',
  `tips` varchar(255) NOT NULL COMMENT '配置提示',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='[系统] 系统配置';

-- ----------------------------
-- Records of hisi_admin_config
-- ----------------------------
INSERT INTO `hisi_admin_config` VALUES ('1', '1', 'sys', '扩展配置分组', 'config_group', '', 'array', ' ', '', '请按如下格式填写：&lt;br&gt;键值:键名&lt;br&gt;键值:键名&lt;br&gt;&lt;span style=&quot;color:#f00&quot;&gt;键值只能为英文、数字、下划线&lt;/span&gt;', '1', '1', '1492140215', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('13', '1', 'base', '网站域名', 'site_domain', '', 'input', '', '', '', '2', '1', '1492140215', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('14', '1', 'upload', '图片上传大小限制', 'upload_image_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', '3', '1', '1490841797', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('15', '1', 'upload', '允许上传图片格式', 'upload_image_ext', 'jpg,png,gif,jpeg,ico', 'input', '', '', '多个格式请用英文逗号（,）隔开', '4', '1', '1490842130', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('16', '1', 'upload', '缩略图裁剪方式', 'thumb_type', '2', 'select', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放\r\n', '', '', '5', '1', '1490842450', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('17', '1', 'upload', '图片水印开关', 'image_watermark', '1', 'switch', '0:关闭\r\n1:开启', '', '', '6', '1', '1490842583', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('18', '1', 'upload', '图片水印图', 'image_watermark_pic', '', 'image', '', '', '', '7', '1', '1490842679', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('19', '1', 'upload', '图片水印透明度', 'image_watermark_opacity', '50', 'input', '', '', '可设置值为0~100，数字越小，透明度越高', '8', '1', '1490857704', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('20', '1', 'upload', '图片水印图位置', 'image_watermark_location', '9', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', '9', '1', '1490858228', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('21', '1', 'upload', '文件上传大小限制', 'upload_file_size', '0', 'input', '', '', '单位：KB，0表示不限制大小', '1', '1', '1490859167', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('22', '1', 'upload', '允许上传文件格式', 'upload_file_ext', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip', 'input', '', '', '多个格式请用英文逗号（,）隔开', '2', '1', '1490859246', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('23', '1', 'upload', '文字水印开关', 'text_watermark', '0', 'switch', '0:关闭\r\n1:开启', '', '', '10', '1', '1490860872', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('24', '1', 'upload', '文字水印内容', 'text_watermark_content', '', 'input', '', '', '', '11', '1', '1490861005', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('25', '1', 'upload', '文字水印字体', 'text_watermark_font', '', 'file', '', '', '不上传将使用系统默认字体', '12', '1', '1490861117', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('26', '1', 'upload', '文字水印字体大小', 'text_watermark_size', '20', 'input', '', '', '单位：px(像素)', '13', '1', '1490861204', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('27', '1', 'upload', '文字水印颜色', 'text_watermark_color', '#000000', 'input', '', '', '文字水印颜色，格式:#000000', '14', '1', '1490861482', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('28', '1', 'upload', '文字水印位置', 'text_watermark_location', '7', 'select', '7:左下角\r\n1:左上角\r\n4:左居中\r\n9:右下角\r\n3:右上角\r\n6:右居中\r\n2:上居中\r\n8:下居中\r\n5:居中', '', '', '11', '1', '1490861718', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('29', '1', 'upload', '缩略图尺寸', 'thumb_size', '300x300;500x500', 'input', '', '', '为空则不生成，生成 500x500 的缩略图，则填写 500x500，多个规格填写参考 300x300;500x500;800x800', '4', '1', '1490947834', '1491040778');
INSERT INTO `hisi_admin_config` VALUES ('30', '1', 'develop', '开发模式', 'app_debug', '1', 'switch', '0:关闭\r\n1:开启', '', '', '0', '1', '1491005004', '1492093874');
INSERT INTO `hisi_admin_config` VALUES ('31', '1', 'develop', '页面Trace', 'app_trace', '0', 'switch', '0:关闭\r\n1:开启', '', '', '0', '1', '1491005081', '1492093874');
INSERT INTO `hisi_admin_config` VALUES ('33', '1', 'sys', '富文本编辑器', 'editor', 'umeditor', 'select', 'ueditor:UEditor\r\numeditor:UMEditor\r\nkindeditor:KindEditor\r\nckeditor:CKEditor', '', '', '2', '1', '1491142648', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('35', '1', 'databases', '备份目录', 'backup_path', './backup/database/', 'input', '', '', '数据库备份路径,路径必须以 / 结尾', '0', '1', '1491881854', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('36', '1', 'databases', '备份分卷大小', 'part_size', '20971520', 'input', '', '', '用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '0', '1', '1491881975', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('37', '1', 'databases', '备份压缩开关', 'compress', '1', 'switch', '0:关闭\r\n1:开启', '', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '0', '1', '1491882038', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('38', '1', 'databases', '备份压缩级别', 'compress_level', '4', 'radio', '1:最低\r\n4:一般\r\n9:最高', '', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '0', '1', '1491882154', '1491965974');
INSERT INTO `hisi_admin_config` VALUES ('39', '1', 'base', '网站状态', 'site_status', '1', 'switch', '0:关闭\r\n1:开启', '', '站点关闭后将不能访问，后台可正常登录', '1', '1', '1492049460', '1494690024');
INSERT INTO `hisi_admin_config` VALUES ('40', '1', 'sys', '后台管理路径', 'admin_path', 'admin.php', 'input', '', '', '必须以.php为后缀', '0', '1', '1492139196', '1492140215');
INSERT INTO `hisi_admin_config` VALUES ('41', '1', 'base', '网站标题', 'site_title', 'HisiPHP应用市场', 'input', '', '', '网站标题是体现一个网站的主旨，要做到主题突出、标题简洁、连贯等特点，建议不超过28个字', '6', '1', '1492502354', '1494695131');
INSERT INTO `hisi_admin_config` VALUES ('42', '1', 'base', '网站关键词', 'site_keywords', 'hisiphp,hisiphp框架,php开源框架', 'input', '', '', '网页内容所包含的核心搜索关键词，多个关键字请用英文逗号&quot;,&quot;分隔', '7', '1', '1494690508', '1494690780');
INSERT INTO `hisi_admin_config` VALUES ('43', '1', 'base', '网站描述', 'site_description', '', 'textarea', '', '', '网页的描述信息，搜索引擎采纳后，作为搜索结果中的页面摘要显示，建议不超过80个字', '8', '1', '1494690669', '1494691075');
INSERT INTO `hisi_admin_config` VALUES ('44', '1', 'base', 'ICP备案信息', 'site_icp', '', 'input', '', '', '请填写ICP备案号，用于展示在网站底部，ICP备案官网：&lt;a href=&quot;http://www.miibeian.gov.cn&quot; target=&quot;_blank&quot;&gt;http://www.miibeian.gov.cn&lt;/a&gt;', '9', '1', '1494691721', '1494692046');
INSERT INTO `hisi_admin_config` VALUES ('45', '1', 'base', '站点统计代码', 'site_statis', '', 'textarea', '', '', '第三方流量统计代码，前台调用时请先用 htmlspecialchars_decode函数转义输出', '10', '1', '1494691959', '1494694797');
INSERT INTO `hisi_admin_config` VALUES ('46', '1', 'base', '网站名称', 'site_name', 'HisiPHP', 'input', '', '', '将显示在浏览器窗口标题等位置', '3', '1', '1494692103', '1494694680');
INSERT INTO `hisi_admin_config` VALUES ('47', '1', 'base', '网站LOGO', 'site_logo', '', 'image', '', '', '网站LOGO图片', '4', '1', '1494692345', '1494693235');
INSERT INTO `hisi_admin_config` VALUES ('48', '1', 'base', '网站图标', 'site_favicon', '', 'image', '', '/admin/annex/favicon', '又叫网站收藏夹图标，它显示位于浏览器的地址栏或者标题前面，&lt;strong class=&quot;red&quot;&gt;.ico格式&lt;/strong&gt;，&lt;a href=&quot;https://www.baidu.com/s?ie=UTF-8&amp;wd=favicon&quot; target=&quot;_blank&quot;&gt;点此了解网站图标&lt;/a&gt;', '5', '1', '1494692781', '1494693966');
INSERT INTO `hisi_admin_config` VALUES ('49', '1', 'base', '手机网站', 'wap_site_status', '0', 'switch', '0:关闭\r\n1:开启', '', '如果有手机网站，请设置为开启状态，否则只显示PC网站', '2', '1', '1498405436', '1498405436');
INSERT INTO `hisi_admin_config` VALUES ('50', '1', 'sys', '云端推送', 'cloud_push', '0', 'switch', '0:关闭\r\n1:开启', '', '关闭之后，无法通过云端推送安装扩展', '3', '1', '1504250320', '1504250320');
INSERT INTO `hisi_admin_config` VALUES ('51', '0', 'base', '手机网站域名', 'wap_domain', '', 'input', '', '', '手机访问将自动跳转至此域名', '2', '1', '1504304776', '1504304837');
INSERT INTO `hisi_admin_config` VALUES ('52', '0', 'sys', '多语言支持', 'multi_language', '0', 'switch', '0:关闭\r\n1:开启', '', '开启后你可以自由上传多种语言包', '4', '1', '1506532211', '1506532211');

-- ----------------------------
-- Table structure for hisi_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_hook`;
CREATE TABLE `hisi_admin_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统插件',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子来源[plugins.插件名，module.模块名]',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '钩子简介',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子表';

-- ----------------------------
-- Records of hisi_admin_hook
-- ----------------------------
INSERT INTO `hisi_admin_hook` VALUES ('1', '1', 'system_admin_index', '', '后台首页', '1', '1490885108', '1490885108');
INSERT INTO `hisi_admin_hook` VALUES ('2', '1', 'system_admin_tips', '', '后台所有页面提示', '1', '1490885108', '1490885108');
INSERT INTO `hisi_admin_hook` VALUES ('3', '1', 'system_annex_upload', '', '附件上传钩子，可扩展上传到第三方存储', '1', '1490885108', '1490885108');
INSERT INTO `hisi_admin_hook` VALUES ('4', '1', 'system_member_login', '', '会员登陆成功之后的动作', '1', '1490885108', '1490885108');
INSERT INTO `hisi_admin_hook` VALUES ('5', '1', 'system_member_register', '', '会员注册成功后的动作', '1', '1490885108', '1490885108');

-- ----------------------------
-- Table structure for hisi_admin_hook_plugins
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_hook_plugins`;
CREATE TABLE `hisi_admin_hook_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL COMMENT '钩子id',
  `plugins` varchar(32) NOT NULL COMMENT '插件标识',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 钩子-插件对应表';

-- ----------------------------
-- Records of hisi_admin_hook_plugins
-- ----------------------------
INSERT INTO `hisi_admin_hook_plugins` VALUES ('1', 'system_admin_index', 'hisiphp', '1510063011', '1510063011', '0', '1');

-- ----------------------------
-- Table structure for hisi_admin_language
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_language`;
CREATE TABLE `hisi_admin_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '语言包名称',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
  `locale` varchar(255) NOT NULL DEFAULT '' COMMENT '本地浏览器语言编码',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标',
  `pack` varchar(100) NOT NULL DEFAULT '' COMMENT '上传的语言包',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 语言包';

-- ----------------------------
-- Records of hisi_admin_language
-- ----------------------------
INSERT INTO `hisi_admin_language` VALUES ('1', '简体中文', 'zh-cn', 'zh-CN,zh-CN.UTF-8,zh-cn', '', '1', '1', '1');

-- ----------------------------
-- Table structure for hisi_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_log`;
CREATE TABLE `hisi_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `param` text,
  `remark` varchar(255) DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(128) DEFAULT '',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='[系统] 操作日志';

-- ----------------------------
-- Records of hisi_admin_log
-- ----------------------------
INSERT INTO `hisi_admin_log` VALUES ('44', '1', '系统日志', 'admin/log/index', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', '4', '192.168.1.174', '1534320641', '1534320773');
INSERT INTO `hisi_admin_log` VALUES ('45', '1', '数据库管理', 'admin/database/index', '[]', '浏览数据', '1', '192.168.1.174', '1534320647', '1534320647');
INSERT INTO `hisi_admin_log` VALUES ('46', '1', '会员等级', 'admin/member/level', '{\"page\":\"1\",\"limit\":\"10\"}', '浏览数据', '2', '192.168.1.174', '1534320652', '1534320653');
INSERT INTO `hisi_admin_log` VALUES ('47', '1', '在线升级', 'admin/upgrade/index', '[]', '浏览数据', '1', '192.168.1.174', '1534320721', '1534320721');
INSERT INTO `hisi_admin_log` VALUES ('48', '1', '钩子管理', 'admin/hook/index', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', '2', '192.168.1.174', '1534320743', '1534320744');
INSERT INTO `hisi_admin_log` VALUES ('49', '1', '插件管理', 'admin/plugins/index', '[]', '浏览数据', '1', '192.168.1.174', '1534320745', '1534320745');
INSERT INTO `hisi_admin_log` VALUES ('50', '1', '设计插件', 'admin/plugins/design', '[]', '浏览数据', '1', '192.168.1.174', '1534320750', '1534320750');
INSERT INTO `hisi_admin_log` VALUES ('51', '1', '系统管理员', 'admin/user/index', '{\"page\":\"1\",\"limit\":\"20\"}', '浏览数据', '2', '192.168.1.174', '1534320775', '1534320776');
INSERT INTO `hisi_admin_log` VALUES ('52', '1', '系统菜单', 'admin/menu/index', '[]', '浏览数据', '1', '192.168.1.174', '1534320781', '1534320781');
INSERT INTO `hisi_admin_log` VALUES ('53', '1', '配置管理', 'admin/config/index', '{\"page\":\"1\",\"limit\":\"20\",\"group\":\"base\"}', '浏览数据', '12', '192.168.1.174', '1534320785', '1534320802');
INSERT INTO `hisi_admin_log` VALUES ('54', '1', '系统设置', 'admin/system/index', '[]', '浏览数据', '1', '192.168.1.174', '1534320805', '1534320805');
INSERT INTO `hisi_admin_log` VALUES ('55', '1', '系统配置', 'admin/system/index', '{\"group\":\"sys\"}', '浏览数据', '2', '192.168.1.174', '1534320810', '1534320829');
INSERT INTO `hisi_admin_log` VALUES ('56', '1', '上传配置', 'admin/system/index', '{\"group\":\"upload\"}', '浏览数据', '1', '192.168.1.174', '1534320830', '1534320830');
INSERT INTO `hisi_admin_log` VALUES ('57', '1', '开发配置', 'admin/system/index', '{\"group\":\"develop\"}', '浏览数据', '1', '192.168.1.174', '1534320841', '1534320841');
INSERT INTO `hisi_admin_log` VALUES ('58', '1', '数据库配置', 'admin/system/index', '{\"group\":\"databases\"}', '浏览数据', '1', '192.168.1.174', '1534320846', '1534320846');
INSERT INTO `hisi_admin_log` VALUES ('59', '1', '后台首页', 'admin/index/index', '[]', '浏览数据', '1', '192.168.1.174', '1534330472', '1534330472');
INSERT INTO `hisi_admin_log` VALUES ('60', '1', '后台首页', 'admin/index/welcome', '[]', '浏览数据', '1', '192.168.1.174', '1534330473', '1534330473');

-- ----------------------------
-- Table structure for hisi_admin_member
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_member`;
CREATE TABLE `hisi_admin_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级ID',
  `nick` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用金额',
  `frozen_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `income` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收入统计',
  `expend` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开支统计',
  `exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `frozen_integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '冻结积分',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别(1男，0女)',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `last_login_ip` varchar(128) NOT NULL DEFAULT '' COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间(0永久)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0禁用，1正常)',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 会员表';

-- ----------------------------
-- Records of hisi_admin_member
-- ----------------------------
INSERT INTO `hisi_admin_member` VALUES ('1000000', '1', '', 'test', '0', '', '$2y$10$WC0mMyErW1u1JCLXDCbTIuagCceC/kKpjzvCf.cxrVKaxsrZLXrGe', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '1', '', '', '0', '0', '0', '1', '1493274686');

-- ----------------------------
-- Table structure for hisi_admin_member_level
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_member_level`;
CREATE TABLE `hisi_admin_member_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '等级名称',
  `min_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小经验值',
  `max_exper` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大经验值',
  `discount` int(2) unsigned NOT NULL DEFAULT '100' COMMENT '折扣率(%)',
  `intro` varchar(255) NOT NULL COMMENT '等级简介',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认等级',
  `expire` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员有效期(天)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 会员等级';

-- ----------------------------
-- Records of hisi_admin_member_level
-- ----------------------------
INSERT INTO `hisi_admin_member_level` VALUES ('1', '注册会员', '0', '0', '100', '', '1', '0', '1', '0', '1491966814');

-- ----------------------------
-- Table structure for hisi_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_menu`;
CREATE TABLE `hisi_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID(快捷菜单专用)',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL COMMENT '模块名或插件名，插件名格式:plugins.插件名',
  `title` varchar(20) NOT NULL COMMENT '菜单标题',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-shezhi' COMMENT '菜单图标',
  `url` varchar(200) NOT NULL COMMENT '链接地址(模块/控制器/方法)',
  `param` varchar(200) NOT NULL DEFAULT '' COMMENT '扩展参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '打开方式(_blank,_self)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `debug` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开发模式可见',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `nav` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为菜单显示，1显示0不显示',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1显示，0隐藏',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 管理菜单';

-- ----------------------------
-- Records of hisi_admin_menu
-- ----------------------------
INSERT INTO `hisi_admin_menu` VALUES ('1', '0', '0', 'admin', '首页', '', 'admin/index', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('2', '0', '0', 'admin', '系统', '', 'admin/system', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('3', '0', '0', 'admin', '插件', 'aicon ai-shezhi', 'admin/plugins', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('4', '0', '1', 'admin', '快捷菜单', 'aicon ai-caidan', 'admin/quick', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('5', '0', '3', 'admin', '插件列表', 'aicon ai-mokuaiguanli', 'admin/plugins', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('6', '0', '2', 'admin', '系统功能', 'aicon ai-gongneng', 'admin/system', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('7', '0', '2', 'admin', '会员管理', 'aicon ai-huiyuanliebiao', 'admin/member', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('8', '0', '2', 'admin', '系统扩展', 'aicon ai-shezhi', 'admin/extend', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('9', '0', '2', 'admin', '开发专用', 'aicon ai-doubleleft', 'admin/develop', '', '_self', '4', '1', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('10', '0', '6', 'admin', '系统设置', 'aicon ai-icon01', 'admin/system/index', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('11', '0', '6', 'admin', '配置管理', 'aicon ai-peizhiguanli', 'admin/config/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('12', '0', '6', 'admin', '系统菜单', 'aicon ai-systemmenu', 'admin/menu/index', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('13', '0', '6', 'admin', '管理员角色', '', 'admin/user/role', '', '_self', '4', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('14', '0', '6', 'admin', '系统管理员', 'aicon ai-tubiao05', 'admin/user/index', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('15', '0', '6', 'admin', '系统日志', 'aicon ai-xitongrizhi-tiaoshi', 'admin/log/index', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('16', '0', '6', 'admin', '附件管理', '', 'admin/annex/index', '', '_self', '7', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('17', '0', '8', 'admin', '模块管理', 'aicon ai-mokuaiguanli1', 'admin/module/index', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('18', '0', '8', 'admin', '插件管理', 'aicon ai-chajianguanli', 'admin/plugins/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('19', '0', '8', 'admin', '钩子管理', 'aicon ai-icon-test', 'admin/hook/index', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('20', '0', '7', 'admin', '会员等级', 'aicon ai-huiyuandengji', 'admin/member/level', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('21', '0', '7', 'admin', '会员列表', 'aicon ai-huiyuanliebiao', 'admin/member/index', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('22', '0', '9', 'admin', '[示例]列表模板', '', 'admin/develop/lists', '', '_self', '1', '1', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('23', '0', '9', 'admin', '[示例]编辑模板', '', 'admin/develop/edit', '', '_self', '2', '1', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('24', '0', '4', 'admin', '后台首页', '', 'admin/index/index', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('25', '0', '4', 'admin', '清空缓存', '', 'admin/index/clear', '', '_self', '2', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('26', '0', '12', 'admin', '添加菜单', '', 'admin/menu/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('27', '0', '12', 'admin', '修改菜单', '', 'admin/menu/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('28', '0', '12', 'admin', '删除菜单', '', 'admin/menu/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('29', '0', '12', 'admin', '状态设置', '', 'admin/menu/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('30', '0', '12', 'admin', '排序设置', '', 'admin/menu/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('31', '0', '12', 'admin', '添加快捷菜单', '', 'admin/menu/quick', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('32', '0', '12', 'admin', '导出菜单', '', 'admin/menu/export', '', '_self', '7', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('33', '0', '13', 'admin', '添加角色', '', 'admin/user/addrole', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('34', '0', '13', 'admin', '修改角色', '', 'admin/user/editrole', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('35', '0', '13', 'admin', '删除角色', '', 'admin/user/delrole', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('36', '0', '13', 'admin', '状态设置', '', 'admin/user/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('37', '0', '14', 'admin', '添加管理员', '', 'admin/user/adduser', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('38', '0', '14', 'admin', '修改管理员', '', 'admin/user/edituser', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('39', '0', '14', 'admin', '删除管理员', '', 'admin/user/deluser', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('40', '0', '14', 'admin', '状态设置', '', 'admin/user/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('41', '0', '14', 'admin', '个人信息设置', '', 'admin/user/info', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('42', '0', '18', 'admin', '安装插件', '', 'admin/plugins/install', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('43', '0', '18', 'admin', '卸载插件', '', 'admin/plugins/uninstall', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('44', '0', '18', 'admin', '删除插件', '', 'admin/plugins/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('45', '0', '18', 'admin', '状态设置', '', 'admin/plugins/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('46', '0', '18', 'admin', '设计插件', '', 'admin/plugins/design', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('47', '0', '18', 'admin', '运行插件', '', 'admin/plugins/run', '', '_self', '6', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('48', '0', '18', 'admin', '更新插件', '', 'admin/plugins/update', '', '_self', '7', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('49', '0', '18', 'admin', '插件配置', '', 'admin/plugins/setting', '', '_self', '8', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('50', '0', '19', 'admin', '添加钩子', '', 'admin/hook/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('51', '0', '19', 'admin', '修改钩子', '', 'admin/hook/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('52', '0', '19', 'admin', '删除钩子', '', 'admin/hook/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('53', '0', '19', 'admin', '状态设置', '', 'admin/hook/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('54', '0', '19', 'admin', '插件排序', '', 'admin/hook/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('55', '0', '11', 'admin', '添加配置', '', 'admin/config/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('56', '0', '11', 'admin', '修改配置', '', 'admin/config/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('57', '0', '11', 'admin', '删除配置', '', 'admin/config/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('58', '0', '11', 'admin', '状态设置', '', 'admin/config/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('59', '0', '11', 'admin', '排序设置', '', 'admin/config/sort', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('60', '0', '10', 'admin', '基础配置', '', 'admin/system/index', 'group=base', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('61', '0', '10', 'admin', '系统配置', '', 'admin/system/index', 'group=sys', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('62', '0', '10', 'admin', '上传配置', '', 'admin/system/index', 'group=upload', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('63', '0', '10', 'admin', '开发配置', '', 'admin/system/index', 'group=develop', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('64', '0', '17', 'admin', '设计模块', '', 'admin/module/design', '', '_self', '6', '1', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('65', '0', '17', 'admin', '安装模块', '', 'admin/module/install', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('66', '0', '17', 'admin', '卸载模块', '', 'admin/module/uninstall', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('67', '0', '17', 'admin', '状态设置', '', 'admin/module/status', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('68', '0', '17', 'admin', '设置默认模块', '', 'admin/module/setdefault', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('69', '0', '17', 'admin', '删除模块', '', 'admin/module/del', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('70', '0', '21', 'admin', '添加会员', '', 'admin/member/add', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('71', '0', '21', 'admin', '修改会员', '', 'admin/member/edit', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('72', '0', '21', 'admin', '删除会员', '', 'admin/member/del', '', '_self', '3', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('73', '0', '21', 'admin', '状态设置', '', 'admin/member/status', '', '_self', '4', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('74', '0', '21', 'admin', '[弹窗]会员选择', '', 'admin/member/pop', '', '_self', '5', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('75', '0', '20', 'admin', '添加会员等级', '', 'admin/member/addlevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('76', '0', '20', 'admin', '修改会员等级', '', 'admin/member/editlevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('77', '0', '20', 'admin', '删除会员等级', '', 'admin/member/dellevel', '', '_self', '0', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('78', '0', '16', 'admin', '附件上传', '', 'admin/annex/upload', '', '_self', '1', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('79', '0', '16', 'admin', '删除附件', '', 'admin/annex/del', '', '_self', '2', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('80', '0', '8', 'admin', '在线升级', 'aicon ai-iconfontshengji', 'admin/upgrade/index', '', '_self', '4', '0', '1', '1', '1', '1491352728');
INSERT INTO `hisi_admin_menu` VALUES ('81', '0', '80', 'admin', '获取升级列表', '', 'admin/upgrade/lists', '', '_self', '0', '0', '1', '1', '1', '1491353504');
INSERT INTO `hisi_admin_menu` VALUES ('82', '0', '80', 'admin', '安装升级包', '', 'admin/upgrade/install', '', '_self', '0', '0', '1', '1', '1', '1491353568');
INSERT INTO `hisi_admin_menu` VALUES ('83', '0', '80', 'admin', '下载升级包', '', 'admin/upgrade/download', '', '_self', '0', '0', '1', '1', '1', '1491395830');
INSERT INTO `hisi_admin_menu` VALUES ('84', '0', '6', 'admin', '数据库管理', 'aicon ai-shujukuguanli', 'admin/database/index', '', '_self', '8', '0', '1', '1', '1', '1491461136');
INSERT INTO `hisi_admin_menu` VALUES ('85', '0', '84', 'admin', '备份数据库', '', 'admin/database/export', '', '_self', '0', '0', '1', '1', '1', '1491461250');
INSERT INTO `hisi_admin_menu` VALUES ('86', '0', '84', 'admin', '恢复数据库', '', 'admin/database/import', '', '_self', '0', '0', '1', '1', '1', '1491461315');
INSERT INTO `hisi_admin_menu` VALUES ('87', '0', '84', 'admin', '优化数据库', '', 'admin/database/optimize', '', '_self', '0', '0', '1', '1', '1', '1491467000');
INSERT INTO `hisi_admin_menu` VALUES ('88', '0', '84', 'admin', '删除备份', '', 'admin/database/del', '', '_self', '0', '0', '1', '1', '1', '1491467058');
INSERT INTO `hisi_admin_menu` VALUES ('89', '0', '84', 'admin', '修复数据库', '', 'admin/database/repair', '', '_self', '0', '0', '1', '1', '1', '1491880879');
INSERT INTO `hisi_admin_menu` VALUES ('90', '0', '21', 'admin', '设置默认等级', '', 'admin/member/setdefault', '', '_self', '0', '0', '1', '1', '1', '1491966585');
INSERT INTO `hisi_admin_menu` VALUES ('91', '0', '10', 'admin', '数据库配置', '', 'admin/system/index', 'group=databases', '_self', '5', '0', '1', '0', '1', '1492072213');
INSERT INTO `hisi_admin_menu` VALUES ('92', '0', '17', 'admin', '模块打包', '', 'admin/module/package', '', '_self', '7', '0', '1', '1', '1', '1492134693');
INSERT INTO `hisi_admin_menu` VALUES ('93', '0', '18', 'admin', '插件打包', '', 'admin/plugins/package', '', '_self', '0', '0', '1', '1', '1', '1492134743');
INSERT INTO `hisi_admin_menu` VALUES ('94', '0', '17', 'admin', '主题管理', '', 'admin/module/theme', '', '_self', '8', '0', '1', '1', '1', '1492433470');
INSERT INTO `hisi_admin_menu` VALUES ('95', '0', '17', 'admin', '设置默认主题', '', 'admin/module/setdefaulttheme', '', '_self', '9', '0', '1', '1', '1', '1492433618');
INSERT INTO `hisi_admin_menu` VALUES ('96', '0', '17', 'admin', '删除主题', '', 'admin/module/deltheme', '', '_self', '10', '0', '1', '1', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('97', '0', '6', 'admin', '语言包管理', '', 'admin/language/index', '', '_self', '11', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('98', '0', '97', 'admin', '添加语言包', '', 'admin/language/add', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('99', '0', '97', 'admin', '修改语言包', '', 'admin/language/edit', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('100', '0', '97', 'admin', '删除语言包', '', 'admin/language/del', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('101', '0', '97', 'admin', '排序设置', '', 'admin/language/sort', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('102', '0', '97', 'admin', '状态设置', '', 'admin/language/status', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('103', '0', '16', 'admin', '收藏夹图标上传', '', 'admin/annex/favicon', '', '_self', '3', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('104', '0', '17', 'admin', '导入模块', '', 'admin/module/import', '', '_self', '11', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('105', '0', '4', 'admin', '后台首页', '', 'admin/index/welcome', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('106', '0', '4', 'admin', '布局切换', '', 'admin/user/iframe', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('107', '0', '15', 'admin', '删除日志', '', 'admin/log/del', 'table=admin_log', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('108', '0', '15', 'admin', '清空日志', '', 'admin/log/clear', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('109', '0', '17', 'admin', '编辑模块', '', 'admin/module/edit', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('110', '0', '17', 'admin', '模块图标上传', '', 'admin/module/icon', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('111', '0', '18', 'admin', '导入插件', '', 'admin/plugins/import', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('112', '0', '19', 'admin', '钩子插件状态', '', 'admin/hook/hookPluginsStatus', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('113', '0', '4', 'admin', '设置主题', '', 'admin/user/setTheme', '', '_self', '100', '0', '1', '0', '1', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('114', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('115', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('116', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('117', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('118', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('119', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('120', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('121', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('122', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('123', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('124', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('125', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('126', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('127', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('128', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('129', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('130', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('131', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('132', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('133', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('134', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('135', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('136', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('137', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('138', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('139', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('140', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('141', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('142', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('143', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('144', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('145', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('146', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('147', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('148', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('149', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('150', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('151', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('152', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('153', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('154', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('155', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('156', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('157', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('158', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('159', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('160', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('161', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('162', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('163', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('164', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('165', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('166', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('167', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('168', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('169', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('170', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('171', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('172', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('173', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('174', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('175', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('176', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('177', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('178', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('179', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('180', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('181', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('182', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('183', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('184', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('185', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('186', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('187', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('188', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('189', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('190', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('191', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('192', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('193', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('194', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('195', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('196', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('197', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('198', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('199', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('200', '0', '4', 'admin', '预留占位', '', '', '', '_self', '100', '0', '1', '1', '0', '1490315067');
INSERT INTO `hisi_admin_menu` VALUES ('203', '1', '4', 'admin', '模块管理', 'aicon ai-mokuaiguanli1', 'admin/module/index', '', '_self', '1', '0', '0', '1', '1', '1534316153');
INSERT INTO `hisi_admin_menu` VALUES ('204', '0', '0', 'test', '测试模块', 'aicon ai-shezhi', 'test', '', '_self', '100', '0', '0', '1', '1', '1534316957');

-- ----------------------------
-- Table structure for hisi_admin_menu_lang
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_menu_lang`;
CREATE TABLE `hisi_admin_menu_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `lang` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '语言包',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hisi_admin_menu_lang
-- ----------------------------
INSERT INTO `hisi_admin_menu_lang` VALUES ('131', '1', '首页', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('132', '2', '系统', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('133', '3', '插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('134', '4', '快捷菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('135', '5', '插件列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('136', '6', '系统功能', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('137', '7', '会员管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('138', '8', '系统扩展', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('139', '9', '开发专用', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('140', '10', '系统设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('141', '11', '配置管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('142', '12', '系统菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('143', '13', '管理员角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('144', '14', '系统管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('145', '15', '系统日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('146', '16', '附件管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('147', '17', '模块管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('148', '18', '插件管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('149', '19', '钩子管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('150', '20', '会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('151', '21', '会员列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('152', '22', '[示例]列表模板', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('153', '23', '[示例]编辑模板', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('154', '24', '后台首页', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('155', '25', '清空缓存', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('156', '26', '添加菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('157', '27', '修改菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('158', '28', '删除菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('159', '29', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('160', '30', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('161', '31', '添加快捷菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('162', '32', '导出菜单', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('163', '33', '添加角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('164', '34', '修改角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('165', '35', '删除角色', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('166', '36', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('167', '37', '添加管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('168', '38', '修改管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('169', '39', '删除管理员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('170', '40', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('171', '41', '个人信息设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('172', '42', '安装插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('173', '43', '卸载插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('174', '44', '删除插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('175', '45', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('176', '46', '设计插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('177', '47', '运行插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('178', '48', '更新插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('179', '49', '插件配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('180', '50', '添加钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('181', '51', '修改钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('182', '52', '删除钩子', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('183', '53', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('184', '54', '插件排序', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('185', '55', '添加配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('186', '56', '修改配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('187', '57', '删除配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('188', '58', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('189', '59', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('190', '60', '基础配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('191', '61', '系统配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('192', '62', '上传配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('193', '63', '开发配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('194', '64', '设计模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('195', '65', '安装模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('196', '66', '卸载模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('197', '67', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('198', '68', '设置默认模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('199', '69', '删除模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('200', '70', '添加会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('201', '71', '修改会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('202', '72', '删除会员', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('203', '73', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('204', '74', '[弹窗]会员选择', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('205', '75', '添加会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('206', '76', '修改会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('207', '77', '删除会员等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('208', '78', '附件上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('209', '79', '删除附件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('210', '80', '在线升级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('211', '81', '获取升级列表', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('212', '82', '安装升级包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('213', '83', '下载升级包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('214', '84', '数据库管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('215', '85', '备份数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('216', '86', '恢复数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('217', '87', '优化数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('218', '88', '删除备份', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('219', '89', '修复数据库', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('220', '90', '设置默认等级', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('221', '91', '数据库配置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('222', '92', '模块打包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('223', '93', '插件打包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('224', '94', '主题管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('225', '95', '设置默认主题', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('226', '96', '删除主题', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('227', '97', '语言包管理', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('228', '98', '添加语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('229', '99', '修改语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('230', '100', '删除语言包', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('231', '101', '排序设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('232', '102', '状态设置', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('233', '103', '收藏夹图标上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('234', '104', '导入模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('235', '105', '欢迎页面', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('236', '106', '布局切换', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('237', '107', '删除日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('238', '108', '清空日志', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('239', '109', '编辑模块', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('240', '110', '模块图标上传', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('241', '111', '导入插件', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('242', '112', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('243', '113', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('244', '114', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('245', '115', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('246', '116', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('247', '117', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('248', '118', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('249', '119', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('250', '120', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('251', '121', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('252', '122', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('253', '123', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('254', '124', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('255', '125', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('256', '126', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('257', '127', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('258', '128', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('259', '129', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('260', '130', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('261', '131', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('262', '132', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('263', '133', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('264', '134', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('265', '135', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('266', '136', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('267', '137', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('268', '138', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('269', '139', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('270', '140', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('271', '141', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('272', '142', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('273', '143', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('274', '144', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('275', '145', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('276', '146', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('277', '147', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('278', '148', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('279', '149', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('280', '150', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('281', '151', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('282', '152', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('283', '153', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('284', '154', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('285', '155', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('286', '156', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('287', '157', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('288', '158', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('289', '159', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('290', '160', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('291', '161', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('292', '162', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('293', '163', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('294', '164', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('295', '165', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('296', '166', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('297', '167', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('298', '168', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('299', '169', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('300', '170', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('301', '171', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('302', '172', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('303', '173', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('304', '174', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('305', '175', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('306', '176', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('307', '177', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('308', '178', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('309', '179', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('310', '180', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('311', '181', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('312', '182', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('313', '183', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('314', '184', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('315', '185', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('316', '186', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('317', '187', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('318', '188', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('319', '189', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('320', '190', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('321', '191', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('322', '192', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('323', '193', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('324', '194', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('325', '195', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('326', '196', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('327', '197', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('328', '198', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('329', '199', '预留占位', '1');
INSERT INTO `hisi_admin_menu_lang` VALUES ('330', '200', '预留占位', '1');

-- ----------------------------
-- Table structure for hisi_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_module`;
CREATE TABLE `hisi_admin_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统模块',
  `name` varchar(50) NOT NULL COMMENT '模块名(英文)',
  `identifier` varchar(100) NOT NULL COMMENT '模块标识(模块名(字母).开发者标识.module)',
  `title` varchar(50) NOT NULL COMMENT '模块标题',
  `intro` varchar(255) NOT NULL COMMENT '模块简介',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `icon` varchar(80) NOT NULL DEFAULT 'aicon ai-mokuaiguanli' COMMENT '图标',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未安装，1未启用，2已启用',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认模块(只能有一个)',
  `config` text NOT NULL COMMENT '配置',
  `app_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '应用市场ID(0本地)',
  `app_keys` varchar(200) DEFAULT '' COMMENT '应用秘钥',
  `theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '主题模板',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='[系统] 模块';

-- ----------------------------
-- Records of hisi_admin_module
-- ----------------------------
INSERT INTO `hisi_admin_module` VALUES ('1', '1', 'admin', 'admin.hisiphp.module', '系统管理模块', '系统核心模块，用于后台各项管理功能模块及功能拓展', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', '', 'default', '1489998096', '1489998096');
INSERT INTO `hisi_admin_module` VALUES ('2', '1', 'index', 'index.hisiphp.module', '系统默认模块', '仅供前端插件访问和应用市场推送安装，禁止在此模块下面开发任何东西。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', '', 'default', '1489998096', '1489998096');
INSERT INTO `hisi_admin_module` VALUES ('3', '1', 'install', 'install.hisiphp.module', '系统安装模块', '系统安装模块，勿动。', 'HisiPHP官方出品', '', '1.0.0', 'http://www.hisiphp.com', '0', '2', '0', '', '0', '', 'default', '1489998096', '1489998096');
INSERT INTO `hisi_admin_module` VALUES ('5', '0', 'api', 'api', '接口', '', '', '/static/app_icon/api.png', '1.0.0', '', '0', '1', '0', '', '0', '', 'default', '1534295450', '1534295450');
INSERT INTO `hisi_admin_module` VALUES ('6', '0', 'test', 'test.module', '测试模块', '这是个测试模块', '杨炎', '/static/app_icon/test.png', '1.0.0', '', '0', '2', '0', '', '0', '', 'default', '1534316943', '1534316943');

-- ----------------------------
-- Table structure for hisi_admin_plugins
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_plugins`;
CREATE TABLE `hisi_admin_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL COMMENT '插件名称(英文)',
  `title` varchar(32) NOT NULL COMMENT '插件标题',
  `icon` varchar(64) NOT NULL COMMENT '图标',
  `intro` text NOT NULL COMMENT '插件简介',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `url` varchar(255) NOT NULL COMMENT '作者主页',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `config` text NOT NULL COMMENT '插件配置',
  `app_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '应用市场ID(0本地)',
  `app_keys` varchar(200) DEFAULT '' COMMENT '应用秘钥',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='[系统] 插件表';

-- ----------------------------
-- Records of hisi_admin_plugins
-- ----------------------------
INSERT INTO `hisi_admin_plugins` VALUES ('1', '0', 'hisiphp', '系统基础信息', '/plugins/hisiphp/hisiphp.png', '后台首页展示系统基础信息和开发团队信息', 'HisiPHP', 'http://www.hisiphp.com', '1.0.0', 'hisiphp.hisiphp.plugins', '', '0', '', '1509379331', '1509379331', '0', '2');

-- ----------------------------
-- Table structure for hisi_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_role`;
CREATE TABLE `hisi_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(200) NOT NULL COMMENT '角色简介',
  `auth` text NOT NULL COMMENT '角色权限',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='[系统] 管理角色';

-- ----------------------------
-- Records of hisi_admin_role
-- ----------------------------
INSERT INTO `hisi_admin_role` VALUES ('1', '超级管理员', '拥有系统最高权限', '0', '1489411760', '0', '1');
INSERT INTO `hisi_admin_role` VALUES ('2', '系统管理员', '拥有系统管理员权限', '[\"1\",\"4\",\"25\",\"24\",\"2\",\"6\",\"10\",\"60\",\"61\",\"62\",\"63\",\"91\",\"11\",\"55\",\"56\",\"57\",\"58\",\"59\",\"12\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"13\",\"33\",\"34\",\"35\",\"36\",\"14\",\"37\",\"38\",\"39\",\"40\",\"41\",\"16\",\"78\",\"79\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"7\",\"20\",\"75\",\"76\",\"77\",\"21\",\"90\",\"70\",\"71\",\"72\",\"73\",\"74\",\"8\",\"17\",\"65\",\"66\",\"67\",\"68\",\"94\",\"95\",\"18\",\"42\",\"43\",\"45\",\"47\",\"48\",\"49\",\"19\",\"80\",\"81\",\"82\",\"83\",\"9\",\"22\",\"23\",\"3\",\"5\"]', '1489411760', '0', '1');

-- ----------------------------
-- Table structure for hisi_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `hisi_admin_user`;
CREATE TABLE `hisi_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL,
  `nick` varchar(50) NOT NULL COMMENT '昵称',
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `auth` text NOT NULL COMMENT '权限',
  `iframe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0默认，1框架',
  `theme` varchar(30) NOT NULL DEFAULT '0' COMMENT '主题',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `last_login_ip` varchar(128) NOT NULL COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='[系统] 管理用户';

-- ----------------------------
-- Records of hisi_admin_user
-- ----------------------------
INSERT INTO `hisi_admin_user` VALUES ('1', '1', 'admin', '$2y$10$sfyAzVYV/EXRt6bUZOg5huFLyCkyMGygK/3hU4OrpwYuCXkMieVe2', '超级管理员', '', '', '', '1', '0', '1', '192.168.1.174', '1534330468', '1534242250', '1534330468');
