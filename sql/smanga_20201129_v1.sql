-- ----------------------------
-- 1. Artist
-- ----------------------------
drop table if exists artist;
create table artist (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  artist_name       varchar(100)    not null                   comment 'Artist name',
  artist_info       text            default ''                 comment 'Artist information',
  artist_counter    bigint(10)      default 0                  comment 'Number of reader like this artist',
  remark            varchar(500)    default ''                 comment 'Remark',
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (id)
) engine=innodb auto_increment=1 comment = 'artist';