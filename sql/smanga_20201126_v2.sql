-- ----------------------------
-- 1. Manga category table
-- ----------------------------
drop table if exists manga_category;
create table manga_category (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  category_name     varchar(30)     not null                   comment 'Category name',
  favorite_counter  bigint(10)      default 0                  comment 'Number of reader like this category',
  status            char(1)         default '1'                comment 'Category status (1 enabled 0 disabled)',
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  remark            varchar(500)    default null               comment 'Remark',
  cover_image       varchar(100)    default ''                 comment 'Category cover image path',
  cover_image_id    bigint(20)      default null               comment 'Id of cover image',
  recommended_age   varchar(30)     default ''                 comment 'Age recommend', 
  primary key (id)
) engine=innodb auto_increment=1 comment = 'Manga Category';

-- ----------------------------
-- Initialization-category information table data
-- ----------------------------
insert into manga_category values(1, 'Shonen', 0, '1', '0', 'admin', sysdate(), '', null, '', '', null, 'roughly 12-18');

-- ----------------------------
-- 2. Manga table
-- ----------------------------
drop table if exists manga;
create table manga (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  manga_name        varchar(100)    not null                   comment 'Manga name',
  categories        varchar(200)    not null                   comment 'Categories (each category seperated by comma)',
  category_ids      varchar(200)    not null                   comment 'Category ids (String with multiple category id seperated by comma',
  author            varchar(100)    default ''                 comment 'Author name of manga',
  author_id         bigint(20)      default null               comment 'Id of author',
  favorite_counter  bigint(10)      default 0                  comment 'Number of reader like this manga',
  remark            text            default ''                 comment 'Remark',
  cover_image       varchar(100)    default ''                 comment 'Manga cover image path',
  cover_image_id    bigint(20)      default null               comment 'Id of cover image',
  slide_image       varchar(100)    default ''                 comment 'Manga slide image path',
  slide_image_id    bigint(20)      default null               comment 'Id of slide image',
  recommended_age   varchar(30)     default ''                 comment 'Age recommend',
  status            char(1)         default '1'                comment 'Category status (1 enabled 0 disabled)',
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (id)
) engine=innodb auto_increment=1 comment = 'Manga';

-- ----------------------------
-- 3. Manga chapter table
-- ----------------------------
drop table if exists manga_chapter;
create table manga_chapter (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  chapter_name      varchar(100)    default ''                 comment 'Manga name',
  chapter_index     varchar(200)    not null                   comment 'Index of chapter in manga',
  chapter_lang      varchar(10)     default 'en'               comment 'Language of chapter',
  chapter_images    varchar(500)    default ''                 comment 'Image paths with multipe image seperated by comma',
  chapter_image_ids bigint(20)      default null               comment 'Image ids with multipe image seperated by comma',
  manga_id          bigint(20)      not null                   comment 'Author name of manga',
  view_counter      bigint(10)      default 0                  comment 'Number of reader read this chapter',
  favorite_counter  bigint(10)      default 0                  comment 'Number of reader like this chapter',
  remark            varchar(500)    default ''                 comment 'Remark',
  status            char(1)         default '1'                comment 'Chapter status (1 enabled 0 disabled)',
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (id)
) engine=innodb auto_increment=1 comment = 'Manga Chapter';

-- ----------------------------
-- 4. Image table
-- ----------------------------
drop table if exists image_file;
create table image_file (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  image_name        varchar(100)    not null                   comment 'Image file name',
  image_path        varchar(200)    default ''                 comment 'Image file path',
  used_status       char(1)         default '1'                comment 'Used status (1 used 0 not use)', 
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (id)
) engine=innodb auto_increment=1 comment = 'Image File';

-- ----------------------------
-- 5. Author
-- ----------------------------
drop table if exists author;
create table author (
  id                bigint(20)      not null auto_increment    comment 'Serial ID',
  author_name       varchar(100)    not null                   comment 'Author name',
  author_info       text            default ''                 comment 'Author information',
  favorite_counter  bigint(10)      default 0                  comment 'Number of reader like this author',
  remark            varchar(500)    default ''                 comment 'Remark',
  del_flag          varchar(1)      default '0'                comment 'Delete flag (0 means existence 1 means deletion)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update time',
  primary key (id)
) engine=innodb auto_increment=1 comment = 'Author';
