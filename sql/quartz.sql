-- ----------------------------
-- 1、Store the detailed information of each configured jobDetail
-- ----------------------------
drop table if exists QRTZ_JOB_DETAILS;
create table QRTZ_JOB_DETAILS (
    sched_name           varchar(120)    not null,
    job_name             varchar(200)    not null,
    job_group            varchar(200)    not null,
    description          varchar(250)    null,
    job_class_name       varchar(250)    not null,
    is_durable           varchar(1)      not null,
    is_nonconcurrent     varchar(1)      not null,
    is_update_data       varchar(1)      not null,
    requests_recovery    varchar(1)      not null,
    job_data             blob            null,
    primary key (sched_name,job_name,job_group)
) engine=innodb;

-- ----------------------------
-- 2、 Store the information of the configured Trigger
-- ----------------------------
drop table if exists QRTZ_TRIGGERS;
create table QRTZ_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    job_name             varchar(200)    not null,
    job_group            varchar(200)    not null,
    description          varchar(250)    null,
    next_fire_time       bigint(13)      null,
    prev_fire_time       bigint(13)      null,
    priority             integer         null,
    trigger_state        varchar(16)     not null,
    trigger_type         varchar(8)      not null,
    start_time           bigint(13)      not null,
    end_time             bigint(13)      null,
    calendar_name        varchar(200)    null,
    misfire_instr        smallint(2)     null,
    job_data             blob            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,job_name,job_group) references QRTZ_JOB_DETAILS(sched_name,job_name,job_group)
) engine=innodb;

-- ----------------------------
-- 3、 Store a simple Trigger, including the number of repetitions, intervals, and the number of triggers
-- ----------------------------
drop table if exists QRTZ_SIMPLE_TRIGGERS;
create table QRTZ_SIMPLE_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    repeat_count         bigint(7)       not null,
    repeat_interval      bigint(12)      not null,
    times_triggered      bigint(10)      not null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
) engine=innodb;

-- ----------------------------
-- 4、 Store Cron Trigger, including Cron expression and time zone information
-- ---------------------------- 
drop table if exists QRTZ_CRON_TRIGGERS;
create table QRTZ_CRON_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    cron_expression      varchar(200)    not null,
    time_zone_id         varchar(80),
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
) engine=innodb;

-- ----------------------------
-- 5、 Trigger is stored as a Blob type (used when Quartz users use JDBC to create their own custom Trigger type, and JobStore does not know how to store the instance)
-- ---------------------------- 
drop table if exists QRTZ_BLOB_TRIGGERS;
create table QRTZ_BLOB_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    blob_data            blob            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
) engine=innodb;

-- ----------------------------
-- 6、 Store calendar information in Blob type, quartz can configure a calendar to specify a time range
-- ---------------------------- 
drop table if exists QRTZ_CALENDARS;
create table QRTZ_CALENDARS (
    sched_name           varchar(120)    not null,
    calendar_name        varchar(200)    not null,
    calendar             blob            not null,
    primary key (sched_name,calendar_name)
) engine=innodb;

-- ----------------------------
-- 7、 Store the information of the suspended Trigger group
-- ---------------------------- 
drop table if exists QRTZ_PAUSED_TRIGGER_GRPS;
create table QRTZ_PAUSED_TRIGGER_GRPS (
    sched_name           varchar(120)    not null,
    trigger_group        varchar(200)    not null,
    primary key (sched_name,trigger_group)
) engine=innodb;

-- ----------------------------
-- 8、 Store the status information related to the triggered Trigger and the execution information of the associated Job
-- ---------------------------- 
drop table if exists QRTZ_FIRED_TRIGGERS;
create table QRTZ_FIRED_TRIGGERS (
    sched_name           varchar(120)    not null,
    entry_id             varchar(95)     not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    instance_name        varchar(200)    not null,
    fired_time           bigint(13)      not null,
    sched_time           bigint(13)      not null,
    priority             integer         not null,
    state                varchar(16)     not null,
    job_name             varchar(200)    null,
    job_group            varchar(200)    null,
    is_nonconcurrent     varchar(1)      null,
    requests_recovery    varchar(1)      null,
    primary key (sched_name,entry_id)
) engine=innodb;

-- ----------------------------
-- 9、 Store a small amount of status information about the Scheduler, if it is used in a cluster, you can see other Scheduler instances
-- ---------------------------- 
drop table if exists QRTZ_SCHEDULER_STATE; 
create table QRTZ_SCHEDULER_STATE (
    sched_name           varchar(120)    not null,
    instance_name        varchar(200)    not null,
    last_checkin_time    bigint(13)      not null,
    checkin_interval     bigint(13)      not null,
    primary key (sched_name,instance_name)
) engine=innodb;

-- ----------------------------
-- 10、 Store information about the pessimistic lock of the program (if pessimistic lock is used)
-- ---------------------------- 
drop table if exists QRTZ_LOCKS;
create table QRTZ_LOCKS (
    sched_name           varchar(120)    not null,
    lock_name            varchar(40)     not null,
    primary key (sched_name,lock_name)
) engine=innodb;

drop table if exists QRTZ_SIMPROP_TRIGGERS;
create table QRTZ_SIMPROP_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    str_prop_1           varchar(512)    null,
    str_prop_2           varchar(512)    null,
    str_prop_3           varchar(512)    null,
    int_prop_1           int             null,
    int_prop_2           int             null,
    long_prop_1          bigint          null,
    long_prop_2          bigint          null,
    dec_prop_1           numeric(13,4)   null,
    dec_prop_2           numeric(13,4)   null,
    bool_prop_1          varchar(1)      null,
    bool_prop_2          varchar(1)      null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
) engine=innodb;

commit;