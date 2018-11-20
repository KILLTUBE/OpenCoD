-- rename warns to history
CREATE TABLE IF NOT EXISTS `history` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `victim_id` INTEGER NOT NULL,
    `invoker_id` INTEGER NOT NULL,
    `type` TEXT NOT NULL,
    `datetime` INTEGER NOT NULL,
    `reason` TEXT NOT NULL,
    CONSTRAINT `history_victim` FOREIGN KEY (`victim_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `history_invoker` FOREIGN KEY (`invoker_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX IF NOT EXISTS `history_victim_idx` ON `history` (`victim_id`);
CREATE INDEX IF NOT EXISTS `history_invoker_idx` ON `history` (`invoker_id`);

INSERT INTO `history` (`id`, `victim_id`, `invoker_id`, `type`, `datetime`, `reason`) SELECT `id`, `player_id`, `admin_id`, 'warn' AS `type`, `datetime`, `reason` FROM `warn`;

DROP TABLE `warn`;

INSERT INTO `history` (`id`, `victim_id`, `invoker_id`, `type`, `datetime`, `reason`) SELECT `id`, `player_id`, `admin_id`, 'level' AS `type`, `datetime`, `level` FROM `level`;

DROP TABLE `level`;

-- create acl tables
CREATE TABLE IF NOT EXISTS `level` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `name` TEXT NOT NULL
);

CREATE TABLE `level_role` (
    `level_id` INTEGER NOT NULL,
    `role` TEXT NOT NULL,
    PRIMARY KEY (`level_id`, `role`),
    CONSTRAINT `role_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- populate acl
-- add levels
BEGIN;
INSERT INTO `level` (`id`, `name`) VALUES (0, 'Guest');
INSERT INTO `level` (`id`, `name`) VALUES (1, 'Regular');
INSERT INTO `level` (`id`, `name`) VALUES (2, 'VIP');
INSERT INTO `level` (`id`, `name`) VALUES (3, 'Admin');
INSERT INTO `level` (`id`, `name`) VALUES (4, 'Senior Admin');
INSERT INTO `level` (`id`, `name`) VALUES (5, 'Server Owner');
COMMIT;

-- add roles for level 0
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (0, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (0, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (0, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (0, 'greeting');
COMMIT;

-- add roles for level 1
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'greeting');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'listmaps');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'listsprees');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (1, 'listrules');
COMMIT;

-- add roles for level 2
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'greeting');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'listplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'listteams');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'listmaps');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'listsprees');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'listrules');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (2, 'spec999');
COMMIT;

-- add roles for level 3
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'greeting');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listteams');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listmaps');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listsprees');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listrules');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listhistory');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'listbans');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'liststats');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'adminchat');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'put');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'dropweapons');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'warn');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'mute');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'voicemute');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'spec999');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'balance');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'cointoss');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'pause');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'nextmap');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'restart');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'botadmin');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'enablevote');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'noinactivity');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'novote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'nocensor');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (3, 'novotelimit');
COMMIT;

-- add roles for level 4
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'greeting');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listteams');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listmaps');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listsprees');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listrules');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listhistory');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listwarns');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listbans');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'listaliases');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'liststats');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'finger');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'adminchat');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'put');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'dropweapons');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'rename');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'freeze');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'disorient');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'burn');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'slap');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'gib');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'throw');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'glow');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'pants');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'pop');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'warn');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'mute');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'voicemute');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'kick');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'ban');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'spec999');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'balance');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'lockplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'lockteam');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'shuffle');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'swap');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'cointoss');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'pause');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'nextmap');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'restart');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'botadmin');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'enablevote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'cancelvote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'passvote');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'news');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'noinactivity');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'novote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'nocensor');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'nobalance');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'novotelimit');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'noreason');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'teamcmds');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (4, 'silentcmds');
COMMIT;

-- add roles for level 5
BEGIN;
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'admintest');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'help');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'time');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'greeting');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listteams');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listmaps');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listsprees');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listrules');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listhistory');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listwarns');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listbans');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'listaliases');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'liststats');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'finger');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'adminchat');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'put');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'dropweapons');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'rename');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'freeze');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'disorient');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'burn');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'slap');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'gib');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'throw');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'glow');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'pants');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'pop');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'warn');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'mute');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'voicemute');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'kick');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'ban');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'spec999');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'balance');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'lockplayers');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'lockteam');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'shuffle');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'swap');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'cointoss');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'pause');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'nextmap');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'restart');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'botadmin');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'enablevote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'cancelvote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'passvote');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'news');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'uptime');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'setlevel');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'readconfig');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'noinactivity');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'novote');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'nocensor');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'nobalance');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'novotelimit');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'noreason');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'perma');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'teamcmds');
INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'silentcmds');

INSERT INTO `level_role`(`level_id`, `role`) VALUES (5, 'spy');
COMMIT;

-- update player table
CREATE TABLE IF NOT EXISTS `player_x` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `guid` TEXT NOT NULL UNIQUE,
    `ip` TEXT NOT NULL,
    `level_id` INTEGER NOT NULL,
    `lastseen` INTEGER NOT NULL,
    `seen` INTEGER NOT NULL,
    CONSTRAINT `player_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO `player_x` (`id`, `guid`, `ip`, `level_id`, `lastseen`, `seen`) SELECT `id`, `guid`, `ip`, 0 AS `level_id`, 0 AS `lastseen`, 0 AS `seen` FROM `player`;

DROP TABLE `player`;

ALTER TABLE `player_x` RENAME TO `player`;

-- set level of console
UPDATE `player` SET `level_id`=5 WHERE `guid`='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

-- set last seen information
UPDATE `player` SET `lastseen`=(SELECT MAX(`lastused`) AS `lastused` FROM `alias` AS `a` WHERE `a`.`player_id`=`player`.`id`);
UPDATE `player` SET `seen`=(SELECT SUM(`used`) AS `used` FROM `alias` AS `a` WHERE `a`.`player_id`=`player`.`id`);

-- create mute and ban tables
CREATE TABLE IF NOT EXISTS `mute` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `victim_id` INTEGER NOT NULL,
    `invoker_id` INTEGER NOT NULL,
    `type` TEXT NOT NULL,
    `issued` INTEGER NOT NULL,
    `expires` INTEGER NOT NULL,
    `duration` INTEGER NOT NULL,
    `reason` TEXT NOT NULL,
    CONSTRAINT `mute_victim` FOREIGN KEY (`victim_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `mute_invoker` FOREIGN KEY (`invoker_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX IF NOT EXISTS `mute_victim_idx` ON `mute` (`victim_id`);
CREATE INDEX IF NOT EXISTS `mute_invoker_idx` ON `mute` (`invoker_id`);

CREATE TABLE IF NOT EXISTS `ban` (
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `victim_id` INTEGER NOT NULL,
    `invoker_id` INTEGER NOT NULL,
    `issued` INTEGER NOT NULL,
    `expires` INTEGER NOT NULL,
    `duration` INTEGER NOT NULL,
    `reason` TEXT NOT NULL,
    CONSTRAINT `ban_victim` FOREIGN KEY (`victim_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ban_invoker` FOREIGN KEY (`invoker_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX IF NOT EXISTS `ban_victim_idx` ON `ban` (`victim_id`);
CREATE INDEX IF NOT EXISTS `ban_invoker_idx` ON `ban` (`invoker_id`);
