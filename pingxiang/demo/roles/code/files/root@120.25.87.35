CREATE DATABASE pingxiang DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use pingxiang;


-- --------------------------------------------------------

--
-- 表的结构 `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '审核人id',
  `reason` varchar(255) COLLATE utf8_general_ci DEFAULT 'NULL' COMMENT '驳回原因',
  `category_message` int(11) DEFAULT NULL COMMENT '类型',
  `message_id` int(11) NOT NULL COMMENT '信息id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `flowes`
--

CREATE TABLE `flowes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '流程id',
  `title` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `description` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型分类',
  `type_id` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `content` longtext COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '企业名称或人名',
  `sort` int(11) NOT NULL COMMENT '置顶',
  `apply_user_id` int(11) NOT NULL COMMENT '申请人id',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除状态, 1未删除，2删除',
  `auditStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态, 0待审核,1驳回，2通过,3一级通过',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_type`
--

CREATE TABLE `message_type` (
  `type_id` varchar(64) COLLATE utf8_general_ci NOT NULL COMMENT '类型id',
  `number` int(11) DEFAULT NULL COMMENT '总数',
  `updated_at` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `navigations`
--

CREATE TABLE `navigations` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '导航id',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `flow_id` int(11) DEFAULT NULL COMMENT '流程id',
  `category` varchar(128) COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '机构id',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `organization_navigation`
--

CREATE TABLE `organization_navigation` (
  `organization_id` int(10) UNSIGNED NOT NULL COMMENT '机构id',
  `navigation_id` int(10) UNSIGNED NOT NULL COMMENT '导航id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '权限id',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `display_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示名称',
  `description` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL COMMENT '权限id',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `read_count`
--

CREATE TABLE `read_count` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '访问量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `resources`
--

CREATE TABLE `resources` (
  `resources_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '资源目录名称',
  `operator` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '操作者',
  `time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL COMMENT '状态，正常为0，删除为-2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `resources_info`
--

CREATE TABLE `resources_info` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `pid` int(11) NOT NULL,
  `fid` int(11) NOT NULL COMMENT '父id',
  `item_name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `subject_type` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '主体名称',
  `infomation` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '信息分类',
  `share_range` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '数据共享范围',
  `limited_term` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '有限期限',
  `status` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '状态，正常为0，删除为-2',
  `time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '角色id',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `display_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示名称',
  `description` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `type_relationship`
--

CREATE TABLE `type_relationship` (
  `type_id` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `type_description` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型描述',
  `category` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型分类',
  `category_description` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '类型分类描述',
  `parent_category` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '父类型分类',
  `parent_category_description` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '父类型分类描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(255) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flowes`
--
ALTER TABLE `flowes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigations_name_unique` (`name`),
  ADD UNIQUE KEY `navigations_category_unique` (`category`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_name_unique` (`name`);

--
-- Indexes for table `organization_navigation`
--
ALTER TABLE `organization_navigation`
  ADD PRIMARY KEY (`organization_id`,`navigation_id`),
  ADD KEY `organization_navigation_navigation_id_foreign` (`navigation_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `read_count`
--
ALTER TABLE `read_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resources_id`);

--
-- Indexes for table `resources_info`
--
ALTER TABLE `resources_info`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `flowes`
--
ALTER TABLE `flowes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流程id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '导航id', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '机构id', AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `read_count`
--
ALTER TABLE `read_count`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `resources`
--
ALTER TABLE `resources`
  MODIFY `resources_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `resources_info`
--
ALTER TABLE `resources_info`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 限制导出的表
--

--
-- 限制表 `organization_navigation`
--
ALTER TABLE `organization_navigation`
  ADD CONSTRAINT `organization_navigation_navigation_id_foreign` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_navigation_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


use pingxiang;


--
-- Database: `pingxiang`
--

--
-- 转存表中的数据 `flowes`
--

INSERT INTO `flowes` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, '流程一', '流程一：直接发布，一级或二级机构直接发布，不需要审核', NULL, NULL),
(2, '流程二', '流程二：机构审核，由发布机构直接审核，审核通过即发布', NULL, NULL),
(3, '流程三', '流程三：层级审核，一级机构发布的内容一级机构审核。二级机构发布的内容需先经过二级机构审核，通过后发送一级机构审核，通过后发布', NULL, NULL),
(4, '流程四', '流程四：一级审核：由二级机构发布的内容不经过本审核直接到一级机构进行审核。一级机构发布的内容一级机构审核。', NULL, NULL);

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_06_15_040943_users', 1),
(2, '2017_06_15_084043_basises', 1),
(3, '2017_06_20_145743_messages', 1),
(4, '2017_06_28_152443_type_relationship', 1),
(5, '2017_07_30_143323_resources', 1),
(6, '2017_07_30_143408_resources_info', 1),
(7, '2017_07_31_162446_user_logs', 1),
(8, '2017_08_01_162446_read_count', 1);

--
-- 转存表中的数据 `navigations`
--

INSERT INTO `navigations` (`id`, `name`, `flow_id`, `category`, `created_at`, `updated_at`) VALUES
(1, '信用新闻', 3, 'news', NULL, NULL),
(2, '信用监管', 3, 'creditSupervision', NULL, NULL),
(3, '信用双公示', 3, 'doubleCreditPublicity', NULL, NULL),
(4, '政策法规', 3, 'policy', NULL, NULL),
(5, '专题建设', 3, 'projectConstruction', NULL, NULL),
(6, '信用档案', 3, 'creditRecord', NULL, NULL),
(7, '信用助手', 3, 'creditassistant', NULL, NULL),
(8, '组织架构', 3, 'organizationalStructure', NULL, NULL),
(9, '网站管理', 3, 'websiteManagement', NULL, NULL);

--
-- 转存表中的数据 `organizations`
--

INSERT INTO `organizations` (`id`, `name`) VALUES
(29, '交通局'),
(2, '人力社保局'),
(5, '住建局'),
(22, '农业委员会'),
(21, '卫计局'),
(1, '发改委'),
(16, '司法局'),
(14, '商务局'),
(3, '国土资源局'),
(8, '国税局'),
(20, '国资委'),
(6, '地税局'),
(25, '安监局'),
(7, '工商局'),
(13, '政府金融办'),
(19, '教育局'),
(17, '文化局'),
(26, '旅游局'),
(23, '民政局'),
(4, '环保局'),
(31, '省民政局'),
(32, '省编办'),
(30, '省质监局'),
(18, '知识产权局'),
(15, '经信委'),
(27, '统计局'),
(24, '编办'),
(12, '萍乡海关'),
(28, '证监局'),
(9, '质监管局'),
(11, '食药监局'),
(10, '高院');

--
-- 转存表中的数据 `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'public', '发布', '新闻发布', '2017-06-23 00:00:00', '2017-06-23 00:00:00'),
(2, 'check', '审核', '新闻审核', '2017-06-23 00:00:00', '2017-06-23 00:00:00'),
(3, 'publicandcheck', '发布审核', '新闻发布审核', '2017-06-23 00:00:00', '2017-06-23 00:00:00');


--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, '管理员', '管理员', '管理员', '2017-06-23 00:00:00', '2017-06-23 00:00:00');

--
-- 转存表中的数据 `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(3, 1);

--
-- 转存表中的数据 `read_count`
--

INSERT INTO `read_count` (`id`, `date_time`, `num`, `status`) VALUES
(1, '2017-08-01', 0, 1);

--
-- 转存表中的数据 `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- 转存表中的数据 `type_relationship`
--

INSERT INTO `type_relationship` (`type_id`, `type_description`, `category`, `category_description`, `parent_category`, `parent_category_description`) VALUES
('uilding', '冶金、有色、建材行业项目审批信息', 'NDRC', '发改委', 'legalPerson', '企业法人'),
('professional', '职业资格证书核发信息', 'HRSSB', '人力社保局', 'legalPerson', '企业法人'),
('mining', '企业采矿探矿信息', 'LRB', '国土资源局', 'legalPerson', '企业法人'),
('environmentCredit', '年度企业环境信用评价诚信、合格结果', 'EPB', '环保局', 'legalPerson', '企业法人'),
('securityLicense', '企业安全生产许可证审批信息', 'HAB', '住建局', 'legalPerson', '企业法人'),
('taxcRedit', '纳税信用A级纳税人信息', 'LTB', '地税局', 'legalPerson', '企业法人'),
('merchants', '个体工商户信息', 'ICB', '工商局', 'legalPerson', '企业法人'),
('yearTaxcRedit', '年度纳税信用A级纳税人名单', 'IRS', '国税局', 'legalPerson', '企业法人'),
('famousProduct', '名牌产品名单信息', 'QSB', '质监管局', 'legalPerson', '企业法人'),
('referee', '个人未履行生效裁判信息', 'cityCourt', '市中院', 'legalPerson', '企业法人'),
('medical', '医疗器械公示信息', 'FDAB', '食药监局', 'legalPerson', '企业法人'),
('customsEnterprise', '海关企业分类管理信息', 'pingxiangCustoms', '萍乡海关', 'legalPerson', '企业法人'),
('financing', '融资担保公司许可取消信息', 'governmentFinanceOffice', '政府金融办', 'legalPerson', '企业法人'),
('pawn', '典当企业年审信息', 'MOFCOM', '商务厅', 'legalPerson', '企业法人'),
('civilBlasting', '民用爆炸物品安全生产许可证信息', 'CBL', '经信委', 'legalPerson', '企业法人'),
('lawyer', '律师基本信息', 'JB', '司法局', 'legalPerson', '企业法人'),
('performance', '演出经纪机构信息', 'COB', '文化局', 'legalPerson', '企业法人'),
('enterprisesPenalty', '企业处理或处罚信息', 'IPOB', '知识产权局', 'legalPerson', '企业法人'),
('teacherRecognize', '教师表彰奖励信息', 'EOB', '教育局', 'legalPerson', '企业法人'),
('enterpriseAssets', '国资企业基础信息表', 'SASAC', '国资委', 'legalPerson', '企业法人'),
('foodsafety', '食品安全企业标准备案信息', 'WPC', '卫计委', 'legalPerson', '企业法人'),
('agricultural', '农产品质量安全检验检测机构信息', 'AC', '农业委员会', 'legalPerson', '企业法人'),
('fund', '基金会信息', 'PCAD', '省民政厅', 'legalPerson', '企业法人'),
('', '', 'SO', '编办', 'legalPerson', '企业法人'),
('fireworks', '烟花爆竹企业生产信息', 'SSB', '安监局', 'legalPerson', '企业法人'),
('travel', '旅行社管理信息', 'TB', '旅游局', 'legalPerson', '企业法人'),
('strategic', '战略性新兴产业统计企业信息', 'SOB', '统计局', 'legalPerson', '企业法人'),
('listedcompany', '上市公司信息', 'CSRC', '证监局', 'legalPerson', '企业法人'),
('traffic', '交通建设工程监理单位资质信息', 'DTB', '交通局', 'legalPerson', '企业法人'),
('government', '政府机关', 'GPQSB', '省质监局', 'government', '政府机关'),
('affiliatedInstitutions', '事业单位', 'CQBSP', '省质监局', 'cause', '事业单位'),
('socialInformation', '社会团体登记管理信息', 'CPCAD', '省民政厅', 'cause', '事业单位'),
('careerInformation', '事业单位法人登记信息', 'CPSO', '省编办', 'cause', '事业单位');

--
-- 转存表中的数据 `user_logs`
--

INSERT INTO `user_logs` (`id`, `uid`, `name`, `ip`, `created_at`, `organization_id`) VALUES
(1, 17, 'jinfeihu', '192.168.0.111', 1501917466, 1),
(2, 75, 'leonnj', '192.168.0.111', 1501917720, 1),
(3, 75, 'leonnj', '192.168.0.111', 1501917934, 1),
(4, 75, 'leonnj', '192.168.0.111', 1501918093, 1),
(5, 75, 'leonnj', '192.168.0.111', 1501918127, 1);
