-- ----------------------------
-- 1. User information table
-- ----------------------------
drop table if exists business_user;
create table business_user (
  user_id           bigint(20)      not null auto_increment    comment 'User ID',
  login_name        varchar(30)     not null                   comment 'Login account',
  user_name         varchar(30)     default ''                 comment 'User name',
  user_type         varchar(1)      default 'R'                comment 'User type (R reader P publisher)',
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
) engine=innodb auto_increment=100 comment = 'Business User Information Form';

-- ----------------------------
-- Initialization-user information table data
-- ----------------------------
insert into business_user values(1, 'tronghieu', 'Nguyen Trong Hieu', 'R', 'tronghieu8531@gmail.com', '0935802290', '0', '', '5363aed8ab3221be5ca78b9780f35394', 'dbf967', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, 'Reader user test');