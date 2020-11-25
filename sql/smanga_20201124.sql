-- ----------------------------
-- 1. Department table
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
  dept_id           bigint(20)      not null auto_increment    comment 'Department id',
  parent_id         bigint(20)      default 0                  comment 'Parent department id',
  ancestors         varchar(50)     default ''                 comment 'Ancestor list',
  dept_name         varchar(30)     default ''                 comment 'Department name',
  order_num         int(4)          default 0                  comment 'Display order',
  leader            varchar(20)     default null               comment 'Principal',
  phone             varchar(11)     default null               comment 'Contact number',
  email             varchar(50)     default null               comment 'Mailbox',
  status            char(1)         default '0'                comment 'Department status (0 normal 1 disabled)',
  del_flag          char(1)         default '0'                comment 'Delete flag (0 means existence 2 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time 	    datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (dept_id)
) engine=innodb auto_increment=200 comment = 'Department table';

-- ----------------------------
-- Initialization-department table data
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          'Smanga Technology',   0, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(101,  100, '0,100',      'Shenzhen Headquarter', 1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(102,  100, '0,100',      'Changsha Branch', 2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(103,  101, '0,100,101',  'R & D department',   1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(104,  101, '0,100,101',  'Marketing department',   2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(105,  101, '0,100,101',  'Testing department',   3, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(106,  101, '0,100,101',  'Financial department',   4, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(107,  101, '0,100,101',  'Operation and maintenance department',   5, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(108,  102, '0,100,102',  'Marketing department',   1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(109,  102, '0,100,102',  'Financial department',   2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', sysdate(), '', null);


-- ----------------------------
-- 2. User information table
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id           bigint(20)      not null auto_increment    comment 'User ID',
  dept_id           bigint(20)      default null               comment 'Department ID',
  login_name        varchar(30)     not null                   comment 'Login account',
  user_name         varchar(30)     default ''                 comment 'User name',
  user_type         varchar(2)      default '00'               comment 'User type (00 system user 01 registered user)',
  email             varchar(50)     default ''                 comment 'User mailbox',
  phonenumber       varchar(11)     default ''                 comment 'Mobile phone number',
  sex               char(1)         default '0'                comment 'User gender (0 male 1 female 2 unknown)',
  avatar            varchar(100)    default ''                 comment 'Avatar path',
  password          varchar(50)     default ''                 comment 'Password',
  salt              varchar(20)     default ''                 comment 'Salt encryption',
  status            char(1)         default '0'                comment 'Account status (0 normal 1 disabled)',
  del_flag          char(1)         default '0'                comment 'Delete flag (0 means existence 2 means deletion)',
  login_ip          varchar(50)     default ''                 comment 'Last login IP',
  login_date        datetime                                   comment 'Last login time',
  pwd_update_date   datetime                                   comment 'Last password update time',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(500)    default null               comment 'Remarks',
  primary key (user_id)
) engine=innodb auto_increment=100 comment = 'User Information Form';

-- ----------------------------
-- Initialization-user information table data
-- ----------------------------
insert into sys_user values(1,  103, 'admin', 'Smanga', '00', 'smanga@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, 'Administrator');
insert into sys_user values(2,  105, 'ry',    'Smanga', '00', 'smanga@mail.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, 'Tester');


-- ----------------------------
-- 3. Job information form
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
  post_id       bigint(20)      not null auto_increment    comment 'Post ID',
  post_code     varchar(64)     not null                   comment 'Post code',
  post_name     varchar(50)     not null                   comment 'Position Name',
  post_sort     int(4)          not null                   comment 'Display order',
  status        char(1)         not null                   comment 'Status (0 normal 1 disabled)',
  create_by     varchar(64)     default ''                 comment 'Creator',
  create_time   datetime                                   comment 'Creation time',
  update_by     varchar(64)     default ''			           comment 'Updater',
  update_time   datetime                                   comment 'Update time',
  remark        varchar(500)    default null               comment 'Remarks',
  primary key (post_id)
) engine=innodb comment = 'Job Information Form';

-- ----------------------------
-- Initialization-post information table data
-- ----------------------------
insert into sys_post values(1, 'ceo',  'Chairman',    1, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(2, 'se',   'Project manager',  2, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(3, 'hr',   'Human Resources',  3, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(4, 'user', 'General staff',  4, '0', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 4. Role information table
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id           bigint(20)      not null auto_increment    comment 'Role ID',
  role_name         varchar(30)     not null                   comment 'Role Name',
  role_key          varchar(100)    not null                   comment 'Role permission string',
  role_sort         int(4)          not null                   comment 'Display order',
  data_scope        char(1)         default '1'                comment 'Data range (1: All data permissions 2: Customized data permissions 3: Data permissions for this department 4: Data permissions for this department and below)',
  status            char(1)         not null                   comment 'Role status (0 normal 1 disabled)',
  del_flag          char(1)         default '0'                comment 'Delete flag (0 means existence 2 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(500)    default null               comment 'Remarks',
  primary key (role_id)
) engine=innodb auto_increment=100 comment = 'Role information table';

-- ----------------------------
-- Initialization-role information table data
-- ----------------------------
insert into sys_role values('1', 'Super administrator', 'admin',  1, 1, '0', '0', 'admin', sysdate(), '', null, 'Super administrator');
insert into sys_role values('2', 'Normal role',   'common', 2, 2, '0', '0', 'admin', sysdate(), '', null, 'Normal role');


-- ----------------------------
-- 5. Menu permission table
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id           bigint(20)      not null auto_increment    comment 'Menu ID',
  menu_name         varchar(50)     not null                   comment 'Menu name',
  parent_id         bigint(20)      default 0                  comment 'Parent menu ID',
  order_num         int(4)          default 0                  comment 'Display order',
  url               varchar(200)    default '#'                comment 'Request address',
  target            varchar(20)     default ''                 comment 'Open method (menuItem tab menuBlank new window)',
  menu_type         char(1)         default ''                 comment 'Menu type (M directory C menu F button)',
  visible           char(1)         default 0                  comment 'Menu status (0 display 1 hide)',
  perms             varchar(100)    default null               comment 'Authority ID',
  icon              varchar(100)    default '#'                comment 'Menu icon',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(500)    default ''                 comment 'Remarks',
  primary key (menu_id)
) engine=innodb auto_increment=2000 comment = 'Menu permission table';

-- ----------------------------
-- Initialization-menu information table data
-- ----------------------------
-- A menu
insert into sys_menu values('1', 'System Management', '0', '1', '#',                '',          'M', '0', '', 'fa fa-gear',           'admin', sysdate(), '', null, 'System Management Directory');
insert into sys_menu values('2', 'System monitoring', '0', '2', '#',                '',          'M', '0', '', 'fa fa-video-camera',   'admin', sysdate(), '', null, 'System Monitoring Directory');
insert into sys_menu values('3', 'System Tools', '0', '3', '#',                '',          'M', '0', '', 'fa fa-bars',           'admin', sysdate(), '', null, 'System tool catalog');
insert into sys_menu values('4', 'Smanga official website', '0', '4', 'http://google.com', 'menuBlank', 'C', '0', '', 'fa fa-location-arrow', 'admin', sysdate(), '', null, 'Smanga official website address');
-- Secondary menu
insert into sys_menu values('100',  'User Management', '1', '1', '/system/user',          '', 'C', '0', 'system:user:view',         'fa fa-user-o',          'admin', sysdate(), '', null, 'User management menu');
insert into sys_menu values('101',  'Role management', '1', '2', '/system/role',          '', 'C', '0', 'system:role:view',         'fa fa-user-secret',     'admin', sysdate(), '', null, 'Role management menu');
insert into sys_menu values('102',  'Menu management', '1', '3', '/system/menu',          '', 'C', '0', 'system:menu:view',         'fa fa-th-list',         'admin', sysdate(), '', null, 'Menu management menu');
insert into sys_menu values('103',  'Department management', '1', '4', '/system/dept',          '', 'C', '0', 'system:dept:view',         'fa fa-outdent',         'admin', sysdate(), '', null, 'Department Management Menu');
insert into sys_menu values('104',  'Job management', '1', '5', '/system/post',          '', 'C', '0', 'system:post:view',         'fa fa-address-card-o',  'admin', sysdate(), '', null, 'Post management menu');
insert into sys_menu values('105',  'Dictionary management', '1', '6', '/system/dict',          '', 'C', '0', 'system:dict:view',         'fa fa-bookmark-o',      'admin', sysdate(), '', null, 'Dictionary management menu');
insert into sys_menu values('106',  'Parameter settings', '1', '7', '/system/config',        '', 'C', '0', 'system:config:view',       'fa fa-sun-o',           'admin', sysdate(), '', null, 'Parameter setting menu');
insert into sys_menu values('107',  'Announcement', '1', '8', '/system/notice',        '', 'C', '0', 'system:notice:view',       'fa fa-bullhorn',        'admin', sysdate(), '', null, 'Notification announcement menu');
insert into sys_menu values('108',  'Log management', '1', '9', '#',                     '', 'M', '0', '',                         'fa fa-pencil-square-o', 'admin', sysdate(), '', null, 'Log management menu');
insert into sys_menu values('109',  'Online user', '2', '1', '/monitor/online',       '', 'C', '0', 'monitor:online:view',      'fa fa-user-circle',     'admin', sysdate(), '', null, 'Online user menu');
insert into sys_menu values('110',  'Timed task', '2', '2', '/monitor/job',          '', 'C', '0', 'monitor:job:view',         'fa fa-tasks',           'admin', sysdate(), '', null, 'Timed task menu');
insert into sys_menu values('111',  'Data monitoring', '2', '3', '/monitor/data',         '', 'C', '0', 'monitor:data:view',        'fa fa-bug',             'admin', sysdate(), '', null, 'Data monitoring menu');
insert into sys_menu values('112',  'Service monitoring', '2', '4', '/monitor/server',       '', 'C', '0', 'monitor:server:view',      'fa fa-server',          'admin', sysdate(), '', null, 'Service monitoring menu');
insert into sys_menu values('113',  'Cache monitoring', '2', '5', '/monitor/cache',        '', 'C', '0', 'monitor:cache:view',       'fa fa-cube',            'admin', sysdate(), '', null, 'Cache monitoring menu');
insert into sys_menu values('114',  'Form construction', '3', '1', '/tool/build',           '', 'C', '0', 'tool:build:view',          'fa fa-wpforms',         'admin', sysdate(), '', null, 'Form build menu');
insert into sys_menu values('115',  'Code generation', '3', '2', '/tool/gen',             '', 'C', '0', 'tool:gen:view',            'fa fa-code',            'admin', sysdate(), '', null, 'Code generation menu');
insert into sys_menu values('116',  'System interface', '3', '3', '/tool/swagger',         '', 'C', '0', 'tool:swagger:view',        'fa fa-gg',              'admin', sysdate(), '', null, 'System interface menu');
-- Three-level menu
insert into sys_menu values('500',  'Operation log', '108', '1', '/monitor/operlog',    '', 'C', '0', 'monitor:operlog:view',     'fa fa-address-book',    'admin', sysdate(), '', null, 'Operation log menu');
insert into sys_menu values('501',  'Login log', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view',  'fa fa-file-image-o',    'admin', sysdate(), '', null, 'Login log menu');
-- User management button
insert into sys_menu values('1000', 'User query', '100', '1',  '#', '',  'F', '0', 'system:user:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1001', 'User added', '100', '2',  '#', '',  'F', '0', 'system:user:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1002', 'User modification', '100', '3',  '#', '',  'F', '0', 'system:user:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1003', 'User delete', '100', '4',  '#', '',  'F', '0', 'system:user:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1004', 'User export', '100', '5',  '#', '',  'F', '0', 'system:user:export',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1005', 'User import', '100', '6',  '#', '',  'F', '0', 'system:user:import',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1006', 'Reset Password', '100', '7',  '#', '',  'F', '0', 'system:user:resetPwd',    '#', 'admin', sysdate(), '', null, '');
-- Role management button
insert into sys_menu values('1007', 'Role query', '101', '1',  '#', '',  'F', '0', 'system:role:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1008', 'New role', '101', '2',  '#', '',  'F', '0', 'system:role:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1009', 'Role modification', '101', '3',  '#', '',  'F', '0', 'system:role:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1010', 'Role deletion', '101', '4',  '#', '',  'F', '0', 'system:role:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1011', 'Role export', '101', '5',  '#', '',  'F', '0', 'system:role:export',      '#', 'admin', sysdate(), '', null, '');
-- Menu management button
insert into sys_menu values('1012', 'Menu query', '102', '1',  '#', '',  'F', '0', 'system:menu:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1013', 'New menu', '102', '2',  '#', '',  'F', '0', 'system:menu:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1014', 'Menu modification', '102', '3',  '#', '',  'F', '0', 'system:menu:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1015', 'Menu delete', '102', '4',  '#', '',  'F', '0', 'system:menu:remove',      '#', 'admin', sysdate(), '', null, '');
-- Department Management Button
insert into sys_menu values('1016', 'Department query', '103', '1',  '#', '',  'F', '0', 'system:dept:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1017', 'New department', '103', '2',  '#', '',  'F', '0', 'system:dept:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1018', 'Department modification', '103', '3',  '#', '',  'F', '0', 'system:dept:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1019', 'Department delete', '103', '4',  '#', '',  'F', '0', 'system:dept:remove',      '#', 'admin', sysdate(), '', null, '');
-- Position management button
insert into sys_menu values('1020', 'Job inquiry', '104', '1',  '#', '',  'F', '0', 'system:post:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1021', 'New job', '104', '2',  '#', '',  'F', '0', 'system:post:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1022', 'Post modification', '104', '3',  '#', '',  'F', '0', 'system:post:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1023', 'Post deletion', '104', '4',  '#', '',  'F', '0', 'system:post:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1024', 'Post export', '104', '5',  '#', '',  'F', '0', 'system:post:export',      '#', 'admin', sysdate(), '', null, '');
-- Dictionary management button
insert into sys_menu values('1025', 'Dictionary lookup', '105', '1', '#', '',  'F', '0', 'system:dict:list',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1026', 'New dictionary', '105', '2', '#', '',  'F', '0', 'system:dict:add',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1027', 'Dictionary modification', '105', '3', '#', '',  'F', '0', 'system:dict:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1028', 'Dictionary delete', '105', '4', '#', '',  'F', '0', 'system:dict:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1029', 'Dictionary export', '105', '5', '#', '',  'F', '0', 'system:dict:export',       '#', 'admin', sysdate(), '', null, '');
-- Parameter setting button
insert into sys_menu values('1030', 'Parameter query', '106', '1', '#', '',  'F', '0', 'system:config:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1031', 'Add parameter', '106', '2', '#', '',  'F', '0', 'system:config:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1032', 'Parameter modification', '106', '3', '#', '',  'F', '0', 'system:config:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1033', 'Parameter deletion', '106', '4', '#', '',  'F', '0', 'system:config:remove',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1034', 'Parameter export', '106', '5', '#', '',  'F', '0', 'system:config:export',    '#', 'admin', sysdate(), '', null, '');
-- Notification announcement button
insert into sys_menu values('1035', 'Announcement query', '107', '1', '#', '',  'F', '0', 'system:notice:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1036', 'New announcement', '107', '2', '#', '',  'F', '0', 'system:notice:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1037', 'Announcement modification', '107', '3', '#', '',  'F', '0', 'system:notice:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1038', 'Announcement delete', '107', '4', '#', '',  'F', '0', 'system:notice:remove',    '#', 'admin', sysdate(), '', null, '');
-- Operation log button
insert into sys_menu values('1039', 'Operation query', '500', '1', '#', '',  'F', '0', 'monitor:operlog:list',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1040', 'Operation delete', '500', '2', '#', '',  'F', '0', 'monitor:operlog:remove',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1041', 'Details', '500', '3', '#', '',  'F', '0', 'monitor:operlog:detail',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1042', 'Log export', '500', '4', '#', '',  'F', '0', 'monitor:operlog:export',  '#', 'admin', sysdate(), '', null, '');
-- Login log button
insert into sys_menu values('1043', 'Login query', '501', '1', '#', '',  'F', '0', 'monitor:logininfor:list',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1044', 'Login delete', '501', '2', '#', '',  'F', '0', 'monitor:logininfor:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1045', 'Log export', '501', '3', '#', '',  'F', '0', 'monitor:logininfor:export',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1046', 'Account unlock', '501', '4', '#', '',  'F', '0', 'monitor:logininfor:unlock',       '#', 'admin', sysdate(), '', null, '');
-- Online user button
insert into sys_menu values('1047', 'Online search', '109', '1', '#', '',  'F', '0', 'monitor:online:list',             '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1048', 'Batch withdrawal', '109', '2', '#', '',  'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1049', 'Single forced withdrawal', '109', '3', '#', '',  'F', '0', 'monitor:online:forceLogout',      '#', 'admin', sysdate(), '', null, '');
-- Time task button
insert into sys_menu values('1050', 'Task query', '110', '1', '#', '',  'F', '0', 'monitor:job:list',                '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1051', 'New task', '110', '2', '#', '',  'F', '0', 'monitor:job:add',                 '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1052', 'Task modification', '110', '3', '#', '',  'F', '0', 'monitor:job:edit',                '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1053', 'Task delete', '110', '4', '#', '',  'F', '0', 'monitor:job:remove',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1054', 'State modification', '110', '5', '#', '',  'F', '0', 'monitor:job:changeStatus',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1055', 'Task details', '110', '6', '#', '',  'F', '0', 'monitor:job:detail',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1056', 'Task export', '110', '7', '#', '',  'F', '0', 'monitor:job:export',              '#', 'admin', sysdate(), '', null, '');
-- Code generation button
insert into sys_menu values('1057', 'Generate query', '115', '1', '#', '',  'F', '0', 'tool:gen:list',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1058', 'Generate modification', '115', '2', '#', '',  'F', '0', 'tool:gen:edit',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1059', 'Generate delete', '115', '3', '#', '',  'F', '0', 'tool:gen:remove',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1060', 'Preview code', '115', '4', '#', '',  'F', '0', 'tool:gen:preview',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1061', 'Generate code', '115', '5', '#', '',  'F', '0', 'tool:gen:code',     '#', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 6、User and role association table User N-1 role
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id   bigint(20) not null comment 'User ID',
  role_id   bigint(20) not null comment 'Role ID',
  primary key(user_id, role_id)
) engine=innodb comment = 'User and role association table';

-- ----------------------------
-- Initialization-user and role association table data
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、Role and menu association table Role 1-N menu
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id   bigint(20) not null comment 'Role ID',
  menu_id   bigint(20) not null comment 'Menu ID',
  primary key(role_id, menu_id)
) engine=innodb comment = 'Role and menu association table';

-- ----------------------------
-- Initialization-role and menu association table data
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');
insert into sys_role_menu values ('2', '1061');

-- ----------------------------
-- 8、Role and Department Association Table Role 1-N Department
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
  role_id   bigint(20) not null comment 'Role ID',
  dept_id   bigint(20) not null comment 'Department ID',
  primary key(role_id, dept_id)
) engine=innodb comment = 'Role and Department Association Table';

-- ----------------------------
-- Initialization-role and department association table data
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9、User and position association table User 1-N position
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
  user_id   bigint(20) not null comment 'User ID',
  post_id   bigint(20) not null comment 'Post ID',
  primary key (user_id, post_id)
) engine=innodb comment = 'User and post association table';

-- ----------------------------
-- Initialization-user and position association table data
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10、Operation log record
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id           bigint(20)      not null auto_increment    comment 'Log primary key',
  title             varchar(50)     default ''                 comment 'Module title',
  business_type     int(2)          default 0                  comment 'Business type (0 other 1 added 2 modified 3 deleted)',
  method            varchar(100)    default ''                 comment 'Method name',
  request_method    varchar(10)     default ''                 comment 'Request method',
  operator_type     int(1)          default 0                  comment 'Operation category (0 other 1 background user 2 mobile terminal user)',
  oper_name         varchar(50)     default ''                 comment 'Operator',
  dept_name         varchar(50)     default ''                 comment 'Department name',
  oper_url          varchar(255)    default ''                 comment 'Request URL',
  oper_ip           varchar(50)     default ''                 comment 'Host address',
  oper_location     varchar(255)    default ''                 comment 'Operating location',
  oper_param        varchar(2000)   default ''                 comment 'Request parameter',
  json_result       varchar(2000)   default ''                 comment 'Return parameter',
  status            int(1)          default 0                  comment 'Operation status (0 normal and 1 abnormal)',
  error_msg         varchar(2000)   default ''                 comment 'Wrong information',
  oper_time         datetime                                   comment 'Operating time',
  primary key (oper_id)
) engine=innodb auto_increment=100 comment = 'Operation log record';


-- ----------------------------
-- 11、Dictionary type table
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
  dict_id          bigint(20)      not null auto_increment    comment 'Dictionary primary key',
  dict_name        varchar(100)    default ''                 comment 'Dictionary name',
  dict_type        varchar(100)    default ''                 comment 'Dictionary type',
  status           char(1)         default '0'                comment 'Status (0 normal 1 disabled)',
  create_by        varchar(64)     default ''                 comment 'Creator',
  create_time      datetime                                   comment 'Creation time',
  update_by        varchar(64)     default ''                 comment 'Updater',
  update_time      datetime                                   comment 'Update time',
  remark           varchar(500)    default null               comment 'Remarks',
  primary key (dict_id),
  unique (dict_type)
) engine=innodb auto_increment=100 comment = 'Dictionary type table';

insert into sys_dict_type values(1,  'User gender', 'sys_user_sex',        '0', 'admin', sysdate(), '', null, 'User gender list');
insert into sys_dict_type values(2,  'Menu status', 'sys_show_hide',       '0', 'admin', sysdate(), '', null, 'Menu status list');
insert into sys_dict_type values(3,  'System switch', 'sys_normal_disable',  '0', 'admin', sysdate(), '', null, 'System switch list');
insert into sys_dict_type values(4,  'Task status', 'sys_job_status',      '0', 'admin', sysdate(), '', null, 'Task status list');
insert into sys_dict_type values(5,  'Task grouping', 'sys_job_group',       '0', 'admin', sysdate(), '', null, 'Task grouping list');
insert into sys_dict_type values(6,  'Whether the system', 'sys_yes_no',          '0', 'admin', sysdate(), '', null, 'Is the system listed');
insert into sys_dict_type values(7,  'Notification type', 'sys_notice_type',     '0', 'admin', sysdate(), '', null, 'List of notification types');
insert into sys_dict_type values(8,  'Notification status', 'sys_notice_status',   '0', 'admin', sysdate(), '', null, 'Notification status list');
insert into sys_dict_type values(9,  'Operation type', 'sys_oper_type',       '0', 'admin', sysdate(), '', null, 'List of operation types');
insert into sys_dict_type values(10, 'System status', 'sys_common_status',   '0', 'admin', sysdate(), '', null, 'Login status list');


-- ----------------------------
-- 12、Dictionary data table
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
  dict_code        bigint(20)      not null auto_increment    comment 'Dictionary encoding',
  dict_sort        int(4)          default 0                  comment 'Dictionary sort',
  dict_label       varchar(100)    default ''                 comment 'Dictionary tag',
  dict_value       varchar(100)    default ''                 comment 'Dictionary key',
  dict_type        varchar(100)    default ''                 comment 'Dictionary type',
  css_class        varchar(100)    default null               comment 'Style attributes (other style extensions)',
  list_class       varchar(100)    default null               comment 'Table echo style',
  is_default       char(1)         default 'N'                comment 'Whether the default (Y is N no)',
  status           char(1)         default '0'                comment 'Status (0 normal 1 disabled)',
  create_by        varchar(64)     default ''                 comment 'Creator',
  create_time      datetime                                   comment 'Creation time',
  update_by        varchar(64)     default ''                 comment 'Updater',
  update_time      datetime                                   comment 'Update time',
  remark           varchar(500)    default null               comment 'Remarks',
  primary key (dict_code)
) engine=innodb auto_increment=100 comment = 'Dictionary data table';

insert into sys_dict_data values(1,  1,  'Male',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', sysdate(), '', null, 'Sex: Male');
insert into sys_dict_data values(2,  2,  'Female',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, 'Gender: Female');
insert into sys_dict_data values(3,  3,  'Unknown',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, 'Unknown gender');
insert into sys_dict_data values(4,  1,  'Display',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Show menu');
insert into sys_dict_data values(5,  2,  'Hide',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Hide menu');
insert into sys_dict_data values(6,  1,  'Normal',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(7,  2,  'Deactivate',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled state');
insert into sys_dict_data values(8,  1,  'Normal',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(9,  2,  'Time out',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled state');
insert into sys_dict_data values(10, 1,  'Default',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', sysdate(), '', null, 'Default group');
insert into sys_dict_data values(11, 2,  'System',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', sysdate(), '', null, 'System grouping');
insert into sys_dict_data values(12, 1,  'Yes',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'The system default is');
insert into sys_dict_data values(13, 2,  'No',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'System default no');
insert into sys_dict_data values(14, 1,  'Notice',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, 'Notice');
insert into sys_dict_data values(15, 2,  'Announcement',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', sysdate(), '', null, 'Announcement');
insert into sys_dict_data values(16, 1,  'Normal',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(17, 2,  'Shut down',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled');
insert into sys_dict_data values(18, 99, 'Other',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'Other operations');
insert into sys_dict_data values(19, 1,  'Add',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'New operation');
insert into sys_dict_data values(20, 2,  'Modify',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'Modify operation');
insert into sys_dict_data values(21, 3,  'Delete',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Delete operation');
insert into sys_dict_data values(22, 4,  'Authorization',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', sysdate(), '', null, 'Authorized operation');
insert into sys_dict_data values(23, 5,  'Export',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Export operation');
insert into sys_dict_data values(24, 6,  'Import',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Import operation');
insert into sys_dict_data values(25, 7,  'Retreat',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Force back operation');
insert into sys_dict_data values(26, 8,  'Generate code', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Generate operation');
insert into sys_dict_data values(27, 9,  'Clear data', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Empty operation');
insert into sys_dict_data values(28, 1,  'Success',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(29, 2,  'Failure',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled state');


-- ----------------------------
-- 13. Parameter configuration table
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
  config_id         int(5)          not null auto_increment    comment 'Parameter primary key',
  config_name       varchar(100)    default ''                 comment 'Parameter name',
  config_key        varchar(100)    default ''                 comment 'Parameter key name',
  config_value      varchar(500)    default ''                 comment 'Parameter key value',
  config_type       char(1)         default 'N'                comment 'Built-in system (Y Yes N No)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(500)    default null               comment 'Remarks',
  primary key (config_id)
) engine=innodb auto_increment=100 comment = 'Parameter configuration table';

insert into sys_config values(1, 'Main frame page-default skin style name',     'sys.index.skinName',               'skin-blue',     'Y', 'admin', sysdate(), '', null, 'Blue skin-blue、Green skin-green、Purple skin-purple、Red skin-red、Yellow skin-yellow');
insert into sys_config values(2, 'User Management-Account Initial Password',         'sys.user.initPassword',            '123456',        'Y', 'admin', sysdate(), '', null, 'Initialization password 123456');
insert into sys_config values(3, 'Main frame page-sidebar theme',           'sys.index.sideTheme',              'theme-dark',    'Y', 'admin', sysdate(), '', null, 'Dark theme theme-dark，Light theme theme-light, dark blue theme theme-blue');
insert into sys_config values(4, 'Account self-service-whether to enable the user registration function', 'sys.account.registerUser',         'false',         'Y', 'admin', sysdate(), '', null, 'Whether to enable the registered user function (true to enable, false to disable)');
insert into sys_config values(5, 'User Management-Password Character Range',         'sys.account.chrtype',              '0',             'Y', 'admin', sysdate(), '', null, 'The default range of arbitrary characters, 0 arbitrary (password can enter any character), 1 number (password can only be 0-9 numbers), 2 English letters (password can only be az and AZ letters), 3 letters and numbers (password must contain Letters, numbers), 4 alphanumerics and special characters (currently supported special characters include: ~!@#$%^&*()-=_+)');
insert into sys_config values(6, 'User Management-Initial Password Change Policy',     'sys.account.initPasswordModify',   '0',             'Y', 'admin', sysdate(), '', null, '0: The initial password modification policy is closed without any prompt, 1: Remind the user, if the initial password is not modified, the password modification dialog box will be reminded when logging in');
insert into sys_config values(7, 'User management-account password update cycle',     'sys.account.passwordValidateDays', '0',             'Y', 'admin', sysdate(), '', null, 'Password update cycle (fill in the number, the initial value of the data is 0 is not limited, if the modification must be a positive integer greater than 0 and less than 365), if it exceeds this cycle to log in to the system, the password modification dialog box will be reminded when logging in');
insert into sys_config values(8, 'Main frame page-menu navigation display style',     'sys.index.menuStyle',              'default',       'Y', 'admin', sysdate(), '', null, 'Menu navigation display style (default is the left navigation menu, topnav is the top navigation menu)');
insert into sys_config values(9, 'Main frame page-whether to open the footer',         'sys.index.ignoreFooter',           'true',          'Y', 'admin', sysdate(), '', null, 'Whether to enable the bottom footer display (true display, false hide)');


-- ----------------------------
-- 14、System access record
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id        bigint(20)     not null auto_increment   comment 'Access ID',
  login_name     varchar(50)    default ''                comment 'Login account',
  ipaddr         varchar(50)    default ''                comment 'Login IP address',
  login_location varchar(255)   default ''                comment 'Login location',
  browser        varchar(50)    default ''                comment 'Browser type',
  os             varchar(50)    default ''                comment 'Operating system',
  status         char(1)        default '0'               comment 'Login status (0 success 1 failure)',
  msg            varchar(255)   default ''                comment 'Prompt message',
  login_time     datetime                                 comment 'Interview time',
  primary key (info_id)
) engine=innodb auto_increment=100 comment = 'System access record';


-- ----------------------------
-- 15、Online user records
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
  sessionId         varchar(50)   default ''                comment 'User session id',
  login_name        varchar(50)   default ''                comment 'Login account',
  dept_name         varchar(50)   default ''                comment 'Department name',
  ipaddr            varchar(50)   default ''                comment 'Login IP address',
  login_location    varchar(255)  default ''                comment 'Login location',
  browser           varchar(50)   default ''                comment 'Browser type',
  os                varchar(50)   default ''                comment 'Operating system',
  status            varchar(10)   default ''                comment 'Online status on_line online off_line offline',
  start_timestamp   datetime                                comment 'Session creation time',
  last_access_time  datetime                                comment 'Ssession last access time',
  expire_time       int(5)        default 0                 comment 'Timeout period, in minutes',
  primary key (sessionId)
) engine=innodb comment = 'Online status on_line online off_line offline';


-- ----------------------------
-- 16. Timing task schedule
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  job_id              bigint(20)    not null auto_increment    comment 'Task ID',
  job_name            varchar(64)   default ''                 comment 'Mission name',
  job_group           varchar(64)   default 'DEFAULT'          comment 'Task group name',
  invoke_target       varchar(500)  not null                   comment 'Call target string',
  cron_expression     varchar(255)  default ''                 comment 'Cron execution expression',
  misfire_policy      varchar(20)   default '3'                comment 'Plan execution error strategy (1 execute immediately 2 execute once 3 give up execution)',
  concurrent          char(1)       default '1'                comment 'Whether to execute concurrently (0 allowed 1 prohibited)',
  status              char(1)       default '0'                comment 'Status (0 normal, 1 pause)',
  create_by           varchar(64)   default ''                 comment 'Creator',
  create_time         datetime                                 comment 'Creation time',
  update_by           varchar(64)   default ''                 comment 'Updater',
  update_time         datetime                                 comment 'Update time',
  remark              varchar(500)  default ''                 comment 'Remarks information',
  primary key (job_id, job_name, job_group)
) engine=innodb auto_increment=100 comment = 'Timed task schedule';

insert into sys_job values(1, 'System default (no parameters)', 'DEFAULT', 'smangaTask.smangaNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(2, 'System default (with parameters)', 'DEFAULT', 'smangaTask.smangaParams(\'smanga\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(3, 'System default (multiple parameters)', 'DEFAULT', 'smangaTask.smangaMultipleParams(\'smanga\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 17、Scheduled task scheduling log table
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  job_log_id          bigint(20)     not null auto_increment    comment 'Task log ID',
  job_name            varchar(64)    not null                   comment 'Mission name',
  job_group           varchar(64)    not null                   comment 'Task group name',
  invoke_target       varchar(500)   not null                   comment 'Call target string',
  job_message         varchar(500)                              comment 'Log information',
  status              char(1)        default '0'                comment 'Execution status (0 normal and 1 failed)',
  exception_info      varchar(2000)  default ''                 comment 'Exception information',
  create_time         datetime                                  comment 'Creation time',
  primary key (job_log_id)
) engine=innodb comment = 'Scheduled task scheduling log table';


-- ----------------------------
-- 18、Notification form
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
  notice_id         int(4)          not null auto_increment    comment 'Announcement ID',
  notice_title      varchar(50)     not null                   comment 'Announcement title',
  notice_type       char(1)         not null                   comment 'Announcement type (1 notification 2 announcement)',
  notice_content    varchar(2000)   default null               comment 'Announcement content',
  status            char(1)         default '0'                comment 'Announcement status (0 normal 1 closed)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(255)    default null               comment 'Remarks',
  primary key (notice_id)
) engine=innodb auto_increment=10 comment = 'Notification form';

-- ----------------------------
-- Initialization-Announcement Information Table Data
-- ----------------------------
insert into sys_notice values('1', 'Reminder: 2020-11-24 if the new version is released', '2', 'New version content', '0', 'admin', sysdate(), '', null, 'Administrator');
insert into sys_notice values('2', 'Maintenance notice: 2020-11-24 if the system is maintained in the early morning', '1', 'Maintenance content',   '0', 'admin', sysdate(), '', null, 'Administrator');


-- ----------------------------
-- 19、Code generation business table
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
  table_id             bigint(20)      not null auto_increment    comment 'Numbering',
  table_name           varchar(200)    default ''                 comment 'Table name',
  table_comment        varchar(500)    default ''                 comment 'Table description',
  sub_table_name       varchar(64)     default null               comment 'Table name of the associated child table',
  sub_table_fk_name    varchar(64)     default null               comment 'The name of the foreign key associated with the child table',
  class_name           varchar(100)    default ''                 comment 'Entity class name',
  tpl_category         varchar(200)    default 'crud'             comment 'Template used (crud single table operation tree tree table operation sub main and sub table operation)',
  package_name         varchar(100)                               comment 'Generate package path',
  module_name          varchar(30)                                comment 'Generate module name',
  business_name        varchar(30)                                comment 'Generate business name',
  function_name        varchar(50)                                comment 'Generate function name',
  function_author      varchar(50)                                comment 'Generate function author',
  gen_type             char(1)         default '0'                comment 'Code generation method (0zip compressed package 1 custom path)',
  gen_path             varchar(200)    default '/'                comment 'Build path (do not fill in the default project path)',
  options              varchar(1000)                              comment 'Other build options',
  create_by            varchar(64)     default ''                 comment 'Creator',
  create_time 	       datetime                                   comment 'Creation time',
  update_by            varchar(64)     default ''                 comment 'Updater',
  update_time          datetime                                   comment 'Update time',
  remark               varchar(500)    default null               comment 'Remarks',
  primary key (table_id)
) engine=innodb auto_increment=1 comment = 'Code generation business table';


-- ----------------------------
-- 20、Code generation business table fields
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
  column_id         bigint(20)      not null auto_increment    comment 'Numbering',
  table_id          varchar(64)                                comment 'Attribution table number',
  column_name       varchar(200)                               comment 'Column name',
  column_comment    varchar(500)                               comment 'Column description',
  column_type       varchar(100)                               comment 'Column type',
  java_type         varchar(500)                               comment 'JAVA type',
  java_field        varchar(200)                               comment 'JAVA field name',
  is_pk             char(1)                                    comment 'Whether the primary key (1 is)',
  is_increment      char(1)                                    comment 'Whether to increase (1 is)',
  is_required       char(1)                                    comment 'Is it required (1 yes)',
  is_insert         char(1)                                    comment 'Is it an insert field (1 yes)',
  is_edit           char(1)                                    comment 'Whether to edit the field (1 yes)',
  is_list           char(1)                                    comment 'Whether the list field (1 is)',
  is_query          char(1)                                    comment 'Whether to query the field (1 is)',
  query_type        varchar(200)    default 'EQ'               comment 'Query method (equal to, not equal to, greater than, less than, range)',
  html_type         varchar(200)                               comment 'Display type (text box, text field, drop-down box, check box, radio button, date control)',
  dict_type         varchar(200)    default ''                 comment 'Dictionary type',
  sort              int                                        comment 'Sort',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time 	    datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (column_id)
) engine=innodb auto_increment=1 comment = 'Code generation business table fields';