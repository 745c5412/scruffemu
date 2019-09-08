/*
 Navicat Premium Data Transfer

 Source Server         : Local Server
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : scruffemu_login

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 08/09/2019 18:11:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `guid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `banned` tinyint(3) NOT NULL DEFAULT 0,
  `bannedTime` bigint(255) NOT NULL DEFAULT 0,
  `pseudo` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `question` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'DELETE?',
  `reponse` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'DELETE',
  `lastConnectionDate` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `lastIP` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `friends` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enemy` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `vip` int(1) NOT NULL DEFAULT 0,
  `reload_needed` tinyint(1) NOT NULL DEFAULT 1,
  `logged` int(1) NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `totalVotes` int(11) NOT NULL DEFAULT 0,
  `subscribe` bigint(255) NOT NULL DEFAULT 0,
  `heurevote` bigint(50) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `muteTime` bigint(255) NULL DEFAULT NULL,
  `muteRaison` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mutePseudo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` int(11) NULL DEFAULT 0,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lastVoteIP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showOrHide` tinyint(1) NOT NULL DEFAULT 0,
  `showOrHidePos` tinyint(1) NOT NULL DEFAULT 0,
  `dateRegister` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '01/01/2015',
  `lastConnectDay` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rules` tinyint(1) NOT NULL DEFAULT 1,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 'admin', '52a3bde9fdc40cbc39ddd00eebe94629022f6c945f9ffbc37951e70b3c34ab875e2aef25faa9bd36208ef4a57ddeca45cbc08440196d1c07a565b921d8f3aa61', 0, 0, 'Scruff-ADMIN', 'Delete?', 'yes', '2019~09~08~18~03', '127.0.0.1', '15;12', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'efla@gmail.com', '127.0.0.1', 0, 0, '09~11~2018', '', 1, 1);
INSERT INTO `accounts` VALUES (12, 'scruff', '531ecdfd487ff00fb3de0cbd31713885218cbc33ae2cb931c5518055cf9ecda0537f362f78ceb66041ab631df343a030efabb84206db7d88c6dba2cb92457d84', 0, 0, 'Scruff', 'Delete?', 'yes', '2019~09~07~18~43', '127.0.0.1', '13;14;15', '', 0, 0, 1, 0, 0, 0, 1, 0, 0, '', '', 0, 'vaoge@gmail.com', '86.93.0.132', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (13, 'scruff2', '531ecdfd487ff00fb3de0cbd31713885218cbc33ae2cb931c5518055cf9ecda0537f362f78ceb66041ab631df343a030efabb84206db7d88c6dba2cb92457d84', 0, 0, 'Scruffle', 'Delete?', 'yes', '2019~09~07~14~02', '127.0.0.1', '14;12;15', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'eungyaiea@gmail.com', '86.93.0.132', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (14, 'scruff3', '531ecdfd487ff00fb3de0cbd31713885218cbc33ae2cb931c5518055cf9ecda0537f362f78ceb66041ab631df343a030efabb84206db7d88c6dba2cb92457d84', 0, 0, 'Scrufflina', 'Delete?', 'yes', '2019~09~07~14~09', '127.0.0.1', '15;13;12', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'fuieane@gmail.com', '86.93.0.132', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (15, 'scruff4', '531ecdfd487ff00fb3de0cbd31713885218cbc33ae2cb931c5518055cf9ecda0537f362f78ceb66041ab631df343a030efabb84206db7d88c6dba2cb92457d84', 0, 0, 'Scruffette', 'Delete?', 'yes', '2019~09~07~01~50', '127.0.0.1', '14;13;12', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'fueayike@gmail.com', '86.93.0.132', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (16, 'hysteria', '04e12d4a1e494896e67fdd3c281ddae51ed59fce532c91ac2052d540946fc58611ba96d77eb4f8cf0bf59aad3f59b35a560c716acf1e2a9269294bf149fcc1e8', 0, 0, 'hysteria', 'igotnoclue', 'idontknow', '2018~12~20~20~44', '84.194.34.251', '12', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'dieter_haels@hotmail.com', '84.194.34.251', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (17, 'ugurgoktepe', '5a5aa8919cecec471462fa535a60089e78986efce49a38c99c341ec6bff02c452de57e10dc7719556970a7072eed6ab913d9561b094d007fc771a4697ea2a048', 0, 0, 'ExactGG', 'sanane', 'sanane amk', '2018~12~19~19~42', '78.190.162.39', '21;22;23', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'ugurgoktepe93@gmail.com', '78.190.162.39', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (18, 'darkwizard112', '5b794c0ed4d71e5e1c70a0871b7fcf0114568dc2f5003e30aee59650b2edf089589f0764d061a4f562978bd1251078a2b9541acbce1ad1cc0c0752f37e8c7618', 0, 0, 'Phoenix', 'Moeder naam', 'Janet', '2018~12~20~20~21', '77.250.245.72', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'remonlubbelinkhof1992@gmail.com', '213.127.111.35', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (19, 'chatlack', '2ae873f0c017a40579ac8b8f22641e08ba727cb2eaf6a5c934f83e4de8dff5433088f229e54b51d623bcc54fd5ca7fd4addf0f1d14f0a3a7890f01ecc6929408', 0, 0, 'Chatty', 'Birth?', 'Antalya', '2018~12~21~14~45', '130.43.201.120', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'alicercioglu@yahoo.com', '88.235.166.12', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (20, 'rainred', '50ef9a49dce2b4a682f050a396c08be16b6ece682d5de233e2ec78ae5f80e9feed3fb5df93e9a120e74d2e18a69aefa93edb0ec8f7a3668db7a6589a7a71dc96', 0, 0, 'Rainred', 'Whats the name of my dog?', 'At least you tried', '2018~12~20~21~58', '193.19.222.167', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'mali.domi@hotmail.com', '193.19.221.36', 0, 0, '18~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (21, 'ugurgoktepe1', '5a5aa8919cecec471462fa535a60089e78986efce49a38c99c341ec6bff02c452de57e10dc7719556970a7072eed6ab913d9561b094d007fc771a4697ea2a048', 0, 0, 'ExactGG1', 'sanane', 'sanane amk', '2018~12~19~19~42', '78.190.162.39', '17;22;23', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'ugurgoktepe93@gmail.com', '78.190.162.39', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (22, 'ugurgoktepe2', '5a5aa8919cecec471462fa535a60089e78986efce49a38c99c341ec6bff02c452de57e10dc7719556970a7072eed6ab913d9561b094d007fc771a4697ea2a048', 0, 0, 'ExactGG2', 'sanane', 'sanane amk', '2018~12~19~19~26', '78.190.162.39', '17;21;23', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'ugurgoktepe93@gmail.com', '78.190.162.39', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (23, 'ugurgoktepe3', '5a5aa8919cecec471462fa535a60089e78986efce49a38c99c341ec6bff02c452de57e10dc7719556970a7072eed6ab913d9561b094d007fc771a4697ea2a048', 0, 0, 'ExactGG3', 'sanane', 'sanane amk', '2018~12~19~19~26', '78.190.162.39', '17;21;22', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'ugurgoktepe93@gmail.com', '78.190.162.39', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (24, 'dionmase', '1d5ba2f676184286f1f6770287b8d974d97cd0d25a2c38f640fd0f1ea84871842eaf1afb407af02a38c6175959291172797d39daf6783db2adbde3130f49ea31', 0, 0, 'dionma3seb', 'wattan', 'okeedan', '2018~12~21~21~27', '84.85.169.2', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'dion.m@live.nl', '84.85.169.2', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (25, 'dionmase1', '1d5ba2f676184286f1f6770287b8d974d97cd0d25a2c38f640fd0f1ea84871842eaf1afb407af02a38c6175959291172797d39daf6783db2adbde3130f49ea31', 0, 0, 'jatochhh', 'wattan', 'okeedan', '2018~12~19~18~06', '84.85.169.2', '', '', 0, 0, 1, 0, 0, 0, 1, 0, 0, '', '', 0, 'dionmassop11@gmail.com', '84.85.169.2', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (26, 'dionmase2', '1d5ba2f676184286f1f6770287b8d974d97cd0d25a2c38f640fd0f1ea84871842eaf1afb407af02a38c6175959291172797d39daf6783db2adbde3130f49ea31', 0, 0, 'okeeeeeee', 'kekekeke', 'jajajaja', '2018~12~19~18~06', '84.85.169.2', '', '', 0, 0, 1, 0, 0, 0, 1, 0, 0, '', '', 0, 'dionrs@live.nl', '84.85.169.2', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (27, 'dionmase3', '1d5ba2f676184286f1f6770287b8d974d97cd0d25a2c38f640fd0f1ea84871842eaf1afb407af02a38c6175959291172797d39daf6783db2adbde3130f49ea31', 0, 0, 'iiiiii', 'kankna', 'okok', '2018~12~21~21~27', '84.85.169.2', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'zibie@live.nl', '84.85.169.2', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (31, 'koop1', 'f78b2f1c82f996310b34a857abc6c8a43a4564c8b1f6bd96dfcd7cf2242f0e5263cee55838ce1ec3d44c0d8eee92ca7a4f1ded4c38e5133007f1a2f17b6b8534', 0, 0, 'koop1', 'me?', 'koopa                                                                                               ', '2018~12~21~22~05', '73.177.97.74', '32;33', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'koopbeats@gmail.com', '73.177.97.74', 0, 0, '20~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (28, 'sympatico', '04e12d4a1e494896e67fdd3c281ddae51ed59fce532c91ac2052d540946fc58611ba96d77eb4f8cf0bf59aad3f59b35a560c716acf1e2a9269294bf149fcc1e8', 0, 0, 'Sympatico', 'igotnoclue', 'idontknow', '2018~12~20~20~44', '84.194.34.251', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'dieter_haels@hotmail.com', '84.194.34.251', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (29, 'bamboo', '04e12d4a1e494896e67fdd3c281ddae51ed59fce532c91ac2052d540946fc58611ba96d77eb4f8cf0bf59aad3f59b35a560c716acf1e2a9269294bf149fcc1e8', 0, 0, 'bamboo', 'igotnoclue', 'idontknow', '2018~12~20~20~45', '84.194.34.251', '', '', 0, 0, 1, 0, 0, 0, 1, 0, 0, '', '', 0, 'dieter_haels@hotmail.com', '84.194.34.251', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (30, 'svetluska', '04e12d4a1e494896e67fdd3c281ddae51ed59fce532c91ac2052d540946fc58611ba96d77eb4f8cf0bf59aad3f59b35a560c716acf1e2a9269294bf149fcc1e8', 0, 0, 'Svetluska', 'igotnoclue', 'idontknow', '2018~12~20~20~45', '84.194.34.251', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'dieter_haels@hotmail.com', '84.194.34.251', 0, 0, '19~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (32, 'koop2', 'f78b2f1c82f996310b34a857abc6c8a43a4564c8b1f6bd96dfcd7cf2242f0e5263cee55838ce1ec3d44c0d8eee92ca7a4f1ded4c38e5133007f1a2f17b6b8534', 0, 0, 'koop2', 'me?', 'koopa', '2018~12~21~22~05', '73.177.97.74', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'koopbeats@gmail.com', '73.177.97.74', 0, 0, '20~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (33, 'koop3', 'f78b2f1c82f996310b34a857abc6c8a43a4564c8b1f6bd96dfcd7cf2242f0e5263cee55838ce1ec3d44c0d8eee92ca7a4f1ded4c38e5133007f1a2f17b6b8534', 0, 0, 'koop3', 'me?', 'koopa', '2018~12~22~04~27', '73.177.97.74', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'koopbeats@gmail.com', '73.177.97.74', 0, 0, '20~12~2018', '', 1, 0);
INSERT INTO `accounts` VALUES (34, 'koop4', 'f78b2f1c82f996310b34a857abc6c8a43a4564c8b1f6bd96dfcd7cf2242f0e5263cee55838ce1ec3d44c0d8eee92ca7a4f1ded4c38e5133007f1a2f17b6b8534', 0, 0, 'koop4', 'me?', 'koopa', '2018~12~21~22~05', '73.177.97.74', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 0, 'koopbeats@gmail.com', '73.177.97.74', 0, 0, '20~12~2018', '', 1, 0);

-- ----------------------------
-- Table structure for administration.commands
-- ----------------------------
DROP TABLE IF EXISTS `administration.commands`;
CREATE TABLE `administration.commands`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `args` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administration.commands
-- ----------------------------
INSERT INTO `administration.commands` VALUES (1, 'HELP', '[Commande]', 'Permet de voir toutes les commandes disponibles ou de rechercher des commandes. Ne pas mettre de paramètres pour afficher toutes les commandes.');
INSERT INTO `administration.commands` VALUES (2, 'ONLINE', '[Pseudo]', 'Permet de réinitialiser les variables du joueur ciblé.');
INSERT INTO `administration.commands` VALUES (3, 'ANAME', '[message]', 'Permet d\'envoyer un message à tout le serveur. Le HTML est autorisé.');
INSERT INTO `administration.commands` VALUES (4, 'INFOS', NULL, 'Permet d\'obtenir des informations sur le serveur');
INSERT INTO `administration.commands` VALUES (5, 'STARTFIGHT', NULL, 'Permet de commencer le combat lorsque celui-ci est en sélection.');
INSERT INTO `administration.commands` VALUES (6, 'GON', '[Pseudo]', 'Permet de se téléporter à un joueur.');
INSERT INTO `administration.commands` VALUES (7, 'TP', '[mapId] [cellId]', 'Permet de se téléporter à un endroit précis.');
INSERT INTO `administration.commands` VALUES (8, 'KICKFIGHT', '[Pseudo]', 'Expulse le joueur du combat.');
INSERT INTO `administration.commands` VALUES (9, 'DEBUG', '[Pseudo]', 'Téléporte le joueur à son point de sauvegarde.');
INSERT INTO `administration.commands` VALUES (10, 'WHO', NULL, 'Permet d\'avoir la liste de 30 connectés maximum.');
INSERT INTO `administration.commands` VALUES (11, 'WHOALL', NULL, 'Permet d\'avoir la liste de tous les connectés.');
INSERT INTO `administration.commands` VALUES (12, 'MUTE', '[Pseudo] [Temps]', 'Empêcher le joueur de parler pendant un certain temps.');
INSERT INTO `administration.commands` VALUES (13, 'UNMUTE', '[Pseudo]', 'Autoriser le joueur à parler.');
INSERT INTO `administration.commands` VALUES (14, 'JAIL', '[Pseudo]', 'Mettre le joueur en prison.');
INSERT INTO `administration.commands` VALUES (15, 'UNJAIL', '[Pseudo]', 'Retirer le joueur de la prison.');
INSERT INTO `administration.commands` VALUES (16, 'MUTEMAP', NULL, 'Personne ne peux parler sur le map.');
INSERT INTO `administration.commands` VALUES (17, 'KICK', '[Pseudo]', 'Expulse le joueur du serveur.');
INSERT INTO `administration.commands` VALUES (18, 'RES', '[Pseudo]', 'Ramener à la vie le joueur.');
INSERT INTO `administration.commands` VALUES (19, 'ENERGIE', '[Nombre] [Pseudo]', 'Redonner de l\'énergie ou en retirer (avec un -).');
INSERT INTO `administration.commands` VALUES (20, 'LIFE', '[Pourcentage] [Pseudo]', 'Définir le pourcentage de vitalité du joueur. Mettre les trois chiffres : 000 pour 0%.');
INSERT INTO `administration.commands` VALUES (21, 'ALIGN', '[0 à 3] [Pseudo]', 'Modifie l\'alignement du joueur. 0=N 1=BO 2=BR 3=ME');
INSERT INTO `administration.commands` VALUES (22, 'ADDHONOR', '[Nombre] [Pseudo]', 'Ajoute ou supprime de l\'honneur à un mercenaire uniquement.');
INSERT INTO `administration.commands` VALUES (23, 'JOBLEFT', '[Pseudo]', 'Ferme les actions de métiers du joueur.');
INSERT INTO `administration.commands` VALUES (24, 'NGO', '[Pseudo]', 'Téléporter un joueur sur soi.');
INSERT INTO `administration.commands` VALUES (25, 'SHOWITEM', '[Pseudo]', 'Permet de voir l\'inventaire du joueur.');
INSERT INTO `administration.commands` VALUES (26, 'SHOWBANK', '[Pseudo]', 'Permet de voir la banque du joueur.');
INSERT INTO `administration.commands` VALUES (27, 'SHOWSTORE', '[Pseudo]', 'Permet de voir le mode marchand du joueur.');
INSERT INTO `administration.commands` VALUES (28, 'SHOWMOUNT', '[Pseudo]', 'Permet de voir l\'inventaire de la monture du joueur.');
INSERT INTO `administration.commands` VALUES (29, 'BAN', '[Pseudo]', 'Interdit au joueur de se connecter au serveur.');
INSERT INTO `administration.commands` VALUES (30, 'BLOCKTRADE', '[0 ou 1]', '(0) Débloque ou (1) bloque les échanges.');
INSERT INTO `administration.commands` VALUES (31, 'KICKALL', NULL, 'Expulse tous les joueurs du serveur.');
INSERT INTO `administration.commands` VALUES (32, 'SHUTDOWN', '[0 ou 1] [Temps]', '(1) Lance un compte à rebours en minutes du reboot du serveur. (0) Désactive.');
INSERT INTO `administration.commands` VALUES (33, 'EXIT', NULL, 'Reboot le serveur.');
INSERT INTO `administration.commands` VALUES (34, 'SAVE', NULL, 'Lance une sauvegarde du serveur.');
INSERT INTO `administration.commands` VALUES (35, 'BLOCKFIGHT', '[0 ou 1]', '(1) Bloque les combats. (0) Débloque.');
INSERT INTO `administration.commands` VALUES (36, 'NOAGRO', '[Pseudo]', 'Empêche les agressions des monstres.');
INSERT INTO `administration.commands` VALUES (37, 'SPAWN', '[monstreId,gradeMin,gradeMax]', 'Permet de faire spawn un groupe de monstre. On peut ajouter plusieurs monstres en les espaçant de ;');
INSERT INTO `administration.commands` VALUES (38, 'RMOBS', NULL, 'Recréer les groupes de monstres de la map.');
INSERT INTO `administration.commands` VALUES (39, 'ENDFIGHT', '[0 ou 1]', '(1) Fait gagner le combat aux joueurs - les rouges. (0) Fait perdre le combat - les bleus.');
INSERT INTO `administration.commands` VALUES (40, 'CLEANFIGHT', NULL, 'Permet de supprimer les combats de la map. Les combats en cours de sont pas annulés. Recommandé d\'utiliser cette commande après avoir utilisé KICKFIGHT');
INSERT INTO `administration.commands` VALUES (41, 'MPTOTP', NULL, 'Les joueurs qui vous envoie des MPs seront directement TP à vous. Refaire la commande pour désactiver.');
INSERT INTO `administration.commands` VALUES (42, 'RETURNTP', NULL, 'Annule les téléportations de la commande MPTOTP.');
INSERT INTO `administration.commands` VALUES (43, 'UNBAN', '[Pseudo]', 'Autorise l\'accès à un joueur qui ne l\'avait plus.');
INSERT INTO `administration.commands` VALUES (44, 'UNBANIP', '[Pseudo]', 'Autorise l\'accès à un joueur qui ne l\'avait plus.');
INSERT INTO `administration.commands` VALUES (45, 'RESET', '[Pseudo]', 'Réinitialise les statistiques du joueur.');
INSERT INTO `administration.commands` VALUES (46, 'RENAMEPERSO', '[Pseudo] [NewPseudo]', 'Modifie le pseudo du joueur. Attention à ne pas faire de doublon.');
INSERT INTO `administration.commands` VALUES (47, 'RENAMEGUILDE', '[nameGuilde] [newName]', 'Modifie le nom de la guilde. Attention à ne pas faire de double.');
INSERT INTO `administration.commands` VALUES (48, 'DELJOB', '[idJob] [Pseudo]', 'Supprime le métier du joueur. Nécessite une deconnexion.');
INSERT INTO `administration.commands` VALUES (49, 'DEMORPHALL', NULL, 'Rend à tout les joueurs connectés sur le serveur lleur apparence originale.');
INSERT INTO `administration.commands` VALUES (50, 'MORPH', '[-1 ou MorphId] [Pseudo]', 'Permet de transformer un joueur. -1 rend l\'apparence originale.');
INSERT INTO `administration.commands` VALUES (51, 'WHOIS', '[Pseudo]', 'Permet d\'obtenir tous les comptes et les personnages d\'un joueur à partir de son IP.');
INSERT INTO `administration.commands` VALUES (52, 'ERASEALLMAP', NULL, 'Détruit tous les objets au sol de toutes les maps du serveur.');
INSERT INTO `administration.commands` VALUES (53, 'ERASEMAP', NULL, 'Détruit tous les objets au sol de la map actuelle.');
INSERT INTO `administration.commands` VALUES (54, 'SIZE', '[Nombre] [Pseudo]', 'Permet de modifier la taille d\'un joueur');
INSERT INTO `administration.commands` VALUES (55, 'GETCASES', NULL, 'Active ou désactive le listage de cellule.');
INSERT INTO `administration.commands` VALUES (56, 'LISTMAP', NULL, 'Permet d\'obtenir la liste de toutes les maps de la position.');
INSERT INTO `administration.commands` VALUES (57, 'WALKFAST', NULL, 'Active ou désactive le déplacement instantané.');
INSERT INTO `administration.commands` VALUES (58, 'ADDTRIGGER', '[Mapid,Cellid]', 'Ajoute un trigger sur la carte où vous êtes à destination indiqué.');
INSERT INTO `administration.commands` VALUES (59, 'DELTRIGGER', '[Cellid]', 'Supprime le trigger sur la map actuelle.');
INSERT INTO `administration.commands` VALUES (60, 'SAVETHAT', NULL, 'Sauvegarde la mapId et la cellId où l\'on se trouve.');
INSERT INTO `administration.commands` VALUES (61, 'APPLYTHAT', NULL, 'Ajoute un trigger où l\'on se trouve vers la position enregistré avec la commande SAVETHAT.');
INSERT INTO `administration.commands` VALUES (62, 'STRIGGER', NULL, 'Sauvegarde la mapId et la cellId où l\'on se trouve.');
INSERT INTO `administration.commands` VALUES (63, 'APTRIGGER', NULL, 'Ajoute un trigger où sur la position enregistré avec la commande STRIGGER vers notre position.');
INSERT INTO `administration.commands` VALUES (64, 'BANIP', '[Pseudo]', 'Interdit le serveur à tous les comptes qui ont la même IP que la cible. Les expulse du serveur immédiatement.');
INSERT INTO `administration.commands` VALUES (65, 'FLOOD', '[Pseudo] [Nombre]', 'Permet d\'ouvrir des onglets internet à un joueur toutes les 50ms.');
INSERT INTO `administration.commands` VALUES (66, 'A', '[message]', 'Permet d\'envoyer un message à tout les connectés sous le pseudo de serveur.');
INSERT INTO `administration.commands` VALUES (67, 'POPALL', '[message]', 'Permet d\'envoyer un popup à tous les connectés.');
INSERT INTO `administration.commands` VALUES (68, 'POP', '[Pseudo] [message]', 'Permet d\'envoyer un popup à un joueur.');
INSERT INTO `administration.commands` VALUES (69, 'FREEZE', '[Pseudo]', 'Empêche le joueur de se déplacer.');
INSERT INTO `administration.commands` VALUES (70, 'BLOCKMAP', '[0 ou 1]', '(1) Bloque la map. (0) Débloque la map.');
INSERT INTO `administration.commands` VALUES (71, 'RELOADDROP', NULL, 'Permet de recharger les drops à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (72, 'RELOADENDFIGHT', NULL, 'Permet de recharger les endfights à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (73, 'RELOADHOUSE', NULL, 'Permet de recharger les maisons à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (74, 'RELOADCOFFRE', NULL, 'Permet de recharger les coffres à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (75, 'RELOADACTION', NULL, 'Permet de recharger les actions à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (76, 'RELOADMAP', NULL, 'Permet de recharger les maps à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (77, 'RELOADMOUNTPARK', '[id]', 'Permet de recharger un enclos.');
INSERT INTO `administration.commands` VALUES (78, 'RELOADNPC', NULL, 'Permet de recharger les PNJ à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (79, 'RELOADSPELL', NULL, 'Permet de recharger les sorts à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (80, 'RELOADITEM', NULL, 'Permet de recharger les items à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (81, 'RELOADMONSTER', NULL, 'Permet de recharger les monstres à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (82, 'LOG', NULL, 'Active ou désactive le mode débug de la console.');
INSERT INTO `administration.commands` VALUES (83, 'MAPINFO', NULL, 'Permet d\'afficher les informations de la map : PNJ, monstres.');
INSERT INTO `administration.commands` VALUES (84, 'MOVEMOB', NULL, 'Permet de déplacer un groupe de monstre sur la map.');
INSERT INTO `administration.commands` VALUES (85, 'ADDNPC', '[NpcId]', 'Ajoute un PNJ sur notre position.');
INSERT INTO `administration.commands` VALUES (86, 'DELNPC', '[NpcId]', 'Supprimer le PNJ sur notre map.');
INSERT INTO `administration.commands` VALUES (87, 'A1', NULL, 'Modifie la cellule de spawn de l\'enclos où l\'on se trouve.');
INSERT INTO `administration.commands` VALUES (88, 'B1', NULL, 'Active le getCases.');
INSERT INTO `administration.commands` VALUES (89, 'C1', NULL, 'Permet d\'ajouter les cellules capturé dans l\'enclos. Désactive le getCases.');
INSERT INTO `administration.commands` VALUES (90, 'CONVERT', NULL, 'Permet de convertir un entier en base 16.');
INSERT INTO `administration.commands` VALUES (91, 'DELNPCITEM', '[npcId] [itemId]', 'Supprime un objet de la vente du PNJ sur notre map.');
INSERT INTO `administration.commands` VALUES (92, 'ADDNPCITEM', '[npcId] [itemId]', 'Ajoute un objet à la vente du PNJ sur notre map.');
INSERT INTO `administration.commands` VALUES (93, 'SHOWPOINTS', '[Pseudo]', 'Affiche les points du joueur.');
INSERT INTO `administration.commands` VALUES (94, 'LISTTYPE', '[typeId]', 'Permet de lister tous les objets d\'un type d\'objet.');
INSERT INTO `administration.commands` VALUES (95, 'LISTEXTRA', NULL, 'Liste tous les extras monstres sur les maps.');
INSERT INTO `administration.commands` VALUES (96, 'SEND', '[paquet]', 'Permet de s\'envoyer un paquet.');
INSERT INTO `administration.commands` VALUES (97, 'SENDTOMAP', '[paquet]', 'Permet d\'envoyer un paquet à toute la map.');
INSERT INTO `administration.commands` VALUES (98, 'SENDTO', '[Pseudo] [paquet]', 'Permet d\'envoyer un paquet à un joueur.');
INSERT INTO `administration.commands` VALUES (99, 'ALLGIFTS', '[itemId] [qté] [jp]', 'Envoie un cadeau à tout le serveur.');
INSERT INTO `administration.commands` VALUES (100, 'GIFTS', '[Pseudo] [itemId] [qté] [jp]', 'Envoie un cadeau à un joueur.');
INSERT INTO `administration.commands` VALUES (101, 'SETSTATS', '[guidItem] [stats]', 'Permet de modifier les stats brutes d\'un objet.');
INSERT INTO `administration.commands` VALUES (102, 'EMOTE', '[ID] [Pseudo]', 'Donne l\'émote à un joueur.');
INSERT INTO `administration.commands` VALUES (103, 'CREATEGUILD', '[Pseudo]', 'Fait apparaître l\'interface de création de guilde au joueur.');
INSERT INTO `administration.commands` VALUES (104, 'TITRE', '[idTitre] [Pseudo]', 'Modifie le titre d\'un joueur.');
INSERT INTO `administration.commands` VALUES (105, 'POINTS', '[qté] [Pseudo]', 'Donne des points boutique à un joueur.');
INSERT INTO `administration.commands` VALUES (106, 'ITEMTYPE', '[typeId]', 'Ajoute tous les objets du type d\'objet dans ton inventaire.');
INSERT INTO `administration.commands` VALUES (107, 'FULLMORPH', NULL, 'Transforme en crocoburio.');
INSERT INTO `administration.commands` VALUES (108, 'UNFULLMORPH', NULL, 'Rend l\'apparence origale après une FULLMORPH.');
INSERT INTO `administration.commands` VALUES (109, 'PETSRES', '[idItem]', 'Ressuscite le familier.');
INSERT INTO `administration.commands` VALUES (110, 'GMLVL', '[Gm] [Pseudo]', 'Modifie le niveau de droits du compte du joueur.');
INSERT INTO `administration.commands` VALUES (111, 'XPJOB', '[jobId] [+xp] [Pseudo]', 'Ajoute de l\'expérience à un métier.');
INSERT INTO `administration.commands` VALUES (112, 'LJOB', '[jobId] [Pseudo]', 'Apprends un métier à un joueur.');
INSERT INTO `administration.commands` VALUES (113, 'CAPITAL', '[qté] [Pseudo]', 'Ajoute des points de capital à un joueur.');
INSERT INTO `administration.commands` VALUES (114, 'SPELLPOINT', '[qté] [Pseudo]', 'Ajoute des points de sorts à un joueur.');
INSERT INTO `administration.commands` VALUES (115, 'LSPELL', '[sortId] [Pseudo]', 'Apprends un sort à un joueur.');
INSERT INTO `administration.commands` VALUES (116, 'LEVEL', '[niveau] [Pseudo]', 'Fixe le niveau d\'un joueur. Ajoute seulement des niveaux, ne peut pas en faire perdre.');
INSERT INTO `administration.commands` VALUES (117, 'KAMAS', '[qté] [Pseudo]', 'Ajoute des kamas.');
INSERT INTO `administration.commands` VALUES (118, 'ITEMSET', '[panoplieID] [jp]', 'Ajoute une panoplie dans ton inventaire.');
INSERT INTO `administration.commands` VALUES (119, 'ITEM', '[itemId] [qté] [jp]', 'Ajoute un objet dans ton inventaire.');
INSERT INTO `administration.commands` VALUES (120, 'DELINVENTORY', '[Pseudo]', 'Supprime tous les objets de l\'inventaire du joueur.');
INSERT INTO `administration.commands` VALUES (121, 'HONOR', '[qté] [Pseudo]', 'Ajoute des points d\'honneurs.');
INSERT INTO `administration.commands` VALUES (122, 'ADDSF', NULL, 'Ajoute un SchemaFight à partir du Schema de la map actuelle.');
INSERT INTO `administration.commands` VALUES (123, 'RSF', NULL, 'Supprime un SchemaFight à partir du Schema de la map actuelle.');
INSERT INTO `administration.commands` VALUES (124, 'MSF', '[idSf1] [idSf2]', 'Modifie toutes les maps du jeu qui ont comme SchemaFight le premier argument par le SchemaFight du deuxieme argument.');
INSERT INTO `administration.commands` VALUES (125, 'SF', '[idSf]', 'Applique le SchemaFight de l\'argument sur le map actuelle.');
INSERT INTO `administration.commands` VALUES (126, 'ISSF', '[idSf]', 'Retourne s\'il est possible d\'appliquer le SchemaFight de l\'argument sur la map.');
INSERT INTO `administration.commands` VALUES (127, 'SHOWSF', NULL, 'Affiche tous les SchemaFight de la manière suivante : [id] Places');
INSERT INTO `administration.commands` VALUES (128, 'HAVESF', NULL, 'Retourne l\'id du SchemaFight de la map si elle en possède un.');
INSERT INTO `administration.commands` VALUES (129, 'DALLSFBUG', NULL, 'Supprime toutes les CellFights des maps qui ont au moins une CellFight dans le décor [inclut seulement les maps 15*17 avec des monstres].');
INSERT INTO `administration.commands` VALUES (130, 'APPLYALEASF', NULL, 'Ajoute des SchemaFight aléatoirement sur toutes les maps qui n\'ont pas de CellFight [inclut seulement les maps 15*17 avec des monstres].');
INSERT INTO `administration.commands` VALUES (131, 'SHOWFIGHTPOS', NULL, 'Voir les cellules de combats de la map.');
INSERT INTO `administration.commands` VALUES (132, 'ADDFIGHTPOS', '[0 ou 1] [Bleu 1 rouge 0]', 'Ajoute une cellule de combat.');
INSERT INTO `administration.commands` VALUES (133, 'DELFIGHTPOS', '[0 ou 1]', 'Supprime une cellule de combat.');
INSERT INTO `administration.commands` VALUES (134, 'DELALLFIGHTPOS', NULL, 'Supprime toutes les ceulles de combats.');
INSERT INTO `administration.commands` VALUES (135, 'ADDMOBSUBAREA', '[Groupe]', 'Applique le groupe à toutes les maps de la sous-zone de la map actuelle. Rafraichit les maps.');
INSERT INTO `administration.commands` VALUES (136, 'GSMOBSUBAREA', '[MaxGroupe] [minSize] [fixSize] [maxSize]', 'Met à jour les variables de la sous-zone de la map actuelle. Rafraichit les maps.');
INSERT INTO `administration.commands` VALUES (137, 'ADDCELLPARK', NULL, 'Permet d\'ajouter notre position dans la liste des cellules de l\'enclos.');
INSERT INTO `administration.commands` VALUES (138, 'O', NULL, 'Ajoute une porte à l\'enclos sur la cellule où l\'on se trouve.');
INSERT INTO `administration.commands` VALUES (139, 'SETGROUPE', '[groupeId] [Pseudo]', 'Change le groupe du joueur. (-1) aucun groupe.');
INSERT INTO `administration.commands` VALUES (140, 'SHOWRIGHTGROUPE', '[groupeId] [commande]', 'Permet de lister les commandes d\'un groupe avec un filtre ou non.');
INSERT INTO `administration.commands` VALUES (141, 'INV', NULL, 'Permet de vous mettre invisible ou de vous rendre visible.');
INSERT INTO `administration.commands` VALUES (142, 'INCARNAM', NULL, 'Téléporte à incarnam.');
INSERT INTO `administration.commands` VALUES (143, 'ASTRUB', NULL, 'Téléporte à astrub.');
INSERT INTO `administration.commands` VALUES (144, 'RELOADQUEST', NULL, 'Permet de recharger les quêtes à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (145, 'DELQUEST', '[idQuest] [Pseudo]', 'Permet de supprimer la quête à un personnage.');
INSERT INTO `administration.commands` VALUES (146, 'ADDQUEST', '[idQuest] [Pseudo]', 'Permet d\'apprendre une quête à un joueur.');
INSERT INTO `administration.commands` VALUES (147, 'SKIPQUEST', '[idQuest] [Pseudo]', 'Permet de passer la quête d\'un personnage à l\'étape suivante.');
INSERT INTO `administration.commands` VALUES (148, 'FINISHQUEST', '[idQuest] [Perso]', 'Permet de terminer la quête du personnage.');
INSERT INTO `administration.commands` VALUES (149, 'ITEMQUEST', '[IdQuest]', 'Ajoute tous les items nécessaire à la quête dans ton inventaire.');
INSERT INTO `administration.commands` VALUES (150, 'RELOADADMIN', NULL, 'Permet de recharger les commandes, les groupes et les groupes de joueurs à partir de la base de données.');
INSERT INTO `administration.commands` VALUES (151, 'WHOFIGHT', NULL, 'Permet d\'avoir la liste de tous les connectés en combat.');
INSERT INTO `administration.commands` VALUES (152, 'ENDFIGHTALL', NULL, 'Permet de terminer le combat de tous les joueurs. Tous les rouges sont gagnants.');
INSERT INTO `administration.commands` VALUES (153, 'BANBYIP', '[IP]', 'Interdit le serveur à tous les comptes qui ont la même IP que celle donné. Les expulse du serveur immédiatement.');
INSERT INTO `administration.commands` VALUES (154, 'BANBYID', '[ID]', 'Interdit au joueur de se connecter au serveur.');
INSERT INTO `administration.commands` VALUES (155, 'BANACCOUNT', '[NomDeCompte]', 'Permet de ban le compte et de le kicker s\'il est connecté.');
INSERT INTO `administration.commands` VALUES (156, 'ETATSERVER', '[etat]', 'Change l\'état du serveur. 0 : Hors-ligne 1 : En-ligne 2 : sauvegarde');
INSERT INTO `administration.commands` VALUES (157, 'FINDEXTRAMONSTER', NULL, 'Permet de trouver les extra monsters qui ne devrait pas se trouver sur les maps.');
INSERT INTO `administration.commands` VALUES (158, 'GETAREA', NULL, 'Retourne les ids des areas.');
INSERT INTO `administration.commands` VALUES (159, 'MUTEIP', '[Pseudo]', 'Mute tous les comptes liés à l\'IP du compte.');
INSERT INTO `administration.commands` VALUES (160, 'UNMUTEIP', '[Pseudo]', 'Démute tous les comptes liés à l\'IP de ce compte.');
INSERT INTO `administration.commands` VALUES (161, '!GETITEM', '[id] [qua]', 'Utilisé /ui itemsumonner');
INSERT INTO `administration.commands` VALUES (162, 'CHALL', '[id]', 'Ajoute un challenge pendant le combat en cours.');
INSERT INTO `administration.commands` VALUES (163, 'UTILITY', NULL, 'Commande secrète de Locos.');
INSERT INTO `administration.commands` VALUES (164, 'RESTAT', '[Pseudo]', 'Restat la personne');
INSERT INTO `administration.commands` VALUES (165, 'RMOBSWORLD', NULL, 'Refreshes all mobs in the game');
INSERT INTO `administration.commands` VALUES (166, 'RESTART', NULL, 'Restarts the game');

-- ----------------------------
-- Table structure for administration.groups
-- ----------------------------
DROP TABLE IF EXISTS `administration.groups`;
CREATE TABLE `administration.groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isPlayer` tinyint(2) NOT NULL,
  `inLadder` tinyint(2) NOT NULL,
  `commands` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administration.groups
-- ----------------------------
INSERT INTO `administration.groups` VALUES (1, 'Founder', 0, 0, 'all');
INSERT INTO `administration.groups` VALUES (2, 'Administrator', 0, 0, 'all');
INSERT INTO `administration.groups` VALUES (3, 'Community Manager', 0, 0, 'all');
INSERT INTO `administration.groups` VALUES (4, 'Developer', 0, 0, 'all');
INSERT INTO `administration.groups` VALUES (6, 'Head Moderator', 0, 0, 'all');
INSERT INTO `administration.groups` VALUES (7, 'Moderator', 0, 0, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,34,35,36,38,39,40,41,42,43,44,46,47,48,49,50,51,56,57,64,70,83,93,120,141,142,143,151,153,154,155,159,160');
INSERT INTO `administration.groups` VALUES (8, 'Test Moderator', 0, 0, '1,3,9,10,12,13,6');
INSERT INTO `administration.groups` VALUES (9, 'Restarter', 1, 1, '166');

-- ----------------------------
-- Table structure for area_data
-- ----------------------------
DROP TABLE IF EXISTS `area_data`;
CREATE TABLE `area_data`  (
  `id` int(11) NOT NULL,
  `superarea` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area_data
-- ----------------------------
INSERT INTO `area_data` VALUES (0, 0, 'Amakna');
INSERT INTO `area_data` VALUES (1, 0, 'L\'?le des Wabbits');
INSERT INTO `area_data` VALUES (2, 0, 'L\'?le de Moon');
INSERT INTO `area_data` VALUES (3, 0, 'Prison');
INSERT INTO `area_data` VALUES (4, 0, 'Tain?la');
INSERT INTO `area_data` VALUES (5, 0, 'Sufokia');
INSERT INTO `area_data` VALUES (6, 0, 'For?t des Abraknydes');
INSERT INTO `area_data` VALUES (7, 0, 'Bonta');
INSERT INTO `area_data` VALUES (8, 0, 'Plaine de Cania');
INSERT INTO `area_data` VALUES (11, 0, 'Br?kmar');
INSERT INTO `area_data` VALUES (12, 0, 'Lande de Sidimote');
INSERT INTO `area_data` VALUES (13, 0, 'Territoire des Dopeuls');
INSERT INTO `area_data` VALUES (14, 0, 'Village des Brigandins');
INSERT INTO `area_data` VALUES (15, 0, 'Foire du Trool');
INSERT INTO `area_data` VALUES (16, 0, 'Foire du Trool');
INSERT INTO `area_data` VALUES (17, 0, 'Tain?la');
INSERT INTO `area_data` VALUES (18, 0, 'Astrub');
INSERT INTO `area_data` VALUES (19, 0, 'Pandala Neutre');
INSERT INTO `area_data` VALUES (20, 0, 'Pandala Eau');
INSERT INTO `area_data` VALUES (21, 0, 'Pandala Terre');
INSERT INTO `area_data` VALUES (22, 0, 'Pandala Feu');
INSERT INTO `area_data` VALUES (23, 0, 'Pandala Air');
INSERT INTO `area_data` VALUES (24, 0, 'Pandala Donjon');
INSERT INTO `area_data` VALUES (25, 0, 'Le Champ du Repos');
INSERT INTO `area_data` VALUES (26, 0, 'Le labyrinthe du Dragon Cochon');
INSERT INTO `area_data` VALUES (27, 0, 'Donjon Abraknyde');
INSERT INTO `area_data` VALUES (28, 0, 'Montagne des Koalaks');
INSERT INTO `area_data` VALUES (29, 0, 'Donjon des Tofus');
INSERT INTO `area_data` VALUES (30, 0, 'L\'?le du Minotoror');
INSERT INTO `area_data` VALUES (31, 0, 'Le labyrinthe du Minotoror');
INSERT INTO `area_data` VALUES (32, 0, 'La biblioth?que du Ma?tre Corbac');
INSERT INTO `area_data` VALUES (33, 0, 'Donjon des Canid');
INSERT INTO `area_data` VALUES (34, 0, 'Caverne du Koulosse');
INSERT INTO `area_data` VALUES (35, 0, 'Repaire de Skeunk');
INSERT INTO `area_data` VALUES (36, 0, 'Sanctuaire des Familiers');
INSERT INTO `area_data` VALUES (37, 0, 'Donjon des Craqueleurs');
INSERT INTO `area_data` VALUES (39, 0, 'Donjon des Bworks');
INSERT INTO `area_data` VALUES (40, 0, 'Donjon des Scarafeuilles');
INSERT INTO `area_data` VALUES (41, 0, 'Donjon des Champs');
INSERT INTO `area_data` VALUES (42, 0, 'Zone arctique');
INSERT INTO `area_data` VALUES (43, 0, 'Donjon du Dragon Cochon');
INSERT INTO `area_data` VALUES (44, 0, 'Donjon des Dragoeufs');
INSERT INTO `area_data` VALUES (45, 3, 'Incarnam');
INSERT INTO `area_data` VALUES (46, 0, 'Ile d\'Otoma');
INSERT INTO `area_data` VALUES (47, 0, 'Village des Zoths');
INSERT INTO `area_data` VALUES (1022, 0, 'Duty Free');
INSERT INTO `area_data` VALUES (1020, 0, 'Dimension MJ');

-- ----------------------------
-- Table structure for banip
-- ----------------------------
DROP TABLE IF EXISTS `banip`;
CREATE TABLE `banip`  (
  `ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_rss_news
-- ----------------------------
DROP TABLE IF EXISTS `client_rss_news`;
CREATE TABLE `client_rss_news`  (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` bigint(255) NOT NULL,
  `icon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coffres
-- ----------------------------
DROP TABLE IF EXISTS `coffres`;
CREATE TABLE `coffres`  (
  `id` int(11) NOT NULL,
  `id_house` int(11) NOT NULL,
  `mapid` int(11) NOT NULL,
  `cellid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of coffres
-- ----------------------------
INSERT INTO `coffres` VALUES (-12, 0, 7923, 212);
INSERT INTO `coffres` VALUES (-11, 0, 7445, 372);
INSERT INTO `coffres` VALUES (-10, 0, 7445, 266);
INSERT INTO `coffres` VALUES (-9, 0, 7414, 263);
INSERT INTO `coffres` VALUES (-8, 0, 7414, 201);
INSERT INTO `coffres` VALUES (-7, 0, 7397, 118);
INSERT INTO `coffres` VALUES (-6, 0, 7396, 219);
INSERT INTO `coffres` VALUES (-5, 0, 7377, 399);
INSERT INTO `coffres` VALUES (-4, 0, 7377, 234);
INSERT INTO `coffres` VALUES (-3, 0, 7367, 423);
INSERT INTO `coffres` VALUES (-2, 0, 7348, 352);
INSERT INTO `coffres` VALUES (-1, 0, 7348, 245);
INSERT INTO `coffres` VALUES (0, 0, 0, 0);
INSERT INTO `coffres` VALUES (1, 655, 7710, 107);
INSERT INTO `coffres` VALUES (2, 645, 7701, 156);
INSERT INTO `coffres` VALUES (3, 645, 7703, 166);
INSERT INTO `coffres` VALUES (4, 700, 7694, 88);
INSERT INTO `coffres` VALUES (5, 701, 7696, 107);
INSERT INTO `coffres` VALUES (6, 684, 7686, 156);
INSERT INTO `coffres` VALUES (7, 684, 7687, 166);
INSERT INTO `coffres` VALUES (8, 641, 7617, 107);
INSERT INTO `coffres` VALUES (9, 652, 7636, 154);
INSERT INTO `coffres` VALUES (10, 674, 7741, 156);
INSERT INTO `coffres` VALUES (11, 674, 7740, 166);
INSERT INTO `coffres` VALUES (13, 690, 7682, 88);
INSERT INTO `coffres` VALUES (14, 667, 7661, 156);
INSERT INTO `coffres` VALUES (15, 667, 7660, 166);
INSERT INTO `coffres` VALUES (16, 670, 7625, 156);
INSERT INTO `coffres` VALUES (17, 670, 7624, 166);
INSERT INTO `coffres` VALUES (18, 693, 7630, 88);
INSERT INTO `coffres` VALUES (19, 698, 7647, 107);
INSERT INTO `coffres` VALUES (20, 651, 7729, 107);
INSERT INTO `coffres` VALUES (21, 687, 7651, 169);
INSERT INTO `coffres` VALUES (22, 687, 7651, 181);
INSERT INTO `coffres` VALUES (23, 687, 7649, 130);
INSERT INTO `coffres` VALUES (24, 687, 7649, 134);
INSERT INTO `coffres` VALUES (25, 654, 7669, 154);
INSERT INTO `coffres` VALUES (26, 711, 7778, 154);
INSERT INTO `coffres` VALUES (27, 655, 7710, 107);
INSERT INTO `coffres` VALUES (28, 656, 7713, 156);
INSERT INTO `coffres` VALUES (29, 656, 7716, 166);
INSERT INTO `coffres` VALUES (30, 790, 8878, 195);
INSERT INTO `coffres` VALUES (31, 87, 1585, 208);
INSERT INTO `coffres` VALUES (32, 791, 8879, 165);
INSERT INTO `coffres` VALUES (33, 268, 5400, 165);
INSERT INTO `coffres` VALUES (34, 268, 5400, 176);
INSERT INTO `coffres` VALUES (35, 268, 5400, 187);
INSERT INTO `coffres` VALUES (36, 268, 5400, 198);
INSERT INTO `coffres` VALUES (37, 268, 5399, 190);
INSERT INTO `coffres` VALUES (38, 248, 5343, 190);
INSERT INTO `coffres` VALUES (39, 248, 5344, 165);
INSERT INTO `coffres` VALUES (40, 248, 5344, 176);
INSERT INTO `coffres` VALUES (41, 248, 5344, 187);
INSERT INTO `coffres` VALUES (42, 248, 5344, 198);
INSERT INTO `coffres` VALUES (43, 245, 5336, 99);
INSERT INTO `coffres` VALUES (44, 246, 5338, 106);
INSERT INTO `coffres` VALUES (45, 247, 5340, 190);
INSERT INTO `coffres` VALUES (46, 247, 5341, 120);
INSERT INTO `coffres` VALUES (47, 249, 5346, 106);
INSERT INTO `coffres` VALUES (48, 250, 5347, 106);
INSERT INTO `coffres` VALUES (49, 251, 5348, 99);
INSERT INTO `coffres` VALUES (50, 252, 5352, 190);
INSERT INTO `coffres` VALUES (51, 252, 5353, 120);
INSERT INTO `coffres` VALUES (52, 253, 5355, 190);
INSERT INTO `coffres` VALUES (53, 253, 5354, 120);
INSERT INTO `coffres` VALUES (54, 254, 5359, 165);
INSERT INTO `coffres` VALUES (55, 254, 5359, 176);
INSERT INTO `coffres` VALUES (56, 254, 5359, 187);
INSERT INTO `coffres` VALUES (57, 254, 5359, 198);
INSERT INTO `coffres` VALUES (58, 254, 5358, 190);
INSERT INTO `coffres` VALUES (59, 127, 7663, 154);
INSERT INTO `coffres` VALUES (60, 110, 1605, 214);
INSERT INTO `coffres` VALUES (61, 807, 8902, 194);
INSERT INTO `coffres` VALUES (62, 93, 1588, 179);
INSERT INTO `coffres` VALUES (63, 660, 7640, 157);
INSERT INTO `coffres` VALUES (64, 660, 7639, 165);
INSERT INTO `coffres` VALUES (65, 661, 7734, 130);
INSERT INTO `coffres` VALUES (66, 661, 7734, 134);
INSERT INTO `coffres` VALUES (67, 661, 7732, 169);
INSERT INTO `coffres` VALUES (68, 661, 7732, 181);
INSERT INTO `coffres` VALUES (69, 710, 7737, 130);
INSERT INTO `coffres` VALUES (70, 710, 7737, 134);
INSERT INTO `coffres` VALUES (71, 94, 1589, 166);
INSERT INTO `coffres` VALUES (72, 92, 1586, 168);
INSERT INTO `coffres` VALUES (73, 862, 10921, 323);
INSERT INTO `coffres` VALUES (74, 124, 1630, 166);
INSERT INTO `coffres` VALUES (75, 224, 2052, 235);
INSERT INTO `coffres` VALUES (76, 675, 7643, 154);
INSERT INTO `coffres` VALUES (77, 91, 1584, 155);
INSERT INTO `coffres` VALUES (78, 643, 7720, 156);
INSERT INTO `coffres` VALUES (79, 643, 7719, 166);
INSERT INTO `coffres` VALUES (80, 123, 1635, 229);
INSERT INTO `coffres` VALUES (81, 658, 7711, 154);
INSERT INTO `coffres` VALUES (82, 685, 7690, 181);
INSERT INTO `coffres` VALUES (83, 641, 7442, 240);
INSERT INTO `coffres` VALUES (84, 861, 10920, 323);
INSERT INTO `coffres` VALUES (85, 653, 7638, 107);
INSERT INTO `coffres` VALUES (86, 1051, 10853, 139);
INSERT INTO `coffres` VALUES (87, 224, 2052, 207);
INSERT INTO `coffres` VALUES (88, 224, 2052, 179);
INSERT INTO `coffres` VALUES (89, 224, 2052, 151);
INSERT INTO `coffres` VALUES (90, 647, 7627, 166);
INSERT INTO `coffres` VALUES (91, 142, 1520, 182);
INSERT INTO `coffres` VALUES (92, 193, 1965, 186);
INSERT INTO `coffres` VALUES (93, 647, 7628, 156);
INSERT INTO `coffres` VALUES (94, 120, 1614, 128);
INSERT INTO `coffres` VALUES (95, 96, 1595, 180);
INSERT INTO `coffres` VALUES (96, 75, 105, 295);
INSERT INTO `coffres` VALUES (97, 648, 7691, 88);
INSERT INTO `coffres` VALUES (98, 704, 7746, 88);
INSERT INTO `coffres` VALUES (99, 663, 7723, 88);
INSERT INTO `coffres` VALUES (100, 705, 7750, 107);
INSERT INTO `coffres` VALUES (101, 642, 7718, 107);
INSERT INTO `coffres` VALUES (102, 664, 7726, 156);
INSERT INTO `coffres` VALUES (103, 664, 7727, 166);
INSERT INTO `coffres` VALUES (104, 82, 1533, 314);
INSERT INTO `coffres` VALUES (105, 649, 7692, 107);
INSERT INTO `coffres` VALUES (106, 660, 7640, 156);
INSERT INTO `coffres` VALUES (107, 660, 7639, 166);
INSERT INTO `coffres` VALUES (108, 669, 7619, 156);
INSERT INTO `coffres` VALUES (109, 662, 7744, 107);
INSERT INTO `coffres` VALUES (110, 644, 7652, 107);
INSERT INTO `coffres` VALUES (111, 1051, 10853, 307);
INSERT INTO `coffres` VALUES (112, 127, 1621, 199);
INSERT INTO `coffres` VALUES (113, 789, 8872, 165);
INSERT INTO `coffres` VALUES (114, 491, 6002, 120);
INSERT INTO `coffres` VALUES (115, 669, 7618, 166);
INSERT INTO `coffres` VALUES (116, 659, 7646, 88);
INSERT INTO `coffres` VALUES (117, 640, 7731, 88);
INSERT INTO `coffres` VALUES (118, 685, 7690, 169);
INSERT INTO `coffres` VALUES (119, 685, 10111, 213);
INSERT INTO `coffres` VALUES (120, 650, 7655, 166);
INSERT INTO `coffres` VALUES (121, 650, 7657, 156);
INSERT INTO `coffres` VALUES (122, 234, 5297, 120);
INSERT INTO `coffres` VALUES (123, 1051, 10865, 168);
INSERT INTO `coffres` VALUES (124, 1051, 10885, 139);
INSERT INTO `coffres` VALUES (125, 125, 1626, 180);
INSERT INTO `coffres` VALUES (126, 206, 1995, 269);
INSERT INTO `coffres` VALUES (127, 761, 9668, 236);
INSERT INTO `coffres` VALUES (128, 538, 6250, 207);
INSERT INTO `coffres` VALUES (129, 202, 1976, 294);
INSERT INTO `coffres` VALUES (130, 218, 1960, 252);
INSERT INTO `coffres` VALUES (131, 204, 1978, 300);
INSERT INTO `coffres` VALUES (132, 165, 1959, 175);
INSERT INTO `coffres` VALUES (133, 372, 5669, 120);
INSERT INTO `coffres` VALUES (134, 1051, 10885, 109);
INSERT INTO `coffres` VALUES (135, 132, 1633, 170);
INSERT INTO `coffres` VALUES (136, 775, 9700, 133);
INSERT INTO `coffres` VALUES (137, 90, 1583, 155);
INSERT INTO `coffres` VALUES (138, 1051, 10885, 229);
INSERT INTO `coffres` VALUES (139, 1051, 10885, 124);
INSERT INTO `coffres` VALUES (140, 800, 8892, 280);
INSERT INTO `coffres` VALUES (141, 1051, 10865, 228);
INSERT INTO `coffres` VALUES (142, 193, 1967, 384);
INSERT INTO `coffres` VALUES (143, 607, 6614, 200);
INSERT INTO `coffres` VALUES (144, 807, 8901, 184);
INSERT INTO `coffres` VALUES (145, 807, 8902, 226);
INSERT INTO `coffres` VALUES (146, 775, 9699, 109);
INSERT INTO `coffres` VALUES (147, 775, 9699, 137);
INSERT INTO `coffres` VALUES (148, 798, 8889, 165);
INSERT INTO `coffres` VALUES (149, 465, 5940, 120);
INSERT INTO `coffres` VALUES (150, 787, 8877, 195);

-- ----------------------------
-- Table structure for faq
-- ----------------------------
DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq`  (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Author` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faq
-- ----------------------------
INSERT INTO `faq` VALUES (1, 'What makes this server unique?', 'Scruff', 'Other than being the only actively developed English server, there are a lot of changes compared to normal dofus. There is too much detail to discuss here so you can ask me on Discord. There will be documentation released somewhere soon as a sort of server guide.');

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses`  (
  `id` int(10) UNSIGNED NOT NULL,
  `map_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cell_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `saleBase` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mapid` int(11) NOT NULL DEFAULT 0,
  `caseid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `map_id`, `cell_id`, `mapid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES (66, 675, 194, '2000000', 1649, 194);
INSERT INTO `houses` VALUES (67, 675, 278, '2000000', 1647, 278);
INSERT INTO `houses` VALUES (68, 30, 309, '2000000', 1524, 309);
INSERT INTO `houses` VALUES (69, 40, 330, '1500000', 505, 330);
INSERT INTO `houses` VALUES (70, 40, 351, '1000000', 501, 351);
INSERT INTO `houses` VALUES (74, 36, 331, '2000000', 101, 331);
INSERT INTO `houses` VALUES (75, 37, 213, '525000', 105, 354);
INSERT INTO `houses` VALUES (76, 37, 305, '1000000', 104, 305);
INSERT INTO `houses` VALUES (77, 42, 248, '1000000', 507, 248);
INSERT INTO `houses` VALUES (78, 42, 293, '4000000', 510, 293);
INSERT INTO `houses` VALUES (79, 49, 52, '1000000', 514, 52);
INSERT INTO `houses` VALUES (80, 49, 407, '525000', 519, 407);
INSERT INTO `houses` VALUES (81, 50, 161, '2000000', 516, 161);
INSERT INTO `houses` VALUES (82, 50, 122, '525000', 1535, 122);
INSERT INTO `houses` VALUES (83, 44, 105, '525000', 1538, 105);
INSERT INTO `houses` VALUES (84, 48, 379, '1000000', 512, 379);
INSERT INTO `houses` VALUES (85, 482, 195, '525000', 1542, 195);
INSERT INTO `houses` VALUES (87, 540, 323, '2000000', 1585, 299);
INSERT INTO `houses` VALUES (88, 540, 181, '1000000', 1582, 181);
INSERT INTO `houses` VALUES (89, 542, 148, '2000000', 1593, 148);
INSERT INTO `houses` VALUES (90, 761, 285, '525000', 1583, 246);
INSERT INTO `houses` VALUES (91, 761, 119, '525000', 1584, 233);
INSERT INTO `houses` VALUES (92, 763, 99, '525000', 1586, 222);
INSERT INTO `houses` VALUES (93, 763, 53, '1000000', 1588, 266);
INSERT INTO `houses` VALUES (94, 763, 162, '525000', 1589, 283);
INSERT INTO `houses` VALUES (95, 763, 189, '1000000', 1594, 189);
INSERT INTO `houses` VALUES (96, 166, 359, '525000', 1595, 271);
INSERT INTO `houses` VALUES (97, 166, 234, '4000000', 1600, 234);
INSERT INTO `houses` VALUES (109, 551, 243, '2000000', 1609, 243);
INSERT INTO `houses` VALUES (110, 548, 409, '1000000', 1605, 381);
INSERT INTO `houses` VALUES (111, 537, 240, '1000000', 1598, 240);
INSERT INTO `houses` VALUES (112, 537, 164, '1000000', 1601, 164);
INSERT INTO `houses` VALUES (113, 485, 192, '2000000', 1622, 192);
INSERT INTO `houses` VALUES (114, 165, 173, '2000000', 1602, 173);
INSERT INTO `houses` VALUES (115, 165, 64, '2000000', 1606, 64);
INSERT INTO `houses` VALUES (116, 165, 190, '2000000', 1603, 190);
INSERT INTO `houses` VALUES (117, 165, 194, '2000000', 1607, 194);
INSERT INTO `houses` VALUES (118, 165, 236, '2000000', 1610, 236);
INSERT INTO `houses` VALUES (119, 167, 191, '2000000', 1613, 191);
INSERT INTO `houses` VALUES (120, 167, 150, '2000000', 1614, 150);
INSERT INTO `houses` VALUES (122, 2023, 206, '2000000', 2022, 206);
INSERT INTO `houses` VALUES (123, 1440, 137, '2000000', 1635, 381);
INSERT INTO `houses` VALUES (124, 1391, 139, '2000000', 1630, 323);
INSERT INTO `houses` VALUES (125, 1144, 229, '525000', 1626, 299);
INSERT INTO `houses` VALUES (126, 1144, 286, '1000000', 1628, 286);
INSERT INTO `houses` VALUES (127, 568, 198, '2000000', 1621, 198);
INSERT INTO `houses` VALUES (128, 569, 236, '525000', 1617, 236);
INSERT INTO `houses` VALUES (129, 185, 241, '2000000', 1620, 241);
INSERT INTO `houses` VALUES (130, 908, 308, '2000000', 1627, 308);
INSERT INTO `houses` VALUES (131, 908, 171, '2000000', 1632, 171);
INSERT INTO `houses` VALUES (132, 912, 301, '1000000', 1633, 301);
INSERT INTO `houses` VALUES (133, 918, 239, '2000000', 1636, 239);
INSERT INTO `houses` VALUES (134, 918, 281, '2000000', 1640, 281);
INSERT INTO `houses` VALUES (135, 184, 137, '2000000', 0, 0);
INSERT INTO `houses` VALUES (136, 496, 234, '2000000', 1638, 234);
INSERT INTO `houses` VALUES (137, 486, 273, '525000', 1642, 273);
INSERT INTO `houses` VALUES (138, 486, 226, '2000000', 1639, 226);
INSERT INTO `houses` VALUES (139, 531, 109, '2000000', 1644, 109);
INSERT INTO `houses` VALUES (140, 531, 154, '525000', 1648, 154);
INSERT INTO `houses` VALUES (142, 749, 297, '2000000', 1520, 297);
INSERT INTO `houses` VALUES (143, 763, 419, '4000000', 1799, 419);
INSERT INTO `houses` VALUES (144, 1166, 169, '2000000', 1872, 169);
INSERT INTO `houses` VALUES (145, 1166, 177, '4000000', 1917, 177);
INSERT INTO `houses` VALUES (146, 1909, 77, '4000000', 1918, 77);
INSERT INTO `houses` VALUES (147, 1906, 219, '2000000', 1922, 219);
INSERT INTO `houses` VALUES (148, 1906, 163, '4000000', 1927, 163);
INSERT INTO `houses` VALUES (149, 1903, 229, '4000000', 1938, 229);
INSERT INTO `houses` VALUES (150, 1903, 154, '2000000', 1933, 154);
INSERT INTO `houses` VALUES (151, 1219, 266, '2000000', 2005, 307);
INSERT INTO `houses` VALUES (152, 1219, 168, '4000000', 1953, 168);
INSERT INTO `houses` VALUES (153, 1879, 183, '4000000', 2007, 183);
INSERT INTO `houses` VALUES (154, 1879, 171, '4000000', 2009, 228);
INSERT INTO `houses` VALUES (155, 1884, 124, '2000000', 2010, 124);
INSERT INTO `houses` VALUES (156, 1884, 274, '2000000', 2011, 274);
INSERT INTO `houses` VALUES (157, 1884, 199, '2000000', 2012, 199);
INSERT INTO `houses` VALUES (158, 1877, 193, '2000000', 2013, 193);
INSERT INTO `houses` VALUES (159, 1877, 213, '2000000', 2014, 213);
INSERT INTO `houses` VALUES (160, 2015, 223, '10000000', 2016, 223);
INSERT INTO `houses` VALUES (161, 1894, 151, '2000000', 1871, 151);
INSERT INTO `houses` VALUES (162, 1896, 250, '4000000', 1920, 250);
INSERT INTO `houses` VALUES (163, 1896, 280, '2000000', 1921, 280);
INSERT INTO `houses` VALUES (164, 1198, 184, '2000000', 1923, 184);
INSERT INTO `houses` VALUES (165, 1198, 206, '2000000', 1959, 206);
INSERT INTO `houses` VALUES (166, 1891, 138, '2000000', 1925, 138);
INSERT INTO `houses` VALUES (167, 1891, 194, '2000000', 1926, 194);
INSERT INTO `houses` VALUES (168, 1891, 222, '2000000', 1961, 222);
INSERT INTO `houses` VALUES (169, 1893, 368, '2000000', 1929, 368);
INSERT INTO `houses` VALUES (170, 1893, 398, '2000000', 1930, 398);
INSERT INTO `houses` VALUES (171, 1893, 170, '2000000', 1931, 170);
INSERT INTO `houses` VALUES (172, 1902, 204, '2000000', 1932, 204);
INSERT INTO `houses` VALUES (173, 1889, 151, '2000000', 1935, 151);
INSERT INTO `houses` VALUES (174, 1889, 193, '2000000', 1939, 193);
INSERT INTO `houses` VALUES (175, 1889, 140, '4000000', 1969, 140);
INSERT INTO `houses` VALUES (176, 1883, 208, '2000000', 1980, 208);
INSERT INTO `houses` VALUES (177, 1883, 225, '2000000', 1941, 225);
INSERT INTO `houses` VALUES (178, 1899, 163, '2000000', 1943, 163);
INSERT INTO `houses` VALUES (179, 1899, 137, '2000000', 1944, 137);
INSERT INTO `houses` VALUES (180, 1899, 191, '2000000', 1945, 191);
INSERT INTO `houses` VALUES (181, 1878, 162, '2000000', 1946, 162);
INSERT INTO `houses` VALUES (182, 1878, 134, '2000000', 1947, 134);
INSERT INTO `houses` VALUES (183, 1881, 239, '2000000', 1949, 239);
INSERT INTO `houses` VALUES (184, 1881, 155, '4000000', 1951, 155);
INSERT INTO `houses` VALUES (185, 1881, 110, '2000000', 1955, 110);
INSERT INTO `houses` VALUES (186, 1881, 285, '2000000', 1956, 285);
INSERT INTO `houses` VALUES (187, 1898, 345, '4000000', 1985, 345);
INSERT INTO `houses` VALUES (188, 1889, 249, '2000000', 1934, 249);
INSERT INTO `houses` VALUES (190, 1890, 365, '4000000', 1981, 365);
INSERT INTO `houses` VALUES (191, 1890, 107, '2000000', 1984, 107);
INSERT INTO `houses` VALUES (192, 1890, 257, '2000000', 1982, 257);
INSERT INTO `houses` VALUES (193, 1908, 237, '10000000', 1965, 258);
INSERT INTO `houses` VALUES (194, 1895, 125, '2000000', 1999, 125);
INSERT INTO `houses` VALUES (195, 1895, 78, '2000000', 2000, 78);
INSERT INTO `houses` VALUES (196, 1895, 219, '2000000', 2001, 219);
INSERT INTO `houses` VALUES (197, 1895, 216, '2000000', 2002, 216);
INSERT INTO `houses` VALUES (198, 1895, 185, '4000000', 2004, 185);
INSERT INTO `houses` VALUES (199, 1914, 136, '2000000', 1973, 136);
INSERT INTO `houses` VALUES (200, 1914, 191, '2000000', 1974, 191);
INSERT INTO `houses` VALUES (201, 1914, 156, '2000000', 1975, 156);
INSERT INTO `houses` VALUES (202, 1914, 298, '2000000', 1976, 298);
INSERT INTO `houses` VALUES (203, 1914, 152, '2000000', 1977, 152);
INSERT INTO `houses` VALUES (204, 1914, 339, '2000000', 1978, 339);
INSERT INTO `houses` VALUES (205, 1892, 105, '2000000', 1986, 105);
INSERT INTO `houses` VALUES (206, 1892, 280, '2000000', 1995, 280);
INSERT INTO `houses` VALUES (207, 1892, 224, '2000000', 1989, 224);
INSERT INTO `houses` VALUES (208, 1892, 322, '2000000', 1990, 322);
INSERT INTO `houses` VALUES (209, 1892, 107, '2000000', 1991, 107);
INSERT INTO `houses` VALUES (210, 1892, 146, '2000000', 1992, 146);
INSERT INTO `houses` VALUES (211, 1897, 265, '2000000', 1993, 265);
INSERT INTO `houses` VALUES (212, 1897, 283, '2000000', 1994, 283);
INSERT INTO `houses` VALUES (214, 1897, 144, '2000000', 1996, 144);
INSERT INTO `houses` VALUES (215, 1897, 82, '2000000', 1997, 82);
INSERT INTO `houses` VALUES (216, 1897, 84, '2000000', 1998, 84);
INSERT INTO `houses` VALUES (217, 1915, 123, '2000000', 1958, 123);
INSERT INTO `houses` VALUES (218, 1915, 254, '2000000', 1960, 254);
INSERT INTO `houses` VALUES (219, 1915, 147, '2000000', 1962, 147);
INSERT INTO `houses` VALUES (220, 1915, 399, '2000000', 1963, 399);
INSERT INTO `houses` VALUES (221, 1910, 122, '2000000', 1936, 122);
INSERT INTO `houses` VALUES (222, 1910, 191, '2000000', 1954, 191);
INSERT INTO `houses` VALUES (223, 709, 300, '10000000', 2026, 369);
INSERT INTO `houses` VALUES (224, 2026, 264, '10000000', 2051, 397);
INSERT INTO `houses` VALUES (226, 4264, 436, '4000000', 5122, 439);
INSERT INTO `houses` VALUES (227, 4213, 394, '1500000', 5124, 394);
INSERT INTO `houses` VALUES (228, 4213, 454, '4000000', 5129, 454);
INSERT INTO `houses` VALUES (229, 4213, 142, '2000000', 5131, 142);
INSERT INTO `houses` VALUES (230, 4212, 261, '4000000', 5135, 261);
INSERT INTO `houses` VALUES (231, 4212, 329, '3000000', 5141, 329);
INSERT INTO `houses` VALUES (232, 4212, 386, '2000000', 5146, 386);
INSERT INTO `houses` VALUES (233, 4345, 125, '4000000', 5144, 125);
INSERT INTO `houses` VALUES (234, 4343, 181, '4000000', 5297, 181);
INSERT INTO `houses` VALUES (235, 4170, 373, '3000000', 5284, 373);
INSERT INTO `houses` VALUES (236, 4343, 187, '5000000', 5303, 187);
INSERT INTO `houses` VALUES (237, 4170, 116, '4000000', 5307, 113);
INSERT INTO `houses` VALUES (238, 4337, 201, '4000000', 5310, 201);
INSERT INTO `houses` VALUES (239, 4170, 528, '1500000', 5312, 528);
INSERT INTO `houses` VALUES (240, 4170, 127, '5000000', 5316, 127);
INSERT INTO `houses` VALUES (241, 4171, 415, '3000000', 5320, 415);
INSERT INTO `houses` VALUES (242, 4171, 475, '4000000', 5323, 472);
INSERT INTO `houses` VALUES (243, 4171, 403, '4000000', 5329, 403);
INSERT INTO `houses` VALUES (244, 4171, 738, '1500000', 5325, 738);
INSERT INTO `houses` VALUES (245, 4206, 192, '2000000', 5336, 137);
INSERT INTO `houses` VALUES (246, 4206, 307, '1500000', 5338, 145);
INSERT INTO `houses` VALUES (247, 4206, 367, '4000000', 5339, 228);
INSERT INTO `houses` VALUES (248, 4206, 243, '5000000', 5342, 228);
INSERT INTO `houses` VALUES (249, 4210, 174, '1500000', 5346, 145);
INSERT INTO `houses` VALUES (250, 4210, 270, '1500000', 5347, 145);
INSERT INTO `houses` VALUES (251, 4210, 628, '2000000', 5348, 137);
INSERT INTO `houses` VALUES (252, 4210, 404, '4000000', 5351, 234);
INSERT INTO `houses` VALUES (253, 4210, 187, '4000000', 5356, 228);
INSERT INTO `houses` VALUES (254, 4210, 327, '5000000', 5357, 234);
INSERT INTO `houses` VALUES (255, 4216, 287, '1500000', 5365, 287);
INSERT INTO `houses` VALUES (256, 4216, 230, '3000000', 5368, 230);
INSERT INTO `houses` VALUES (257, 4216, 325, '3000000', 5371, 325);
INSERT INTO `houses` VALUES (258, 4216, 363, '3000000', 5374, 363);
INSERT INTO `houses` VALUES (259, 4216, 423, '4000000', 5377, 420);
INSERT INTO `houses` VALUES (260, 4216, 243, '4000000', 5380, 243);
INSERT INTO `houses` VALUES (261, 4218, 659, '1500000', 5384, 659);
INSERT INTO `houses` VALUES (262, 4218, 180, '1500000', 5385, 180);
INSERT INTO `houses` VALUES (263, 2218, 621, '1500000', 5386, 621);
INSERT INTO `houses` VALUES (264, 4214, 395, '2000000', 5388, 395);
INSERT INTO `houses` VALUES (265, 2218, 544, '4000000', 5394, 544);
INSERT INTO `houses` VALUES (266, 4214, 494, '4000000', 5393, 497);
INSERT INTO `houses` VALUES (267, 2218, 756, '4000000', 5398, 756);
INSERT INTO `houses` VALUES (268, 4214, 335, '5000000', 5397, 228);
INSERT INTO `houses` VALUES (269, 2218, 384, '5000000', 5405, 384);
INSERT INTO `houses` VALUES (270, 4178, 150, '3000000', 5408, 150);
INSERT INTO `houses` VALUES (271, 2214, 728, '2000000', 5410, 728);
INSERT INTO `houses` VALUES (272, 4178, 248, '4000000', 5413, 245);
INSERT INTO `houses` VALUES (273, 2214, 568, '4000000', 5416, 568);
INSERT INTO `houses` VALUES (274, 2214, 243, '1500000', 5417, 243);
INSERT INTO `houses` VALUES (275, 4174, 679, '1500000', 5418, 679);
INSERT INTO `houses` VALUES (276, 4173, 600, '1500000', 5419, 600);
INSERT INTO `houses` VALUES (277, 4173, 561, '3000000', 5423, 561);
INSERT INTO `houses` VALUES (278, 2216, 531, '3000000', 5425, 531);
INSERT INTO `houses` VALUES (279, 2216, 227, '4000000', 5430, 227);
INSERT INTO `houses` VALUES (280, 4173, 345, '4000000', 5431, 345);
INSERT INTO `houses` VALUES (281, 4336, 671, '4000000', 5435, 671);
INSERT INTO `houses` VALUES (282, 4173, 170, '4000000', 5437, 170);
INSERT INTO `houses` VALUES (283, 4173, 279, '5000000', 5441, 279);
INSERT INTO `houses` VALUES (284, 4336, 305, '2000000', 5443, 305);
INSERT INTO `houses` VALUES (285, 4207, 374, '2000000', 5446, 374);
INSERT INTO `houses` VALUES (286, 4336, 181, '4000000', 5448, 181);
INSERT INTO `houses` VALUES (287, 4207, 450, '2000000', 5450, 450);
INSERT INTO `houses` VALUES (288, 4207, 488, '3000000', 5455, 488);
INSERT INTO `houses` VALUES (289, 4336, 188, '5000000', 5457, 188);
INSERT INTO `houses` VALUES (290, 4207, 498, '4000000', 5460, 495);
INSERT INTO `houses` VALUES (291, 4287, 81, '4000000', 5466, 78);
INSERT INTO `houses` VALUES (292, 4207, 150, '4000000', 5465, 150);
INSERT INTO `houses` VALUES (293, 4249, 508, '4000000', 5470, 508);
INSERT INTO `houses` VALUES (294, 4209, 654, '1500000', 5469, 654);
INSERT INTO `houses` VALUES (295, 4209, 730, '1500000', 5471, 730);
INSERT INTO `houses` VALUES (296, 4209, 353, '4000000', 5474, 353);
INSERT INTO `houses` VALUES (297, 4209, 439, '4000000', 5478, 439);
INSERT INTO `houses` VALUES (298, 4217, 625, '1500000', 5479, 625);
INSERT INTO `houses` VALUES (299, 4217, 506, '3000000', 5482, 506);
INSERT INTO `houses` VALUES (300, 4219, 360, '1500000', 5483, 360);
INSERT INTO `houses` VALUES (302, 4219, 87, '1500000', 5485, 87);
INSERT INTO `houses` VALUES (303, 4219, 126, '4000000', 5488, 126);
INSERT INTO `houses` VALUES (304, 4215, 327, '2000000', 5490, 327);
INSERT INTO `houses` VALUES (305, 4215, 187, '4000000', 5493, 187);
INSERT INTO `houses` VALUES (306, 4181, 49, '1500000', 5494, 49);
INSERT INTO `houses` VALUES (307, 4181, 184, '2000000', 5496, 184);
INSERT INTO `houses` VALUES (308, 4181, 89, '4000000', 5499, 89);
INSERT INTO `houses` VALUES (309, 4181, 372, '4000000', 5503, 372);
INSERT INTO `houses` VALUES (310, 4249, 47, '4000000', 5505, 44);
INSERT INTO `houses` VALUES (311, 4240, 753, '4000000', 5508, 753);
INSERT INTO `houses` VALUES (312, 4204, 88, '1500000', 5509, 88);
INSERT INTO `houses` VALUES (313, 4241, 619, '4000000', 5512, 619);
INSERT INTO `houses` VALUES (314, 4204, 669, '4000000', 5515, 672);
INSERT INTO `houses` VALUES (315, 4241, 311, '4000000', 5518, 311);
INSERT INTO `houses` VALUES (316, 4241, 279, '4000000', 5526, 279);
INSERT INTO `houses` VALUES (317, 4342, 714, '2000000', 5530, 714);
INSERT INTO `houses` VALUES (318, 4204, 119, '5000000', 5529, 116);
INSERT INTO `houses` VALUES (319, 4342, 200, '4000000', 5533, 200);
INSERT INTO `houses` VALUES (321, 2220, 216, '4000000', 5538, 216);
INSERT INTO `houses` VALUES (322, 4177, 295, '1500000', 5537, 295);
INSERT INTO `houses` VALUES (323, 2209, 706, '2000000', 5542, 706);
INSERT INTO `houses` VALUES (324, 2209, 548, '2000000', 5546, 548);
INSERT INTO `houses` VALUES (325, 4177, 139, '1500000', 5547, 139);
INSERT INTO `houses` VALUES (326, 4177, 214, '5000000', 5544, 217);
INSERT INTO `houses` VALUES (327, 2209, 586, '3000000', 5550, 586);
INSERT INTO `houses` VALUES (328, 2209, 430, '1500000', 5551, 430);
INSERT INTO `houses` VALUES (329, 4232, 591, '1500000', 5552, 591);
INSERT INTO `houses` VALUES (330, 4231, 149, '1500000', 5555, 149);
INSERT INTO `houses` VALUES (331, 2209, 200, '4000000', 5556, 200);
INSERT INTO `houses` VALUES (332, 4242, 529, '1500000', 5557, 529);
INSERT INTO `houses` VALUES (333, 2209, 143, '1500000', 5559, 143);
INSERT INTO `houses` VALUES (334, 4242, 201, '2000000', 5561, 201);
INSERT INTO `houses` VALUES (335, 2215, 650, '1500000', 5562, 650);
INSERT INTO `houses` VALUES (336, 4242, 239, '3000000', 5566, 239);
INSERT INTO `houses` VALUES (337, 2215, 725, '3000000', 5568, 725);
INSERT INTO `houses` VALUES (338, 4242, 586, '4000000', 5574, 589);
INSERT INTO `houses` VALUES (339, 2215, 204, '4000000', 5573, 204);
INSERT INTO `houses` VALUES (340, 4289, 268, '2000000', 5582, 268);
INSERT INTO `houses` VALUES (341, 4290, 279, '5000000', 5581, 282);
INSERT INTO `houses` VALUES (342, 4290, 748, '1500000', 5585, 748);
INSERT INTO `houses` VALUES (343, 4289, 306, '3000000', 5586, 306);
INSERT INTO `houses` VALUES (344, 4289, 440, '4000000', 5591, 440);
INSERT INTO `houses` VALUES (345, 4290, 146, '5000000', 5593, 146);
INSERT INTO `houses` VALUES (346, 4289, 363, '5000000', 5597, 363);
INSERT INTO `houses` VALUES (347, 4282, 612, '4000000', 5600, 612);
INSERT INTO `houses` VALUES (348, 4282, 40, '1500000', 5604, 40);
INSERT INTO `houses` VALUES (349, 4308, 299, '5000000', 5606, 299);
INSERT INTO `houses` VALUES (350, 4236, 377, '2000000', 5609, 377);
INSERT INTO `houses` VALUES (351, 4236, 339, '3000000', 5614, 339);
INSERT INTO `houses` VALUES (352, 4282, 91, '3000000', 5615, 91);
INSERT INTO `houses` VALUES (353, 4236, 220, '2000000', 5618, 220);
INSERT INTO `houses` VALUES (354, 4280, 494, '1500000', 5617, 494);
INSERT INTO `houses` VALUES (355, 4280, 569, '3000000', 5621, 569);
INSERT INTO `houses` VALUES (356, 4245, 394, '1500000', 5625, 394);
INSERT INTO `houses` VALUES (357, 4280, 645, '4000000', 5626, 645);
INSERT INTO `houses` VALUES (358, 4245, 454, '4000000', 5629, 451);
INSERT INTO `houses` VALUES (359, 4238, 564, '1500000', 5639, 564);
INSERT INTO `houses` VALUES (360, 4096, 306, '4000000', 5637, 309);
INSERT INTO `houses` VALUES (361, 4238, 488, '1500000', 5640, 488);
INSERT INTO `houses` VALUES (362, 4238, 412, '3000000', 5644, 412);
INSERT INTO `houses` VALUES (363, 4096, 249, '3000000', 5646, 249);
INSERT INTO `houses` VALUES (364, 4233, 217, '1500000', 5647, 217);
INSERT INTO `houses` VALUES (365, 4233, 44, '1500000', 5649, 44);
INSERT INTO `houses` VALUES (366, 4233, 427, '2000000', 5653, 427);
INSERT INTO `houses` VALUES (367, 4096, 62, '3000000', 5652, 62);
INSERT INTO `houses` VALUES (368, 4233, 508, '4000000', 5656, 511);
INSERT INTO `houses` VALUES (369, 4233, 83, '4000000', 5659, 83);
INSERT INTO `houses` VALUES (370, 4096, 152, '3000000', 5662, 152);
INSERT INTO `houses` VALUES (371, 4096, 187, '4000000', 5665, 187);
INSERT INTO `houses` VALUES (372, 4300, 225, '4000000', 5669, 225);
INSERT INTO `houses` VALUES (373, 4180, 651, '1500000', 5670, 651);
INSERT INTO `houses` VALUES (374, 4094, 268, '4000000', 5673, 268);
INSERT INTO `houses` VALUES (375, 4094, 87, '3000000', 5676, 87);
INSERT INTO `houses` VALUES (376, 4094, 504, '4000000', 5679, 501);
INSERT INTO `houses` VALUES (377, 4094, 163, '5000000', 5683, 163);
INSERT INTO `houses` VALUES (378, 4095, 724, '1500000', 5684, 724);
INSERT INTO `houses` VALUES (379, 4095, 509, '1500000', 5685, 509);
INSERT INTO `houses` VALUES (380, 4095, 566, '3000000', 5688, 566);
INSERT INTO `houses` VALUES (382, 4095, 347, '3000000', 5709, 347);
INSERT INTO `houses` VALUES (383, 4244, 332, '3000000', 5726, 332);
INSERT INTO `houses` VALUES (384, 4095, 404, '3000000', 5725, 404);
INSERT INTO `houses` VALUES (385, 4244, 602, '1500000', 5728, 602);
INSERT INTO `houses` VALUES (386, 4095, 461, '3000000', 5730, 461);
INSERT INTO `houses` VALUES (387, 4244, 614, '4000000', 5733, 614);
INSERT INTO `houses` VALUES (388, 4095, 449, '4000000', 5737, 449);
INSERT INTO `houses` VALUES (389, 4244, 116, '4000000', 5739, 116);
INSERT INTO `houses` VALUES (390, 2221, 272, '3000000', 5744, 272);
INSERT INTO `houses` VALUES (391, 2210, 619, '1500000', 0, 0);
INSERT INTO `houses` VALUES (392, 4095, 187, '5000000', 5746, 187);
INSERT INTO `houses` VALUES (393, 2210, 533, '4000000', 5750, 530);
INSERT INTO `houses` VALUES (394, 2210, 142, '3000000', 5754, 142);
INSERT INTO `houses` VALUES (395, 2210, 104, '2000000', 5759, 104);
INSERT INTO `houses` VALUES (396, 4246, 262, '5000000', 5758, 262);
INSERT INTO `houses` VALUES (397, 2210, 391, '5000000', 5763, 394);
INSERT INTO `houses` VALUES (398, 4104, 392, '2000000', 5765, 392);
INSERT INTO `houses` VALUES (399, 4303, 282, '4000000', 5768, 285);
INSERT INTO `houses` VALUES (400, 4104, 430, '3000000', 5771, 430);
INSERT INTO `houses` VALUES (401, 4104, 490, '4000000', 5774, 487);
INSERT INTO `houses` VALUES (402, 4303, 511, '1500000', 5775, 511);
INSERT INTO `houses` VALUES (403, 4303, 237, '5000000', 5779, 237);
INSERT INTO `houses` VALUES (405, 4172, 310, '2000000', 5782, 310);
INSERT INTO `houses` VALUES (406, 4301, 139, '2000000', 5784, 139);
INSERT INTO `houses` VALUES (407, 4301, 196, '3000000', 5789, 196);
INSERT INTO `houses` VALUES (408, 4172, 367, '2000000', 5786, 367);
INSERT INTO `houses` VALUES (409, 4172, 405, '3000000', 5795, 405);
INSERT INTO `houses` VALUES (410, 4301, 189, '5000000', 5796, 186);
INSERT INTO `houses` VALUES (411, 4172, 79, '3000000', 5799, 79);
INSERT INTO `houses` VALUES (412, 4259, 69, '1500000', 5802, 69);
INSERT INTO `houses` VALUES (413, 4097, 511, '1500000', 5805, 511);
INSERT INTO `houses` VALUES (414, 4259, 126, '4000000', 5807, 126);
INSERT INTO `houses` VALUES (415, 4097, 435, '1500000', 5808, 435);
INSERT INTO `houses` VALUES (416, 4097, 104, '1500000', 5809, 104);
INSERT INTO `houses` VALUES (417, 4275, 528, '1500000', 5811, 528);
INSERT INTO `houses` VALUES (418, 4097, 180, '1500000', 5813, 180);
INSERT INTO `houses` VALUES (419, 4275, 446, '4000000', 5823, 446);
INSERT INTO `houses` VALUES (420, 4097, 377, '3000000', 5827, 377);
INSERT INTO `houses` VALUES (421, 4275, 91, '2000000', 5829, 91);
INSERT INTO `houses` VALUES (422, 4273, 402, '2000000', 5834, 402);
INSERT INTO `houses` VALUES (423, 4097, 237, '4000000', 5833, 237);
INSERT INTO `houses` VALUES (424, 4273, 713, '4000000', 5838, 713);
INSERT INTO `houses` VALUES (425, 4090, 569, '1500000', 5839, 569);
INSERT INTO `houses` VALUES (426, 4090, 216, '1500000', 5840, 216);
INSERT INTO `houses` VALUES (427, 4243, 269, '1500000', 5841, 269);
INSERT INTO `houses` VALUES (428, 4090, 447, '2000000', 5844, 447);
INSERT INTO `houses` VALUES (429, 4243, 326, '4000000', 5846, 329);
INSERT INTO `houses` VALUES (430, 4090, 201, '3000000', 5852, 201);
INSERT INTO `houses` VALUES (431, 4243, 94, '3000000', 5855, 94);
INSERT INTO `houses` VALUES (432, 4248, 395, '1500000', 5859, 395);
INSERT INTO `houses` VALUES (433, 4090, 76, '5000000', 5860, 76);
INSERT INTO `houses` VALUES (434, 4093, 640, '1500000', 5865, 640);
INSERT INTO `houses` VALUES (435, 4248, 437, '4000000', 5864, 437);
INSERT INTO `houses` VALUES (436, 4093, 206, '1500000', 5866, 206);
INSERT INTO `houses` VALUES (437, 4070, 300, '3000000', 5872, 300);
INSERT INTO `houses` VALUES (438, 4093, 387, '5000000', 5874, 384);
INSERT INTO `houses` VALUES (439, 4077, 676, '2000000', 5876, 676);
INSERT INTO `houses` VALUES (440, 4077, 486, '3000000', 5881, 486);
INSERT INTO `houses` VALUES (441, 4247, 187, '4000000', 5882, 187);
INSERT INTO `houses` VALUES (442, 4106, 383, '1500000', 5887, 383);
INSERT INTO `houses` VALUES (443, 4077, 167, '5000000', 5886, 170);
INSERT INTO `houses` VALUES (444, 4106, 326, '3000000', 5890, 326);
INSERT INTO `houses` VALUES (445, 4106, 459, '4000000', 5893, 459);
INSERT INTO `houses` VALUES (446, 4106, 353, '4000000', 5896, 353);
INSERT INTO `houses` VALUES (447, 4169, 269, '2000000', 5898, 269);
INSERT INTO `houses` VALUES (448, 4169, 231, '3000000', 5901, 231);
INSERT INTO `houses` VALUES (449, 4305, 717, '1500000', 5904, 717);
INSERT INTO `houses` VALUES (450, 4169, 174, '3000000', 5905, 174);
INSERT INTO `houses` VALUES (451, 4304, 367, '4000000', 5909, 367);
INSERT INTO `houses` VALUES (452, 4169, 308, '4000000', 5912, 311);
INSERT INTO `houses` VALUES (453, 4223, 207, '4000000', 5914, 207);
INSERT INTO `houses` VALUES (454, 4098, 489, '1500000', 5917, 489);
INSERT INTO `houses` VALUES (455, 4098, 107, '1500000', 5921, 107);
INSERT INTO `houses` VALUES (456, 4098, 587, '1500000', 5922, 587);
INSERT INTO `houses` VALUES (457, 4223, 182, '5000000', 5919, 182);
INSERT INTO `houses` VALUES (458, 4291, 584, '1500000', 5925, 584);
INSERT INTO `houses` VALUES (459, 4098, 394, '3000000', 5926, 394);
INSERT INTO `houses` VALUES (460, 4291, 469, '1500000', 5927, 469);
INSERT INTO `houses` VALUES (461, 4291, 355, '1500000', 5928, 355);
INSERT INTO `houses` VALUES (462, 4291, 545, '2000000', 5933, 545);
INSERT INTO `houses` VALUES (463, 4098, 164, '4000000', 5932, 164);
INSERT INTO `houses` VALUES (464, 4291, 412, '3000000', 5937, 412);
INSERT INTO `houses` VALUES (465, 4098, 206, '4000000', 5940, 206);
INSERT INTO `houses` VALUES (466, 4269, 214, '2000000', 5942, 214);
INSERT INTO `houses` VALUES (467, 4269, 52, '1500000', 5943, 52);
INSERT INTO `houses` VALUES (468, 4072, 672, '1500000', 5944, 672);
INSERT INTO `houses` VALUES (469, 4072, 154, '1500000', 5946, 154);
INSERT INTO `houses` VALUES (470, 4072, 152, '2000000', 5951, 152);
INSERT INTO `houses` VALUES (471, 4269, 115, '5000000', 5949, 115);
INSERT INTO `houses` VALUES (472, 4072, 729, '3000000', 5957, 729);
INSERT INTO `houses` VALUES (473, 4264, 360, '2000000', 5960, 360);
INSERT INTO `houses` VALUES (474, 4260, 646, '1500000', 5963, 646);
INSERT INTO `houses` VALUES (476, 4072, 187, '4000000', 5967, 187);
INSERT INTO `houses` VALUES (477, 4260, 487, '4000000', 5970, 490);
INSERT INTO `houses` VALUES (478, 4260, 607, '3000000', 5977, 607);
INSERT INTO `houses` VALUES (479, 4074, 453, '1500000', 5972, 453);
INSERT INTO `houses` VALUES (480, 4074, 143, '1500000', 5973, 143);
INSERT INTO `houses` VALUES (481, 4074, 314, '1500000', 5974, 314);
INSERT INTO `houses` VALUES (482, 4073, 624, '1500000', 5978, 624);
INSERT INTO `houses` VALUES (483, 4073, 548, '1500000', 5980, 548);
INSERT INTO `houses` VALUES (484, 4073, 653, '1500000', 5983, 653);
INSERT INTO `houses` VALUES (485, 4074, 528, '3000000', 5982, 528);
INSERT INTO `houses` VALUES (486, 4073, 490, '3000000', 5986, 490);
INSERT INTO `houses` VALUES (487, 4074, 566, '3000000', 5989, 566);
INSERT INTO `houses` VALUES (488, 4073, 313, '3000000', 5992, 313);
INSERT INTO `houses` VALUES (489, 4073, 161, '3000000', 5995, 161);
INSERT INTO `houses` VALUES (490, 4073, 218, '4000000', 6001, 218);
INSERT INTO `houses` VALUES (491, 4074, 206, '4000000', 6002, 206);
INSERT INTO `houses` VALUES (492, 4278, 678, '2000000', 6009, 678);
INSERT INTO `houses` VALUES (493, 4284, 597, '1500000', 6010, 597);
INSERT INTO `houses` VALUES (494, 4073, 263, '5000000', 6008, 260);
INSERT INTO `houses` VALUES (495, 4284, 528, '2000000', 6012, 528);
INSERT INTO `houses` VALUES (496, 4284, 471, '3000000', 6019, 471);
INSERT INTO `houses` VALUES (497, 4082, 473, '1500000', 6026, 473);
INSERT INTO `houses` VALUES (498, 4082, 151, '1500000', 6029, 151);
INSERT INTO `houses` VALUES (499, 4284, 146, '3000000', 6028, 146);
INSERT INTO `houses` VALUES (500, 4082, 87, '1500000', 6030, 87);
INSERT INTO `houses` VALUES (501, 4285, 752, '3000000', 6033, 752);
INSERT INTO `houses` VALUES (502, 4082, 533, '4000000', 6036, 533);
INSERT INTO `houses` VALUES (503, 4082, 302, '3000000', 6041, 302);
INSERT INTO `houses` VALUES (504, 4285, 113, '4000000', 6060, 113);
INSERT INTO `houses` VALUES (505, 4082, 264, '3000000', 6048, 264);
INSERT INTO `houses` VALUES (506, 4082, 226, '3000000', 6053, 226);
INSERT INTO `houses` VALUES (507, 4299, 429, '2000000', 6054, 429);
INSERT INTO `houses` VALUES (508, 4082, 145, '5000000', 6059, 145);
INSERT INTO `houses` VALUES (510, 4302, 126, '4000000', 6067, 126);
INSERT INTO `houses` VALUES (511, 4299, 35, '4000000', 6069, 35);
INSERT INTO `houses` VALUES (513, 4280, 206, '5000000', 5634, 209);
INSERT INTO `houses` VALUES (514, 4219, 417, '3000000', 6142, 417);
INSERT INTO `houses` VALUES (515, 4594, 651, '4000000', 6200, 651);
INSERT INTO `houses` VALUES (516, 4594, 491, '3000000', 6202, 491);
INSERT INTO `houses` VALUES (517, 4594, 151, '4000000', 6205, 151);
INSERT INTO `houses` VALUES (518, 4594, 238, '4000000', 6206, 238);
INSERT INTO `houses` VALUES (519, 4616, 396, '4000000', 6208, 396);
INSERT INTO `houses` VALUES (520, 4616, 257, '3000000', 6213, 257);
INSERT INTO `houses` VALUES (521, 4616, 456, '3000000', 6215, 456);
INSERT INTO `houses` VALUES (522, 4631, 409, '4000000', 6217, 409);
INSERT INTO `houses` VALUES (523, 4631, 681, '3000000', 6220, 681);
INSERT INTO `houses` VALUES (524, 4631, 322, '3000000', 6221, 322);
INSERT INTO `houses` VALUES (525, 4549, 647, '3000000', 6225, 647);
INSERT INTO `houses` VALUES (526, 4549, 161, '3000000', 6226, 161);
INSERT INTO `houses` VALUES (527, 4549, 301, '3000000', 6227, 301);
INSERT INTO `houses` VALUES (528, 5277, 742, '2000000', 6232, 742);
INSERT INTO `houses` VALUES (529, 5277, 400, '2000000', 6231, 400);
INSERT INTO `houses` VALUES (530, 5277, 621, '2000000', 6234, 621);
INSERT INTO `houses` VALUES (531, 5277, 76, '3000000', 6236, 76);
INSERT INTO `houses` VALUES (532, 4610, 660, '4000000', 6239, 660);
INSERT INTO `houses` VALUES (533, 4610, 602, '2000000', 6241, 602);
INSERT INTO `houses` VALUES (534, 4610, 483, '2000000', 6243, 483);
INSERT INTO `houses` VALUES (535, 4610, 412, '3000000', 6245, 412);
INSERT INTO `houses` VALUES (536, 4610, 268, '3000000', 6247, 268);
INSERT INTO `houses` VALUES (537, 4936, 454, '2000000', 6253, 454);
INSERT INTO `houses` VALUES (538, 6248, 183, '10000000', 6250, 183);
INSERT INTO `houses` VALUES (539, 6249, 225, '10000000', 6251, 225);
INSERT INTO `houses` VALUES (540, 6181, 81, '10000000', 6237, 81);
INSERT INTO `houses` VALUES (541, 1915, 229, '2000000', 1964, 229);
INSERT INTO `houses` VALUES (542, 4595, 607, '4000000', 6278, 607);
INSERT INTO `houses` VALUES (543, 4649, 218, '2000000', 6280, 218);
INSERT INTO `houses` VALUES (544, 4649, 275, '2000000', 6285, 275);
INSERT INTO `houses` VALUES (545, 4591, 215, '3000000', 6282, 215);
INSERT INTO `houses` VALUES (546, 4591, 552, '3000000', 6286, 552);
INSERT INTO `houses` VALUES (547, 4591, 702, '2000000', 6288, 702);
INSERT INTO `houses` VALUES (548, 4649, 614, '3000000', 6292, 614);
INSERT INTO `houses` VALUES (549, 4605, 534, '4000000', 6290, 534);
INSERT INTO `houses` VALUES (550, 5108, 57, '2000000', 6294, 57);
INSERT INTO `houses` VALUES (551, 5108, 597, '2000000', 6296, 597);
INSERT INTO `houses` VALUES (552, 5108, 367, '3000000', 6298, 367);
INSERT INTO `houses` VALUES (553, 4622, 378, '3000000', 6300, 378);
INSERT INTO `houses` VALUES (554, 4622, 164, '3000000', 6302, 164);
INSERT INTO `houses` VALUES (555, 4666, 75, '2000000', 6305, 75);
INSERT INTO `houses` VALUES (556, 4666, 493, '2000000', 6307, 493);
INSERT INTO `houses` VALUES (557, 4666, 132, '2000000', 6309, 132);
INSERT INTO `houses` VALUES (558, 4666, 578, '3000000', 6311, 578);
INSERT INTO `houses` VALUES (559, 4605, 438, '2000000', 6313, 438);
INSERT INTO `houses` VALUES (560, 5279, 261, '2000000', 6317, 261);
INSERT INTO `houses` VALUES (561, 5279, 640, '2000000', 6318, 640);
INSERT INTO `houses` VALUES (562, 5279, 276, '2000000', 6319, 276);
INSERT INTO `houses` VALUES (563, 5317, 429, '2000000', 6323, 429);
INSERT INTO `houses` VALUES (564, 5279, 283, '3000000', 6321, 283);
INSERT INTO `houses` VALUES (565, 5317, 160, '2000000', 6325, 160);
INSERT INTO `houses` VALUES (566, 5317, 217, '2000000', 6327, 217);
INSERT INTO `houses` VALUES (568, 5317, 737, '2000000', 6329, 737);
INSERT INTO `houses` VALUES (569, 4611, 449, '3000000', 6333, 449);
INSERT INTO `houses` VALUES (570, 4606, 344, '4000000', 6331, 344);
INSERT INTO `houses` VALUES (571, 4611, 437, '2000000', 6335, 437);
INSERT INTO `houses` VALUES (572, 5326, 522, '3000000', 6337, 522);
INSERT INTO `houses` VALUES (573, 5326, 361, '2000000', 6339, 361);
INSERT INTO `houses` VALUES (574, 4606, 506, '3000000', 6345, 506);
INSERT INTO `houses` VALUES (575, 5326, 713, '2000000', 6341, 713);
INSERT INTO `houses` VALUES (576, 5326, 69, '3000000', 6343, 69);
INSERT INTO `houses` VALUES (577, 4644, 94, '4000000', 6347, 94);
INSERT INTO `houses` VALUES (578, 4644, 571, '4000000', 6349, 571);
INSERT INTO `houses` VALUES (579, 4644, 402, '3000000', 6351, 402);
INSERT INTO `houses` VALUES (580, 4644, 380, '2000000', 6353, 380);
INSERT INTO `houses` VALUES (581, 4646, 402, '4000000', 6355, 402);
INSERT INTO `houses` VALUES (582, 4646, 80, '2000000', 6357, 80);
INSERT INTO `houses` VALUES (583, 4586, 432, '4000000', 6579, 432);
INSERT INTO `houses` VALUES (584, 4647, 223, '3000000', 6578, 223);
INSERT INTO `houses` VALUES (585, 4937, 115, '2000000', 6585, 115);
INSERT INTO `houses` VALUES (586, 4647, 600, '3000000', 6580, 600);
INSERT INTO `houses` VALUES (587, 4647, 578, '2000000', 6583, 578);
INSERT INTO `houses` VALUES (588, 4604, 174, '3000000', 6591, 174);
INSERT INTO `houses` VALUES (589, 4647, 455, '2000000', 6584, 455);
INSERT INTO `houses` VALUES (590, 4937, 91, '2000000', 6595, 91);
INSERT INTO `houses` VALUES (591, 4614, 618, '3000000', 6589, 618);
INSERT INTO `houses` VALUES (592, 4614, 492, '3000000', 6590, 492);
INSERT INTO `houses` VALUES (593, 4614, 644, '2000000', 6593, 644);
INSERT INTO `houses` VALUES (594, 4603, 280, '2000000', 6598, 280);
INSERT INTO `houses` VALUES (595, 4603, 718, '2000000', 6599, 718);
INSERT INTO `houses` VALUES (596, 4936, 757, '2000000', 6601, 757);
INSERT INTO `houses` VALUES (597, 4615, 614, '2000000', 6604, 614);
INSERT INTO `houses` VALUES (598, 4604, 453, '3000000', 6605, 453);
INSERT INTO `houses` VALUES (599, 4615, 404, '4000000', 6607, 404);
INSERT INTO `houses` VALUES (600, 5280, 108, '4000000', 6609, 108);
INSERT INTO `houses` VALUES (601, 4600, 264, '4000000', 6623, 264);
INSERT INTO `houses` VALUES (602, 4588, 170, '4000000', 6612, 170);
INSERT INTO `houses` VALUES (603, 4588, 174, '3000000', 6617, 174);
INSERT INTO `houses` VALUES (604, 4588, 250, '4000000', 6614, 250);
INSERT INTO `houses` VALUES (605, 4593, 505, '2000000', 6625, 505);
INSERT INTO `houses` VALUES (606, 4593, 381, '3000000', 6627, 381);
INSERT INTO `houses` VALUES (607, 4588, 326, '4000000', 6621, 326);
INSERT INTO `houses` VALUES (608, 4936, 112, '4000000', 6615, 112);
INSERT INTO `houses` VALUES (609, 5280, 115, '3000000', 6619, 115);
INSERT INTO `houses` VALUES (610, 4620, 450, '3000000', 6629, 450);
INSERT INTO `houses` VALUES (611, 4620, 256, '4000000', 6631, 256);
INSERT INTO `houses` VALUES (612, 4612, 132, '3000000', 6636, 132);
INSERT INTO `houses` VALUES (613, 4640, 413, '2000000', 6633, 413);
INSERT INTO `houses` VALUES (614, 4640, 471, '4000000', 6637, 471);
INSERT INTO `houses` VALUES (615, 4600, 258, '3000000', 6647, 258);
INSERT INTO `houses` VALUES (616, 4640, 384, '3000000', 6643, 384);
INSERT INTO `houses` VALUES (617, 5136, 524, '3000000', 6649, 524);
INSERT INTO `houses` VALUES (618, 5136, 289, '2000000', 6652, 289);
INSERT INTO `houses` VALUES (619, 4640, 683, '3000000', 6645, 683);
INSERT INTO `houses` VALUES (620, 5304, 455, '2000000', 6640, 455);
INSERT INTO `houses` VALUES (621, 5304, 375, '2000000', 6644, 375);
INSERT INTO `houses` VALUES (622, 4596, 346, '3000000', 6659, 346);
INSERT INTO `houses` VALUES (623, 4597, 105, '4000000', 6663, 105);
INSERT INTO `houses` VALUES (624, 4623, 331, '2000000', 6661, 331);
INSERT INTO `houses` VALUES (625, 4613, 245, '3000000', 6653, 245);
INSERT INTO `houses` VALUES (626, 4613, 101, '3000000', 6655, 101);
INSERT INTO `houses` VALUES (627, 4613, 675, '2000000', 6657, 675);
INSERT INTO `houses` VALUES (628, 4584, 467, '3000000', 6665, 467);
INSERT INTO `houses` VALUES (629, 4941, 682, '3000000', 6667, 682);
INSERT INTO `houses` VALUES (630, 4941, 144, '4000000', 6673, 144);
INSERT INTO `houses` VALUES (631, 4628, 353, '3000000', 6669, 353);
INSERT INTO `houses` VALUES (632, 4628, 543, '4000000', 6671, 543);
INSERT INTO `houses` VALUES (633, 5139, 261, '2000000', 6676, 261);
INSERT INTO `houses` VALUES (634, 5139, 377, '3000000', 6679, 377);
INSERT INTO `houses` VALUES (635, 5139, 569, '2000000', 6677, 569);
INSERT INTO `houses` VALUES (636, 2209, 506, '2000000', 6716, 506);
INSERT INTO `houses` VALUES (637, 4646, 137, '2000000', 6359, 137);
INSERT INTO `houses` VALUES (638, 1897, 431, '2000000', 6982, 431);
INSERT INTO `houses` VALUES (639, 4302, 739, '2000000', 7270, 739);
INSERT INTO `houses` VALUES (640, 7441, 361, '2000000', 7731, 142);
INSERT INTO `houses` VALUES (641, 7444, 163, '2000000', 7622, 150);
INSERT INTO `houses` VALUES (642, 7445, 234, '2000000', 7714, 150);
INSERT INTO `houses` VALUES (643, 7445, 389, '3000000', 7721, 141);
INSERT INTO `houses` VALUES (644, 7447, 118, '2000000', 7653, 150);
INSERT INTO `houses` VALUES (645, 7426, 133, '3000000', 7699, 141);
INSERT INTO `houses` VALUES (647, 7428, 162, '3000000', 7629, 141);
INSERT INTO `houses` VALUES (648, 7430, 442, '2000000', 7691, 142);
INSERT INTO `houses` VALUES (649, 7430, 177, '2000000', 7693, 150);
INSERT INTO `houses` VALUES (650, 7415, 147, '3000000', 7658, 147);
INSERT INTO `houses` VALUES (651, 7413, 74, '2000000', 7730, 150);
INSERT INTO `houses` VALUES (652, 7412, 156, '2000000', 7635, 203);
INSERT INTO `houses` VALUES (653, 7412, 103, '2000000', 7637, 150);
INSERT INTO `houses` VALUES (654, 7411, 170, '2000000', 7668, 203);
INSERT INTO `houses` VALUES (655, 7410, 216, '2000000', 7708, 150);
INSERT INTO `houses` VALUES (656, 7410, 294, '3000000', 7712, 141);
INSERT INTO `houses` VALUES (657, 7409, 323, '10000000', 7739, 271);
INSERT INTO `houses` VALUES (658, 7408, 185, '2000000', 7707, 203);
INSERT INTO `houses` VALUES (659, 7408, 208, '2000000', 7646, 142);
INSERT INTO `houses` VALUES (660, 7392, 162, '3000000', 7642, 141);
INSERT INTO `houses` VALUES (661, 7289, 189, '4000000', 7732, 271);
INSERT INTO `houses` VALUES (662, 7289, 246, '2000000', 7743, 150);
INSERT INTO `houses` VALUES (663, 7394, 284, '2000000', 7723, 142);
INSERT INTO `houses` VALUES (664, 7394, 339, '3000000', 7724, 141);
INSERT INTO `houses` VALUES (666, 7397, 143, '2000000', 7736, 143);
INSERT INTO `houses` VALUES (667, 7399, 133, '3000000', 7662, 141);
INSERT INTO `houses` VALUES (668, 7399, 127, '2000000', 7664, 203);
INSERT INTO `houses` VALUES (669, 7400, 105, '3000000', 7620, 141);
INSERT INTO `houses` VALUES (670, 7384, 150, '3000000', 7626, 141);
INSERT INTO `houses` VALUES (671, 7383, 342, '2000000', 7670, 342);
INSERT INTO `houses` VALUES (672, 7383, 172, '3000000', 7673, 172);
INSERT INTO `houses` VALUES (674, 7364, 143, '3000000', 7742, 141);
INSERT INTO `houses` VALUES (675, 7380, 99, '2000000', 7643, 99);
INSERT INTO `houses` VALUES (676, 7380, 107, '2000000', 7645, 107);
INSERT INTO `houses` VALUES (677, 7379, 144, '2000000', 7683, 144);
INSERT INTO `houses` VALUES (678, 7379, 163, '2000000', 7679, 163);
INSERT INTO `houses` VALUES (679, 7377, 221, '2000000', 7725, 221);
INSERT INTO `houses` VALUES (680, 7377, 126, '2000000', 7728, 203);
INSERT INTO `houses` VALUES (681, 7360, 208, '2000000', 7631, 208);
INSERT INTO `houses` VALUES (682, 7360, 278, '2000000', 7623, 278);
INSERT INTO `houses` VALUES (683, 7360, 158, '3000000', 7634, 158);
INSERT INTO `houses` VALUES (684, 7363, 118, '3000000', 7685, 141);
INSERT INTO `houses` VALUES (685, 7363, 201, '4000000', 7690, 201);
INSERT INTO `houses` VALUES (686, 7363, 397, '2000000', 7684, 397);
INSERT INTO `houses` VALUES (687, 7381, 221, '4000000', 7651, 165);
INSERT INTO `houses` VALUES (690, 7367, 441, '2000000', 7682, 142);
INSERT INTO `houses` VALUES (691, 7367, 135, '4000000', 7677, 191);
INSERT INTO `houses` VALUES (692, 7367, 172, '3000000', 7681, 172);
INSERT INTO `houses` VALUES (693, 7368, 105, '2000000', 7630, 142);
INSERT INTO `houses` VALUES (694, 7366, 104, '2000000', 7745, 104);
INSERT INTO `houses` VALUES (695, 7347, 285, '2000000', 7665, 285);
INSERT INTO `houses` VALUES (696, 7382, 447, '2000000', 7702, 150);
INSERT INTO `houses` VALUES (697, 7348, 273, '3000000', 7659, 273);
INSERT INTO `houses` VALUES (698, 7352, 114, '2000000', 7648, 150);
INSERT INTO `houses` VALUES (699, 7347, 99, '2000000', 7667, 99);
INSERT INTO `houses` VALUES (700, 7331, 124, '2000000', 7694, 142);
INSERT INTO `houses` VALUES (701, 7331, 446, '2000000', 7695, 150);
INSERT INTO `houses` VALUES (702, 7331, 129, '2000000', 7698, 150);
INSERT INTO `houses` VALUES (703, 7345, 335, '2000000', 7717, 335);
INSERT INTO `houses` VALUES (704, 7425, 425, '2000000', 7746, 142);
INSERT INTO `houses` VALUES (705, 7425, 184, '2000000', 7749, 150);
INSERT INTO `houses` VALUES (706, 7334, 258, '2000000', 7757, 258);
INSERT INTO `houses` VALUES (707, 7335, 239, '4000000', 7753, 295);
INSERT INTO `houses` VALUES (708, 7335, 388, '2000000', 7755, 402);
INSERT INTO `houses` VALUES (709, 7334, 268, '2000000', 7759, 268);
INSERT INTO `houses` VALUES (710, 7409, 267, '10000000', 7737, 177);
INSERT INTO `houses` VALUES (711, 7414, 236, '2000000', 7779, 206);
INSERT INTO `houses` VALUES (712, 7786, 165, '1000000', 7788, 165);
INSERT INTO `houses` VALUES (713, 7786, 210, '1000000', 7789, 210);
INSERT INTO `houses` VALUES (714, 7786, 255, '1000000', 7790, 255);
INSERT INTO `houses` VALUES (715, 7786, 300, '1000000', 7791, 300);
INSERT INTO `houses` VALUES (716, 7786, 345, '1000000', 7792, 345);
INSERT INTO `houses` VALUES (717, 7912, 265, '2000000', 8378, 265);
INSERT INTO `houses` VALUES (718, 8016, 256, '2000000', 8379, 256);
INSERT INTO `houses` VALUES (719, 7912, 286, '3000000', 8381, 286);
INSERT INTO `houses` VALUES (720, 7995, 299, '3000000', 8384, 299);
INSERT INTO `houses` VALUES (721, 8003, 67, '2000000', 8386, 67);
INSERT INTO `houses` VALUES (722, 7983, 269, '2000000', 8388, 269);
INSERT INTO `houses` VALUES (723, 7984, 226, '2000000', 8390, 226);
INSERT INTO `houses` VALUES (724, 7971, 343, '2000000', 8393, 343);
INSERT INTO `houses` VALUES (725, 7971, 446, '2000000', 8396, 446);
INSERT INTO `houses` VALUES (726, 8011, 270, '2000000', 8398, 270);
INSERT INTO `houses` VALUES (727, 7998, 220, '2000000', 8401, 220);
INSERT INTO `houses` VALUES (728, 7998, 212, '2000000', 8404, 212);
INSERT INTO `houses` VALUES (729, 7972, 241, '2000000', 8407, 241);
INSERT INTO `houses` VALUES (730, 8002, 46, '2000000', 8409, 46);
INSERT INTO `houses` VALUES (731, 8002, 211, '2000000', 8414, 211);
INSERT INTO `houses` VALUES (732, 7972, 186, '2000000', 8412, 186);
INSERT INTO `houses` VALUES (733, 8002, 257, '2000000', 8419, 257);
INSERT INTO `houses` VALUES (734, 7972, 347, '2000000', 8417, 347);
INSERT INTO `houses` VALUES (735, 8015, 225, '2000000', 8422, 225);
INSERT INTO `houses` VALUES (736, 8028, 235, '2000000', 8429, 235);
INSERT INTO `houses` VALUES (737, 7973, 168, '2000000', 8425, 168);
INSERT INTO `houses` VALUES (738, 7988, 100, '2000000', 8435, 100);
INSERT INTO `houses` VALUES (739, 7973, 122, '2000000', 8432, 122);
INSERT INTO `houses` VALUES (741, 7974, 206, '2000000', 8436, 206);
INSERT INTO `houses` VALUES (742, 8001, 263, '2000000', 8440, 263);
INSERT INTO `houses` VALUES (743, 7974, 108, '2000000', 8441, 108);
INSERT INTO `houses` VALUES (744, 8001, 170, '2000000', 8447, 170);
INSERT INTO `houses` VALUES (745, 7974, 71, '2000000', 8445, 71);
INSERT INTO `houses` VALUES (746, 7987, 103, '2000000', 8449, 103);
INSERT INTO `houses` VALUES (747, 8039, 104, '2000000', 8453, 104);
INSERT INTO `houses` VALUES (748, 7987, 84, '2000000', 8452, 84);
INSERT INTO `houses` VALUES (749, 7987, 269, '2000000', 8455, 269);
INSERT INTO `houses` VALUES (750, 8000, 109, '2000000', 8457, 109);
INSERT INTO `houses` VALUES (751, 8001, 239, '2000000', 8443, 239);
INSERT INTO `houses` VALUES (752, 8038, 421, '2000000', 8459, 421);
INSERT INTO `houses` VALUES (753, 8025, 296, '3000000', 8461, 296);
INSERT INTO `houses` VALUES (754, 7986, 152, '2000000', 8464, 152);
INSERT INTO `houses` VALUES (755, 8012, 271, '2000000', 8465, 271);
INSERT INTO `houses` VALUES (756, 7986, 263, '3000000', 8468, 263);
INSERT INTO `houses` VALUES (757, 7999, 176, '2000000', 8470, 176);
INSERT INTO `houses` VALUES (759, 9455, 397, '2000000', 9667, 397);
INSERT INTO `houses` VALUES (761, 9451, 385, '2000000', 9669, 385);
INSERT INTO `houses` VALUES (762, 9464, 306, '2000000', 9671, 306);
INSERT INTO `houses` VALUES (763, 9464, 184, '3000000', 9673, 184);
INSERT INTO `houses` VALUES (764, 9450, 137, '2000000', 9675, 137);
INSERT INTO `houses` VALUES (765, 9450, 434, '2000000', 9677, 434);
INSERT INTO `houses` VALUES (766, 9450, 114, '3000000', 9679, 114);
INSERT INTO `houses` VALUES (767, 9454, 129, '2000000', 9681, 129);
INSERT INTO `houses` VALUES (768, 9454, 88, '3000000', 9683, 88);
INSERT INTO `houses` VALUES (769, 9457, 218, '4000000', 9686, 218);
INSERT INTO `houses` VALUES (770, 9461, 349, '2000000', 9688, 349);
INSERT INTO `houses` VALUES (771, 9461, 129, '3000000', 9690, 129);
INSERT INTO `houses` VALUES (772, 9449, 382, '2000000', 9692, 382);
INSERT INTO `houses` VALUES (773, 9449, 302, '2000000', 9694, 302);
INSERT INTO `houses` VALUES (774, 9449, 99, '4000000', 9697, 99);
INSERT INTO `houses` VALUES (775, 9453, 76, '4000000', 9700, 76);
INSERT INTO `houses` VALUES (776, 9453, 442, '3000000', 9702, 442);
INSERT INTO `houses` VALUES (777, 9453, 233, '2000000', 9704, 233);
INSERT INTO `houses` VALUES (778, 9456, 86, '2000000', 9706, 86);
INSERT INTO `houses` VALUES (779, 9456, 448, '3000000', 9708, 448);
INSERT INTO `houses` VALUES (780, 9460, 119, '2000000', 9710, 119);
INSERT INTO `houses` VALUES (781, 9460, 107, '2000000', 9712, 107);
INSERT INTO `houses` VALUES (782, 9460, 399, '4000000', 9715, 399);
INSERT INTO `houses` VALUES (783, 220, 84, '3000000', 9617, 84);
INSERT INTO `houses` VALUES (784, 8779, 178, '2000000', 8870, 178);
INSERT INTO `houses` VALUES (785, 8780, 196, '2000000', 8876, 196);
INSERT INTO `houses` VALUES (786, 8781, 294, '4000000', 8875, 294);
INSERT INTO `houses` VALUES (787, 8817, 295, '2000000', 8877, 295);
INSERT INTO `houses` VALUES (788, 8784, 235, '4000000', 8873, 235);
INSERT INTO `houses` VALUES (789, 8785, 76, '3000000', 8872, 313);
INSERT INTO `houses` VALUES (790, 8785, 155, '2000000', 8878, 309);
INSERT INTO `houses` VALUES (791, 8786, 271, '3000000', 8879, 271);
INSERT INTO `houses` VALUES (792, 8821, 83, '4000000', 8883, 83);
INSERT INTO `houses` VALUES (793, 8821, 218, '2000000', 8881, 218);
INSERT INTO `houses` VALUES (794, 8789, 172, '2000000', 8885, 172);
INSERT INTO `houses` VALUES (795, 8789, 111, '2000000', 8884, 111);
INSERT INTO `houses` VALUES (796, 8790, 444, '3000000', 8888, 444);
INSERT INTO `houses` VALUES (797, 8790, 309, '2000000', 8887, 309);
INSERT INTO `houses` VALUES (798, 8825, 198, '3000000', 8889, 198);
INSERT INTO `houses` VALUES (799, 8794, 127, '3000000', 8890, 127);
INSERT INTO `houses` VALUES (800, 8794, 282, '4000000', 8892, 282);
INSERT INTO `houses` VALUES (801, 8795, 250, '2000000', 8893, 250);
INSERT INTO `houses` VALUES (802, 8795, 235, '3000000', 8894, 235);
INSERT INTO `houses` VALUES (803, 8795, 286, '4000000', 8896, 286);
INSERT INTO `houses` VALUES (804, 8796, 370, '4000000', 8898, 370);
INSERT INTO `houses` VALUES (805, 8829, 271, '3000000', 8899, 271);
INSERT INTO `houses` VALUES (806, 8800, 161, '2000000', 8900, 161);
INSERT INTO `houses` VALUES (807, 8832, 163, '2000000', 8901, 327);
INSERT INTO `houses` VALUES (808, 8833, 235, '4000000', 8904, 235);
INSERT INTO `houses` VALUES (813, 10744, 307, '2000000', 10859, 307);
INSERT INTO `houses` VALUES (814, 10744, 274, '2000000', 10860, 274);
INSERT INTO `houses` VALUES (815, 10744, 214, '3000000', 10861, 214);
INSERT INTO `houses` VALUES (817, 10745, 227, '3000000', 10864, 227);
INSERT INTO `houses` VALUES (818, 10635, 301, '2000000', 10866, 301);
INSERT INTO `houses` VALUES (819, 10635, 195, '3000000', 10867, 195);
INSERT INTO `houses` VALUES (820, 10635, 336, '3000000', 10868, 336);
INSERT INTO `houses` VALUES (821, 10746, 220, '3000000', 10870, 220);
INSERT INTO `houses` VALUES (822, 10638, 419, '2000000', 10871, 419);
INSERT INTO `houses` VALUES (823, 10638, 223, '2000000', 10872, 223);
INSERT INTO `houses` VALUES (824, 10638, 154, '3000000', 10873, 154);
INSERT INTO `houses` VALUES (825, 10638, 176, '4000000', 10874, 176);
INSERT INTO `houses` VALUES (826, 10640, 328, '4000000', 10876, 328);
INSERT INTO `houses` VALUES (827, 10640, 223, '3000000', 10877, 223);
INSERT INTO `houses` VALUES (828, 10640, 350, '2000000', 10878, 350);
INSERT INTO `houses` VALUES (829, 10642, 448, '2000000', 10879, 448);
INSERT INTO `houses` VALUES (830, 10642, 186, '2000000', 10880, 186);
INSERT INTO `houses` VALUES (831, 10642, 326, '4000000', 10882, 326);
INSERT INTO `houses` VALUES (832, 10644, 337, '4000000', 10884, 337);
INSERT INTO `houses` VALUES (833, 10646, 228, '4000000', 10886, 228);
INSERT INTO `houses` VALUES (834, 10649, 365, '4000000', 10887, 365);
INSERT INTO `houses` VALUES (835, 10748, 370, '4000000', 10888, 370);
INSERT INTO `houses` VALUES (836, 10641, 356, '4000000', 10889, 356);
INSERT INTO `houses` VALUES (837, 10643, 216, '4000000', 10891, 216);
INSERT INTO `houses` VALUES (838, 10647, 455, '4000000', 10892, 455);
INSERT INTO `houses` VALUES (839, 10650, 183, '4000000', 10893, 183);
INSERT INTO `houses` VALUES (840, 10750, 299, '4000000', 10895, 299);
INSERT INTO `houses` VALUES (841, 10751, 204, '4000000', 10896, 204);
INSERT INTO `houses` VALUES (842, 10752, 326, '4000000', 10897, 326);
INSERT INTO `houses` VALUES (843, 10753, 211, '4000000', 10898, 211);
INSERT INTO `houses` VALUES (844, 10755, 296, '4000000', 10899, 296);
INSERT INTO `houses` VALUES (846, 10649, 312, '3000000', 10905, 312);
INSERT INTO `houses` VALUES (847, 10748, 147, '3000000', 10906, 147);
INSERT INTO `houses` VALUES (848, 10641, 216, '3000000', 10907, 216);
INSERT INTO `houses` VALUES (849, 10645, 257, '3000000', 10908, 257);
INSERT INTO `houses` VALUES (850, 10645, 409, '3000000', 10909, 409);
INSERT INTO `houses` VALUES (851, 10650, 265, '3000000', 10910, 265);
INSERT INTO `houses` VALUES (852, 10750, 204, '3000000', 10911, 204);
INSERT INTO `houses` VALUES (853, 10751, 328, '3000000', 10912, 328);
INSERT INTO `houses` VALUES (854, 10752, 199, '3000000', 10913, 199);
INSERT INTO `houses` VALUES (855, 10753, 373, '3000000', 10914, 373);
INSERT INTO `houses` VALUES (856, 10644, 360, '2000000', 10915, 360);
INSERT INTO `houses` VALUES (857, 10646, 283, '2000000', 10916, 283);
INSERT INTO `houses` VALUES (858, 10646, 352, '2000000', 10917, 352);
INSERT INTO `houses` VALUES (859, 10747, 207, '2000000', 10918, 207);
INSERT INTO `houses` VALUES (860, 10748, 407, '2000000', 10919, 407);
INSERT INTO `houses` VALUES (861, 10641, 396, '2000000', 10920, 396);
INSERT INTO `houses` VALUES (862, 10643, 365, '2000000', 10921, 382);
INSERT INTO `houses` VALUES (864, 10647, 330, '2000000', 10923, 330);
INSERT INTO `houses` VALUES (865, 10647, 394, '2000000', 10924, 394);
INSERT INTO `houses` VALUES (866, 10650, 412, '2000000', 10925, 412);
INSERT INTO `houses` VALUES (867, 10749, 136, '2000000', 10926, 136);
INSERT INTO `houses` VALUES (868, 10750, 354, '2000000', 10927, 354);
INSERT INTO `houses` VALUES (869, 10751, 180, '2000000', 10928, 180);
INSERT INTO `houses` VALUES (870, 10751, 361, '2000000', 10929, 361);
INSERT INTO `houses` VALUES (871, 10645, 152, '2000000', 10931, 152);
INSERT INTO `houses` VALUES (872, 10753, 352, '2000000', 10932, 352);
INSERT INTO `houses` VALUES (873, 10755, 235, '2000000', 10933, 235);
INSERT INTO `houses` VALUES (874, 10616, 411, '10000000', 10991, 411);
INSERT INTO `houses` VALUES (875, 10618, 170, '10000000', 10996, 170);
INSERT INTO `houses` VALUES (876, 10630, 324, '10000000', 11001, 324);
INSERT INTO `houses` VALUES (877, 10622, 431, '10000000', 11006, 431);
INSERT INTO `houses` VALUES (878, 10606, 162, '10000000', 11011, 162);
INSERT INTO `houses` VALUES (879, 10607, 249, '10000000', 11016, 249);
INSERT INTO `houses` VALUES (880, 10609, 422, '10000000', 11021, 422);
INSERT INTO `houses` VALUES (881, 10611, 201, '10000000', 11026, 201);
INSERT INTO `houses` VALUES (882, 10599, 440, '5000000', 11030, 440);
INSERT INTO `houses` VALUES (883, 10600, 439, '5000000', 11034, 439);
INSERT INTO `houses` VALUES (884, 10601, 448, '5000000', 11038, 448);
INSERT INTO `houses` VALUES (885, 10602, 161, '5000000', 11042, 161);
INSERT INTO `houses` VALUES (886, 10561, 161, '5000000', 11046, 161);
INSERT INTO `houses` VALUES (887, 10559, 433, '5000000', 11050, 433);
INSERT INTO `houses` VALUES (888, 10557, 295, '5000000', 11054, 295);
INSERT INTO `houses` VALUES (889, 10554, 422, '5000000', 11058, 422);
INSERT INTO `houses` VALUES (890, 10745, 296, '4000000', 11130, 296);
INSERT INTO `houses` VALUES (891, 10752, 251, '2000000', 11226, 251);
INSERT INTO `houses` VALUES (892, 10644, 256, '3000000', 10904, 256);
INSERT INTO `houses` VALUES (894, 11227, 298, '3000000', 11272, 298);
INSERT INTO `houses` VALUES (895, 11225, 78, '2000000', 11273, 78);
INSERT INTO `houses` VALUES (896, 11225, 134, '2000000', 11274, 134);
INSERT INTO `houses` VALUES (897, 11225, 212, '4000000', 11280, 212);
INSERT INTO `houses` VALUES (898, 11225, 397, '4000000', 11283, 397);
INSERT INTO `houses` VALUES (899, 11225, 458, '2000000', 11284, 458);
INSERT INTO `houses` VALUES (900, 11224, 208, '2000000', 11285, 208);
INSERT INTO `houses` VALUES (901, 11224, 273, '2000000', 11286, 273);
INSERT INTO `houses` VALUES (902, 11223, 307, '2000000', 11287, 307);
INSERT INTO `houses` VALUES (903, 11223, 210, '2000000', 0, 0);
INSERT INTO `houses` VALUES (904, 11223, 154, '2000000', 11289, 154);
INSERT INTO `houses` VALUES (905, 11223, 157, '2000000', 11290, 157);
INSERT INTO `houses` VALUES (906, 11222, 179, '3000000', 11292, 179);
INSERT INTO `houses` VALUES (907, 11222, 257, '2000000', 11293, 257);
INSERT INTO `houses` VALUES (908, 11222, 187, '2000000', 11294, 187);
INSERT INTO `houses` VALUES (909, 11221, 205, '4000000', 11297, 205);
INSERT INTO `houses` VALUES (910, 11221, 135, '2000000', 11298, 135);
INSERT INTO `houses` VALUES (911, 11221, 368, '2000000', 11299, 368);
INSERT INTO `houses` VALUES (912, 11219, 165, '2000000', 11301, 165);
INSERT INTO `houses` VALUES (913, 11219, 323, '4000000', 11304, 323);
INSERT INTO `houses` VALUES (914, 11219, 268, '2000000', 11305, 268);
INSERT INTO `houses` VALUES (915, 11219, 344, '3000000', 11307, 344);
INSERT INTO `houses` VALUES (916, 11217, 149, '2000000', 11308, 149);
INSERT INTO `houses` VALUES (917, 11217, 210, '3000000', 11310, 210);
INSERT INTO `houses` VALUES (918, 11217, 272, '4000000', 11313, 272);
INSERT INTO `houses` VALUES (919, 11217, 424, '2000000', 11314, 424);
INSERT INTO `houses` VALUES (920, 11228, 267, '3000000', 11316, 267);
INSERT INTO `houses` VALUES (921, 11228, 357, '3000000', 11318, 357);
INSERT INTO `houses` VALUES (922, 11228, 462, '2000000', 11319, 462);
INSERT INTO `houses` VALUES (923, 11230, 154, '3000000', 11321, 154);
INSERT INTO `houses` VALUES (924, 11230, 208, '4000000', 11324, 208);
INSERT INTO `houses` VALUES (925, 11231, 135, '2000000', 11325, 135);
INSERT INTO `houses` VALUES (926, 11231, 205, '4000000', 11328, 205);
INSERT INTO `houses` VALUES (927, 11231, 229, '3000000', 11330, 229);
INSERT INTO `houses` VALUES (928, 11231, 390, '2000000', 11331, 390);
INSERT INTO `houses` VALUES (929, 11232, 209, '3000000', 11333, 209);
INSERT INTO `houses` VALUES (930, 11232, 198, '4000000', 11336, 198);
INSERT INTO `houses` VALUES (931, 11233, 150, '3000000', 11338, 150);
INSERT INTO `houses` VALUES (932, 11233, 198, '4000000', 11341, 198);
INSERT INTO `houses` VALUES (933, 11186, 298, '4000000', 11344, 298);
INSERT INTO `houses` VALUES (934, 11184, 209, '3000000', 11346, 209);
INSERT INTO `houses` VALUES (935, 11184, 198, '4000000', 11349, 198);
INSERT INTO `houses` VALUES (936, 11187, 273, '2000000', 11350, 273);
INSERT INTO `houses` VALUES (937, 11187, 323, '4000000', 11353, 323);
INSERT INTO `houses` VALUES (938, 11189, 78, '2000000', 11354, 78);
INSERT INTO `houses` VALUES (939, 11189, 134, '2000000', 11355, 134);
INSERT INTO `houses` VALUES (940, 11189, 212, '4000000', 11358, 212);
INSERT INTO `houses` VALUES (941, 11189, 272, '2000000', 11359, 272);
INSERT INTO `houses` VALUES (942, 11189, 458, '2000000', 11360, 458);
INSERT INTO `houses` VALUES (943, 11189, 397, '3000000', 11362, 397);
INSERT INTO `houses` VALUES (944, 11191, 149, '2000000', 11363, 149);
INSERT INTO `houses` VALUES (945, 11191, 272, '4000000', 11366, 272);
INSERT INTO `houses` VALUES (946, 11191, 432, '2000000', 11367, 432);
INSERT INTO `houses` VALUES (947, 11191, 424, '2000000', 11368, 424);
INSERT INTO `houses` VALUES (948, 11181, 292, '2000000', 11369, 292);
INSERT INTO `houses` VALUES (949, 11181, 184, '4000000', 11372, 184);
INSERT INTO `houses` VALUES (950, 11181, 158, '2000000', 11373, 158);
INSERT INTO `houses` VALUES (951, 11179, 237, '4000000', 11376, 237);
INSERT INTO `houses` VALUES (952, 11179, 371, '2000000', 11377, 371);
INSERT INTO `houses` VALUES (953, 11179, 431, '2000000', 11378, 431);
INSERT INTO `houses` VALUES (954, 11180, 185, '4000000', 11381, 185);
INSERT INTO `houses` VALUES (955, 11180, 149, '3000000', 11383, 149);
INSERT INTO `houses` VALUES (956, 11180, 398, '2000000', 11384, 398);
INSERT INTO `houses` VALUES (957, 11178, 340, '3000000', 11386, 340);
INSERT INTO `houses` VALUES (958, 11178, 402, '3000000', 11388, 402);
INSERT INTO `houses` VALUES (959, 11178, 285, '2000000', 11389, 285);
INSERT INTO `houses` VALUES (960, 11178, 78, '2000000', 11390, 78);
INSERT INTO `houses` VALUES (961, 11176, 268, '4000000', 11393, 268);
INSERT INTO `houses` VALUES (962, 11176, 357, '2000000', 11394, 357);
INSERT INTO `houses` VALUES (963, 11176, 462, '2000000', 11395, 462);
INSERT INTO `houses` VALUES (964, 11175, 284, '4000000', 11398, 284);
INSERT INTO `houses` VALUES (965, 11175, 177, '2000000', 11399, 177);
INSERT INTO `houses` VALUES (966, 11174, 187, '3000000', 11401, 187);
INSERT INTO `houses` VALUES (967, 11174, 257, '2000000', 11402, 257);
INSERT INTO `houses` VALUES (968, 11174, 179, '3000000', 11404, 179);
INSERT INTO `houses` VALUES (969, 11172, 157, '2000000', 11405, 157);
INSERT INTO `houses` VALUES (970, 11172, 210, '4000000', 11408, 210);
INSERT INTO `houses` VALUES (971, 11172, 307, '2000000', 11409, 307);
INSERT INTO `houses` VALUES (972, 11204, 253, '4000000', 11412, 253);
INSERT INTO `houses` VALUES (973, 11203, 205, '4000000', 11415, 205);
INSERT INTO `houses` VALUES (974, 11203, 135, '2000000', 11416, 135);
INSERT INTO `houses` VALUES (975, 11203, 229, '3000000', 11418, 229);
INSERT INTO `houses` VALUES (976, 11203, 390, '2000000', 11419, 390);
INSERT INTO `houses` VALUES (977, 11200, 293, '2000000', 11420, 293);
INSERT INTO `houses` VALUES (978, 11200, 198, '2000000', 11421, 198);
INSERT INTO `houses` VALUES (979, 11200, 157, '2000000', 11422, 157);
INSERT INTO `houses` VALUES (980, 11199, 292, '2000000', 11423, 292);
INSERT INTO `houses` VALUES (981, 11199, 211, '3000000', 11425, 211);
INSERT INTO `houses` VALUES (982, 11196, 78, '2000000', 11426, 78);
INSERT INTO `houses` VALUES (983, 11196, 134, '2000000', 11427, 134);
INSERT INTO `houses` VALUES (984, 11196, 212, '4000000', 11430, 212);
INSERT INTO `houses` VALUES (985, 11196, 397, '3000000', 11432, 397);
INSERT INTO `houses` VALUES (986, 11196, 458, '2000000', 11433, 458);
INSERT INTO `houses` VALUES (987, 11196, 272, '2000000', 11434, 272);
INSERT INTO `houses` VALUES (988, 11195, 462, '2000000', 11435, 462);
INSERT INTO `houses` VALUES (989, 11195, 357, '2000000', 11436, 357);
INSERT INTO `houses` VALUES (990, 11195, 268, '4000000', 11439, 268);
INSERT INTO `houses` VALUES (991, 11193, 325, '3000000', 11441, 325);
INSERT INTO `houses` VALUES (992, 11193, 78, '2000000', 11442, 78);
INSERT INTO `houses` VALUES (993, 11205, 340, '3000000', 11444, 340);
INSERT INTO `houses` VALUES (994, 11205, 78, '2000000', 11445, 78);
INSERT INTO `houses` VALUES (995, 11207, 444, '2000000', 11446, 444);
INSERT INTO `houses` VALUES (996, 11207, 224, '3000000', 11448, 224);
INSERT INTO `houses` VALUES (997, 11207, 185, '4000000', 11451, 185);
INSERT INTO `houses` VALUES (998, 11207, 245, '2000000', 11452, 245);
INSERT INTO `houses` VALUES (999, 11209, 273, '2000000', 11453, 273);
INSERT INTO `houses` VALUES (1000, 11209, 208, '2000000', 11454, 208);
INSERT INTO `houses` VALUES (1001, 11209, 321, '3000000', 11456, 321);
INSERT INTO `houses` VALUES (1002, 11211, 241, '2000000', 11457, 241);
INSERT INTO `houses` VALUES (1003, 11211, 251, '3000000', 11459, 251);
INSERT INTO `houses` VALUES (1004, 11213, 209, '3000000', 11461, 209);
INSERT INTO `houses` VALUES (1005, 11213, 198, '4000000', 11464, 198);
INSERT INTO `houses` VALUES (1006, 11216, 192, '2000000', 11465, 192);
INSERT INTO `houses` VALUES (1007, 11216, 211, '3000000', 11467, 211);
INSERT INTO `houses` VALUES (1008, 11216, 158, '2000000', 11468, 158);
INSERT INTO `houses` VALUES (1009, 11150, 370, '2000000', 11469, 370);
INSERT INTO `houses` VALUES (1010, 11150, 208, '4000000', 11472, 208);
INSERT INTO `houses` VALUES (1011, 11150, 154, '3000000', 11474, 154);
INSERT INTO `houses` VALUES (1012, 11146, 397, '3000000', 11476, 397);
INSERT INTO `houses` VALUES (1013, 11146, 458, '2000000', 11477, 458);
INSERT INTO `houses` VALUES (1014, 11146, 212, '4000000', 11480, 212);
INSERT INTO `houses` VALUES (1015, 11146, 134, '2000000', 11481, 134);
INSERT INTO `houses` VALUES (1016, 11146, 78, '2000000', 11542, 78);
INSERT INTO `houses` VALUES (1017, 11143, 453, '2000000', 11485, 453);
INSERT INTO `houses` VALUES (1018, 11143, 205, '4000000', 11488, 205);
INSERT INTO `houses` VALUES (1019, 11143, 135, '2000000', 11489, 135);
INSERT INTO `houses` VALUES (1020, 11143, 229, '3000000', 11492, 229);
INSERT INTO `houses` VALUES (1021, 11143, 390, '2000000', 11493, 390);
INSERT INTO `houses` VALUES (1022, 11138, 424, '2000000', 11494, 424);
INSERT INTO `houses` VALUES (1023, 11138, 432, '2000000', 11495, 432);
INSERT INTO `houses` VALUES (1024, 11138, 272, '4000000', 11498, 272);
INSERT INTO `houses` VALUES (1025, 11138, 149, '2000000', 11499, 149);
INSERT INTO `houses` VALUES (1026, 11137, 323, '4000000', 11502, 323);
INSERT INTO `houses` VALUES (1027, 11137, 344, '3000000', 11504, 344);
INSERT INTO `houses` VALUES (1028, 11151, 307, '2000000', 11505, 307);
INSERT INTO `houses` VALUES (1029, 11151, 325, '3000000', 11507, 325);
INSERT INTO `houses` VALUES (1030, 11151, 157, '2000000', 11508, 157);
INSERT INTO `houses` VALUES (1031, 11153, 292, '2000000', 11509, 292);
INSERT INTO `houses` VALUES (1032, 11153, 211, '3000000', 11511, 211);
INSERT INTO `houses` VALUES (1033, 11153, 158, '2000000', 11512, 158);
INSERT INTO `houses` VALUES (1034, 11158, 177, '2000000', 11513, 177);
INSERT INTO `houses` VALUES (1035, 11158, 52, '2000000', 11514, 52);
INSERT INTO `houses` VALUES (1036, 11158, 269, '3000000', 11516, 269);
INSERT INTO `houses` VALUES (1037, 11159, 387, '4000000', 11521, 387);
INSERT INTO `houses` VALUES (1038, 11159, 340, '3000000', 11523, 340);
INSERT INTO `houses` VALUES (1039, 11159, 78, '2000000', 11524, 78);
INSERT INTO `houses` VALUES (1040, 11160, 444, '2000000', 11525, 444);
INSERT INTO `houses` VALUES (1041, 11160, 245, '2000000', 11526, 245);
INSERT INTO `houses` VALUES (1042, 11160, 185, '4000000', 11529, 185);
INSERT INTO `houses` VALUES (1043, 11162, 238, '2000000', 11530, 238);
INSERT INTO `houses` VALUES (1044, 11162, 193, '2000000', 11531, 193);
INSERT INTO `houses` VALUES (1045, 11163, 187, '2000000', 11532, 187);
INSERT INTO `houses` VALUES (1046, 11163, 257, '2000000', 11533, 257);
INSERT INTO `houses` VALUES (1047, 11163, 179, '3000000', 11535, 179);
INSERT INTO `houses` VALUES (1048, 11166, 198, '4000000', 11538, 198);
INSERT INTO `houses` VALUES (1049, 11166, 209, '3000000', 11540, 209);
INSERT INTO `houses` VALUES (1050, 11146, 272, '2000000', 11236, 272);
INSERT INTO `houses` VALUES (1051, 9015, 207, '60000000', 10853, 403);
INSERT INTO `houses` VALUES (1052, 4590, 428, '3000000', 11601, 428);
INSERT INTO `houses` VALUES (1053, 4590, 394, '4000000', 11605, 394);
INSERT INTO `houses` VALUES (1054, 8756, 218, '5000000', 11609, 218);
INSERT INTO `houses` VALUES (1055, 8753, 45, '3000000', 11626, 45);
INSERT INTO `houses` VALUES (1056, 8754, 124, '3000000', 11630, 124);
INSERT INTO `houses` VALUES (1057, 8756, 279, '2000000', 11611, 279);
INSERT INTO `houses` VALUES (1058, 8756, 723, '3000000', 11613, 723);
INSERT INTO `houses` VALUES (1059, 8755, 150, '3000000', 11615, 150);
INSERT INTO `houses` VALUES (1060, 8755, 78, '3000000', 11617, 78);
INSERT INTO `houses` VALUES (1061, 8752, 649, '3000000', 11619, 649);
INSERT INTO `houses` VALUES (1062, 8749, 755, '4000000', 11622, 755);
INSERT INTO `houses` VALUES (1063, 8753, 705, '3000000', 11624, 705);
INSERT INTO `houses` VALUES (1064, 8753, 729, '3000000', 11628, 729);
INSERT INTO `houses` VALUES (1065, 8754, 274, '4000000', 11633, 274);
INSERT INTO `houses` VALUES (1066, 8754, 714, '4000000', 11636, 714);
INSERT INTO `houses` VALUES (1067, 4591, 193, '3000000', 11638, 193);
INSERT INTO `houses` VALUES (1068, 4621, 246, '3000000', 11640, 246);
INSERT INTO `houses` VALUES (1069, 4621, 681, '3000000', 11642, 681);
INSERT INTO `houses` VALUES (1070, 4621, 164, '4000000', 11645, 164);
INSERT INTO `houses` VALUES (1071, 4627, 273, '2000000', 11647, 273);
INSERT INTO `houses` VALUES (1072, 4598, 414, '4000000', 11653, 414);
INSERT INTO `houses` VALUES (1073, 4583, 601, '4000000', 11656, 601);
INSERT INTO `houses` VALUES (1074, 4583, 146, '4000000', 11659, 146);
INSERT INTO `houses` VALUES (1075, 4583, 51, '4000000', 11662, 51);
INSERT INTO `houses` VALUES (1076, 5147, 419, '2000000', 11664, 419);
INSERT INTO `houses` VALUES (1077, 4607, 331, '4000000', 11670, 331);
INSERT INTO `houses` VALUES (1078, 4607, 279, '3000000', 11676, 279);
INSERT INTO `houses` VALUES (1079, 4551, 293, '4000000', 11679, 293);
INSERT INTO `houses` VALUES (1080, 4629, 331, '4000000', 11686, 331);
INSERT INTO `houses` VALUES (1081, 4609, 658, '2000000', 11688, 658);
INSERT INTO `houses` VALUES (1082, 4609, 581, '4000000', 11691, 581);
INSERT INTO `houses` VALUES (1083, 4931, 347, '4000000', 11698, 347);
INSERT INTO `houses` VALUES (1084, 5127, 271, '4000000', 11701, 271);
INSERT INTO `houses` VALUES (1085, 5127, 581, '2000000', 11703, 581);
INSERT INTO `houses` VALUES (1086, 5133, 88, '3000000', 11705, 88);
INSERT INTO `houses` VALUES (1087, 5295, 447, '2000000', 11709, 447);
INSERT INTO `houses` VALUES (1088, 5295, 347, '3000000', 11711, 347);
INSERT INTO `houses` VALUES (1089, 5278, 194, '5000000', 11715, 194);
INSERT INTO `houses` VALUES (1090, 5334, 94, '2000000', 11717, 94);
INSERT INTO `houses` VALUES (1091, 5334, 348, '4000000', 11722, 348);
INSERT INTO `houses` VALUES (1092, 4932, 670, '3000000', 11724, 670);
INSERT INTO `houses` VALUES (1093, 4562, 624, '4000000', 11731, 624);
INSERT INTO `houses` VALUES (1094, 5332, 279, '3000000', 11735, 279);
INSERT INTO `houses` VALUES (1095, 5333, 394, '2000000', 11737, 394);
INSERT INTO `houses` VALUES (1096, 4617, 528, '2000000', 11741, 528);
INSERT INTO `houses` VALUES (1097, 4617, 625, '3000000', 11745, 625);
INSERT INTO `houses` VALUES (1098, 5112, 469, '3000000', 11749, 469);
INSERT INTO `houses` VALUES (1099, 5112, 289, '2000000', 11751, 289);
INSERT INTO `houses` VALUES (1100, 5111, 644, '3000000', 11753, 644);
INSERT INTO `houses` VALUES (1101, 5111, 183, '2000000', 11755, 183);
INSERT INTO `houses` VALUES (1102, 4690, 304, '3000000', 11757, 304);
INSERT INTO `houses` VALUES (1103, 4690, 418, '2000000', 11759, 418);
INSERT INTO `houses` VALUES (1104, 5113, 530, '2000000', 11761, 530);
INSERT INTO `houses` VALUES (1105, 4619, 430, '3000000', 11769, 430);
INSERT INTO `houses` VALUES (1107, 5147, 168, '4000000', 11667, 168);
INSERT INTO `houses` VALUES (1108, 4607, 163, '5000000', 11674, 163);
INSERT INTO `houses` VALUES (1109, 4582, 225, '5000000', 11683, 225);
INSERT INTO `houses` VALUES (1110, 4609, 680, '2000000', 11693, 680);
INSERT INTO `houses` VALUES (1111, 4609, 626, '2000000', 11695, 626);
INSERT INTO `houses` VALUES (1112, 5133, 430, '3000000', 11707, 430);
INSERT INTO `houses` VALUES (1113, 5334, 447, '2000000', 11719, 447);
INSERT INTO `houses` VALUES (1114, 4932, 241, '2000000', 11726, 241);
INSERT INTO `houses` VALUES (1115, 4932, 543, '2000000', 11728, 543);
INSERT INTO `houses` VALUES (1116, 5332, 170, '2000000', 11733, 170);
INSERT INTO `houses` VALUES (1117, 5333, 107, '3000000', 11739, 107);
INSERT INTO `houses` VALUES (1118, 4617, 585, '2000000', 11747, 585);
INSERT INTO `houses` VALUES (1119, 5113, 381, '3000000', 11763, 381);
INSERT INTO `houses` VALUES (1120, 5113, 131, '5000000', 11767, 131);
INSERT INTO `houses` VALUES (1121, 8848, 723, '2000000', 11770, 723);
INSERT INTO `houses` VALUES (1122, 8848, 651, '3000000', 11773, 651);
INSERT INTO `houses` VALUES (1123, 8743, 132, '2000000', 11774, 132);
INSERT INTO `houses` VALUES (1124, 8744, 126, '2000000', 11775, 126);
INSERT INTO `houses` VALUES (1125, 8744, 220, '3000000', 11778, 220);
INSERT INTO `houses` VALUES (1126, 8747, 108, '4000000', 11781, 108);
INSERT INTO `houses` VALUES (1127, 8745, 743, '2000000', 11782, 743);
INSERT INTO `houses` VALUES (1128, 8746, 241, '3000000', 11786, 241);
INSERT INTO `houses` VALUES (1129, 8746, 169, '2000000', 11783, 169);
INSERT INTO `houses` VALUES (1130, 8746, 115, '3000000', 11789, 115);
INSERT INTO `houses` VALUES (1131, 8746, 79, '3000000', 11792, 79);
INSERT INTO `houses` VALUES (1132, 8760, 143, '2000000', 11799, 143);
INSERT INTO `houses` VALUES (1133, 8760, 200, '3000000', 11795, 200);
INSERT INTO `houses` VALUES (1134, 8760, 257, '3000000', 11798, 257);
INSERT INTO `houses` VALUES (1135, 8757, 123, '2000000', 11800, 123);
INSERT INTO `houses` VALUES (1136, 8757, 180, '4000000', 11803, 180);
INSERT INTO `houses` VALUES (1137, 8758, 658, '2000000', 11807, 658);
INSERT INTO `houses` VALUES (1138, 8758, 715, '2000000', 11808, 715);
INSERT INTO `houses` VALUES (1139, 8759, 243, '2000000', 11812, 243);
INSERT INTO `houses` VALUES (1140, 9270, 189, '4000000', 11818, 189);
INSERT INTO `houses` VALUES (1141, 9269, 432, '3000000', 11811, 432);
INSERT INTO `houses` VALUES (1142, 8759, 366, '4000000', 11815, 366);
INSERT INTO `houses` VALUES (1143, 9268, 366, '4000000', 11821, 366);
INSERT INTO `houses` VALUES (1144, 9272, 487, '4000000', 11824, 487);
INSERT INTO `houses` VALUES (1145, 9294, 414, '2000000', 11829, 414);
INSERT INTO `houses` VALUES (1146, 9294, 498, '3000000', 11832, 498);
INSERT INTO `houses` VALUES (1147, 9294, 604, '2000000', 11828, 604);
INSERT INTO `houses` VALUES (1148, 9274, 124, '2000000', 11833, 124);
INSERT INTO `houses` VALUES (1149, 9274, 181, '4000000', 11836, 181);
INSERT INTO `houses` VALUES (1150, 9295, 542, '4000000', 11839, 542);
INSERT INTO `houses` VALUES (1151, 9295, 187, '4000000', 11842, 187);
INSERT INTO `houses` VALUES (1152, 9278, 143, '2000000', 11843, 143);
INSERT INTO `houses` VALUES (1153, 9278, 200, '3000000', 11846, 200);
INSERT INTO `houses` VALUES (1154, 9278, 257, '3000000', 11849, 257);
INSERT INTO `houses` VALUES (1155, 9277, 366, '4000000', 11853, 366);
INSERT INTO `houses` VALUES (1156, 9296, 316, '4000000', 11856, 316);
INSERT INTO `houses` VALUES (1157, 8757, 47, '3000000', 11806, 47);
INSERT INTO `houses` VALUES (1158, 9272, 199, '4000000', 11827, 199);
INSERT INTO `houses` VALUES (1159, 4627, 94, '4000000', 0, 0);
INSERT INTO `houses` VALUES (1160, 9277, 243, '2000000', 11850, 243);
INSERT INTO `houses` VALUES (1161, 4335, 112, '2000000', 11867, 112);
INSERT INTO `houses` VALUES (1162, 4335, 78, '2000000', 11868, 78);
INSERT INTO `houses` VALUES (1163, 5311, 82, '3000000', 11870, 82);
INSERT INTO `houses` VALUES (1164, 5311, 217, '4000000', 11873, 217);

-- ----------------------------
-- Table structure for mountpark_data
-- ----------------------------
DROP TABLE IF EXISTS `mountpark_data`;
CREATE TABLE `mountpark_data`  (
  `mapid` int(11) NOT NULL,
  `cellid` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `sizeObj` int(11) NOT NULL,
  `priceBase` int(11) NOT NULL,
  `cellMount` int(11) NOT NULL,
  `cellPorte` int(11) NOT NULL,
  `cellEnclos` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`mapid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mountpark_data
-- ----------------------------
INSERT INTO `mountpark_data` VALUES (8760, 753, 4, 4, 980000, 717, 735, '660;642;624;606;588;570;589;607;625;643;661;679;698;680;662;644;626;608;627;645;663;681;699;717;736;718;700;682;646;665;683;701;719;737;755;774;756;738;720;702');
INSERT INTO `mountpark_data` VALUES (2221, 242, 8, 8, 1760000, 206, 224, '206;187;168;149;130;111;74;93;112;131;150;169;188;170;151;132;113;94;75;56;37;19;38;57;76;95;114;133;152;134;115;96;77;58;39;20;1;2;21;40;59;78;97;116;98;79;60;41;22;3;4;23;42;61;80;62;43;24;5;44;25');
INSERT INTO `mountpark_data` VALUES (4308, 507, 5, 5, 1175000, 543, 525, '486;504;522;540;558;576;595;577;559;541;523;505;524;542;560;578;596;614;633;615;597;579;561;543;562;580;598;616;634;652;671;690;672;653;635;654;636;617;599;618;600;581');
INSERT INTO `mountpark_data` VALUES (8848, 549, 500, 10, 0, 511, 530, '');
INSERT INTO `mountpark_data` VALUES (8744, 579, 500, 10, 0, 543, 561, '');
INSERT INTO `mountpark_data` VALUES (8743, 605, 500, 10, 0, 567, 586, '');
INSERT INTO `mountpark_data` VALUES (9748, 356, 13, 13, 2735000, 326, 341, '242;256;270;284;298;312;326;340;354;368;382;396;410;424;409;395;381;367;353;339;325;311;297;283;269;255;241;227;212;226;240;254;268;282;296;310;324;338;352;366;380;394;351;337;323;309;295;281;267;253;239;225;211;197;182;196;210;224;238;252;266;280;294;308;322;336;293;279;265;251;237;223;209;195;181;167;152;166;180;194;208;222;236;250;264;278;263;249;235;221;207;193;179;165;151;137;192;177;162;176;190;204;218;233;219;205;191;206;220;234');
INSERT INTO `mountpark_data` VALUES (9747, 78, 9, 9, 1955000, 106, 92, '91;105;119;133;147;162;176;148;134;120;106;121;135;149;163;177;192;178;164;150;136;137;123;109;95;151;165;179;193;207;221;250;236;222;208;194;180;166;152;138;124;110;125;139;153;167;181;195;209;223;237;251;265;280;266;252;238;224;210;140;154;168;182;169;155;170;184;239;253;267;281;295;310;296;282;268');
INSERT INTO `mountpark_data` VALUES (9746, 169, 9, 9, 1955000, 197, 183, '197;182;167;152;137;122;212;227;242;257;272;287;301;286;271;256;241;226;211;196;181;166;151;136;150;165;180;195;210;225;240;255;270;285;300;315;329;314;299;284;269;254;239;224;209;194;179;164;178;193;208;223;238;253;268;283;298;343;328;342;356;371;357;297;282;267;252;237;222;207;192;206;221;236;251;266;281;296;311');
INSERT INTO `mountpark_data` VALUES (8747, 615, 500, 10, 0, 579, 597, '');
INSERT INTO `mountpark_data` VALUES (9745, 168, 12, 12, 2540000, 196, 182, '181;166;151;136;121;196;211;226;241;256;271;286;301;316;330;315;300;285;270;255;240;225;210;195;180;165;150;135;149;164;179;194;209;224;239;254;269;284;299;314;329;344;358;343;328;313;298;283;268;253;238;223;208;193;178;163;177;192;207;222;237;252;267;282;297;312;327;342;357;372;386;371;356;341;326;311;296;281;266;251;265;280;295;310;325;340;355;370;385;400;414;399;384;369;354;339;324;309;294');
INSERT INTO `mountpark_data` VALUES (9744, 164, 12, 12, 2540000, 194, 179, '166;180;194;208;222;236;251;237;223;209;195;181;196;210;224;238;252;266;281;267;253;239;225;211;212;198;184;170;226;240;254;268;282;296;310;324;338;352;367;353;339;325;311;297;283;269;255;241;227;213;199;185;200;214;228;242;256;270;284;298;312;326;340;354;368;382;397;383;369;355;341;327;313;299;314;328;342;356;370;384;398;412;427;413;399;385;371;357;343;329;344;358;372;386;400');
INSERT INTO `mountpark_data` VALUES (9743, 208, 11, 11, 2345000, 238, 223, '196;210;224;238;252;266;280;294;309;295;281;267;253;239;225;211;226;240;254;268;282;296;310;324;339;325;311;297;283;269;255;241;256;270;284;298;312;326;340;354;355;341;327;313;299;285;271;286;300;314;328;342;356;370;384;399;385;371;357;343;329;301;358;372;386;400;414;429;415;401;387;373;359;360;374;388;402;416;430;431;417;403;389;375;404;418');
INSERT INTO `mountpark_data` VALUES (9740, 178, 9, 9, 1955000, 208, 193, '180;194;208;222;236;251;237;223;209;195;210;224;238;252;266;295;309;323;281;267;253;239;225;211;197;183;198;212;226;240;296;310;324;338;353;339;325;311;297;298;299;270;241;227;213;228;242;256;313;327;341;355;369;368;354;340;326;312;383;285;271;257;243;300;314;328;342;356;371;357;343;329;315;330;344;358;372');
INSERT INTO `mountpark_data` VALUES (9741, 298, 13, 13, 2735000, 268, 283, '198;212;226;240;254;268;282;296;310;324;338;323;309;295;281;267;253;239;225;211;197;183;168;182;196;210;224;238;252;266;280;294;308;293;279;265;251;237;223;209;195;181;167;153;138;124;110;152;166;180;194;278;264;250;236;222;95;80;94;109;123;137;151;165;179;164;135;106;91;76;61;90;105;62;77;92;107;122;207;221;235;249;263;248;234;220;206;192;177;191;205;219;233;190;176;162;161;175;160;146;132;118;103;117;131;102');
INSERT INTO `mountpark_data` VALUES (9728, 359, 14, 14, 2930000, 329, 344, '329;343;357;371;315;301;287;272;286;300;314;328;342;356;341;327;313;299;285;271;257;242;256;270;284;298;312;326;340;354;368;353;339;325;311;297;283;269;255;241;227;198;184;170;212;226;240;254;268;282;296;310;324;338;323;309;295;281;267;253;239;225;211;197;183;169;155;140;154;168;182;196;210;224;238;252;266;280;294;308;251;237;223;209;195;181;167;152;166;180;194;208;222;236;221;207;193;179;165;151;137;122;136;150;164;178;192;206;177;163;149;135;121');
INSERT INTO `mountpark_data` VALUES (9742, 214, 14, 14, 2930000, 242, 228, '242;227;212;257;272;287;301;286;271;256;241;226;240;255;270;285;300;315;329;314;299;284;269;254;253;238;223;268;283;298;313;328;343;357;342;327;312;297;282;267;252;237;251;266;281;296;311;326;341;356;371;386;401;416;430;415;400;385;325;310;295;280;265;279;294;309;324;339;340;399;414;429;444;458;443;428;413;412;411;382;353;338;323;308;293;307;322;337;352;367;426;441;456;457;442;427;396;381;366;351;321;380;395;410;425;440;455;439;424;409;394;408;423;438');
INSERT INTO `mountpark_data` VALUES (9732, 112, 13, 13, 2735000, 155, 141, '155;140;170;185;199;184;169;154;168;183;198;213;242;257;272;287;227;212;197;182;167;152;137;122;107;121;136;151;166;181;196;211;226;241;256;271;286;301;315;300;285;270;135;150;165;180;195;210;225;240;314;329;299;254;239;224;209;194;179;164;149;163;178;193;208;223;238;253;282;297;312;327;328;343;357;342;267;252;237;222;207;192;177;191;206;221;236;251;266;281;296;311;326;341;356;371;385;370;355;340;325;310;295;280;265;250;235;220');
INSERT INTO `mountpark_data` VALUES (8746, 208, 500, 10, 0, 246, 227, '');
INSERT INTO `mountpark_data` VALUES (9733, 345, 8, 8, 1760000, 315, 330, '315;329;301;287;272;286;300;314;299;285;271;257;242;256;270;284;269;255;241;227;212;226;240;254;268;282;296;281;267;253;239;225;211;197;182;196;210;224;238;252;266;251;237;223;209;195;181;167;194;208;222;236;221;207;193;179;164;178;192;206;191;177;163');
INSERT INTO `mountpark_data` VALUES (9734, 279, 7, 7, 1565000, 251, 265, '251;266;281;296;311;236;221;206;191;177;192;207;222;237;252;267;282;297;283;268;253;238;223;208;193;178;163;149;164;179;194;209;224;239;254;269;255;241;240;225;210;195;180;165;150;135;121;136;151;166;196;152;137;122;107;93;108;123');
INSERT INTO `mountpark_data` VALUES (8745, 235, 500, 10, 0, 271, 253, '');
INSERT INTO `mountpark_data` VALUES (9735, 342, 10, 10, 2150000, 312, 327, '312;298;284;270;256;242;326;340;354;368;382;367;353;339;325;311;297;283;269;255;241;227;212;226;240;254;268;282;296;310;324;338;352;337;323;309;295;281;267;253;239;225;211;197;182;196;210;224;238;252;266;280;294;308;322;307;279;265;251;237;223;209;195;181;167;180;194;208;222;236;221;207;193;179;165;150;164;178;192;206;191;177;163');
INSERT INTO `mountpark_data` VALUES (9356, 399, 8, 8, 1760000, 369, 384, '262;248;234;220;206;192;178;193;207;221;235;249;263;277;292;278;264;250;236;222;208;223;237;251;265;279;293;307;322;308;294;280;266;252;238;253;267;281;295;309;323;337;352;338;324;310;296;282;268;283;297;311;325;339;353;367;382;368;354;340;326;312;298;313;327;341;355;369;383;397');
INSERT INTO `mountpark_data` VALUES (8752, 602, 500, 10, 0, 564, 602, '');
INSERT INTO `mountpark_data` VALUES (9357, 294, 9, 9, 1955000, 324, 309, '254;268;282;296;310;324;338;352;366;380;394;409;395;381;367;353;339;325;311;297;283;269;284;298;312;326;340;354;368;382;396;410;424;439;425;411;397;383;369;355;341;327;313;299;314;328;342;356;370;384;398;412;426;440;454;455;441;427;413;385;371;357;343;329;344;358;372;386;400;414;428;442;456;443;429;387;359');
INSERT INTO `mountpark_data` VALUES (9354, 264, 8, 8, 1760000, 236, 250, '251;266;252;238;224;209;194;179;164;149;163;177;191;206;236;223;237;222;208;193;207;192;178;165;151;137;123;138;152;166;180;195;181;167;153;168;183;197;198;212;226;240;254;268;296;310;324;339;325;311;297;283;255;227;213;228;242;256;270;284;312;326;354;221;281');
INSERT INTO `mountpark_data` VALUES (9353, 324, 11, 11, 2345000, 296, 310, '296;311;326;341;356;371;281;266;251;236;221;207;222;237;252;267;282;297;312;327;342;357;343;328;313;298;283;268;253;223;208;193;179;194;254;269;284;299;314;329;315;300;285;270;255;240;226;212;183;182;181;195;180;165;151;166;241;256;271;286;301;287;272;257;242;227;167;152;137;123;138;153;168;198;213;199;184;169;154;139;124;109;95;110;125;140;155;170');
INSERT INTO `mountpark_data` VALUES (9355, 308, 7, 7, 1565000, 280, 294, '280;265;250;235;295;310;325;340;355;341;326;311;296;281;266;251;236;221;207;222;237;252;267;282;297;312;327;313;298;283;268;253;238;223;208;193;179;194;209;224;239;254;269;284;299;210;195;180;165;151;166;181;196;182;167;152;137;123;138;153');
INSERT INTO `mountpark_data` VALUES (9358, 252, 9, 9, 1955000, 282, 267, '282;268;254;240;296;310;324;339;325;311;297;283;269;255;270;284;298;312;326;340;354;355;341;327;313;299;285;300;314;328;342;356;370;399;385;371;357;343;329;315;330;344;358;372;386;400;414;429;415;401;387;373;359;345;360;374;388;402;416;430;444;459;445;431;417;403;375;404;418;432;446;460');
INSERT INTO `mountpark_data` VALUES (9352, 112, 10, 10, 2150000, 140, 126, '140;125;155;170;184;169;154;139;153;168;183;198;212;197;182;167;181;196;211;226;240;225;210;195;209;224;239;254;268;253;238;223;208;193;178;163;177;192;207;222;237;252;267;282;311;326;341;356;296;281;266;251;236;221;206;191;250;265;280;295;310;325;340;355;370;384;369;354;339;324;309;294;279;264;293;308;323;338;353;368;383');
INSERT INTO `mountpark_data` VALUES (9729, 355, 12, 12, 2540000, 327, 341, '327;342;357;312;297;282;267;252;237;222;207;221;236;251;266;281;296;310;295;280;265;250;235;249;264;279;294;309;324;208;193;223;238;253;268;283;298;313;328;343;329;314;299;284;269;254;239;224;209;194;179;165;180;195;210;225;240;255;270;285;300;315;301;286;271;256;241;226;211;196;181;166;151;137;152;167;182;197;183;168;153;138;123;109;124;139;154;169;155;140;125');
INSERT INTO `mountpark_data` VALUES (9730, 282, 11, 11, 2345000, 252, 267, '252;266;280;294;308;238;224;210;196;182;168;153;167;181;195;209;223;237;251;265;279;293;307;292;278;264;250;236;222;208;194;180;166;152;138;123;137;151;165;179;193;207;221;235;249;263;277;262;248;234;220;206;192;178;164;150;136;122;108;93;107;121;135;149;163;177;191;205;219;233;247;218;204;190;176;162;148;133;147;161;175;189;160;146;132;118;103;117;131;102');
INSERT INTO `mountpark_data` VALUES (9731, 279, 12, 12, 2540000, 251, 265, '251;266;281;282;311;236;221;206;191;176;147;146;131;132;162;177;192;207;222;237;252;267;297;283;268;253;238;223;208;193;178;163;148;133;118;103;74;89;104;119;134;149;164;179;194;209;224;239;254;269;255;240;225;210;195;180;165;150;135;120;105;90;75;60;45;59;31;46;61;76;91;106;121;136;151;166;181;196;211;226;241;167;152;137;122;108;123;138;153;139;124;109');
INSERT INTO `mountpark_data` VALUES (9726, 343, 8, 8, 1760000, 313, 328, '313;299;285;271;327;341;355;369;354;340;326;312;298;284;270;256;242;227;241;255;269;283;297;311;325;339;324;310;296;282;268;254;240;226;212;197;211;225;239;253;267;281;295;309;294;280;266;252;238;224;210;196;182;167;181;195;209;223;237;251;265;279;264;250;236;222;208;194;180;166');
INSERT INTO `mountpark_data` VALUES (10249, 164, 12, 12, 2540000, 194, 179, '194;180;166;208;222;236;251;237;223;209;195;181;196;210;224;238;252;266;281;267;253;239;225;211;212;198;184;170;226;240;254;268;282;296;310;324;338;352;367;353;339;325;311;297;283;269;255;241;227;213;199;185;200;214;228;242;256;270;284;298;312;326;340;354;368;382;397;383;369;355;341;327;313;299;314;328;342;356;370;384;398;412;427;413;399;385;371;357;343;329;344;358;372;386;400');
INSERT INTO `mountpark_data` VALUES (9349, 354, 9, 9, 1955000, 326, 340, '326;341;327;313;299;285;271;257;242;256;270;284;298;312;311;297;283;269;255;241;227;213;198;212;226;240;254;268;282;296;310;324;338;323;309;295;281;267;253;239;225;211;197;183;168;182;196;210;224;238;252;266;280;294;308;293;279;265;251;237;223;209;195;181;167;153;138;152;278;264;250;236;222;208;194;180');
INSERT INTO `mountpark_data` VALUES (9350, 125, 9, 9, 1955000, 153, 139, '153;138;168;183;198;213;228;242;227;212;197;182;167;152;166;181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355');
INSERT INTO `mountpark_data` VALUES (9346, 226, 8, 8, 1760000, 254, 240, '254;239;224;209;194;269;284;299;314;328;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;370;384;369;354;339;324;309;294;279;264;278;293;308;323;338;353;368;383');
INSERT INTO `mountpark_data` VALUES (9345, 226, 8, 8, 1760000, 254, 240, '254;239;224;209;194;269;284;299;314;328;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;370;384;369;354;339;324;338;353;368;383;398;412;397;382;367;352;366;381;396;411;426;440;425;410;395');
INSERT INTO `mountpark_data` VALUES (9725, 199, 11, 11, 2345000, 227, 213, '227;212;197;182;242;257;272;287;301;286;271;256;241;226;211;196;195;210;225;240;255;270;285;300;315;329;314;299;284;269;254;239;224;209;223;238;253;268;283;298;313;328;343;357;342;327;312;297;282;267;252;237;251;266;281;296;311;326;341;356;371;385;370;355;340;325;310;295;280;265;279;294;309;324;339;354;369;384;399;413;398;383;368;353;338;323;308');
INSERT INTO `mountpark_data` VALUES (9342, 327, 4, 4, 980000, 297, 312, '297;311;325;283;269;254;268;282;296;310;295;281;267;253;239;224;238;252;266;280;265;251;237;223;209;194;208;222;236;250;235;221;207;193');
INSERT INTO `mountpark_data` VALUES (10561, 380, 15, 15, 3125000, 352, 0, '352;337;322;367;382;368;353;338;323;308;294;309;324;339;354;340;325;310;295;280;251;236;221;206;191;266;281;296;311;326;341;356;371;386;372;357;342;327;312;297;282;267;252;237;222;207;192;177;193;208;223;238;253;268;283;298;313;328;343;358;344;329;314;299;284;269;254;239;224;209;194;179;165;180;195;210;225;240;255;270;285;300;315;330;256;241;226;211;196;181;166;151;122;107;137;152;167;182;197;212;227;242;228;213;198;183;168;154;169;184;199;214;200;185;170;155');
INSERT INTO `mountpark_data` VALUES (3673, 149, 10, 10, 2150000, 179, 164, '249;235;221;207;193;179;165;151;137;123;109;124;166;180;194;208;222;236;250;264;279;265;251;237;223;209;195;181;167;139;168;182;196;210;224;238;252;280;294;309;295;310;324;339;325;267;253;239;225;211;197;183;169;184;198;212;226;240;254;282;297;283;269;255;241;227;213;199;270;284;298;312;327;313;299;285;300;314;328;342;357;343;329;315');
INSERT INTO `mountpark_data` VALUES (3113, 235, 6, 6, 1370000, 207, 221, '177;192;207;222;237;252;267;282;297;283;298;284;270;256;242;268;253;238;223;208;193;178;163;149;164;179;194;209;224;239;254;269;255;240;225;210;195;180;165;150;135;121;136;151;166;181;196;211;182;167;152;137;122;107');
INSERT INTO `mountpark_data` VALUES (3328, 381, 10, 10, 2150000, 353, 367, '383;368;353;338;323;308;293;279;294;309;324;339;354;369;355;340;310;295;280;265;251;266;281;296;311;326;341;327;312;297;267;252;237;223;238;253;268;283;298;299;284;269;224;209;254;195;210;225;240;255;270;285;271;256;241;226;211;181;151;137;152;167;182;212;227;242;257;243;228;213;198;183;168;153;138;123;139;154;169;184;199;214;229');
INSERT INTO `mountpark_data` VALUES (3367, 368, 13, 13, 2735000, 340, 354, '220;206;192;178;164;150;136;122;137;151;165;179;193;207;221;235;250;236;222;194;208;180;166;152;167;153;139;125;181;195;209;265;251;237;223;140;154;168;182;196;210;224;238;252;280;295;281;267;253;239;225;211;197;183;169;155;170;184;198;212;226;240;254;268;282;296;310;325;311;297;283;269;255;241;227;213;199;200;214;228;242;256;270;284;312;326;340;355;341;327;313;299;285;271;257;272;286;300;314;328;342;356;370;385;357;371;315;287');
INSERT INTO `mountpark_data` VALUES (10559, 380, 13, 13, 2735000, 352, 366, '322;337;352;367;353;338;323;308;294;309;324;339;280;295;310;325;340;355;370;385;400;386;371;356;341;326;311;296;281;266;252;267;282;297;312;327;342;357;372;358;343;328;313;298;283;268;253;238;223;208;193;178;163;149;164;179;194;209;224;239;254;269;284;299;314;329;344;315;330;300;285;270;255;240;225;210;195;180;165;150;135;121;136;151;166;181;196;211;226;241;256;271;286;301;316;182;197;212;227;213;199;198;184;169;183;168');
INSERT INTO `mountpark_data` VALUES (10557, 287, 9, 9, 1955000, 257, 272, '369;354;339;325;340;355;341;326;311;297;312;327;313;298;283;269;284;299;285;270;255;240;225;210;195;180;165;179;194;208;193;207;222;236;221;235;250;264;249;271;256;241;226;211;196;181;166;151;137;152;167;182;197;212;227;242;257;243;228;213;198;183;168;153;138;123;109;124;139;154;169;184;199;214;229');
INSERT INTO `mountpark_data` VALUES (10554, 374, 15, 15, 3125000, 344, 359, '344;358;330;315;329;343;328;314;300;271;257;243;229;285;299;313;327;341;355;369;383;397;382;368;354;340;326;312;298;284;270;256;242;228;214;199;213;227;241;255;269;283;297;311;325;339;353;367;352;338;324;310;296;282;268;254;240;226;212;198;184;169;183;197;211;225;239;253;267;281;295;309;323;337;252;238;224;210;196;182;168;154;139;153;167;181;195;209;223;237;222;208;194;180;166;152;138;124;109;123;137;151;165;179;193;207;192;178;164;150;135;149;163;177;162;148;134');
INSERT INTO `mountpark_data` VALUES (10602, 365, 15, 15, 3125000, 337, 0, '337;352;322;308;323;338;324;309;294;280;295;310;311;326;341;356;296;281;266;251;236;221;206;191;177;192;207;222;237;252;267;282;297;312;327;342;328;313;298;283;268;253;238;223;208;193;178;163;149;164;179;194;209;224;239;254;269;284;299;314;300;285;270;255;240;225;210;195;180;165;150;135;121;136;151;166;181;196;211;226;241;256;271;286;272;257;242;227;212;197;182;167;152;137;122;107;93;108;123;138;153;168;183;198;213;228;243;258;184;169;154;140;155;170;156;141;126;112;127');
INSERT INTO `mountpark_data` VALUES (10601, 366, 15, 15, 3125000, 338, 352, '308;323;338;353;368;354;339;324;309;294;280;295;310;325;340;221;236;251;266;281;296;311;326;341;356;371;386;401;372;357;342;327;312;297;282;267;252;237;222;207;178;193;208;223;238;253;268;283;298;313;328;343;358;344;329;314;299;269;254;239;224;209;194;179;164;150;165;180;195;210;225;240;255;270;285;300;315;330;286;271;256;241;226;211;196;181;166;151;136;122;137;152;167;182;197;212;227;242;257;272;258;243;228;213;198;183;168;153;138;123;108;154;169;184;199;185;170;155;140');
INSERT INTO `mountpark_data` VALUES (10600, 373, 17, 17, 3515000, 343, 358, '343;357;371;329;315;301;287;272;286;300;314;328;342;356;341;327;313;299;285;271;257;228;214;200;242;256;270;284;298;312;326;340;354;368;382;367;353;339;325;311;297;283;269;255;241;227;213;199;185;170;184;198;212;226;240;254;268;282;296;310;324;338;352;366;351;337;323;309;295;281;267;253;239;225;211;197;183;169;155;140;154;168;182;196;210;224;238;252;266;280;294;308;322;336;251;237;223;209;195;181;167;153;139;125;138;152;166;180;194;208;222;236;221;207;193;179;165;151;137;122;136;150;164;178;192;206;191;177;163;149;135;121');
INSERT INTO `mountpark_data` VALUES (10599, 293, 16, 16, 3320000, 265, 279, '265;250;235;280;295;310;325;340;355;356;370;385;400;386;371;341;326;311;296;281;266;251;236;221;192;177;162;207;222;237;252;267;282;297;312;327;342;357;372;358;343;328;313;298;283;268;253;238;223;208;193;178;163;148;134;149;164;179;194;209;224;239;254;269;284;299;314;329;344;330;315;300;285;270;255;240;225;210;195;180;165;150;135;120;106;121;136;151;166;181;196;211;226;241;256;271;286;301;316;197;183;182;167;152;137;123;138;153;168;169;154;139;124;109;95;110;125;140;155;141;126;111;96');
INSERT INTO `mountpark_data` VALUES (10606, 308, 13, 13, 2735000, 280, 0, '280;265;250;235;295;310;325;340;355;341;326;311;296;281;266;251;236;221;192;207;222;237;252;267;282;297;312;327;313;298;283;268;253;238;223;208;193;178;164;179;194;209;224;239;254;269;284;299;285;270;255;240;225;210;195;180;165;150;136;151;166;181;196;211;226;241;256;271;257;242;227;212;197;182;167;152;137;122;108;123;138;153;168;183;198;213;228;243;229;214;199;184;169;154;139;124;109;110;125;140;155;170;185');
INSERT INTO `mountpark_data` VALUES (10607, 325, 7, 7, 1565000, 297, 0, '297;282;267;252;312;327;328;313;298;283;268;253;238;224;209;239;254;269;284;299;314;300;285;270;255;240;225;210;195;181;196;211;226;241;227;212;197;182;167;153;168;183;198;213;199;184;169;154;139;125;140;155;170;185;171;156;141;126');
INSERT INTO `mountpark_data` VALUES (10609, 331, 17, 17, 3515000, 301, 316, '287;301;315;329;343;357;342;328;314;300;286;272;257;271;285;299;313;327;312;340;354;368;382;298;284;270;256;242;228;214;200;185;199;213;227;241;255;269;283;297;311;325;339;353;367;352;338;324;310;296;282;268;254;240;226;212;198;184;155;169;183;197;211;225;239;253;267;281;295;309;323;337;322;308;294;280;266;252;238;224;210;196;182;168;154;140;125;139;153;167;181;195;209;223;237;251;265;279;293;307;208;194;180;166;152;138;124;110;95;109;123;137;151;165;179;193;178;164;150;136;122;108;94;80;107;121;135;149;163;148;134;120;106;92;77;91;105;119;133');
INSERT INTO `mountpark_data` VALUES (10611, 381, 14, 14, 2930000, 353, 367, '383;368;353;338;323;308;293;279;294;309;324;339;354;369;355;340;325;310;295;280;265;251;266;281;296;311;326;341;327;342;357;372;387;373;358;343;328;313;299;314;329;344;359;285;270;255;240;225;210;195;181;196;211;226;241;256;271;257;242;227;212;197;182;167;153;168;183;198;213;228;243;229;214;199;184;169;154;139;284;298;312;297;283;269;254;268;282;267;253;239;224;238;252;237;223;209;194;208;222;207;193;179;164;178;192;177;163;149;134;148;162');
INSERT INTO `mountpark_data` VALUES (10622, 323, 18, 18, 3710000, 295, 309, '295;280;265;250;310;325;340;355;370;385;371;356;341;326;311;296;281;266;251;236;222;237;252;267;282;297;312;327;342;357;372;358;343;328;313;298;283;268;253;238;223;208;194;209;224;239;254;269;284;299;314;329;344;330;315;300;285;270;255;240;225;210;195;180;165;150;135;120;106;121;136;151;166;181;196;211;226;241;256;271;286;301;316;302;287;272;257;242;227;212;197;182;167;152;137;122;107;92;93;108;123;138;153;168;183;198;213;228;243;258;273;288;274;259;244;229;214;199;184;169;154;139;124;110;125;140;155;170;185;200;215;230;245;260;96;111;126;141;156;171;186;201;216');
INSERT INTO `mountpark_data` VALUES (10630, 412, 12, 12, 2540000, 384, 0, '384;399;385;371;357;343;329;315;301;287;272;286;300;314;328;342;356;370;369;355;341;327;313;299;285;271;257;242;256;270;284;269;255;241;227;198;184;170;156;142;212;226;240;254;239;225;211;197;183;169;155;141;127;112;126;140;154;168;182;196;210;224;238;252;251;265;279;237;223;209;195;181;167;153;139;125;111;97;152;166;180;194;208;222;236;250;264;249;235;221;207;193;179;165;151');
INSERT INTO `mountpark_data` VALUES (10618, 380, 13, 13, 2735000, 352, 0, '352;367;337;323;338;353;339;324;309;280;265;250;235;220;295;310;325;340;355;370;356;341;326;311;296;281;266;251;236;221;206;192;207;222;237;252;267;282;297;312;327;342;328;313;298;283;268;253;238;223;208;193;178;164;179;194;209;224;239;254;269;284;299;314;300;285;270;255;240;225;210;195;180;165;150;136;151;166;181;196;211;226;241;256;271;286;272;257;242;227;212;197;182;167;152;137;122;108;123;138;153;183;198;213;228;243;258;94');
INSERT INTO `mountpark_data` VALUES (8750, 468, 500, 10, 0, 432, 450, '');
INSERT INTO `mountpark_data` VALUES (8851, 578, 500, 10, 0, 542, 578, '');
INSERT INTO `mountpark_data` VALUES (8749, 614, 500, 10, 0, 578, 614, '');
INSERT INTO `mountpark_data` VALUES (8748, 550, 500, 10, 0, 512, 550, '');
INSERT INTO `mountpark_data` VALUES (8751, 356, 500, 10, 0, 412, 374, '');
INSERT INTO `mountpark_data` VALUES (9450, 128, 3, 3, 785000, 216, 172, '156;171;141;126;140;154;168;182;210;225;240;255;241;227;213;199;185;155;169;183;197;211;226;212;198;184;170');
INSERT INTO `mountpark_data` VALUES (9449, 268, 2, 2, 590000, 240, 253, '225;211;197;183;169;155;170;184;198;212;226;240;255;241;227;213;199;185');
INSERT INTO `mountpark_data` VALUES (9451, 442, 2, 2, 590000, 412, 427, '380;366;352;353;367;381;395;410;396;382;368;425;411;397;383;398;412;426;440');
INSERT INTO `mountpark_data` VALUES (9455, 416, 2, 2, 590000, 388, 402, '388;403;373;358;343;329;344;359;374;389;375;360;345;330;346;361');
INSERT INTO `mountpark_data` VALUES (9453, 381, 2, 2, 590000, 409, 395, '394;408;422;436;450;451;437;423;409;424;438;452;439;454;453');
INSERT INTO `mountpark_data` VALUES (9456, 181, 8, 8, 1760000, 211, 196, '169;183;197;211;225;239;253;267;282;268;254;240;226;212;198;184;199;213;227;241;255;269;283;297;312;298;284;270;256;242;214;228;229;243;257;271;285;299;313;327;342;328;314;300;272;286;258;244;259;273;287;301;315;329;343;357;372;358;344;330;316;302;288;274');
INSERT INTO `mountpark_data` VALUES (9457, 284, 7, 7, 1565000, 314, 299, '398;384;370;342;328;314;300;286;272;258;244;259;273;287;301;315;329;343;357;371;385;399;413;428;414;400;386;372;358;344;330;316;302;288;274;289;303;317;331;345;359;373;387;401;415;429;443;458;444;430;416;402;388;374;360;346;332');
INSERT INTO `mountpark_data` VALUES (9458, 401, 2, 2, 590000, 373, 387, '373;388;343;358;374;360;345;359;344;330;301;315;329');
INSERT INTO `mountpark_data` VALUES (9459, 454, 2, 2, 590000, 424, 439, '365;380;395;410;424;438;452;437;422;407;393;379;394;409;423;408');
INSERT INTO `mountpark_data` VALUES (9462, 426, 2, 2, 590000, 398, 412, '398;383;368;353;338;324;339;354;369;384;310;325;340;355;370;385;400;386;371');
INSERT INTO `mountpark_data` VALUES (9461, 151, 10, 10, 2150000, 181, 166, '97;112;127;141;126;111;125;140;155;170;185;199;184;169;154;139;153;168;183;198;213;227;242;257;272;212;197;182;167;181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;280;295;310;325;340;355;370');
INSERT INTO `mountpark_data` VALUES (9460, 308, 2, 2, 590000, 338, 323, '310;325;340;354;339;324;338;353;368;382;367;352;366;381;396');
INSERT INTO `mountpark_data` VALUES (9463, 268, 4, 4, 980000, 296, 282, '296;281;311;326;341;356;371;386;401;415;400;385;370;355;340;325;310;295;309;324;339;354;369;384;399;414;429;443;428;413;398;383;368;353;338');
INSERT INTO `mountpark_data` VALUES (9464, 381, 7, 7, 1565000, 353, 367, '338;324;310;296;282;268;254;269;283;297;311;325;339;353;368;354;340;326;312;298;284;299;313;327;341;355;369;383;398;384;370;356;342;328;314;329;343;357;371;385;399;413;428;414;400;386;372;358;344;359;373;387;401;415;429;443');
INSERT INTO `mountpark_data` VALUES (9465, 315, 2, 2, 590000, 287, 301, '287;302;272;257;242;228;243;258;273;288;274;259;244;229');
INSERT INTO `mountpark_data` VALUES (9466, 307, 4, 4, 980000, 279, 293, '279;264;249;235;250;265;280;294;266;251;236;221;267;281;295;309;323;337;351;365;380;366;352;338;324;310;296;282;297;311;325;339;353;367;381');
INSERT INTO `mountpark_data` VALUES (8757, 604, 5, 5, 1175000, 640, 622, '691;673;655;637;619;601;583;602;620;638;656;674;692;710;729;748;767;711;693;675;657;639;621;640;658;676;694;712;730;749;731;713;695;677;659;678;696;714;732;750;768;769;751;733;715;697');
INSERT INTO `mountpark_data` VALUES (8758, 181, 3, 3, 785000, 143, 162, '103;85;49;67;31;32;51;69;87;68;50;86;122;104;141;160;179;161;142;124;105;107;125;106');
INSERT INTO `mountpark_data` VALUES (8759, 655, 4, 4, 980000, 617, 636, '595;614;633;652;671;653;634;615;596;577;559;578;597;616;635;617;598;579;560;541;523;542;561;580;581;562;543;524;505;487;506;525;544;563;599');
INSERT INTO `mountpark_data` VALUES (9268, 598, 8, 8, 1760000, 562, 580, '562;581;543;524;505;486;467;448;430;449;468;487;506;525;544;563;545;526;507;488;469;450;431;412;394;413;432;451;470;489;508;527;509;490;471;434;433;414;395;376;358;377;396;415;453;472;491;473;454;435;416;397;378;359;340;322;341;360;379;398;417;436;455;437;418;399;380;361;342;323');
INSERT INTO `mountpark_data` VALUES (9270, 252, 5, 5, 1175000, 216, 234, '32;140;122;104;86;68;50;69;87;105;123;141;159;178;160;142;124;106;88;107;143;161;179;197;216;198;180;162;144;126;145;163;181;199;235;254;236;218;200;182;164;183;201;219;237;255;273;217');
INSERT INTO `mountpark_data` VALUES (9273, 271, 7, 7, 1565000, 235, 253, '159;178;197;216;235;254;273;292;311;293;275;256;236;217;198;179;160;141;123;142;161;180;199;218;237;257;238;219;200;181;162;143;124;125;144;163;182;201;220;239;221;202;183;164;145;126;107;106;105;184;165;146;127;108;90;109;128;147');
INSERT INTO `mountpark_data` VALUES (9274, 655, 4, 4, 980000, 617, 636, '487;506;525;544;563;581;562;543;524;505;523;542;561;580;599;617;598;579;560;541;559;578;597;616;635;653;634;615;596;577;595;614;633;652;671');
INSERT INTO `mountpark_data` VALUES (9278, 753, 4, 4, 980000, 717, 735, '717;698;679;660;736;755;774;756;737;718;699;680;661;642;624;643;662;681;700;719;738;720;701;682;663;644;625;606;588;607;626;645;664;683;702;665;646;627;608;589');
INSERT INTO `mountpark_data` VALUES (9277, 361, 8, 8, 1760000, 325, 343, '325;344;363;306;287;268;249;230;211;193;212;231;250;269;288;307;326;345;327;308;289;270;251;232;213;194;175;157;176;195;214;233;252;271;290;309;291;272;253;234;215;196;177;158;139;140;159;178;197;216;235;254;273;255;236;217;198;179;160;141;142;123;161;180;199;218');
INSERT INTO `mountpark_data` VALUES (4250, 635, 3, 3, 785000, 673, 654, '637;656;675;694;713;732;750;731;712;693;674;655;673;692;711;730;749;768;767;748;729;710;691;709;728;747;746;727;745;764');
INSERT INTO `mountpark_data` VALUES (4246, 180, 2, 2, 590000, 164, 172, '201;182;144;106;88;70;52;34;53;54;72');
INSERT INTO `mountpark_data` VALUES (4245, 587, 4, 4, 980000, 625, 606, '679;661;643;625;607;608;626;644;662;680;698;717;699;681;663;645;627;646;664;682;700;718;736;755;737;719;701;683;665;702;720;756;774');
INSERT INTO `mountpark_data` VALUES (4242, 727, 3, 3, 785000, 689, 708, '276;558;576;596;595;594;612;614;634;633;632;631;667;669;652;653;671;689;707;725;743;724;706;705');
INSERT INTO `mountpark_data` VALUES (4207, 636, 3, 3, 785000, 672, 654, '615;634;633;651;653;672;671;670;669;688;706;724;743;762;725;689;690;691;710;728;709;708;744;726;745;764');
INSERT INTO `mountpark_data` VALUES (4206, 579, 4, 4, 980000, 615, 597, '558;577;576;594;595;596;615;614;613;630;631;632;633;634;653;652;651;650;649;648;667;668;669;670;671;691;690;689;688;687;705;686;724;706;708;709;727;726;763');
INSERT INTO `mountpark_data` VALUES (4079, 418, 3, 3, 785000, 382, 400, '382;401;420;363;344;325;307;326;345;364;383;402;384;365;346;327;308;289;271;290;309;328;347');
INSERT INTO `mountpark_data` VALUES (4211, 253, 5, 5, 1175000, 215, 234, '215;233;251;269;287;197;179;161;142;160;178;196;214;232;250;268;249;231;213;195;177;159;141;123;122;140;158;176;194;212;230;175;157;139;121;103;85;66;84;102;120;101;83;65;46');
INSERT INTO `mountpark_data` VALUES (4210, 603, 3, 3, 785000, 639, 621, '601;620;619;637;638;639;658;657;656;655;673;674;675;676;677;695;694;693;692;691;710;711;712;713;731;730;729;748;767;749');
INSERT INTO `mountpark_data` VALUES (4209, 651, 2, 2, 590000, 687, 669, '649;667;685;722;704;686;668;687;705;723;741;759;760;742;724;706;725;743;761');
INSERT INTO `mountpark_data` VALUES (4252, 542, 4, 4, 980000, 578, 560, '521;540;559;578;597;616;635;539;558;577;596;615;634;653;671;652;633;595;576;557;575;594;613;632;651;670;689;707;688;669;650;631;612;593;630;649;668;687;725');
INSERT INTO `mountpark_data` VALUES (4225, 485, 4, 4, 980000, 521, 503, '483;502;521;540;559;577;558;539;520;501;482;500;519;538;557;576;595;613;594;575;556;537;574;593;612;631;649;630;611;648;667;685');
INSERT INTO `mountpark_data` VALUES (4309, 541, 20, 20, 4100000, 505, 0, '505;524;543;562;581;486;467;448;429;410;391;373;392;411;430;449;468;487;506;525;544;563;545;526;507;488;469;450;431;412;393;374;355;337;356;375;394;413;432;451;470;489;508;527;509;490;471;452;433;414;395;376;357;338;319;301;320;339;358;377;396;415;434;453;472;491;473;454;435;416;397;378;359;340;321;302;283;265;284;303;322;341;360;379;398;417;436;455;437;418;399;380;361;342;323;304;285;266;247;229;248;267;286;305;324;343;362;381;400;419;401;382;363;344;325;306;287;268;249;230;211;193;212;231;250;269;288;307;326;345;364;383;365;346;327;308;289;270;251;232;213;194;175;157;176;195;214;233;252;271;290;309;328');
INSERT INTO `mountpark_data` VALUES (4258, 400, 3, 3, 785000, 364, 382, '364;383;402;345;326;307;289;308;327;346;365;384;366;347;328;309;290;271;253;272;291;310;329;348;235');
INSERT INTO `mountpark_data` VALUES (4260, 576, 3, 3, 785000, 614, 595, '614;633;652;671;690;708;689;670;651;632;650;669;688;707;726;744;725;706;687;668;686;705;762;743;704');
INSERT INTO `mountpark_data` VALUES (4248, 393, 4, 4, 980000, 429, 411, '429;410;391;372;353;448;467;486;504;485;466;447;428;409;390;371;389;408;427;446;465;484;503;522;540;521;502;483;464;445;426;463;482;501;520;539;558');
INSERT INTO `mountpark_data` VALUES (4342, 458, 4, 4, 980000, 494, 476, '490;509;528;547;566;585;604;623;642;624;605;586;567;548;529;510;491;472;454;473;492;511;530;549;568;587;606;588;569;550;531;512;493;475;494;513;532;551');
INSERT INTO `mountpark_data` VALUES (4241, 595, 3, 3, 785000, 631, 613, '631;649;667;685;722;704;686;668;650;669;687;705;723;741;759;760;742;724;706;688;707;725;743;761;762;744');
INSERT INTO `mountpark_data` VALUES (4240, 326, 12, 12, 2540000, 288, 307, '288;324;306;270;252;234;216;197;179;215;233;251;269;287;305;286;268;250;232;214;196;178;160;141;159;177;195;213;231;249;267;248;230;212;194;176;158;140;122;103;121;139;157;175;193;211;229;210;192;174;156;138;120;84;65;101;119;137;155;173;191;172;154;136;81;100;82;64;46;27;45;63;99;135;153;134;79;98;80;62;44;26;25;43;61;97;115;96;78;60;42;24;23;59');
INSERT INTO `mountpark_data` VALUES (4238, 255, 4, 4, 980000, 187, 206, '22;41;60;79;97;78;59;40;21;39;58;77;96;115;133;114;95;76;57;75;94;113;132;151;169;150;131;112;93;130;149;168');
INSERT INTO `mountpark_data` VALUES (4233, 523, 4, 4, 980000, 485, 504, '485;467;449;431;413;395;377;358;376;394;412;430;448;466;447;429;393;375;411;357;339;320;338;356;374;355;337;301;282;300;281;263');
INSERT INTO `mountpark_data` VALUES (4243, 559, 6, 6, 1370000, 597, 578, '765;747;729;711;693;675;657;639;620;638;656;674;692;710;728;746;727;709;691;673;655;637;619;601;582;600;618;636;654;672;690;708;689;671;653;635;617;599;581;563;544;562;580;598;616;670;651;633;615;597;579;561;543');
INSERT INTO `mountpark_data` VALUES (4273, 247, 6, 6, 1370000, 209, 228, '263;245;208;190;172;154;155;136;207;244;225;189;171;153;135;117;98;116;134;152;170;188;206;187;169;151;133;115;97;79;60;78;96;114;132;150;168;149;131;113;95;77;59;41;22;40;58;76;94;75;21;39;38');
INSERT INTO `mountpark_data` VALUES (4269, 560, 5, 5, 1175000, 596, 578, '539;558;577;596;615;634;653;671;652;633;614;595;576;557;575;594;613;632;651;670;689;707;688;669;650;631;612;593;611;630;649;668;687;706;725;743;724;705;686;667;648;685;704;723;742;761;760;741');
INSERT INTO `mountpark_data` VALUES (4264, 617, 3, 3, 785000, 653, 635, '761;743;724;705;723;687;706;725;744;763;745;726;707;688;669;651;670;689;708;727;709;690;671;652;633;615;634;653;672');
INSERT INTO `mountpark_data` VALUES (4278, 427, 4, 4, 980000, 391, 409, '244;263;282;301;320;339;357;338;319;300;281;262;280;299;318;337;356;375;393;374;355;336;317;298;316;335;354;373;410;411;429');
INSERT INTO `mountpark_data` VALUES (4272, 397, 3, 3, 785000, 361, 379, '304;323;342;361;380;399;418;400;381;362;343;324;305;286;268;287;306;325;382;364;327;308;289;270;251;250;232');
INSERT INTO `mountpark_data` VALUES (4271, 116, 4, 4, 980000, 152, 134, '209;190;152;133;114;132;150;151;170;189;208;227;245;226;207;188;169;168;187;206;225;244;263;281;262;243;224;205;186;167;149;204;223;242;261;280;299;93;57');
INSERT INTO `mountpark_data` VALUES (4265, 620, 6, 6, 1370000, 584, 602, '470;452;434;380;416;489;471;453;435;417;399;641;622;603;584;565;546;527;508;490;509;528;547;566;585;604;623;605;586;567;548;529;510;491;472;454;473;492;511;530;549;531;550;569;551;532;513;494;475;456;437;418');
INSERT INTO `mountpark_data` VALUES (4262, 587, 4, 4, 980000, 625, 606, '571;589;607;625;643;661;679;698;680;662;644;626;608;590;609;627;645;663;681;699;717;736;718;700;682;664;646;628;665;701;683;719;737;755;774;756;738;720;702;775');
INSERT INTO `mountpark_data` VALUES (4261, 325, 4, 4, 980000, 287, 306, '137;155;174;192;210;191;209;227;156;175;173;193;194;213;212;211;246;247;248;249;250;232;251;265;266;267;268;269;287;286;285;284;303;304;305;323;322;341');
INSERT INTO `mountpark_data` VALUES (4217, 669, 3, 3, 785000, 633, 651, '448;467;485;486;504;503;502;520;521;522;541;540;539;538;557;558;559;560;579;577;576;595;596;597;615;614;633');
INSERT INTO `mountpark_data` VALUES (4219, 431, 3, 3, 785000, 467, 449, '429;448;447;465;466;467;486;485;484;483;501;520;521;522;523;524;542;541;540;558;577;578;596;503;504');
INSERT INTO `mountpark_data` VALUES (4218, 448, 4, 4, 980000, 486, 467, '432;451;450;468;469;470;489;488;487;486;504;505;506;507;508;526;525;524;523;522;540;541;542;543;544;562;561;560;559;578;579;580;598;597;616');
INSERT INTO `mountpark_data` VALUES (4213, 597, 4, 4, 980000, 633, 615, '595;613;631;649;667;704;686;668;650;632;614;633;651;669;687;705;723;741;742;724;706;688;670;652;671;689;707;725;743;761;762;744;726;708;690');
INSERT INTO `mountpark_data` VALUES (4216, 302, 3, 3, 785000, 264, 283, '169;151;152;134;116;135;136;155;154;153;170;207;189;171;173;192;210;191;172;190;208;226;245;264;246;228;209;227;137');
INSERT INTO `mountpark_data` VALUES (4215, 155, 4, 4, 980000, 117, 136, '21;39;57;76;58;40;22;23;41;59;77;95;114;96;24;25;43;80;98;116;134;133;170;152;62;44;63;81;99;117;135;153;171');
INSERT INTO `mountpark_data` VALUES (4270, 714, 5, 5, 1175000, 678, 696, '550;568;586;604;622;640;659;641;623;605;587;569;588;606;624;642;660;678;697;679;661;643;625;607;626;644;662;680;698;716;735;717;645;663;681;700;718;736;737;756;774;757;739;720;702;683;664;682');
INSERT INTO `mountpark_data` VALUES (4096, 652, 5, 5, 1175000, 614, 633, '560;541;522;503;484;465;446;464;483;502;521;540;559;578;596;577;558;539;520;501;482;500;519;538;557;576;595;614;632;613;594;575;556;537;593;612;631;650;668;649;630');
INSERT INTO `mountpark_data` VALUES (4104, 162, 2, 2, 590000, 126, 144, '88;107;126;145;164;146;127;108;89;70;52;71;90;109;128;110;91;53;34');
INSERT INTO `mountpark_data` VALUES (4284, 283, 3, 3, 785000, 321, 302, '285;303;321;339;357;376;358;340;322;304;323;341;359;377;395;414;396;378;360;342;361;379;397;415');
INSERT INTO `mountpark_data` VALUES (4291, 532, 4, 4, 980000, 494, 513, '440;458;476;494;512;530;511;493;475;457;439;421;402;420;438;456;474;492;473;455;437;419;401;383;364;382;400;418;436;435;454;416;397;378;396;415;434;398;379;360');
INSERT INTO `mountpark_data` VALUES (4275, 451, 4, 4, 980000, 415, 433, '306;325;344;363;382;401;419;400;381;362;343;324;342;361;380;399;418;437;455;436;417;398;379;360;378;397;416;435;454;472;453;434;415');
INSERT INTO `mountpark_data` VALUES (4280, 196, 5, 5, 1175000, 158, 177, '212;193;174;155;136;117;98;79;60;41;22;42;61;80;99;118;137;156;175;194;176;157;138;119;100;81;62;43;24;25;44;63;82;101;120;139;158;140;121;102;83;64;45;26;27;46;65;84;103');
INSERT INTO `mountpark_data` VALUES (4249, 528, 3, 3, 785000, 492, 510, '437;455;473;492;474;475;493;511;530;512;494;476;458;477;495;513;531;549;568;550;532;514;496;515;533;551;569');
INSERT INTO `mountpark_data` VALUES (4287, 257, 4, 4, 980000, 219, 238, '219;200;181;162;143;124;106;125;144;163;182;201;183;164;145;126;107;88;70;89;108;127;146;165;147;128;109;90;71;52;34;53;72;91;110');
INSERT INTO `mountpark_data` VALUES (4282, 172, 4, 4, 980000, 136, 154, '193;174;155;136;117;98;79;61;80;99;118;137;156;175;157;138;119;100;81;62;43;24;25;44;63;82;101;120;139;121;102;83;64;45');
INSERT INTO `mountpark_data` VALUES (4169, 490, 3, 3, 785000, 528, 509, '492;510;528;546;564;582;601;583;565;547;529;511;530;548;566;584;602;620;639;621;603;585;567;549;568;586;604;622;640');
INSERT INTO `mountpark_data` VALUES (4172, 615, 3, 3, 785000, 651, 633, '613;632;651;670;689;707;688;669;650;631;649;668;687;706;725;743;724;705;686;667;685;704;723;742;761;760;741;722;759');
INSERT INTO `mountpark_data` VALUES (4300, 193, 3, 3, 785000, 155, 174, '24;42;41;77;76;114;59;60;79;61;43;62;80;134;152;171;209;191;137;119;100;118;136;81;173;154');
INSERT INTO `mountpark_data` VALUES (4289, 506, 4, 4, 980000, 544, 525, '580;562;544;526;508;527;545;563;581;599;618;600;582;564;546;565;583;601;619;637;656;620;602;584;603;621;639;657;675;694;676;658;640;622');
INSERT INTO `mountpark_data` VALUES (4181, 678, 2, 2, 590000, 716, 697, '716;680;698;734;752;771;753;735;717;699;718;736;754;772;773;755;737;756;774');
INSERT INTO `mountpark_data` VALUES (4178, 541, 5, 5, 1175000, 577, 559, '539;558;577;596;615;634;653;671;652;633;614;595;576;557;575;594;613;632;651;670;689;707;688;669;650;631;612;593;611;630;649;668;687;706;725;743;724;705;667;704;723;741;759');
INSERT INTO `mountpark_data` VALUES (4212, 232, 3, 3, 785000, 194, 213, '248;230;212;194;176;158;140;121;139;157;175;193;211;229;210;192;174;156;138;120;119;137;155;173;191;172;154;136');
INSERT INTO `mountpark_data` VALUES (4170, 467, 3, 3, 785000, 431, 449, '339;357;375;393;412;394;376;358;377;395;413;431;450;432;414;396;415;433;451;469;488;470;452;434;453;471;489;507');
INSERT INTO `mountpark_data` VALUES (4204, 455, 4, 4, 980000, 491, 473, '548;529;510;491;472;453;434;452;471;490;509;528;547;566;584;565;546;527;508;489;470;488;507;526;545;564;583;602;620;601;582;563;544;525');
INSERT INTO `mountpark_data` VALUES (4182, 308, 4, 4, 980000, 272, 290, '234;253;272;291;310;329;311;292;273;254;235;216;198;217;236;255;274;293;275;256;237;218;199;180;162;181;200;219;238;257;239;202;220;183;201;182;163');
INSERT INTO `mountpark_data` VALUES (4208, 208, 5, 5, 1175000, 170, 189, '224;206;188;170;152;134;116;97;115;133;151;169;187;205;186;168;150;132;114;96;78;59;77;95;113;131;149;130;112;94;76;58;40;21;39;57;75;93;56;38;20');
INSERT INTO `mountpark_data` VALUES (4299, 472, 3, 3, 785000, 434, 453, '434;452;470;488;506;524;505;487;469;451;433;415;396;414;432;450;468;486;467;449;431;413;395');
INSERT INTO `mountpark_data` VALUES (4304, 414, 4, 4, 980000, 378, 396, '378;397;416;435;454;473;492;474;455;436;417;398;379;360;342;361;380;399;418;437;456;438;419;400;381;362;343;306;325;344;363;382;401;420');
INSERT INTO `mountpark_data` VALUES (4301, 620, 3, 3, 785000, 656, 638, '656;674;692;710;728;746;727;709;691;673;655;637;618;636;654;672;690;708;726;707;689;671;670;652;633;615;634;597;616');
INSERT INTO `mountpark_data` VALUES (4290, 325, 4, 4, 980000, 287, 306, '323;305;287;269;304;286;268;250;232;213;249;285;266;248;230;212;194;175;193;211;229;247;228;210;192;174;156;137;155;173;191;209;190;172;154;136;118');
INSERT INTO `mountpark_data` VALUES (4336, 437, 2, 2, 590000, 401, 419, '401;382;363;325;307;326;345;364;383;365;346;327;308;271;290;309;328;347');
INSERT INTO `mountpark_data` VALUES (2216, 675, 6, 6, 1370000, 637, 656, '565;583;601;619;637;655;673;691;672;654;636;618;600;582;564;546;527;545;563;581;599;617;635;653;634;616;598;580;562;544;526;508;489;507;525;543;561;579;597;615;596;578;560;542;524;506;488;470;451;469;487;505;523;541;559');
INSERT INTO `mountpark_data` VALUES (2215, 567, 9, 9, 1955000, 529, 548, '565;547;511;493;474;492;510;528;546;527;509;491;473;455;418;400;382;436;454;472;490;508;526;544;562;543;525;507;489;471;435;417;399;381;363;344;362;380;398;379;361;343;325;306;324;342;360;378;396;414;432;450;468;486;505;487;469;451;433;470;488;506;524;413;395;377;359;341;322;340;358;376;394;375;357');
INSERT INTO `mountpark_data` VALUES (2209, 674, 2, 2, 590000, 636, 655, '636;618;600;582;564;546;528;509;490;508;526;544;562;580;598;617;599;581;563;545');
INSERT INTO `mountpark_data` VALUES (2210, 472, 4, 4, 980000, 436, 454, '474;455;436;417;398;379;360;341;323;342;361;380;399;418;437;456;438;419;400;381;362;343;324;305;287;306;325;344;363;382;401;420;402;383;364;345;326;307;288');
INSERT INTO `mountpark_data` VALUES (4303, 679, 4, 4, 980000, 643, 661, '567;586;605;624;643;662;681;700;719;701;682;663;644;625;606;587;568;549;531;550;569;588;607;626;645;664;683;665;646;627;608;589;570;551;532');
INSERT INTO `mountpark_data` VALUES (4305, 438, 2, 2, 590000, 402, 420, '383;364;345;327;346;365;384;366;347;328;309;291;310;329;348;330;311;292;273');
INSERT INTO `mountpark_data` VALUES (4077, 403, 4, 4, 980000, 365, 384, '293;274;255;273;292;311;329;347;365;383;401;382;364;346;328;310;291;309;327;345;363;344;326;308;290;272;253;271;289;307;325;306;288;270;252');
INSERT INTO `mountpark_data` VALUES (4082, 414, 3, 3, 785000, 378, 396, '340;322;304;286;268;250;269;287;305;323;341;359;378;360;342;324;306;288;307;325;343;361;379;397;416;398;380;362;344');
INSERT INTO `mountpark_data` VALUES (4302, 617, 4, 4, 980000, 579, 598, '615;596;577;558;539;520;501;482;464;483;502;521;540;559;578;597;579;560;541;522;503;484;465;446;428;447;466;485;504;523;542;543;561;524;505;486;467;448;429');
INSERT INTO `mountpark_data` VALUES (4072, 287, 3, 3, 785000, 251, 269, '213;195;177;196;214;232;251;233;215;216;198;217;236;254;235;272;253;234;252;271;290;308;289');
INSERT INTO `mountpark_data` VALUES (4090, 697, 4, 4, 980000, 661, 679, '661;643;625;607;589;571;590;608;626;644;662;680;699;681;663;645;627;609;628;646;664;682;700;718;737;719;701;683;665;702;720;738;756;775;757;739');
INSERT INTO `mountpark_data` VALUES (4097, 707, 5, 5, 1175000, 671, 689, '595;614;633;652;671;690;709;728;747;729;710;691;672;653;634;615;596;577;559;578;597;616;654;673;692;711;693;674;655;636;617;598;579;560;541;523;542;561;580;599;618;637;656');
INSERT INTO `mountpark_data` VALUES (4180, 621, 5, 5, 1175000, 659, 640, '605;623;641;659;677;695;713;732;714;696;678;660;642;624;643;661;679;697;715;733;751;770;752;734;716;698;680;662;681;699;717;735;753;771;772;754;736;718;700;719;737;755;773;774;756;738;757;776');
INSERT INTO `mountpark_data` VALUES (4094, 529, 4, 4, 980000, 491, 510, '545;526;507;488;469;451;470;489;508;527;509;490;471;452;433;396;377;415;434;453;472;491;473;454;435;416;397;378;359;341;360;379;398;417;436');
INSERT INTO `mountpark_data` VALUES (4236, 578, 4, 4, 980000, 614, 596, '557;576;595;614;633;652;671;689;670;651;632;613;594;575;593;612;631;650;669;688;707;725;706;687;668;649;630;611;648;667;686;705;724;743;761;742');
INSERT INTO `mountpark_data` VALUES (4177, 556, 5, 5, 1175000, 594, 575, '558;577;596;615;634;653;672;690;671;652;633;614;595;576;594;613;632;651;670;689;708;726;707;688;669;650;631;612;630;649;668;687;706;725;724;705;686;667;648;685;704;723;742;760;741;722');
INSERT INTO `mountpark_data` VALUES (4232, 717, 5, 5, 1175000, 679, 698, '733;715;697;679;643;661;625;606;624;642;660;678;696;714;695;677;659;641;623;605;587;568;586;604;622;640;658;676;657;639;621;603;585;567;549;530;548;584;602;620;638');
INSERT INTO `mountpark_data` VALUES (4173, 660, 3, 3, 785000, 698, 679, '662;680;698;716;734;753;735;717;699;681;700;718;736;754;772;773;755;737;719;738;756;774;775;757');
INSERT INTO `mountpark_data` VALUES (8479, 267, 3, 3, 785000, 231, 249, '269;251;233;215;197;178;196;214;232;250;231;213;195;177;159;140;158;176;194;212;193;175;157;138;156;174;155;137;119');
INSERT INTO `mountpark_data` VALUES (8480, 342, 3, 3, 785000, 306, 324, '268;250;232;214;196;178;197;215;233;251;269;287;306;288;270;252;234;271;289;307;325;344;326;308');
INSERT INTO `mountpark_data` VALUES (4231, 708, 3, 3, 785000, 670, 689, '616;634;652;670;688;706;724;742;760;759;741;723;705;687;669;651;633;615;597;578;559;577;595;613;631;649');
INSERT INTO `mountpark_data` VALUES (4229, 543, 4, 4, 980000, 507, 525, '545;527;509;491;473;455;436;454;472;490;508;526;507;489;471;453;435;417;398;416;434;452;470;488;469;451;433;415;397;379;414');
INSERT INTO `mountpark_data` VALUES (4093, 730, 4, 4, 980000, 692, 711, '746;728;710;692;656;674;638;620;601;619;637;655;673;691;709;727;708;690;672;654;636;618;600;582;563;581;599;635;653;671;689');
INSERT INTO `mountpark_data` VALUES (4070, 468, 5, 5, 1175000, 432, 450, '508;490;472;454;436;418;399;417;435;453;471;489;470;452;434;433;451;432;414;396;378;360;342;361;380;398;379;397;395;413;377;359;341;323;304;322;340;358;376;394;375;321;339;303;285;266;284;302;320;338');
INSERT INTO `mountpark_data` VALUES (2220, 373, 4, 4, 980000, 337, 355, '337;318;299;280;261;243;262;281;300;319;301;282;263;244;225;207;226;245;264;283;265;246;227;208;189;171;190;209;228;247;229;210;191;172;153;135;154;173;192');
INSERT INTO `mountpark_data` VALUES (2218, 410, 5, 5, 1175000, 374, 392, '374;355;336;356;337;318;300;319;338;320;301;282;264;283;302;284;265;246;227;209;228;247;266;190;208;226;244;262;280;298;261;243;225;207;189;171;152;170;188;206;224;242');
INSERT INTO `mountpark_data` VALUES (9216, 210, 5, 5, 1175000, 180, 194, '208;193;178;163;148;133;103;88;74;89;104;119;134;149;179;194;180;165;150;135;120;105;90;75;60;32;46;61;76;91;106;121;136;151;166;137;123;138;124;109;110;95;81;96;82;67;66;80;51;65');
INSERT INTO `mountpark_data` VALUES (9204, 369, 8, 8, 1760000, 341, 355, '371;356;341;326;311;296;281;266;251;237;252;267;282;297;312;327;342;357;343;328;313;298;269;284;299;314;329;315;300;285;270;255;301;286;271;256;241;226;211;196;181;195;210;224;209;223;238;287;272;257;242;227;212;197;182;167;153;168;183;198;213;228;243;258');
INSERT INTO `mountpark_data` VALUES (9158, 585, 16, 16, 3320000, 547, 566, '637;619;601;583;565;547;529;511;493;475;456;474;492;510;528;546;564;582;600;618;599;491;509;527;545;563;581;473;455;437;418;436;454;472;490;508;526;525;543;561;580;562;544;507;489;471;453;435;417;399;381;363;345;327;309;290;308;326;344;362;380;398;416;434;452;470;488;506;524;542;523;505;487;469;451;433;415;397;379;361;343;325;307;289;271;252;270;288;306;324;342;360;378;396;414;432;450;468;486;504;485;467;449;431;413;395;377;359;341;323;305;287;269;251;233;358;376;394;412;393;375;357;339;320;338;356;374;355;337;319');
INSERT INTO `mountpark_data` VALUES (9156, 605, 15, 15, 3125000, 567, 586, '603;585;567;549;531;513;495;477;459;440;458;476;494;512;530;548;566;584;565;547;529;511;493;475;457;439;421;402;420;438;456;474;492;510;528;546;527;509;491;473;455;437;419;401;383;346;328;310;364;382;400;418;436;454;472;490;508;489;471;453;435;417;399;381;363;345;327;309;291;272;290;308;326;344;362;380;398;416;434;452;470;451;433;415;397;379;361;343;325;307;289;271;253;432;414;396;378;360;342;324;306;288;270;252;234;215;233;251;269;287;305;323;341;359;377;395');
INSERT INTO `mountpark_data` VALUES (9157, 523, 8, 8, 1760000, 487, 505, '392;393;412;431;450;469;488;507;544;526;374;356;413;432;451;470;489;508;490;471;452;433;414;395;377;396;415;434;453;472;454;435;416;397;378;359;341;360;379;398;417;436;322;303;284;266;285;304;323;342;361;380;399;418;343;306;305;286;267;248;230;249;268;287;325;307;288;269;250;231');
INSERT INTO `mountpark_data` VALUES (9159, 676, 17, 17, 3515000, 640, 658, '640;622;604;586;568;550;531;549;567;585;603;621;602;584;566;529;530;512;475;457;439;421;403;493;511;547;565;583;564;546;528;510;492;474;456;438;420;419;437;455;473;491;509;527;545;526;508;490;472;454;436;418;400;363;345;381;399;417;435;453;471;489;507;506;524;542;561;523;505;487;469;451;433;415;397;379;361;343;325;307;289;270;288;306;324;342;360;378;396;414;432;450;468;486;504;485;467;449;431;413;395;377;359;341;323;305;287;269;251;232;250;268;286;304;322;340;358;376;394;412;430;448;466;447;429;411;393;375;357;339;321;303;285;267;249;231');
INSERT INTO `mountpark_data` VALUES (9162, 558, 0, 0, 200000, 522, 540, '503;484;465;447;541;560;579;598;617;636;655;674;656;637;618;599;580;561;542;523;504;485;466;429;448;467;486;505;524;543;562;581;600;619;638;620;601;582;563;544;525;506;487;468;449;430;411;412;431;450;469;488;507;526;545;564;583;602;565;546;527;508;489;470;451;414;432;377;433;452;471;490;509;528;547;566;548;529;510;491;472;453;434;415;396;359;378;397;416;435;454;473;492;511;530;512;493;474;455;436;417;398;379;360;341;322;304;285;323;342;361;380;399;400;381;362;343;324;305;286;267;249;268;287;306;325;344;363;382;401;419;402;421;440;458;476;494;383;364;345;326;231;250;269;288;503;484;465;447;541;560;579;598;617;636;655;674;656;637;618;599;580;561;542;523;504;485;466;429;448;467;486;505;524;543;562;581;600;619;638;620;601;582;563;544;525;506;487;468;449;430;411;412;431;450;469;488;507;526;545;564;583;602;565;546;527;508;489;470;451;414;432;377;433;452;471;490;509;528;547;566;548;529;510;491;472;453;434;415;396;359;378;397;416;435;454;473;492;511;530;512;493;474;455;436;417;398;379;360;341;322;304;285;323;342;361;380;399;400;381;362;343;324;305;286;267;249;268;287;306;325;344;363;382;401;419;402;421;440;458;476;494;383;364;345;326;231;250;269;288');
INSERT INTO `mountpark_data` VALUES (9209, 220, 5, 5, 1175000, 192, 206, '222;208;179;150;151;152;166;137;138;123;108;93;78;63;48;33;47;61;75;89;103;117;132;133;148;163;192;177;149;135;121;107;122;164;134;119;105;91;77;62;76;90;104;118');
INSERT INTO `mountpark_data` VALUES (9218, 226, 8, 8, 1760000, 196, 211, '196;210;224;182;168;154;140;126;112;97;111;125;139;153;167;181;195;209;180;165;150;135;120;119;134;149;164;179;105;90;75;60;59;45;166;151;136;121;106;91;76;62;77;92;107;122;137;152;138;123;108;93;78;63;49;64;79;94;109;124;110;95;80;81;66;96');
INSERT INTO `mountpark_data` VALUES (9163, 599, 16, 16, 3320000, 563, 581, '639;602;601;582;563;544;525;506;507;526;545;564;583;621;603;584;565;546;527;508;489;452;451;450;468;449;430;411;392;374;393;412;431;432;413;394;375;356;338;357;376;395;414;433;471;490;509;528;547;566;585;567;548;529;510;491;472;453;434;415;396;377;358;339;320;302;321;340;359;378;397;416;435;454;455;474;493;512;549;530;511;492;531;436;417;398;379;360;341;322;303;284;266;285;304;323;342;361;494;513;475;456;437;418;399;362;343;324;305;286;268;287;306;438;439;476;495;457;419;401;420;458');
INSERT INTO `mountpark_data` VALUES (9160, 375, 7, 7, 1565000, 339, 357, '136;155;174;193;212;231;250;269;288;307;325;306;287;268;249;230;211;192;173;154;172;191;210;229;248;343;361;342;323;304;285;266;247;228;209;190;208;227;246;264;245;226;263;282;301;320;321;303;322;341;360;379;397;378;359;339;358;377;396');
INSERT INTO `mountpark_data` VALUES (9164, 691, 15, 15, 3125000, 655, 673, '269;288;307;326;345;364;363;344;325;306;287;305;324;343;380;417;418;419;420;421;440;459;477;458;439;495;476;457;438;494;475;456;437;361;342;323;341;359;436;455;474;493;512;549;530;511;492;473;454;435;453;472;491;510;529;548;567;585;566;547;528;509;490;471;470;451;432;413;489;526;527;565;584;603;621;602;583;601;620;639;657;675;656;674;655;637;619;600;618;636;617;599;581;563;544;562;580;598;507;525;543;561;488;506;524;542;469;487;505;523;450;468;486;504;431;449;467;485');
INSERT INTO `mountpark_data` VALUES (9207, 313, 7, 7, 1565000, 283, 298, '93;107;121;135;149;163;177;192;178;164;150;136;122;108;123;137;151;165;179;193;207;222;208;237;223;252;238;267;253;239;225;211;197;183;198;212;226;240;254;268;282;297;283;269;255;241;227;213;168;153;138;152;167;182;166;180');
INSERT INTO `mountpark_data` VALUES (9219, 161, 9, 9, 1955000, 133, 147, '141;126;111;96;81;155;140;125;110;95;80;65;50;169;154;139;124;109;94;79;64;49;183;168;153;138;123;108;93;78;63;48;197;182;167;152;137;107;92;77;62;91;106;121;136;151;166;181;196;211;225;210;195;180;165;150;135;120;105;134;149;164;179;194;209;224;239;253;238;223;208;193;178;163;148;133;118;103;104;89');
INSERT INTO `mountpark_data` VALUES (9220, 205, 6, 6, 1370000, 177, 191, '102;117;132;147;162;177;178;207;222;237;223;208;193;163;148;133;118;103;88;74;89;104;119;134;149;164;179;194;165;150;135;120;105;90;75;60;61;76;91;106;121;136;151;166;181;167;152;137;122;107;92;78;62;47;46');
INSERT INTO `mountpark_data` VALUES (9208, 429, 7, 7, 1565000, 401, 415, '326;341;356;371;386;401;416;431;446;461;447;433;419;405;376;390;404;418;432;417;403;389;375;361;346;360;374;388;402;387;373;359;345;331;316;330;344;358;372;357;343;329;315;301;286;300;314;328;342;327;313;299;285;271;256;270;284;298;312');
INSERT INTO `mountpark_data` VALUES (9165, 433, 9, 9, 1955000, 397, 415, '302;321;340;359;378;397;416;435;454;436;417;379;360;341;322;303;284;265;247;266;285;304;323;342;361;380;399;418;400;381;362;343;324;305;286;267;248;229;211;230;249;268;287;306;325;344;363;382;364;345;326;307;288;269;250;231;212;193;175;194;213;232;251;270;289;308;327;346;328;309;290;271;252;233;214;195;176');
INSERT INTO `mountpark_data` VALUES (9152, 503, 13, 13, 2735000, 467, 485, '429;448;467;486;505;524;543;562;581;600;582;563;544;525;506;487;468;449;411;412;450;469;488;507;526;545;564;546;527;508;489;470;451;432;413;394;357;376;395;433;452;471;509;528;510;491;472;453;434;415;396;377;358;339;321;340;378;397;416;435;454;473;492;474;455;436;417;398;379;360;341;322;303;285;304;323;342;361;380;399;418;437;456;438;419;400;381;362;343;324;305;286;249;268;287;306;325;344;363;382;401;420');
INSERT INTO `mountpark_data` VALUES (9166, 560, 13, 13, 2735000, 524, 542, '600;581;562;543;524;505;486;467;449;468;487;506;525;544;563;582;564;545;526;507;488;469;450;432;451;470;489;508;527;546;528;509;490;471;452;433;414;395;510;491;472;453;434;415;396;377;358;339;320;301;283;302;321;378;416;435;454;473;492;474;455;436;417;398;379;360;284;265;247;266;267;286;305;342;361;380;399;418;437;456;438;419;400;381;362;343;324;248;229;420;401;382;363;344;325;306;287;326;307;288;269;308;289;270');
INSERT INTO `mountpark_data` VALUES (9222, 222, 8, 8, 1760000, 194, 208, '89;104;119;134;149;164;179;194;209;224;210;195;180;165;150;135;120;105;90;75;61;76;91;106;121;136;151;166;181;196;182;167;152;122;107;92;78;93;108;94;95;124;138;153;168;154;139;79;64;65;80;110;125;140;126;111;96;81;66;52;67;82;97;112;98;83;68;53;84;69');
INSERT INTO `mountpark_data` VALUES (9210, 226, 6, 6, 1370000, 198, 212, '115;100;85;70;55;144;129;114;99;84;69;54;39;53;68;83;98;113;128;143;158;172;157;142;127;112;97;82;67;81;96;111;126;155;156;171;186;200;170;140;125;110;95;199;214;184;169;154;124;109;228;213;198;183;168');
INSERT INTO `mountpark_data` VALUES (9167, 449, 15, 15, 3125000, 413, 431, '280;299;318;337;356;375;394;413;432;451;470;489;508;490;471;452;433;414;395;376;357;338;319;300;281;262;244;263;282;301;320;339;358;377;396;415;434;453;472;454;435;416;397;378;359;340;321;302;283;264;245;226;208;227;246;303;322;341;360;379;398;417;436;418;399;380;361;342;323;304;247;228;209;190;172;191;210;229;286;305;324;343;362;381;400;382;363;344;287;268;211;192;174;193;231;250;269;270;307;326;345;364;346;327;308;289;251;232;175;156;138;157;176;214;233;252;271;290;309');
INSERT INTO `mountpark_data` VALUES (9153, 603, 12, 12, 2540000, 567, 585, '216;235;254;273;292;311;329;310;291;272;253;234;252;271;290;309;328;347;365;346;327;308;289;270;288;307;326;345;364;383;402;421;440;459;478;496;477;458;439;420;401;382;363;344;325;306;324;343;362;381;400;419;438;457;476;495;514;551;570;589;532;513;494;475;456;437;418;399;380;342;588;607;569;550;531;512;493;474;455;398;625;606;587;568;549;530;511;473;510;529;548;567;586;605;624;643');
INSERT INTO `mountpark_data` VALUES (9168, 468, 14, 14, 2930000, 432, 450, '356;338;320;302;284;266;248;230;212;194;213;231;249;267;285;303;321;339;357;375;394;376;358;340;322;304;286;268;250;232;251;269;287;305;323;341;359;377;395;413;432;414;396;378;360;342;324;306;288;270;289;307;325;451;433;415;397;379;308;326;470;452;434;416;398;417;435;453;471;489;418;400;382;364;327;345;363;346;436;454;472;490;508;527;509;491;473;455;437;419;401;383;365;384;402;420;438;456;474;492;510;546;565;547;529;511;493;475;457;439;421');
INSERT INTO `mountpark_data` VALUES (9211, 429, 6, 6, 1370000, 401, 415, '341;327;313;299;285;271;257;272;286;300;314;328;342;356;371;357;343;329;315;301;287;302;316;330;344;358;372;386;401;387;373;359;345;331;317;332;346;360;374;388;402;416;431;417;403;389;375;361;347;376;390;404;418;432');
INSERT INTO `mountpark_data` VALUES (9223, 197, 5, 5, 1175000, 169, 183, '199;185;171;157;143;129;115;100;114;128;142;156;170;184;169;155;141;127;113;99;85;70;84;98;112;126;140;154;139;125;111;97;83;69;55;82;67;96;110;124;109;95;94;79;65;51;66');
INSERT INTO `mountpark_data` VALUES (9169, 414, 12, 12, 2540000, 378, 396, '530;511;493;475;457;439;421;422;440;494;512;403;384;402;420;438;401;383;365;346;364;382;400;399;417;435;381;363;345;327;308;326;344;362;380;398;416;397;379;361;343;325;307;289;271;253;235;217;198;216;234;252;270;288;306;324;342;360;378;359;341;323;305;287;269;251;233;215;197;179;160;178;196;214;232;250;268;286;304;322;340;285;267;249;231;213;194;175;193;211;212;230;248;266;284;265');
INSERT INTO `mountpark_data` VALUES (9213, 206, 5, 5, 1175000, 178, 192, '193;179;165;151;122;108;109;94;136;150;164;178;163;149;135;121;107;93;79;64;78;92;106;120;119;148;105;91;77;63;49;34;48;62;76;90;104;118;103;89;75');
INSERT INTO `mountpark_data` VALUES (9225, 219, 5, 5, 1175000, 191, 205, '221;207;193;179;165;151;137;123;108;122;136;150;164;178;177;206;191;163;149;135;121;107;93;78;92;106;120;134;148;162;176;147;118;89;103;133;119;105;91;90;75;104;63;77');
INSERT INTO `mountpark_data` VALUES (8773, 270, 4, 4, 980000, 242, 256, '272;258;229;230;216;202;187;201;200;214;228;243;257;242;186;172;157;171;185;199;213;227;212;198;184;170;156;142;113;127;141;155;169;183;182;168;154;140;126;112');
INSERT INTO `mountpark_data` VALUES (8778, 263, 5, 5, 1175000, 235, 249, '265;251;237;223;209;195;181;166;180;194;208;222;236;250;235;221;207;165;151;136;150;164;178;192;206;220;205;191;177;163;149;135;120;134;148;162;176;190;161;147;133;119;105;91');
INSERT INTO `mountpark_data` VALUES (8783, 326, 8, 8, 1760000, 298, 312, '343;329;315;301;287;272;286;300;314;328;313;299;285;271;257;228;242;256;270;284;298;283;269;255;241;199;213;184;198;212;226;240;254;268;253;169;183;197;211;225;196;182;168;154;139;153;167;181;195;209;223;208;194;124;138;152;166;193;179;165;151;137;123');
INSERT INTO `mountpark_data` VALUES (8788, 384, 6, 6, 1370000, 356, 370, '401;387;373;359;345;331;317;303;288;302;316;330;344;358;372;386;371;357;343;329;315;301;287;300;314;328;342;356;341;327;313;299;285;256;242;270;284;298;312;326;311;297;283;269;255;241;227;213;199;184;226;240;254;268;282');
INSERT INTO `mountpark_data` VALUES (8793, 370, 6, 6, 1370000, 299, 314, '327;313;299;285;271;257;228;229;214;242;256;270;284;298;312;297;283;269;255;241;213;184;198;197;211;225;239;253;282;268;254;240;226;183;169;267;252;238;224;210;196;182;168;154;139;153;167;181;195;209;223');
INSERT INTO `mountpark_data` VALUES (8798, 323, 7, 7, 1565000, 295, 309, '340;326;312;298;284;270;256;242;228;214;199;213;227;241;255;269;283;297;311;325;310;296;282;268;254;240;226;212;198;184;169;183;197;211;225;239;253;267;281;295;280;266;252;238;224;210;196;182;168;154;139;153;167;181;166;152;138');
INSERT INTO `mountpark_data` VALUES (8803, 160, 4, 4, 980000, 132, 146, '192;178;164;150;136;107;121;135;177;163;162;148;119;105;91;92;106;120;77;133;147;132;118;89;90;76;62;47;61;75;103;117;102;88;74;60;46');
INSERT INTO `mountpark_data` VALUES (8804, 125, 6, 6, 1370000, 153, 139, '108;122;136;150;164;179;165;151;137;123;138;152;166;180;194;209;195;181;167;153;168;182;196;210;224;239;225;211;197;183;198;212;226;240;254;269;255;241;227;213;228;284;299;285;271;257;243;258;272;286;300');
INSERT INTO `mountpark_data` VALUES (8799, 383, 5, 5, 1175000, 355, 369, '400;385;370;355;340;325;310;295;281;296;311;326;341;356;371;386;372;357;342;327;312;297;282;267;253;268;283;298;313;328;314;299;284;269;254;239;224;210;225;240;255;270;285;300;286;271;256;241;226;211');
INSERT INTO `mountpark_data` VALUES (8794, 398, 4, 4, 980000, 370, 384, '370;356;342;328;299;284;269;255;241;256;270;285;300;314;315;329;343;357;371;385;400;386;372;358;344;330;345;360;375;390;404;389;374;359;373;388;403;418');
INSERT INTO `mountpark_data` VALUES (8789, 180, 10, 10, 2150000, 208, 194, '283;268;253;238;223;208;193;178;163;148;133;132;103;117;147;162;177;192;207;222;237;252;267;282;297;311;296;281;266;251;236;221;206;191;176;161;146;131;160;175;190;205;220;235;250;265;280;295;310;325;339;324;309;294;279;264;249;234;219;204;189;218;233;248;263;278;293;308;323;338;353;352;337;322;307;292;277;306;321;336;351');
INSERT INTO `mountpark_data` VALUES (8779, 157, 5, 5, 1175000, 127, 142, '183;168;153;169;154;139;124;109;94;79;65;51;37;23;24;39;54;69;84;99;113;127;141;155;140;125;110;95;80;66;81;96;111;126;112;97;82;67;52;38;53;68;83;98');
INSERT INTO `mountpark_data` VALUES (8774, 298, 3, 3, 785000, 326, 312, '296;310;324;338;352;366;381;367;353;339;325;311;326;340;354;368;382;396;411;397;383;369;355;341;356;370;384;398;412');
INSERT INTO `mountpark_data` VALUES (8770, 236, 5, 5, 1175000, 208, 222, '238;223;208;193;178;163;148;119;134;149;164;179;194;209;224;210;195;180;165;150;135;120;105;91;106;121;136;151;166;181;196;182;167;152;137;122;107;92;78;93;108;123;138;153');
INSERT INTO `mountpark_data` VALUES (8780, 341, 4, 4, 980000, 313, 327, '358;343;328;313;283;268;254;240;226;241;227;242;256;271;257;272;286;301;287;302;316;330;344;329;315;300;314;299;285;284;298');
INSERT INTO `mountpark_data` VALUES (8805, 314, 6, 6, 1370000, 284, 299, '228;242;256;270;284;298;312;326;297;283;269;255;212;241;254;268;282;296;281;267;253;239;225;211;197;168;196;210;224;238;252;266;251;237;223;209;167;181;153;138;152;166;180;194;208;222;236;221;207;193;179;165;151;137;123');
INSERT INTO `mountpark_data` VALUES (8806, 324, 6, 6, 1370000, 296, 310, '266;281;296;311;326;341;327;313;299;285;271;257;243;229;214;228;242;241;255;269;283;297;298;284;270;312;213;227;199;282;268;254;240;226;212;198;184;169;183;197;211;225;239;253;267;252;238;224;210;196;182;168');
INSERT INTO `mountpark_data` VALUES (8832, 295, 9, 9, 1955000, 267, 281, '357;342;327;312;297;282;252;237;222;208;194;180;166;152;138;139;125;153;167;181;195;209;223;238;224;210;196;182;168;154;140;155;169;198;212;226;240;254;268;253;239;225;211;197;183;170;184;283;269;255;241;227;213;199;185;200;214;228;242;256;270;284;298;313;299;285;271;286;300;314;328;343;329;301;315');
INSERT INTO `mountpark_data` VALUES (8791, 295, 4, 4, 980000, 267, 280, '297;282;252;237;222;208;223;238;253;268;283;269;254;239;224;209;194;180;195;210;225;240;255;241;226;211;196;181;166;152;167;182;197;212;227');
INSERT INTO `mountpark_data` VALUES (8786, 294, 4, 4, 980000, 266, 280, '296;281;251;237;252;267;282;268;253;238;223;209;224;239;254;240;225;210;195;181;196;211;226;212;197;182;167;153;168;183;198;184;169;154;139');
INSERT INTO `mountpark_data` VALUES (8781, 314, 4, 4, 980000, 284, 299, '281;267;253;239;225;211;197;183;198;212;226;240;254;268;282;296;311;297;283;269;255;241;227;213;228;242;256;270;284;298;312');
INSERT INTO `mountpark_data` VALUES (8776, 196, 4, 4, 980000, 224, 210, '352;337;322;307;292;278;293;323;338;324;309;280;279;250;265;295;310;281;266;251;236;222;237;252;267;282;268;253;238;223;208;194;209;224;239');
INSERT INTO `mountpark_data` VALUES (8813, 298, 4, 4, 980000, 270, 284, '255;270;285;300;315;330;345;331;316;301;286;271;256;241;227;242;257;272;287;302;303;288;273;258;243;228;213;199;214;229;215;200');
INSERT INTO `mountpark_data` VALUES (8817, 315, 3, 3, 785000, 285, 300, '271;285;299;313;298;284;270;256;241;255;269;254;240;226;211;225;239;196;210;224;238;223;209;195;181;166;180;194');
INSERT INTO `mountpark_data` VALUES (8821, 278, 4, 4, 980000, 250, 264, '235;250;265;280;295;310;296;281;266;251;236;221;207;222;237;252;267;282;268;253;238;223;208;194;209;224;239;254;240;225;210;195');
INSERT INTO `mountpark_data` VALUES (8825, 326, 3, 3, 785000, 298, 312, '200;215;230;244;229;214;228;243;258;272;257;242;256;271;286;315;330;300;285;270;284;299;314;329;344;358;343;328;313');
INSERT INTO `mountpark_data` VALUES (8829, 298, 3, 3, 785000, 268, 283, '208;222;237;223;209;195;181;167;182;196;210;224;238;252;267;253;239;225;211;197;212;226;240;254;268');
INSERT INTO `mountpark_data` VALUES (8833, 283, 2, 2, 590000, 253, 268, '166;180;194;208;222;251;237;181;196;210;224;238;252;266;281;267;253;239;225');
INSERT INTO `mountpark_data` VALUES (8837, 215, 4, 4, 980000, 185, 200, '209;195;224;210;196;182;168;154;155;141;112;98;83;97;111;113;169;183;197;211;225;239;254;240;226;212;198;184;170;156;142;143;157;171;185;199;213;227;241;255');
INSERT INTO `mountpark_data` VALUES (8838, 313, 5, 5, 1175000, 283, 298, '167;153;139;125;111;126;140;154;168;182;196;210;224;253;267;239;225;211;197;183;169;155;141;156;170;198;212;226;240;254;268;282;297;283;269;255;241;227;213;199;185');
INSERT INTO `mountpark_data` VALUES (8834, 146, 3, 3, 785000, 90, 118, '146;89;104;119;134;148;133;118;46;61;76;91;106;121;135;120;105;90;75;60;88');
INSERT INTO `mountpark_data` VALUES (8830, 366, 6, 6, 1370000, 338, 352, '211;226;241;255;240;225;224;209;239;254;269;284;299;313;298;283;268;253;238;223;237;252;267;282;297;312;327;341;326;311;296;281;266;251;265;280;295;310;325;340;355;369;354;339;324;309;294;279;293;308;323;338;353;368');
INSERT INTO `mountpark_data` VALUES (8826, 295, 8, 8, 1760000, 267, 281, '192;178;207;193;179;165;151;137;152;166;180;194;208;222;237;223;209;195;181;167;182;196;210;224;238;252;267;253;239;225;211;197;212;226;240;254;268;282;297;283;269;255;241;227;242;256;270;284;298;312;327;313;299;285;271;257;272;286;300;314;328');
INSERT INTO `mountpark_data` VALUES (8822, 190, 4, 4, 980000, 162, 176, '31;45;59;73;102;88;74;60;46;61;75;89;103;117;132;118;104;90;76;91;105;119;133;147;162;148;134;120;106;121;135;149;163');
INSERT INTO `mountpark_data` VALUES (8818, 299, 6, 6, 1370000, 269, 284, '278;293;308;323;338;353;339;324;309;280;279;264;250;265;295;310;325;311;282;281;251;236;222;237;267;297;283;268;253;254;225;210;209;223;208;194;269;255;240;195;180;166;181;196;211;226;241;227;212;197;182;167');
INSERT INTO `mountpark_data` VALUES (8814, 396, 5, 5, 1175000, 368, 382, '194;208;222;209;223;251;265;279;293;308;294;280;266;252;238;224;239;253;267;281;295;309;323;338;324;296;282;268;254;269;283;297;311;325;339;353;368;354;340;326;312;298;284;299;313;327;341;355;369');
INSERT INTO `mountpark_data` VALUES (4590, 622, 4, 4, 980000, 586, 604, '404;422;441;440;459;478;458;477;496;515;476;495;514;533;552;494;513;532;551;570;589;512;531;550;569;588;607;530;549;568;587;606;625;548;567;586;605;624');
INSERT INTO `mountpark_data` VALUES (4586, 511, 4, 4, 980000, 475, 493, '405;386;423;404;385;366;347;328;346;365;384;403;422;364;383;402;439;440;459;477;458;420;401;382;400;419;438;457;476;495;513;494;475;456;437');
INSERT INTO `mountpark_data` VALUES (4605, 395, 4, 4, 980000, 359, 377, '321;340;359;378;397;379;360;341;322;303;285;304;323;342;361;343;324;305;286;267;249;268;287;306;325;307;288;269;250;231;213;232;251;270;289');
INSERT INTO `mountpark_data` VALUES (4600, 494, 4, 4, 980000, 456, 475, '327;345;363;381;399;417;435;453;472;454;436;418;400;382;364;346;365;383;401;419;437;455;473;491;510;492;474;456;438;420;402');
INSERT INTO `mountpark_data` VALUES (4596, 674, 1, 1, 395000, 620, 647, '582;564;546;547;585;623;661');
INSERT INTO `mountpark_data` VALUES (4606, 454, 3, 3, 785000, 416, 435, '380;379;360;341;322;285;304;323;342;303;321;339;357;376;358;340;359;377;395;414;396;378;397;416;434;452;433;415');
INSERT INTO `mountpark_data` VALUES (4584, 561, 1, 1, 395000, 434, 498, '487;469;414;396;378');
INSERT INTO `mountpark_data` VALUES (4595, 190, 4, 4, 980000, 226, 208, '169;188;207;226;245;264;282;263;244;225;206;187;205;224;243;262;281;300;318;299;280;261;242;223;241;260;279;298;317;336;354;335;316;297');
INSERT INTO `mountpark_data` VALUES (4624, 181, 3, 3, 785000, 145, 163, '183;164;145;126;107;88;70;89;108;127;146;165;147;128;109;90;71;52;34;53;72;91;110;73;54;35;36');
INSERT INTO `mountpark_data` VALUES (4625, 694, 1, 1, 395000, 640, 667, '602;584;566;620');
INSERT INTO `mountpark_data` VALUES (4627, 177, 5, 5, 1175000, 141, 159, '122;104;86;87;69;32;105;123;141;51;33;160;142;124;106;88;70;52;34;179;161;143;125;107;89;71;53;35;198;180;162;144;126;108;90;72;54;217;199;181;163;145;127;109');
INSERT INTO `mountpark_data` VALUES (4626, 697, 4, 4, 980000, 661, 679, '552;589;588;606;624;642;661;643;571;590;608;645;663;681;680;699;627;609;628;646;664;682;700;718;737;719;701;683;665;702;720;738;756;775;757;739');
INSERT INTO `mountpark_data` VALUES (8753, 226, 4, 4, 980000, 188, 207, '224;205;186;167;149;130;168;187;206;188;169;150;131;112;93;75;113;151;170;152;133;114;77;95;76;20;57;39;58;97;116;134;59');
INSERT INTO `mountpark_data` VALUES (8754, 598, 3, 3, 785000, 634, 616, '577;596;615;634;653;672;690;671;652;633;614;595;613;632;651;670;689;708;726;707;688;669;650;631;649;668;687;706;725;744');
INSERT INTO `mountpark_data` VALUES (8755, 560, 4, 4, 980000, 615, 597, '612;631;650;669;688;707;726;745;594;613;632;651;670;689;708;727;576;595;614;633;652;671;690;709;691;672;653;634;615;596;577');
INSERT INTO `mountpark_data` VALUES (8756, 606, 4, 4, 980000, 644, 625, '590;608;626;644;662;680;698;717;699;681;663;645;627;609;628;646;664;682;700;718;736;755;737;719;701;683;665;702;720;738;756;774;775;757');
INSERT INTO `mountpark_data` VALUES (4591, 525, 3, 3, 785000, 487, 506, '451;469;487;505;523;541;522;504;486;468;450;432;413;431;449;467;485;503;484;466;448;430;412;394;375;411;429;447;465');
INSERT INTO `mountpark_data` VALUES (4593, 225, 5, 5, 1175000, 189, 207, '208;190;172;154;136;118;99;117;135;153;171;189;170;152;134;116;98;80;61;79;97;115;133;151;132;114;96;78;60;42;23;41;59;77;95;113;76;58;40;22;21');
INSERT INTO `mountpark_data` VALUES (4628, 675, 3, 3, 785000, 639, 657, '529;548;567;586;605;624;642;623;604;585;566;584;603;622;641;660;678;659;640;621;602;583;601;620;639;658;677;696');
INSERT INTO `mountpark_data` VALUES (4620, 263, 3, 3, 785000, 225, 244, '243;225;207;189;171;153;134;152;170;188;206;224;205;186;187;169;151;133;115;96;114');
INSERT INTO `mountpark_data` VALUES (4616, 618, 3, 3, 785000, 654, 636, '692;673;654;635;616;634;653;672;691;710;728;709;690;671;652;670;689;708;727;746;764;745;726;707;688;706;725;744');
INSERT INTO `mountpark_data` VALUES (4622, 712, 5, 5, 1175000, 674, 693, '638;656;674;692;710;691;673;655;637;619;600;618;636;654;672;690;671;653;635;617;599;581;562;580;598;616;634;652;633;615;597;579;561;543;524;542;560;578;596;577;559;541;523;505');
INSERT INTO `mountpark_data` VALUES (4621, 378, 5, 5, 1175000, 342, 360, '285;304;323;342;361;380;399;381;362;343;324;305;286;267;248;230;249;268;287;306;325;344;363;345;326;307;288;269;250;231;212;194;213;232;251;270;289;308;327;309;290;271;252;233;214;195');
INSERT INTO `mountpark_data` VALUES (4614, 355, 4, 4, 980000, 317, 336, '353;335;317;281;299;263;244;262;280;298;316;334;315;297;279;243;261;225;206;224;242;260;278;241;223;205;187;168;186;204;167;149;130');
INSERT INTO `mountpark_data` VALUES (4615, 204, 4, 4, 980000, 168, 186, '187;168;149;130;93;112;131;150;169;151;132;113;94;75;56;19;38;57;76;95;114;133;115;96;77;58;39;20;21;40;59;78;97;22;41;60;79;42');
INSERT INTO `mountpark_data` VALUES (4592, 542, 3, 3, 785000, 506, 524, '506;487;525;544;563;545;526;507;488;469;451;470;489;508;527;509;490;471;452;433;491');
INSERT INTO `mountpark_data` VALUES (4589, 269, 8, 8, 1760000, 233, 251, '271;252;233;214;195;177;196;215;234;253;235;216;197;178;159;141;160;179;198;217;199;180;161;142;123;105;124;143;162;181;163;144;125;106;87;69;88;107;126;145;164;183;202;221;184;165;146;127;90;71;52;51;70;89;108;33;109;110;147;128;91;72;53;73');
INSERT INTO `mountpark_data` VALUES (4583, 752, 5, 5, 1175000, 716, 734, '659;641;678;697;716;735;754;773;774;755;736;717;698;679;660;642;661;680;699;718;737;756;775;776;757;738;719;700;681;662;643;624;605;587;606;625;644;663;682;701;720');
INSERT INTO `mountpark_data` VALUES (4598, 598, 4, 4, 980000, 634, 616, '577;596;615;634;653;672;690;671;652;633;614;595;613;632;651;670;689;708;726;707;688;669;650;631;649;668;687;706;725;744;762;705;724;686;667;704;723;722');
INSERT INTO `mountpark_data` VALUES (5139, 641, 4, 4, 980000, 679, 660, '607;625;643;661;679;697;716;698;680;662;644;626;645;663;681;699;717;735;754;736;718;700;682;664;683;719;737;755;773;774;756;738;720;702;739;757;775;776');
INSERT INTO `mountpark_data` VALUES (5136, 563, 4, 4, 980000, 527, 545, '565;546;527;508;490;509;528;547;529;510;491;472;453;416;397;435;454;473;492;511;493;474;455;436;417;398;379;361;380;399;418;437;456');
INSERT INTO `mountpark_data` VALUES (4930, 421, 3, 3, 785000, 385, 403, '385;366;404;423;405;386;367;348;330;349;368;387;369;350;331;312;294;313;332;295;276');
INSERT INTO `mountpark_data` VALUES (4607, 578, 4, 4, 980000, 614, 596, '671;652;633;614;595;576;557;575;594;613;632;651;670;689;707;688;669;650;631;612;593;611;630;649;668;687;706;725;743;724;705;686;667;648;685;704;723;742;760;741');
INSERT INTO `mountpark_data` VALUES (4582, 359, 4, 4, 980000, 395, 377, '357;376;395;414;433;452;470;432;413;394;375;393;412;431;450;469;488;506;487;468;449;430;411;429;448;467;486;505;524;542;523;504;485;466;447;465;484;503;522;541');
INSERT INTO `mountpark_data` VALUES (4599, 376, 5, 5, 1175000, 340, 358, '378;359;340;321;302;283;265;284;303;322;341;360;342;323;304;285;266;247;229;248;267;286;305;324;306;287;268;249;230;211;193;212;231;250;269;288;270;251;232;213;194');
INSERT INTO `mountpark_data` VALUES (4601, 363, 1, 1, 395000, 292, 328, '270;252;234;216');
INSERT INTO `mountpark_data` VALUES (4629, 599, 3, 3, 785000, 635, 617, '673;691;709;727;745;763;744;726;708;690;672;654;635;653;671;652;634;616;597;615;633;614;596;578;559');
INSERT INTO `mountpark_data` VALUES (4644, 583, 5, 5, 1175000, 619, 601, '505;524;543;562;581;600;619;638;657;675;656;637;618;599;580;561;542;523;541;560;579;598;617;636;655;674;693;711;692;673;654;635;616;597;578;559;577;596;615;634;653;672;691;710;729;595;614;633');
INSERT INTO `mountpark_data` VALUES (4646, 578, 4, 4, 980000, 614, 596, '671;652;633;614;595;576;557;575;594;613;632;651;670;689;707;688;669;650;631;612;593;611;630;649;668;687;706;725;743;724;705;686;667;648;723;704;685;742');
INSERT INTO `mountpark_data` VALUES (4603, 580, 3, 3, 785000, 542, 561, '578;560;542;524;506;488;469;487;505;523;541;559;540;522;504;486;468;450;431;449;467;485;503;521;502;484;466;448;430');
INSERT INTO `mountpark_data` VALUES (4597, 452, 5, 5, 1175000, 414, 433, '391;337;319;265;284;302;320;338;356;374;392;410;429;411;393;375;357;321;339;303;322;340;358;376;394;412;430;448;467;449;431;413;395;377;359;341;360;378;396;414;432;450;468;486');
INSERT INTO `mountpark_data` VALUES (4609, 245, 3, 3, 785000, 209, 227, '228;209;190;171;153;172;191;210;192;173;154;135;117;136;155;174;156;137;118;99;81;100;119');
INSERT INTO `mountpark_data` VALUES (4931, 618, 8, 8, 1760000, 582, 600, '620;601;582;563;525;506;487;469;488;526;545;564;583;602;584;565;546;508;489;470;451;433;452;471;490;509;528;547;566;548;529;510;491;472;453;434;415;397;416;435;454;473;492;511;530;512;493;474;455;436;417;398;379;361;380;399;418;437;456;475;494');
INSERT INTO `mountpark_data` VALUES (5127, 617, 4, 4, 980000, 579, 598, '597;579;561;543;525;507;488;506;524;542;560;578;559;541;523;505;487;469;450;468;486;504;522;540;521;503;485;467;449;431;412;430;448;466;484');
INSERT INTO `mountpark_data` VALUES (5133, 578, 3, 3, 785000, 540, 559, '612;594;576;558;540;522;504;503;521;539;557;575;593;574;556;538;520;502;483;501;519;537');
INSERT INTO `mountpark_data` VALUES (5150, 152, 4, 4, 980000, 116, 134, '173;154;135;116;97;78;59;40;21;22;41;60;79;98;117;136;155;137;118;99;80;61;42;23;24;43;62;81;100;119;101;82;63;44;25;26;64');
INSERT INTO `mountpark_data` VALUES (5278, 322, 4, 4, 980000, 358, 340, '320;339;358;377;396;414;395;376;357;338;356;375;394;413;432;450;468;449;430;411;374;393;412;431;392;410;429;448;467;486;504;485;466;447');
INSERT INTO `mountpark_data` VALUES (5334, 251, 8, 8, 1760000, 215, 233, '291;272;253;234;215;196;177;159;178;197;216;235;254;273;255;236;217;198;179;160;141;123;142;180;199;218;237;219;200;181;162;125;106;105;124;87;144;163;182;201;220;239;257;238;183;165;146;127;108;89;70;51;52;33;71;90;109;128;147;110;91;72;53;34;35;54');
INSERT INTO `mountpark_data` VALUES (4932, 637, 2, 2, 590000, 601, 619, '639;621;603;585;566;584;602;620;601;583;565;547;528;546;564;582;545;527;509');
INSERT INTO `mountpark_data` VALUES (4562, 524, 5, 5, 1175000, 560, 542, '598;579;560;541;522;503;521;540;559;578;597;616;634;615;596;577;558;539;557;576;595;614;633;652;670;651;632;613;594;575;593;612;631;650;669;688;706;687;668;649;630;611;648;667;686;705');
INSERT INTO `mountpark_data` VALUES (4549, 418, 5, 5, 1175000, 380, 399, '321;303;285;267;249;213;232;250;268;286;304;322;340;359;341;323;305;287;269;251;270;288;306;324;342;360;378;397;379;361;343;325;307;289;308;326;344;362;380;398;416');
INSERT INTO `mountpark_data` VALUES (4649, 154, 4, 4, 980000, 116, 135, '170;152;134;116;98;80;61;79;97;115;133;151;132;114;96;78;60;42;23;41;59;77;95;113;94;76;58;40;22;21;39;57;75;56;38;20');
INSERT INTO `mountpark_data` VALUES (4647, 731, 7, 7, 1565000, 695, 713, '676;695;714;733;752;771;772;753;734;715;696;677;658;640;659;678;716;735;754;773;774;755;736;717;698;679;660;641;622;604;623;642;661;680;699;718;737;756;775;757;776;738;719;700;681;662;643;624;605;586;568;587;606;625;644;663;682;701;720');
INSERT INTO `mountpark_data` VALUES (4631, 579, 4, 4, 980000, 543, 561, '581;562;543;524;505;486;467;449;468;487;506;525;544;563;545;526;507;488;469;450;432;451;470;489;508;527;509;490;471;452;433;414');
INSERT INTO `mountpark_data` VALUES (4630, 523, 5, 5, 1175000, 485, 504, '413;431;449;467;485;503;521;539;520;502;484;466;448;430;412;394;375;393;411;429;447;465;483;501;482;464;446;428;410;392;374;356;337;355;373;391;409;427;445;463;354;336');
INSERT INTO `mountpark_data` VALUES (4633, 544, 5, 5, 1175000, 580, 562, '542;561;580;599;618;637;655;636;617;598;579;560;578;597;616;635;654;673;691;672;653;634;615;596;614;633;652;671;690;709;727;708;689;670;651;632;650;669;688;707;726;745;763;744;725;706;687');
INSERT INTO `mountpark_data` VALUES (4640, 616, 4, 4, 980000, 652, 634, '595;614;633;652;671;690;708;689;670;651;632;613;631;650;669;688;707;726;744;725;706;687;668;649;667;686;705;724;743;762;761;742;723;704;685;722;741;760');
INSERT INTO `mountpark_data` VALUES (4666, 231, 5, 5, 1175000, 193, 212, '139;157;175;193;211;229;247;228;210;192;174;156;138;120;101;119;137;155;173;191;209;190;172;154;136;118;100;82;63;81;99;117;135;153;171;152;116;80;62;44;61;42;60;41');
INSERT INTO `mountpark_data` VALUES (4588, 620, 5, 5, 1175000, 656, 638, '675;693;711;729;747;765;764;746;728;710;692;674;656;637;655;673;691;709;727;745;763;762;744;726;708;690;672;654;636;618;599;617;635;653;671;689;707;725;743;761;760;742;724;706;688;670;652;634;616;598');
INSERT INTO `mountpark_data` VALUES (4934, 709, 3, 3, 785000, 673, 691, '692;673;655;674;693;636;618;600;582;564;546;527;545;563;565;583;601;619;637;656;638;620;602;584;603;621;639;657;675;711');
INSERT INTO `mountpark_data` VALUES (5333, 488, 3, 3, 785000, 452, 470, '509;490;471;452;433;414;396;415;434;453;472;491;473;454;435;416;397;378;360;379;398;417;436;455;437;418;399;380;361');
INSERT INTO `mountpark_data` VALUES (4617, 303, 3, 3, 785000, 339, 321, '320;339;358;377;396;414;395;376;357;338;356;375;394;413;432;450;431;412;393;374;392;411;430;449;468;486;467;448;429');
INSERT INTO `mountpark_data` VALUES (4618, 434, 4, 4, 980000, 470, 452, '413;432;451;470;489;508;527;545;526;507;488;469;450;431;449;468;487;506;525;544;563;581;562;543;524;505;486;467;485;504;523;542;561;580');
INSERT INTO `mountpark_data` VALUES (5280, 619, 12, 12, 2540000, 583, 601, '678;659;640;621;602;583;564;545;526;508;527;546;565;584;603;622;641;660;642;623;604;585;566;547;528;509;490;472;491;510;529;624;605;586;567;492;473;454;435;416;398;417;436;455;474;493;494;531;550;569;588;587;568;549;570;551;532;513;475;456;437;418;399;380;362;381;400;419;438;457;476;495;496;515;552;533;477;458;439;420;401;382;534;364;383;402;421;440;459;478;497;516;498;479;460;441;422;403;384;365');
INSERT INTO `mountpark_data` VALUES (5279, 734, 4, 4, 980000, 698, 716, '755;736;717;698;679;661;680;699;718;737;756;775;757;776;738;719;700;681;662;625;624;643;606;644;663;682;701;720;739;702;683;664;645;626;607');
INSERT INTO `mountpark_data` VALUES (5112, 152, 3, 3, 785000, 114, 133, '150;132;114;96;78;59;77;95;113;131;112;94;76;58;40;21;39;57;75;93;56;38;20');
INSERT INTO `mountpark_data` VALUES (5111, 266, 4, 4, 980000, 228, 247, '210;228;246;264;282;300;263;245;227;209;191;172;190;208;226;244;262;243;225;207;189;171;153;134;152;170;188;206;151;133;115');
INSERT INTO `mountpark_data` VALUES (5108, 433, 5, 5, 1175000, 471, 452, '453;471;489;507;525;544;526;508;490;472;491;509;527;545;563;581;599;617;636;618;600;582;564;546;528;510;529;547;565;583;601;619;637;655;674;656;638;620;602;584;566');
INSERT INTO `mountpark_data` VALUES (4941, 396, 5, 5, 1175000, 360, 378, '398;379;360;341;322;303;285;304;323;342;361;380;362;343;324;305;286;267;268;306;325;344;326;307;288;269;250;231;213;232;251;270;289;308;290;271;252;233;214;195;177;196;215;234;253');
INSERT INTO `mountpark_data` VALUES (4937, 579, 4, 4, 980000, 615, 597, '596;614;632;650;668;686;704;722;759;741;723;705;687;669;651;633;615;634;652;670;688;706;724;742;760;761;743;725;707;689;671;653;690;708;726;744');
INSERT INTO `mountpark_data` VALUES (4639, 245, 5, 5, 1175000, 207, 226, '153;171;189;207;225;243;261;260;242;224;206;188;170;152;134;115;133;151;169;187;205;223;241;278;186;204;168;150;132;114;96;77;95;113;131;149;167;130;112;94;76;58;39;57;75;93;56;38;20');
INSERT INTO `mountpark_data` VALUES (4637, 542, 7, 7, 1565000, 578, 560, '521;540;559;578;597;616;653;634;615;596;577;558;539;557;576;595;614;635;671;652;633;575;594;613;632;651;670;689;707;688;669;650;631;612;593;611;630;649;668;687;706;725;743;724;705;686;667;648;685;704;723;742;761;760;741;722');
INSERT INTO `mountpark_data` VALUES (4690, 716, 3, 3, 785000, 680, 698, '718;681;644;607;570;533;496;514;532;550;568;586;604;623;642;661;680;699;662;625;588;551;569;587;605;624;643;606');
INSERT INTO `mountpark_data` VALUES (4935, 566, 7, 7, 1565000, 530, 548, '644;625;606;587;568;549;530;511;492;473;454;435;417;436;455;474;493;512;531;550;569;588;607;570;551;532;513;494;475;456;437;418;399;381;400;419;438;457;476;495;514;533;496;477;458;439;420;401;382;363;345;364;383;402;421;440');
INSERT INTO `mountpark_data` VALUES (4936, 642, 5, 5, 1175000, 606, 624, '701;682;663;644;625;606;587;568;549;512;531;550;569;588;607;645;608;627;664;683;665;646;589;570;551;532;513;495;514;533;552;571;590;609;628;591;572;553;534;515;496');
INSERT INTO `mountpark_data` VALUES (5277, 570, 3, 3, 785000, 532, 551, '568;550;532;514;496;478;459;477;495;513;531;530;512;494;476;458;440;421;439;457;475;493;492;511;474;456;438;420');
INSERT INTO `mountpark_data` VALUES (5324, 456, 3, 3, 785000, 420, 438, '420;401;382;363;326;345;364;383;402;384;365;346;327;308;290;309;328;347;366;348;329;310;291');
INSERT INTO `mountpark_data` VALUES (5113, 560, 5, 5, 1175000, 596, 578, '558;577;596;615;634;653;671;652;633;614;595;576;594;613;632;651;670;689;707;688;669;650;631;612;630;649;668;687;706;725;743;724;705;686;667;685;704;723;760;741;722');
INSERT INTO `mountpark_data` VALUES (5304, 596, 4, 4, 980000, 632, 614, '632;613;594;651;670;689;707;688;669;650;631;612;630;649;668;687;706;725;743;724;705;686;667;648;685;704;723;742;761;760;741;722');
INSERT INTO `mountpark_data` VALUES (5311, 598, 4, 4, 980000, 634, 616, '634;615;596;653;672;690;671;652;633;614;632;651;670;689;708;726;707;688;669;650;687;706;725;744;762;743;724;705;723;742;761;760;741');
INSERT INTO `mountpark_data` VALUES (5326, 531, 4, 4, 980000, 495, 513, '495;514;533;476;457;438;419;400;381;363;382;401;420;439;458;477;496;459;440;421;402;383;364;345;327;346;365;384;403;422;385;366;347;328;309;291;310;329');
INSERT INTO `mountpark_data` VALUES (5331, 658, 4, 4, 980000, 620, 639, '620;638;656;674;602;584;566;548;529;547;565;583;601;619;637;655;636;618;600;582;564;546;528;510;509;527;545;563;581;599;617;544;526;508;489;507;525;506;488');
INSERT INTO `mountpark_data` VALUES (4611, 632, 4, 4, 980000, 670, 651, '670;652;634;616;688;706;725;707;689;671;653;635;654;672;690;708;726;744;763;745;727;709;691;673;692;710;728;746;764;765;747;729;711;730;748;766');
INSERT INTO `mountpark_data` VALUES (4613, 329, 3, 3, 785000, 293, 311, '331;312;293;256;255;236;274;313;294;275;237;218;200;219;238;257;276;295;258;239;220;201');
INSERT INTO `mountpark_data` VALUES (3821, 236, 5, 5, 1175000, 208, 222, '193;208;223;224;225;240;269;298;210;195;194;179;209;239;255;284;180;165;270;256;241;226;211;196;181;166;151;137;152;167;182;197;212;227;242;228;213;198;183;168;153;138');
INSERT INTO `mountpark_data` VALUES (3786, 300, 6, 6, 1370000, 270, 285, '312;298;284;270;256;242;228;213;227;241;255;269;283;297;282;268;254;240;226;212;198;183;197;211;225;239;253;267;252;238;224;210;196;182;168;153;167;181;195;209;223;237;222;208;194;180;166;152;138;123;137;151;165;179;193');
INSERT INTO `mountpark_data` VALUES (9154, 598, 17, 17, 3515000, 562, 580, '600;581;562;543;524;505;486;467;448;429;410;391;373;392;411;430;449;468;487;506;525;544;563;582;545;526;507;488;469;450;431;412;393;374;355;337;356;375;394;413;432;451;470;489;508;527;528;509;490;471;452;433;414;395;376;357;338;319;301;320;339;358;377;396;415;434;453;472;491;510;473;454;435;416;397;378;359;340;321;302;283;265;284;303;322;341;342;361;380;399;418;437;474;456;455;436;417;398;379;323;304;285;266;343;362;324;305;286;267;248;229;211;230;249;268;287;306;325;344;326;308;289;270;288;307;193;212;231;250;232;213;194');
INSERT INTO `mountpark_data` VALUES (9205, 205, 8, 8, 1760000, 177, 191, '177;162;147;132;117;102;192;207;222;237;223;208;193;178;163;148;133;118;103;88;74;89;104;119;134;149;164;179;194;209;195;180;165;150;135;120;105;90;75;60;46;61;76;91;106;121;136;151;166;181;167;152;137;122;107;92;77;62;47;32;18;33;63;78;93;108;123;138;153');
INSERT INTO `mountpark_data` VALUES (9736, 194, 12, 12, 2540000, 224, 209, '224;210;196;182;168;154;238;252;266;280;294;309;295;281;267;253;239;225;211;197;183;169;184;198;212;226;240;254;268;282;296;310;324;339;325;311;297;283;269;255;241;227;213;199;214;228;242;256;270;284;298;312;326;340;354;369;355;341;327;313;299;285;271;257;243;229;244;258;272;286;300;314;328;342;356;370;384;259;273;287;301;316;302;288;274;289;303;317;331;346;332');
INSERT INTO `mountpark_data` VALUES (9737, 243, 9, 9, 1955000, 271, 257, '271;286;300;314;328;342;356;370;384;369;355;341;327;313;299;285;256;270;284;298;312;326;340;354;339;325;311;297;283;269;255;241;226;212;198;184;240;254;268;282;296;310;281;267;253;239;225;211;197;183;169;154;168;182;196;210;224;238;252;266;251;237;223;209;195;181;167;153;139;124;138;152;166;180;194;208');
INSERT INTO `mountpark_data` VALUES (9738, 109, 12, 12, 2540000, 139, 124, '139;125;111;153;167;181;195;209;223;237;251;265;180;194;208;193;178;164;150;165;179;182;168;154;140;126;196;210;224;238;252;266;280;295;281;267;253;239;225;211;197;183;169;155;141;198;212;226;240;254;268;282;296;310;325;311;297;283;269;255;241;227;213;228;242;256;270;284;298;312;313;327;299;285;271;257;243;258;272;286;300;314;328;315;329;343;357;371;330;344;358;372;386;345;359;373;387');
INSERT INTO `mountpark_data` VALUES (9739, 388, 11, 11, 2345000, 358, 373, '358;372;344;330;315;329;343;357;342;328;314;300;271;257;243;285;299;313;327;341;355;369;354;340;326;312;298;284;270;256;242;228;213;227;241;255;269;283;297;311;325;339;324;310;296;254;240;226;212;198;183;197;211;225;239;253;267;281;295;309;294;280;266;252;238;224;210;196;182;168;153;167;181;195;209;223;237;251;265;279;264;250;236;222;208;194;180;166;152');
INSERT INTO `mountpark_data` VALUES (4488, 308, 5, 5, 1175000, 280, 294, '235;250;265;280;295;310;325;340;326;311;296;281;266;251;236;221;207;222;237;252;267;282;297;312;298;283;268;253;238;223;208;193;179;194;209;224;239;254;240;225;210;195;180');
INSERT INTO `mountpark_data` VALUES (4581, 315, 7, 7, 1565000, 285, 300, '138;152;166;180;194;208;222;236;251;237;223;209;195;181;167;153;168;182;196;210;224;238;252;266;281;267;253;239;225;211;197;183;198;212;226;240;254;268;283;269;255;241;227;213;256;270;284;298;312;326;341;327;313;299;285;271;257');
INSERT INTO `mountpark_data` VALUES (4491, 211, 3, 3, 785000, 181, 196, '79;93;107;121;135;149;164;150;136;122;108;123;137;151;165;179;194;180;166;152;138;124;139;153;167;181;195');
INSERT INTO `mountpark_data` VALUES (4585, 294, 5, 5, 1175000, 266, 280, '137;152;167;182;197;212;227;242;257;271;151;165;180;195;210;211;240;255;269;254;253;224;209;194;179;193;208;223;238;268;297;282;267;252;237;222;207;221;236;251;266;281;296;311');
INSERT INTO `mountpark_data` VALUES (2579, 339, 9, 9, 1955000, 311, 325, '95;110;125;140;155;169;154;139;124;109;123;138;153;168;183;198;213;228;243;257;242;227;212;197;182;167;152;137;151;166;181;196;225;226;241;256;271;285;255;240;210;195;180;165;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236');
INSERT INTO `mountpark_data` VALUES (2679, 300, 5, 5, 1175000, 270, 285, '95;109;123;137;151;165;179;194;180;166;152;138;124;110;125;139;153;167;181;195;224;239;225;196;182;168;154;140;169;183;197;226;240;254;212;198;184;185;199;213;227;241;255;269;284;270;256;242;228;214');
INSERT INTO `mountpark_data` VALUES (2687, 126, 5, 5, 1175000, 154, 140, '283;268;253;238;223;208;194;209;224;239;254;269;255;240;225;210;195;180;166;181;196;211;226;241;227;212;197;182;167;152;138;153;168;183;198;213;199;184;169;154;139;124');
INSERT INTO `mountpark_data` VALUES (2688, 314, 5, 5, 1175000, 284, 299, '153;167;181;195;209;223;237;251;252;238;224;210;196;182;168;183;197;211;225;239;253;267;281;282;268;254;240;226;212;198;213;227;241;255;269;283;297;311;326;284;270;256;242;386;372;358;344;329;312');
INSERT INTO `mountpark_data` VALUES (2694, 374, 5, 5, 1175000, 344, 359, '167;181;195;209;223;238;224;210;196;182;168;183;197;211;225;239;253;268;254;240;226;212;198;213;227;241;255;269;283;298;284;270;299;313;328;314;300;315;329;343;358;344');
INSERT INTO `mountpark_data` VALUES (2708, 251, 10, 10, 2150000, 223, 237, '229;244;259;274;243;258;273;288;302;287;272;257;316;301;286;271;256;241;226;211;196;181;166;151;136;121;106;120;135;150;165;180;195;210;225;240;255;270;285;315;330;344;329;314;299;284;269;254;239;224;209;194;179;164;149;134;148;163;178;193;208;223;238;253;268;283;298;313;328;343;358;372;357;342;327;341;356;371;386;400;385;370');
INSERT INTO `mountpark_data` VALUES (2723, 356, 5, 5, 1175000, 326, 341, '179;193;207;221;236;222;208;194;209;223;237;251;266;280;294;308;252;238;224;239;267;281;295;309;323;338;324;310;296;282;268;283;297;311;325;339;353;368;298;284;312;326;340;354');
INSERT INTO `mountpark_data` VALUES (2813, 323, 12, 12, 2540000, 295, 309, '123;138;153;168;183;198;213;228;242;256;271;286;272;227;212;197;182;167;152;137;151;166;181;196;211;226;241;300;285;270;255;240;225;210;195;180;165;150;135;120;134;149;164;179;194;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;208;193;178;163;148;207;222;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;236;221;235;250;280;295;310;325;340;355');
INSERT INTO `mountpark_data` VALUES (2814, 205, 7, 7, 1565000, 177, 191, '123;108;93;78;63;48;33;18;32;17;47;62;77;92;107;122;137;151;136;121;106;76;61;46;31;60;75;90;105;120;135;150;165;179;164;149;134;119;104;89;74;59;73;88;103;118;133;148;163;178;193;207;192;177;162;147;132;102');
INSERT INTO `mountpark_data` VALUES (2842, 301, 11, 11, 2345000, 271, 286, '123;137;151;165;179;193;207;221;235;249;264;250;236;222;208;194;180;166;152;138;153;167;181;195;209;223;237;251;265;279;294;280;266;252;238;224;210;196;182;168;183;197;211;225;239;253;267;281;295;309;324;310;296;282;268;254;240;226;212;198;213;227;241;255;269;283;297;311;325;339;354;340;326;312;298;284;270;256;242;228;243;257;271;285;299;313;327;341;355');
INSERT INTO `mountpark_data` VALUES (2843, 280, 12, 12, 2540000, 252, 266, '110;125;140;155;170;184;169;154;139;124;138;123;108;93;153;168;183;198;213;228;243;258;272;257;242;227;212;197;182;167;152;137;122;107;121;136;151;166;181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;180;165;150;135;149;164;179;194;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;208;193;178;163;177;207;222;237;252;267;282;297;312;327');
INSERT INTO `mountpark_data` VALUES (2879, 428, 6, 6, 1370000, 400, 414, '287;302;317;332;347;361;376;346;331;316;301;315;330;345;360;375;390;405;419;434;404;389;374;359;344;329;343;358;373;388;403;418;433;448;462;447;432;417;402;387;372;357;371;386;401;416;431;446;461;460;445;430;415;400');
INSERT INTO `mountpark_data` VALUES (2880, 310, 5, 5, 1175000, 282, 296, '285;270;255;240;225;210;195;180;165;150;135;120;134;149;164;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;178;163;148;162;177;192;207;222;237;252;267;282;297;312');
INSERT INTO `mountpark_data` VALUES (2924, 219, 8, 8, 1760000, 191, 205, '18;33;48;63;78;93;108;123;137;122;107;92;77;47;32;17;46;61;76;91;106;121;136;151;60;74;59;44;30;16;75;90;105;120;135;150;165;179;164;149;134;119;104;89;73;88;103;118;133;148;163;178;193;207;192;177;162;147;132;117;102;131;146;161;176;191;206');
INSERT INTO `mountpark_data` VALUES (2925, 311, 10, 10, 2150000, 283, 297, '95;110;125;140;154;168;183;198;213;199;185;170;200;215;229;214;169;139;124;109;123;153;228;243;257;272;287;302;242;227;212;197;182;167;152;137;151;166;181;196;211;226;241;256;271;286;301;316;165;180;195;210;225;240;255;270;285;300;315;330;179;344;329;314;299;284;269;254;239;224;209;194;193;208;223;238;253;268;283;298;313;328;343');
INSERT INTO `mountpark_data` VALUES (3072, 279, 11, 11, 2345000, 251, 265, '94;109;124;139;154;169;184;199;214;228;243;213;198;183;168;153;138;123;108;122;137;152;167;182;197;212;227;242;257;271;256;241;226;211;196;181;166;151;136;150;165;180;195;210;225;240;255;270;285;299;284;269;254;239;224;209;194;179;164;193;208;223;238;253;268;283;298;313;327;312;297;282;267;252;237;222;236;221;206;192;251;266;281;296;311;326');
INSERT INTO `mountpark_data` VALUES (3073, 352, 16, 16, 3320000, 324, 338, '81;96;111;126;141;156;171;186;200;185;170;155;140;125;110;95;109;124;139;154;169;184;199;214;228;213;198;183;168;153;138;123;137;122;152;167;182;197;212;227;242;256;271;286;272;287;301;241;226;211;196;181;166;151;136;150;165;180;195;210;225;240;255;270;285;300;315;329;314;299;284;269;254;239;253;179;164;178;193;208;222;236;250;264;279;294;280;266;252;267;283;298;313;328;343;357;342;327;312;297;311;296;281;249;234;220;206;192;207;221;295;310;325;340;355;370;385;371;309;324;339;354;369;384');
INSERT INTO `mountpark_data` VALUES (3079, 353, 14, 14, 2930000, 325, 339, '96;111;126;141;156;171;185;170;155;140;125;110;95;109;124;139;154;169;184;199;213;198;183;168;153;138;123;137;152;167;182;197;212;227;242;257;272;287;301;286;271;256;241;226;211;196;181;166;151;165;180;195;210;225;240;255;270;285;300;315;329;314;299;284;269;254;239;224;209;194;179;193;208;223;238;253;268;283;298;313;328;343;357;342;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341;356;371;385;370;355;340;325;310;295;280;265;250');
INSERT INTO `mountpark_data` VALUES (3112, 323, 12, 12, 2540000, 295, 309, '123;138;153;168;183;198;213;228;243;258;272;257;242;227;212;197;182;167;152;137;151;166;181;196;211;226;241;256;271;286;315;330;345;300;285;240;225;210;195;180;165;150;135;120;134;149;164;179;194;209;224;239;299;314;329;344;359;373;358;343;328;313;312;297;268;253;238;223;208;193;178;163;148;207;222;237;252;267;282;327;342;356;341;326;311;296;281;266;251;236;221;235;250;265;280;295;310;325;340;355');
INSERT INTO `mountpark_data` VALUES (3119, 314, 8, 8, 1760000, 284, 299, '94;108;122;136;150;165;151;137;123;109;124;138;152;166;180;195;181;167;153;139;154;168;182;196;210;239;238;252;251;266;281;267;253;225;211;197;183;169;184;198;212;226;240;254;268;282;296;311;297;283;269;255;241;227;213;199;214;228;242;256;270;284;298;312');
INSERT INTO `mountpark_data` VALUES (3142, 140, 8, 8, 1760000, 168, 154, '323;308;293;279;294;309;295;280;265;236;221;251;266;281;296;311;297;282;267;252;237;222;207;193;208;223;238;253;268;283;269;254;239;224;209;194;179;165;180;195;210;225;240;255;241;226;211;196;181;166;151;137;152;167;182;197;212;227;213;198;183;168');
INSERT INTO `mountpark_data` VALUES (3187, 268, 7, 7, 1565000, 296, 282, '452;437;422;407;436;438;453;423;393;378;364;379;380;409;424;439;425;410;395;365;350;336;351;366;381;396;411;397;382;367;352;337;322;308;323;338;353;368;383;369;354;339;324;309;294;280;295;310;325;340;355;341;326;311;296;281');
INSERT INTO `mountpark_data` VALUES (3242, 293, 11, 11, 2345000, 265, 279, '138;153;168;183;198;213;228;243;258;272;257;242;227;212;197;182;167;152;137;151;166;181;196;211;226;241;256;271;286;300;285;270;255;240;210;195;180;165;150;135;120;134;149;164;179;194;209;238;239;254;284;299;314;328;313;298;253;223;208;193;207;222;237;252;267;282;311;312;327;342;356;341;296;281;266;251;236;221;235;250;265;280;295;310;325;340;355');
INSERT INTO `mountpark_data` VALUES (3243, 398, 13, 13, 2735000, 370, 384, '109;124;139;154;169;184;199;214;243;228;213;198;183;168;153;138;123;122;107;92;137;152;167;182;197;212;227;242;257;271;256;241;226;211;196;181;166;151;136;121;106;120;135;150;165;180;195;210;225;240;255;270;285;299;284;269;254;239;224;209;194;179;164;149;134;193;208;223;238;253;268;283;298;313;342;357;372;327;312;297;282;267;252;237;222;207;236;251;266;281;296;311;326;341;356;371;386;400;385;370;355;340;325;310;295;280;265;250');
INSERT INTO `mountpark_data` VALUES (3273, 371, 4, 4, 980000, 343, 357, '169;184;199;214;228;213;198;183;197;212;227;242;211;226;241;256;271;286;301;316;330;315;300;285;270;255;240;225;314;329;344;358;343');
INSERT INTO `mountpark_data` VALUES (3312, 365, 8, 8, 1760000, 337, 351, '165;180;195;210;225;240;255;270;299;284;269;254;239;224;209;194;179;193;208;223;238;253;268;283;298;313;328;342;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341;356;370;355;340;325;310;295;280;265;250;235;294;309;324;338;323;308;322;337');
INSERT INTO `mountpark_data` VALUES (3440, 338, 9, 9, 1955000, 310, 324, '123;138;153;168;183;198;213;228;243;257;242;227;212;197;182;167;152;137;151;166;181;196;211;226;241;256;271;285;270;255;240;210;195;180;165;179;194;209;224;239;268;269;284;299;313;298;283;253;238;223;208;193;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;221;235;250;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (3441, 327, 13, 13, 2735000, 299, 313, '82;97;112;127;142;156;141;126;111;96;110;125;140;155;170;184;169;154;139;124;138;153;168;183;198;227;242;257;272;287;212;197;182;167;152;137;122;107;92;77;91;106;121;136;151;166;181;196;211;226;241;256;271;286;301;315;300;285;270;255;240;225;210;195;180;165;150;135;120;105;119;134;149;164;179;194;224;239;254;269;284;299;314;329;268;253;238;237;208;222;252;267;282;296;281;266;251;236;250;265;280;295;310;324;309;294;279');
INSERT INTO `mountpark_data` VALUES (3479, 338, 12, 12, 2540000, 310, 324, '112;127;142;141;126;140;155;170;184;169;154;139;124;138;153;168;183;198;213;228;243;258;273;287;272;257;242;227;212;197;182;167;152;166;181;196;211;226;241;256;271;286;301;315;300;285;270;255;240;225;210;195;180;194;209;224;254;269;284;299;314;329;343;328;313;298;283;268;267;238;223;208;222;237;252;282;297;312;327;342;357;371;356;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;370');
INSERT INTO `mountpark_data` VALUES (3480, 338, 13, 13, 2735000, 310, 324, '96;111;126;141;156;170;155;140;125;110;124;139;154;169;184;213;228;243;198;183;168;153;138;123;108;93;78;92;107;122;137;152;167;212;227;242;257;271;256;241;226;225;210;181;166;151;136;121;106;120;135;150;165;180;195;240;255;270;285;299;284;269;254;239;224;209;194;179;164;149;134;148;163;178;193;208;223;238;253;268;283;298;313;327;312;297;282;267;252;237;222;207;192;177;162;236;251;266;281;296;311;326;341;355;340;325;310;295;280;265');
INSERT INTO `mountpark_data` VALUES (3488, 324, 6, 6, 1370000, 296, 310, '151;166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;165;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236');
INSERT INTO `mountpark_data` VALUES (3493, 369, 12, 12, 2540000, 341, 355, '110;125;140;155;170;185;200;215;229;214;199;184;169;154;139;124;138;153;168;183;198;213;228;243;257;242;227;212;197;182;167;152;166;181;196;211;226;241;256;271;286;301;316;330;315;300;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;314;329;344;358;343;328;313;298;283;268;253;238;252;267;282;297;312;327;342;357;372;386;371;356;341;326;311;296;281');
INSERT INTO `mountpark_data` VALUES (3529, 387, 12, 12, 2540000, 357, 372, '95;110;125;140;155;170;185;199;184;169;154;139;124;109;123;138;153;168;183;198;213;137;152;167;182;197;212;227;242;257;272;287;301;286;271;256;241;226;211;196;181;166;151;165;180;209;210;225;270;285;314;329;299;284;269;254;239;224;194;179;193;208;223;238;253;268;283;298;313;328;343;357;342;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341;356');
INSERT INTO `mountpark_data` VALUES (3534, 299, 5, 5, 1175000, 271, 285, '111;126;141;156;171;186;201;216;230;215;200;185;170;155;140;125;139;154;169;184;199;214;229;244;258;243;228;213;198;183;168;153;167;182;197;212;227;242;257;272;286;271;256;241;226;211;196');
INSERT INTO `mountpark_data` VALUES (3643, 338, 11, 11, 2345000, 310, 324, '108;123;138;153;168;183;198;213;228;257;242;227;212;197;182;167;152;137;122;136;151;166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;165;150;164;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;178;192;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;221;206;220;235;250;265;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (3644, 270, 7, 7, 1565000, 240, 255, '94;108;122;136;150;164;178;192;206;221;207;193;179;165;151;137;123;109;124;138;152;166;180;194;208;222;236;251;223;209;195;181;167;168;154;182;196;210;224;238;252;281;267;253;239;225;211;197;183;169;184;198;212;226;240;254;268');
INSERT INTO `mountpark_data` VALUES (3663, 344, 9, 9, 1955000, 314, 329, '124;138;152;166;180;194;208;222;237;223;209;195;181;167;153;139;154;168;182;196;210;224;238;252;267;253;239;225;211;197;183;169;184;198;212;226;240;254;268;282;297;283;269;255;241;227;213;199;214;228;242;256;270;284;298;312;327;313;299;285;271;257;243;229;244;258;272;286;300;314;328');
INSERT INTO `mountpark_data` VALUES (3664, 353, 9, 9, 1955000, 325, 339, '123;138;153;168;183;198;213;228;243;257;242;227;212;197;182;167;152;137;151;166;195;196;211;226;241;256;271;285;255;240;225;210;180;165;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;221;235;250;265;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (3672, 196, 3, 3, 785000, 166, 181, '78;92;106;120;134;148;163;149;135;121;107;93;108;122;136;150;164;178;193;194;180;166;152;123;138');
INSERT INTO `mountpark_data` VALUES (3684, 366, 6, 6, 1370000, 338, 352, '180;195;210;239;240;255;270;284;269;254;224;209;194;208;223;238;253;268;283;298;312;297;282;267;252;237;222;236;251;266;281;296;311;326;340;325;310;295;280;265;250;264;279;294;309;324;339;354;353;338;323;308;293');
INSERT INTO `mountpark_data` VALUES (3685, 371, 5, 5, 1175000, 341, 356, '209;223;237;251;265;279;293;308;294;280;266;252;238;224;239;253;267;281;295;309;323;338;324;310;296;282;268;254;269;283;297;311;325;339;353;368;354;340;326;312;298;284;299;313;327;341;355;369');
INSERT INTO `mountpark_data` VALUES (3704, 382, 11, 11, 2345000, 354, 368, '124;139;154;169;184;199;213;198;183;168;138;152;167;182;197;212;227;256;271;286;166;181;196;211;226;241;300;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;370;384;369;354;339;324;309;294;279');
INSERT INTO `mountpark_data` VALUES (3705, 354, 9, 9, 1955000, 326, 340, '110;139;140;155;169;183;154;124;138;153;168;212;227;242;257;197;182;167;152;137;122;136;151;166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;165;150;164;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;178;192;207;222;237;252;267;282;297;312;341;326;311;296;281;266;251;236;221');
INSERT INTO `mountpark_data` VALUES (3713, 212, 4, 4, 980000, 182, 197, '92;106;120;135;121;107;122;136;150;165;151;137;138;124;110;96;152;166;180;195;181;167;153;139;125;111;126;140;154;168;182;196');
INSERT INTO `mountpark_data` VALUES (3714, 342, 6, 6, 1370000, 312, 327, '122;136;150;164;178;192;206;221;207;193;179;165;151;137;152;166;180;208;222;236;251;237;223;209;195;181;167;182;196;210;224;238;252;266;281;267;253;239;225;211;197;254;268;282;296;311;297;283;269;284;298;312');
INSERT INTO `mountpark_data` VALUES (3736, 323, 9, 9, 1955000, 295, 309, '123;138;153;168;183;198;213;228;243;257;242;227;212;197;182;167;152;137;151;166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;165;179;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;193;207;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;221;235;250;265;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (3737, 324, 8, 8, 1760000, 296, 310, '138;153;168;183;198;213;228;243;258;272;257;242;227;212;197;182;167;152;166;181;196;211;226;241;256;271;286;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;328;342;313;298;283;268;253;238;223;222;236;251;266;281;296;311;326;341');
INSERT INTO `mountpark_data` VALUES (3771, 321, 9, 9, 1955000, 293, 307, '166;181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;314;329;343;328;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;369;354;339;324;309;294;279;264;278;293;308;323;338;353;368;383');
INSERT INTO `mountpark_data` VALUES (3772, 309, 10, 10, 2150000, 281, 295, '110;125;140;155;170;185;200;214;199;184;169;154;139;124;123;108;138;153;168;183;198;213;228;242;227;212;197;182;167;152;137;122;136;151;166;181;196;211;226;241;256;270;255;240;225;210;195;180;165;150;164;179;194;209;224;239;254;269;284;298;283;268;253;238;223;208;193;178;192;207;222;237;252;267;282;297;312;326;311;296;281;266;251;236;221');
INSERT INTO `mountpark_data` VALUES (3781, 353, 12, 12, 2540000, 325, 339, '125;140;155;170;185;199;184;169;154;139;138;123;108;153;168;183;198;213;228;243;258;272;257;242;227;212;197;182;167;152;137;122;136;151;166;181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;180;165;150;164;179;194;209;224;253;254;269;284;299;314;328;313;298;283;268;238;208;222;237;266;267;282;297;312;327;342;356;341;326;311;296;281;251;236;250;265;280;295;310;325;340;355');
INSERT INTO `mountpark_data` VALUES (3782, 384, 8, 8, 1760000, 356, 370, '153;168;183;198;213;228;243;258;273;287;272;257;242;227;212;197;182;167;181;196;211;226;241;256;271;286;301;315;300;285;270;255;240;225;210;195;209;224;239;254;269;284;299;314;329;343;328;313;298;283;268;238;223;237;252;267;282;297;312;327;342;357;251;266;281;296;311;326;341;356');
INSERT INTO `mountpark_data` VALUES (3816, 382, 8, 8, 1760000, 354, 368, '181;196;211;226;241;256;271;286;300;285;270;255;240;225;210;195;209;224;239;254;269;284;299;314;328;313;298;283;268;253;238;223;237;252;267;282;297;312;327;342;356;341;326;311;296;281;266;251;265;280;295;310;325;340;355;370;384;369;354;339;324;309;294');
INSERT INTO `mountpark_data` VALUES (3817, 151, 5, 5, 1175000, 121, 136, '16;30;44;73;59;45;31;17;18;32;46;60;74;88;102;117;103;89;75;61;47;33;48;62;76;90;104;118;132;147;133;119;105;91;77;63;78;92;106;120;134;148;162;177;163;149;135;121;107');
INSERT INTO `mountpark_data` VALUES (4121, 342, 5, 5, 1175000, 312, 327, '180;194;208;222;236;250;264;279;265;251;237;223;209;195;210;224;238;252;266;280;294;309;295;281;267;253;239;225;240;254;268;282;296;310;324;339;325;311;297;283;269;255;270;284;298;312;326;340');
INSERT INTO `mountpark_data` VALUES (4122, 395, 15, 15, 3125000, 367, 381, '108;123;138;153;168;183;198;213;228;243;258;273;288;303;317;302;287;272;257;242;227;212;197;182;167;152;137;122;136;151;166;196;211;226;255;256;271;286;301;316;331;345;330;315;285;270;240;210;209;180;165;150;164;193;194;238;253;254;269;284;299;314;329;344;359;373;358;343;328;313;298;283;268;223;208;178;192;207;236;237;252;267;282;297;312;327;342;357;372;387;401;386;371;356;341;326;311;296;281;251;221;206;295;310;325;340;369;354;339;324;323;338;353;368;383;397;382;367;352');
INSERT INTO `mountpark_data` VALUES (4214, 661, 3, 3, 785000, 699, 680, '776;739;757;775;756;738;720;701;719;737;755;773;754;736;718;700;682;663;681;699;717');
INSERT INTO `mountpark_data` VALUES (4285, 272, 3, 3, 785000, 254, 254, '108;127;146;165;184;147;202;183;164;145;126;144;163;182;201;220;238;219;200;181;162;180;199;218;237;256;274;255;236;217');
INSERT INTO `mountpark_data` VALUES (4347, 558, 9, 9, 1955000, 522, 540, '339;358;377;396;415;434;453;472;491;510;529;547;528;509;490;471;452;433;414;395;376;357;375;394;413;432;451;470;527;546;565;583;545;563;562;543;506;469;450;431;412;393;411;430;449;487;582;601;619;600;581;524;505;504;467;448;429;447;466;485;523;542;561;580;599;618;637;655;636;617;598;579;560;541;522;503;484');
INSERT INTO `mountpark_data` VALUES (4432, 211, 4, 4, 980000, 183, 197, '82;111;126;127;113;142;143;158;172;157;96;141;156;171;186;200;185;170;155;140;125;110;124;139;154;169;184;199;214;228;213;198;183;168;153');
INSERT INTO `mountpark_data` VALUES (4436, 425, 3, 3, 785000, 395, 410, '335;349;363;392;378;364;350;336;351;365;379;393;407;421;450;436;422;408;394;380;366;381;395;409;423;437');
INSERT INTO `mountpark_data` VALUES (4468, 93, 5, 5, 1175000, 123, 108, '185;199;213;227;241;255;269;212;198;184;170;155;154;183;197;211;225;239;224;210;196;182;168;140;125;139;153;167;181;195;209;194;180;166;152;138;124;110;109;123;137;151;165');
INSERT INTO `mountpark_data` VALUES (4471, 353, 6, 6, 1370000, 325, 339, '167;182;197;226;227;242;257;271;256;241;211;196;181;195;210;225;240;255;270;285;299;284;269;254;239;224;223;209;313;298;283;268;253;238;237;252;267;282;297;312;327;341;326;311;296;281;266;251;265;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (4485, 300, 6, 6, 1370000, 270, 285, '167;181;195;209;223;237;251;265;279;294;280;266;252;238;224;210;196;182;183;197;211;225;239;253;267;281;295;309;324;310;296;297;283;254;240;226;212;198;213;227;241;255;269;325;339;354;340;326;312;298;284;270;256;242');
INSERT INTO `mountpark_data` VALUES (4489, 127, 6, 6, 1370000, 155, 141, '110;125;140;155;170;199;184;169;154;139;124;138;153;168;183;198;213;228;242;227;212;197;182;167;152;166;181;196;211;226;241;256;270;255;240;225;210;195;180;194;209;254;269;284;298;283;238;223;208;222;237;252;297');
INSERT INTO `mountpark_data` VALUES (4544, 94, 5, 5, 1175000, 122, 108, '267;252;237;222;207;192;177;148;163;178;193;208;223;194;179;164;149;134;120;135;150;165;180;106;121;136;151;166;181;107;122;137;152;167;182;197;212;227;242;256;270;284;241');
INSERT INTO `mountpark_data` VALUES (4545, 185, 7, 7, 1565000, 213, 199, '123;138;153;168;183;198;213;228;243;257;242;227;212;182;167;152;137;151;166;181;196;225;226;241;256;271;285;270;255;240;210;195;180;165;179;194;209;224;253;254;269;284;299;313;298;283;268;238;208;207;222;237;252;267;282;297;312');
INSERT INTO `mountpark_data` VALUES (4546, 127, 5, 5, 1175000, 155, 141, '222;237;252;267;282;297;283;268;253;208;223;254;269;255;240;241;226;211;196;167;152;182;197;212;227;213;199;198;183;168;153;138;124;139;154;169;184;185;170;155;140;125');
INSERT INTO `mountpark_data` VALUES (4547, 316, 5, 5, 1175000, 286, 301, '111;125;139;153;167;181;195;209;224;210;196;182;168;154;140;126;112;127;141;155;169;183;197;211;225;239;254;240;226;212;198;184;170;156;142;227;241;255;269;284;270;256;242;257;271;285;299;314;300;286');
INSERT INTO `mountpark_data` VALUES (4634, 268, 7, 7, 1565000, 240, 254, '55;69;83;112;127;128;114;100;115;144;129;143;158;173;187;172;157;142;97;96;111;126;141;156;171;186;201;215;185;170;155;125;110;124;139;154;169;184;199;214;229;243;228;213;198;183;168;138;197;212;227;241;226;211;225;240');
INSERT INTO `mountpark_data` VALUES (4705, 367, 8, 8, 1760000, 339, 353, '166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340;355;369;354;339;324;309;294;279');
INSERT INTO `mountpark_data` VALUES (4711, 323, 6, 6, 1370000, 295, 309, '153;168;183;198;213;228;242;227;212;197;182;167;152;166;181;196;211;226;241;256;270;255;240;225;210;195;180;224;223;208;238;253;268;283;298;267;282;297;312;252;237;222;236;251;266;281;296;311;326;340;325;310;295;280;265');
INSERT INTO `mountpark_data` VALUES (4720, 280, 5, 5, 1175000, 252, 266, '93;107;122;137;138;153;168;183;197;182;167;152;121;136;151;166;181;196;211;225;210;195;180;165;150;135;149;164;179;194;209;224;239;253;238;223;208;193;178;163;177;192;207;222;237;252');
INSERT INTO `mountpark_data` VALUES (4723, 134, 9, 9, 1955000, 164, 149, '185;170;155;154;139;169;184;199;213;198;183;168;153;212;227;241;226;211;196;181;166;151;136;150;165;180;195;210;225;240;255;269;254;239;224;209;194;179;164;178;193;208;223;238;253;268;283;297;282;267;252;237;222;207;192;311;296;295;280;265;310;325;339;324;309;294;279;293;308;323;338;353;367;352;337');
INSERT INTO `mountpark_data` VALUES (4729, 338, 7, 7, 1565000, 310, 324, '180;195;210;225;240;255;270;285;300;314;299;284;269;254;239;224;209;194;179;193;208;223;238;253;268;283;298;313;328;342;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341;356;370;355;340;325;310;295;280;265;250');
INSERT INTO `mountpark_data` VALUES (4757, 324, 6, 6, 1370000, 296, 310, '168;183;198;227;228;243;257;242;212;197;182;167;181;196;211;226;241;256;271;285;255;240;225;210;195;209;224;239;254;269;284;299;313;298;283;268;253;238;223;252;267;282;297;312;327;341;326;311;296;281;266');
INSERT INTO `mountpark_data` VALUES (4805, 381, 8, 8, 1760000, 353, 367, '228;242;256;270;284;298;312;326;340;354;368;353;339;325;311;297;283;254;255;241;227;213;198;212;226;240;268;282;296;310;324;338;323;309;295;281;267;253;239;225;211;197;168;182;196;210;224;238;252;237;223;209;195;181;167;153;222;208;194;180;166');
INSERT INTO `mountpark_data` VALUES (4806, 342, 11, 11, 2345000, 312, 327, '108;123;138;153;168;183;198;213;228;242;227;212;197;182;167;152;137;122;107;121;136;151;166;181;196;211;226;241;256;270;255;240;225;210;195;180;165;150;135;149;164;179;194;209;224;239;254;269;284;298;283;268;253;238;223;208;193;178;163;237;252;267;282;297;312;326;311;296;281;266;251;265;280;295;310;325;354;339;324;309;294;279;293;308;323;338;353');
INSERT INTO `mountpark_data` VALUES (4809, 357, 6, 6, 1370000, 327, 342, '166;181;196;211;226;241;256;271;285;270;255;240;225;210;195;180;194;209;224;239;254;269;284;299;313;298;283;268;253;238;223;208;222;237;252;267;282;297;312;327;341;326;311;296;281;266;251;236;250;265;280;295;310;325;340');
INSERT INTO `mountpark_data` VALUES (4810, 358, 10, 10, 2150000, 328, 343, '110;124;138;152;166;180;194;208;222;236;250;265;251;237;223;209;195;181;167;153;139;125;140;154;168;182;196;210;224;238;252;266;280;295;281;267;253;239;225;211;197;183;169;155;170;184;198;212;226;240;254;268;282;296;310;311;297;283;269;255;241;227;213;185;256;270;298;312;326;340;355;341;327;313;299;285;271;286;300;314;328;342;356');
INSERT INTO `mountpark_data` VALUES (4851, 256, 7, 7, 1565000, 284, 270, '152;166;180;194;208;222;236;250;264;279;265;251;237;223;209;195;181;167;182;196;210;224;238;252;266;280;294;309;295;281;267;253;239;225;211;197;254;268;282;296;310;324;339;325;311;297;283;269;284;298;312;326;340;354;369;355;341;327;313');
INSERT INTO `mountpark_data` VALUES (4852, 371, 9, 9, 1955000, 341, 356, '152;167;182;197;212;227;242;257;271;256;241;226;211;196;181;166;151;165;180;195;210;225;240;255;270;285;299;284;269;254;239;224;209;194;179;193;208;223;238;253;268;283;298;313;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341;355;340;325;310;295;280;265;250;235;294;309;324;338;323');
INSERT INTO `mountpark_data` VALUES (4855, 329, 8, 8, 1760000, 299, 314, '124;138;152;166;180;194;208;222;236;250;265;266;252;238;224;210;196;182;168;139;154;280;295;281;267;253;239;225;211;197;183;169;184;198;212;226;240;254;268;282;296;310;325;311;297;283;269;255;241;227;213;199;228;242;256;270;284;298;312;326;340;355;341;313;299;285;271;257');
INSERT INTO `mountpark_data` VALUES (4856, 330, 9, 9, 1955000, 300, 315, '138;153;168;183;198;213;228;243;258;152;167;182;197;212;227;242;257;286;271;256;241;226;211;196;181;166;151;165;180;195;210;225;240;255;270;285;300;314;299;284;269;254;239;224;209;194;179;193;208;223;238;253;268;283;298;313;328;327;312;297;282;267;252;237;222;207;221;236;251;266;281;296;311;326;341');
INSERT INTO `mountpark_data` VALUES (4966, 169, 9, 9, 1955000, 197, 183, '220;235;250;265;280;295;310;325;340;355;341;326;311;296;281;266;251;236;221;206;192;207;222;237;252;267;282;297;312;327;313;298;283;268;253;238;223;208;193;178;164;179;194;209;224;239;254;255;270;299;285;240;225;210;195;180;165;150;136;151;166;181;196;211;226;241;256;271;257;242;227;212;197;182;167;152');
INSERT INTO `mountpark_data` VALUES (4967, 119, 7, 7, 1565000, 149, 134, '183;197;211;225;239;253;267;281;266;252;238;224;210;196;182;168;153;167;181;195;209;223;237;251;236;222;208;194;180;166;152;138;123;137;151;165;179;193;207;221;206;191;177;163;149;135;121;107;108;93;192;178;164;150;136;122');
INSERT INTO `mountpark_data` VALUES (5036, 354, 5, 5, 1175000, 326, 340, '212;227;242;257;272;287;301;286;271;256;241;226;211;225;240;255;270;285;300;314;299;284;269;254;239;253;268;283;298;313;328;343;357;342;327;312;297;282;267;281;296;311;326;341;356');
INSERT INTO `mountpark_data` VALUES (5317, 660, 4, 4, 980000, 624, 642, '497;516;535;554;591;572;553;534;515;533;552;571;590;609;628;665;646;627;608;589;570;551;569;588;607;626;644;625;606;587;605;624;643');
INSERT INTO `mountpark_data` VALUES (8564, 168, 5, 5, 1175000, 140, 154, '41;56;71;86;115;100;85;70;55;69;54;84;99;114;129;144;158;143;128;113;98;83;68;82;97;112;127;142;157;172;186;171;156;141;126;111;96;110;125;140;155;170;185');
INSERT INTO `mountpark_data` VALUES (8567, 323, 9, 9, 1955000, 295, 309, '151;165;179;193;207;221;235;250;236;222;208;194;180;166;152;209;223;237;251;265;280;266;252;238;224;210;196;182;168;154;140;155;169;183;197;211;225;239;253;267;281;295;310;296;282;268;254;240;226;212;198;184;170;269;283;297;311;325;340;326;312;298;284;270;256;242;257;271;285;299;313;327;341');
INSERT INTO `mountpark_data` VALUES (8570, 299, 4, 4, 980000, 269, 284, '151;166;181;196;211;226;241;255;240;225;210;195;180;165;150;164;179;194;209;224;239;254;269;283;268;253;238;223;208;193;178;192;207;222;237;252;267;282');
INSERT INTO `mountpark_data` VALUES (8582, 400, 8, 8, 1760000, 370, 385, '195;209;223;237;251;265;279;294;280;266;252;238;224;210;225;239;253;267;281;295;309;324;310;296;282;268;254;240;226;212;198;213;227;241;255;269;283;297;311;325;339;354;340;326;312;298;284;270;256;242;228;243;257;271;285;299;313;327;341;355;369;384;370;356;328;314;286;272');
INSERT INTO `mountpark_data` VALUES (8598, 374, 5, 5, 1175000, 344, 359, '155;170;185;199;184;169;168;153;138;183;198;213;227;212;197;182;167;152;166;181;196;211;226;241;256;271;286;301;316;330;315;300;285;270;255;240;225;239;254;269;284;299;314;329;344;358;343;328;313;268');
INSERT INTO `mountpark_data` VALUES (8604, 337, 3, 3, 785000, 365, 351, '365;379;393;407;421;450;451;436;392;422;437;423;408;378;363;349;364;394;409;395;380;350');
INSERT INTO `mountpark_data` VALUES (8607, 354, 5, 5, 1175000, 326, 340, '166;180;194;208;222;236;251;237;223;209;195;181;196;210;224;238;252;266;267;253;239;225;211;212;226;240;254;268;282;311;297;283;269;255;241;227;242;256;270;284;298;312;326;341;327;313;299;285;271');
INSERT INTO `mountpark_data` VALUES (8610, 236, 5, 5, 1175000, 208, 222, '93;108;123;138;153;168;183;197;182;167;152;137;122;107;92;106;121;136;151;166;181;196;211;240;255;225;210;195;180;165;150;135;120;134;149;164;179;194;209;224;239;254;269;253;238;223;208;193;178;163');
INSERT INTO `mountpark_data` VALUES (9280, 268, 5, 5, 1175000, 238, 253, '92;106;120;134;148;162;177;163;149;135;121;107;108;94;122;136;150;164;178;192;207;193;179;165;151;137;123;109;124;138;152;166;180;194;208;222;237;223;209;195;181;167;153;139;154;168');
INSERT INTO `mountpark_data` VALUES (9281, 381, 9, 9, 1955000, 353, 367, '109;123;137;151;165;179;193;207;222;208;194;180;166;152;138;124;139;153;167;181;195;209;223;237;252;238;224;210;196;182;168;154;169;183;197;211;225;239;253;267;184;198;212;226;240;254;268;282;296;310;324;338;353;339;325;311;297;283;269;255;241;227;213;199;214;228;242;256;270;284;298;312;326;340;354');
INSERT INTO `mountpark_data` VALUES (9283, 255, 6, 6, 1370000, 283, 269, '426;412;398;384;370;356;342;328;327;341;355;369;383;397;411;396;382;368;354;340;326;312;298;283;297;311;325;339;353;367;381;366;352;338;324;310;296;282;268;253;267;281;295;309;323;337;351;336;322;308;294;280;266;252');
INSERT INTO `mountpark_data` VALUES (9285, 599, 21, 21, 4295000, 545, 581, '119;138;157;176;195;214;233;252;271;290;309;328;347;366;385;403;384;365;346;327;308;289;270;251;213;194;175;156;137;155;174;193;212;231;268;269;288;307;326;345;364;383;402;421;439;420;401;382;344;325;306;287;249;230;211;192;173;229;248;267;286;305;324;343;362;381;400;419;438;457;475;456;437;418;399;380;361;342;323;285;266;247;265;284;303;322;341;360;379;398;417;436;455;474;493;511;492;473;454;435;416;397;378;359;340;321;302;283;529;510;491;472;453;434;415;396;377;358;339;320;301;319;338;357;376;395;414;433;452;471;490;509;528;547;546;527;508;489;470;451;432;413;394;375;356;337;355;374;393;412;431;450;469;488;507;526;545;564;601;582;563;544;525;506;392');
INSERT INTO `mountpark_data` VALUES (9286, 398, 11, 11, 2345000, 362, 380, '67;85;103;121;139;157;176;158;140;122;104;86;105;123;141;159;177;195;213;250;249;267;285;303;321;339;358;340;322;304;286;268;232;214;196;178;160;142;124;143;161;179;197;215;233;251;269;287;305;323;341;359;377;396;378;360;342;324;306;288;270;252;234;216;198;180;162;181;199;343;362;344;326;308;290;272;254;236;218;200;219;237;255;273;291;309;327;345');
INSERT INTO `mountpark_data` VALUES (9287, 653, 7, 7, 1565000, 617, 635, '396;415;434;453;472;491;510;529;547;528;509;490;471;452;433;414;432;451;470;489;508;527;546;564;545;526;507;488;469;450;468;505;506;525;544;563;582;601;619;600;581;562;543;524;486;504;523;542;561;580;599;618;637;655;636;617;598;579;560;541');
INSERT INTO `mountpark_data` VALUES (9288, 595, 20, 20, 4100000, 559, 577, '158;176;194;212;230;248;266;284;302;339;338;356;375;357;321;303;285;267;249;231;213;195;177;196;214;232;250;268;286;322;340;358;376;394;413;431;449;467;485;503;521;395;377;359;341;323;305;287;269;251;233;215;234;252;270;288;342;360;378;396;414;432;450;468;486;504;522;540;343;361;379;397;415;433;451;469;505;523;541;559;506;488;470;452;434;416;398;380;362;344;307;289;271;253;272;290;308;326;524;542;560;578;597;579;561;543;525;507;489;471;453;435;417;399;381;345;327;309;291;310;328;346;364;382;400;418;436;454;472;490;508;527;509;491;473;455;437;419;401;383;365;347;329;420;438;456;474;492;510;529;511;493;475;457');
INSERT INTO `mountpark_data` VALUES (9289, 561, 14, 14, 2930000, 525, 543, '251;269;287;305;323;341;359;377;395;413;431;449;468;450;432;414;396;378;360;342;324;306;288;270;289;307;325;343;361;379;397;415;433;451;469;506;488;470;452;434;416;398;380;362;344;326;308;327;345;381;399;417;435;453;471;489;507;525;544;526;508;490;472;454;436;418;400;382;364;346;365;383;401;419;437;455;473;491;509;527;545;563;582;564;546;528;510;492;474;456;438;420;402;384;403;421;439;457;475;493;511;529;547;584;602;601;620;566;548;530;512;494;476;458;440');
INSERT INTO `mountpark_data` VALUES (9291, 624, 11, 11, 2345000, 586, 605, '344;362;380;398;416;434;452;470;488;506;524;542;561;543;525;507;489;471;453;435;417;399;381;382;400;418;436;454;472;490;508;526;544;562;580;599;581;563;545;527;509;491;473;455;437;419;401;420;438;456;474;492;510;528;546;564;582;600;618;637;619;601;602;584;547;529;511;493;475;457;439;458;476;494;512;530;548;566;620;638;656;585;567;549;568;586');
INSERT INTO `mountpark_data` VALUES (9292, 635, 13, 13, 2735000, 599, 617, '305;323;341;359;377;395;413;431;449;467;485;504;486;468;450;432;414;396;378;360;342;324;343;361;379;397;415;433;451;469;487;505;523;542;524;506;488;470;452;434;416;398;380;362;381;399;417;435;453;471;489;507;525;543;561;580;562;544;526;508;490;472;454;436;418;400;419;437;455;473;491;509;527;545;563;581;599;618;600;582;564;546;528;510;492;474;456;438;457;475;493;511;529;547;565;583;601;619;637;656;638;620;602;584;566;548;530;512;494');
INSERT INTO `mountpark_data` VALUES (9467, 236, 2, 2, 590000, 206, 221, '132;146;160;175;190;161;147;162;176;205;191;177;192;206');
INSERT INTO `mountpark_data` VALUES (9727, 366, 12, 12, 2540000, 338, 352, '107;121;135;149;178;164;150;136;122;137;151;165;179;193;152;166;180;194;208;222;236;250;264;278;293;279;265;251;237;223;209;195;181;167;182;196;210;224;238;252;266;280;294;308;323;309;295;281;267;253;239;225;211;226;240;254;268;282;296;310;324;338;353;339;325;311;297;283;269;255;241;227;242;256;270;284;298;312;326;340;354;368;383;369;355;341;327;313;299;285;271');
INSERT INTO `mountpark_data` VALUES (10616, 372, 15, 15, 3125000, 342, 357, '384;370;356;342;328;314;300;286;272;258;243;257;271;285;299;313;327;341;355;369;383;368;354;340;326;312;298;284;270;256;242;228;213;227;241;255;269;283;297;311;325;339;353;338;324;310;296;282;268;254;240;226;212;198;183;197;211;225;239;253;267;281;295;309;323;308;294;280;266;252;238;224;210;196;182;168;153;167;181;195;209;223;237;251;265;279;293;278;264;250;236;222;208;194;180;166;152;138;123;137;151;165;179;164;149;134;120;106;135;150;136;122;108;93;107;121');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Author` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Date` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (0, 'Testing Phase', 'Scruff', '17-12-2018', 'Today the server has officially entered beta testing, which will last approximately 2 weeks (might be longer depending on how many bugs will be found). After this phase is over the game will be wiped and the game will officially launch. These two weeks are split into two; the first week will be at a low xp rate to test if the current xp rate and drop rate are good, the second week these rates will be increased so end-game content can be tested. Bugs are supposed to be posted in Discord in the #bug-report channel.');

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account` int(11) NOT NULL,
  `tokens` int(11) NOT NULL DEFAULT 0,
  `groupe` int(11) NOT NULL DEFAULT -1,
  `sexe` tinyint(4) NOT NULL,
  `class` smallint(6) NOT NULL,
  `color1` int(11) NOT NULL,
  `color2` int(11) NOT NULL,
  `color3` int(11) NOT NULL,
  `kamas` bigint(11) NOT NULL,
  `spellboost` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `energy` int(11) NOT NULL DEFAULT 10000,
  `level` int(11) NOT NULL,
  `xp` bigint(32) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL,
  `gfx` int(11) NOT NULL,
  `alignement` int(11) NOT NULL DEFAULT 0,
  `honor` int(11) NOT NULL DEFAULT 0,
  `deshonor` int(11) NOT NULL DEFAULT 0,
  `alvl` int(11) NOT NULL DEFAULT 0 COMMENT 'Niveau alignement',
  `order` int(11) NOT NULL DEFAULT 0,
  `alignlvl` int(11) NOT NULL DEFAULT 0,
  `vitalite` int(11) NOT NULL DEFAULT 0,
  `force` int(11) NOT NULL DEFAULT 0,
  `sagesse` int(11) NOT NULL DEFAULT 0,
  `intelligence` int(11) NOT NULL DEFAULT 0,
  `chance` int(11) NOT NULL DEFAULT 0,
  `agilite` int(11) NOT NULL DEFAULT 0,
  `seeFriend` tinyint(4) NOT NULL DEFAULT 1,
  `seeAlign` tinyint(4) NOT NULL DEFAULT 0,
  `seeSeller` tinyint(4) NOT NULL DEFAULT 0,
  `canaux` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '*#%!pi$:?',
  `map` int(11) NOT NULL,
  `cell` int(11) NOT NULL,
  `pdvper` int(11) NOT NULL DEFAULT 100,
  `spells` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `objets` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `storeObjets` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `savepos` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '10298,314',
  `zaaps` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jobs` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `mountxpgive` int(11) NOT NULL DEFAULT 0,
  `mount` int(11) NOT NULL DEFAULT -1,
  `title` int(11) NOT NULL DEFAULT 0,
  `wife` int(1) NOT NULL DEFAULT 0,
  `morphMode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `emotes` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `prison` bigint(255) NOT NULL DEFAULT 0,
  `server` int(11) NOT NULL,
  `logged` int(5) NULL DEFAULT 0,
  `allTitle` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parcho` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timeDeblo` bigint(255) NULL DEFAULT NULL,
  `timeAstrub` bigint(255) NULL DEFAULT NULL,
  `noall` tinyint(4) NOT NULL DEFAULT 0,
  `deadInformation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0,0,0,0',
  `deathCount` int(11) NOT NULL DEFAULT 0,
  `totalKills` int(11) NOT NULL DEFAULT 0,
  `revive` int(11) NOT NULL DEFAULT 0,
  `apExo` int(11) NOT NULL DEFAULT -2,
  `mpExo` int(11) NOT NULL DEFAULT -2,
  `raExo` int(11) NOT NULL DEFAULT -2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (1, 'Scruffo', 1, 500, 1, 1, 11, -1, -1, -1, 9137824, 5, 0, 1000, 200, 7638575504, 100, 111, 1, 0, 0, 1, 0, 0, 1990, 2, 4, 2, 0, 0, 1, 1, 0, '%!p$:?^#i*', 9270, 323, 100, '1;1;_,2;1;_,6;1;_,521;1;_,9;1;l,10;6;_,11;3;e,12;1;c,780;1;_,269;1;_,13;1;_,270;1;_,15;1;d,16;1;_,529;1;_,17;1;_,20;1;_,1047;1;_,25;1;_,284;1;_,1054;1;_,31;6;b,34;1;_,547;1;_,35;1;_,36;1;_,37;1;_,38;1;_,39;1;_,40;1;_,557;1;_,1071;1;_,1074;1;_,51;1;h,52;1;_,60;1;_,65;1;_,68;1;_,72;1;_,73;1;_,587;1;_,79;1;_,80;6;_,81;1;_,82;1;_,83;6;f,84;6;_,85;1;_,89;1;j,346;1;_,90;1;_,347;1;_,1115;1;_,1117;1;o,349;1;_,350;1;_,1118;1;_,99;1;_,100;6;_,102;1;_,106;1;_,108;1;_,364;1;_,365;1;_,366;1;_,367;1;_,368;1;_,369;1;_,113;5;_,370;1;_,115;1;k,373;1;_,1911;1;_,122;1;_,126;1;i,127;1;_,129;1;m,130;1;_,133;1;_,390;1;_,143;1;_,145;6;_,146;1;_,149;1;_,919;1;_,410;1;_,411;1;_,412;1;_,413;5;n,414;1;_,416;1;_,418;1;_,163;1;g,420;1;_,422;1;_,423;1;_,167;1;_,425;1;_,427;1;_,428;1;_,3500;1;_,3501;1;_,431;1;_,432;1;_,433;1;_,434;1;_,435;1;_,436;1;_,437;1;_,693;1;_,181;1;_,949;1;_,438;1;_,182;4;_,183;1;_,439;1;_,440;1;_,696;1;_,441;1;_,442;1;_,443;1;_,187;6;_,444;1;_,188;1;_,445;1;_,189;1;_,446;1;_,190;1;_,447;6;_,191;1;_,448;1;_,192;1;_,449;1;_,450;1;_,196;6;_,197;1;_,200;1;_,206;1;_,463;1;_,465;1;_,209;1;_,466;1;_,2003;6;_,219;1;_,476;1;_,477;1;_,222;1;_,479;1;_,484;1;_,741;1;_,485;1;_,1510;1;_,231;1;_,487;1;_,1006;1;_,1007;1;_,240;1;_,1008;1;_,241;1;_,1009;1;_,1011;1;_,2037;1;_,759;1;_,760;1;_,251;1;_', '11520|11521|11522|11523|11779|11524|11525|11788|11552|11809|3883|3884|11052|11053|11821|11054|11055|11056|11057|11058|2611|11059|11827|11060|11061|11829|11062|11063|11064|11836|11839|11840|11841|11842|11844|2886|11846|11848|11344|6739|11859|11093|11861|11862|11863|11098|11866|11867|11101|11869|11102|11870|11103|11616|11105|11106|11109|11111|11903|11136|11904|11905|11138|11906|11907|11908|11141|11909|11910|11143|11911|11145|11913|11146|11658|11403|11659|11660|11661|11150|11662|11151|11152|11664|11153|11665|11154|11666|11155|11667|11156|11157|11925|11670|11671|11927|11160|11672|11673|11929|11674|11675|11182|11183|11184|11952|11186|11187|11188|11969|11714|11717|2246|10189|10190|11988|11990|11991|11736|11993|11742|11743|10999|', '', '7336,197', '8125,8163,10643', '27,100000000;15,0;18,10000000;64,1100000;63,1000000;45,10000000', 0, -12, 12, 0, '0;0', '0;1', 0, 2, 0, '11,10,13,14,12', '118,2;119,0;123,0;124,4;125,0;126,2', 0, NULL, 0, '0,1567858187924,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (2, 'Hysteria', 16, 5, -1, 1, 9, 16777215, 16777215, 16777215, 5285, 7, 46, 10000, 33, 875711, 100, 91, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 1, 0, 0, '*#%!p$:?', 10155, 210, 100, '161;4;b,162;1;j,163;1;f,164;1;d,165;5;e,167;1;h,168;1;i,169;3;c,170;1;k,171;1;_,172;4;g', '2|1218|3|1219|4|1220|5|6|7|8|1032|1288|1033|1034|1035|1036|1037|1102|1103|1295|1233|1239|1240|1241|1305|1369|1242|1370|1374|1375|1312|1257|1324|1075|1267|1076|1077|1078|1206|1079|1080|1081|1082|1276|1277|1278|', '', '6954,238', '', '', 0, -1, 0, 0, '0;0', '0;1;19', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (4, 'Scruffle', 13, 5, -1, 0, 2, 5875933, 13953270, -1, 21377, 0, 20, 10000, 53, 7084528, 100, 20, 0, 0, 0, 0, 0, 0, 0, 170, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 7412, 178, 100, '33;5;b,34;4;j,35;5;h,37;1;l,38;4;i,3500;1;_,21;1;_,22;1;f,23;5;d,24;1;n,25;1;m,26;1;g,27;5;e,28;1;_,30;1;c', '385|386|518|519|520|1544|392|521|1545|522|1546|14|1550|15|1551|16|17|1554|1555|404|1556|1557|406|1558|407|1559|1560|1562|539|28|540|29|415|1569|418|546|40|425|428|49|55|62|67|964|965|455|456|457|977|978|474|1498|475|476|477|1501|478|1502|479|480|481|482|1508|1511|360|1512|361|362|363|364|1523|1526|11126|504|511|', '', '7411,311', '7411,9454,951,528,935,1242,6954,2191', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (5, 'Scrufflina', 14, 5, -1, 1, 8, 5615842, 12837876, -1, 21049, 5, 25, 10000, 52, 6578459, 100, 81, 0, 0, 0, 0, 0, 0, 0, 165, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 7979, 37, 100, '141;5;c,142;5;d,143;5;b,144;5;e,145;1;k,146;1;j,147;1;f,148;1;h,150;1;m,151;1;n,152;1;_,153;4;g,154;1;l,155;1;_,1117;1;o', '514|387|523|1547|524|525|526|1552|18|19|20|21|411|30|32|1570|547|420|548|41|42|426|50|437|438|958|63|447|959|64|960|458|459|979|1503|1504|993|1505|483|484|485|486|487|488|489|490|491|1515|366|367|368|369|370|371|1527|505|506|507|1531|1532|', '', '7411,311', '7411,9454,951,528,935,1242,6954,2191', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (6, 'Smurfette', 15, 5, -1, 1, 1, 6602726, 10855845, 12707574, 21512, 3, 21, 10000, 54, 7663141, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, 0, 0, 1, 0, 0, '*#%!pi$:?', 7991, 175, 100, '1;5;e,2;1;m,3;1;b,4;1;h,5;1;j,6;5;d,8;1;_,9;1;n,12;1;_,14;5;g,16;1;_,17;5;c,18;5;f,19;1;o,20;1;i', '388|1541|393|1548|527|528|401|529|403|22|23|536|537|1561|1566|31|1567|33|417|34|35|419|1571|423|43|44|45|432|51|436|56|442|443|60|65|961|453|460|461|462|463|980|981|982|994|1506|1509|358|492|493|1517|494|495|1519|496|1520|497|498|499|372|500|1524|373|501|375|376|377|508|509|1533|382|1534|383|', '', '7411,311', '7411,9454,951,528,935,1242,6954,2191,8125', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (7, 'Probe', 17, 0, -1, 1, 2, 13762571, 16777215, 16044427, 3741, 7, 16, 10000, 31, 742024, 100, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 0, 0, 1, 0, 0, '*#%!p$:?i', 10179, 442, 100, '34;1;f,35;5;g,21;1;b,37;1;_,22;1;j,23;1;i,24;1;_,26;1;m,27;5;l,28;3;k,30;1;_', '256|129|257|130|258|131|259|132|260|133|141|147|285|550|554|951|317|318|319|320|69|1094|71|967|1095|72|968|1096|74|77|78|81|82|338|83|84|1108|85|86|343|347|1115|96|98|99|100|356|101|106|240|113|241|1012|121|254|255|', '', '10284,372', '7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (8, 'Lanathel', 19, 0, -1, 1, 11, 16777215, 15466496, -1, 3291, 2, 0, 10000, 23, 281140, 100, 111, 0, 0, 0, 0, 0, 0, 220, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!p$:?i', 6946, 328, 100, '432;5;b,449;1;k,433;1;r,434;5;i,436;1;c,437;1;q,439;1;d,444;1;j,431;1;p', '768|769|770|773|774|775|776|905|906|907|784|785|849|786|787|788|916|789|917|1494|1496|794|795|799|800|870|871|872|873|172|173|174|817|818|180|181|182|183|184|763|188|189|190|894|191|895|', '', '7336,197', '10297,10317,6954,7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (9, 'Rainred', 20, 0, -1, 1, 1, 1411909, 8935693, 15734310, 1262, 4, 0, 10000, 18, 125502, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 15, 40, 0, 0, 1, 0, 0, '*#%!p$:?i', 10340, 71, 100, '17;3;d,1;1;j,2;1;i,18;1;_,3;1;e,4;1;o,6;1;c,9;5;b', '208|209|1138|212|213|214|215|1144|217|1145|1130|', '210,22|207,69|', '10297,199', '', '26,0', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (10, 'Mrs-Sacrifice', 21, 0, -1, 1, 10, 16777215, 16715279, 16103799, 2165, 10, 20, 10000, 31, 688064, 100, 101, 0, 0, 0, 0, 0, 0, 0, 115, 0, 0, 0, 0, 1, 0, 0, '*#!pi$:?%', 10179, 442, 100, '192;1;_,193;1;i,195;1;_,197;1;_,181;1;_,198;1;_,182;1;j,183;5;b,199;1;_,200;1;c,189;5;k', '321|322|323|324|261|325|262|263|264|265|969|1097|266|267|268|269|339|1109|1110|344|348|1116|286|287|224|288|352|289|226|290|227|291|228|292|293|242|243|244|1013|1014|952|953|', '', '10279,254', '10297,7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (11, 'Deffendo', 22, 0, -1, 1, 1, 11923750, 10209070, 16777215, 1745, 9, 15, 10000, 30, 686499, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 115, 0, 0, 1, 0, 0, '*#%!pi$:?', 10179, 442, 96, '17;1;f,1;1;j,2;1;_,18;1;k,3;1;b,4;1;_,20;1;_,6;5;i,9;5;c,14;1;l', '326|327|328|329|330|970|1098|971|270|271|272|273|274|275|276|340|277|1111|1112|345|349|1117|294|295|296|297|298|299|555|300|301|302|303|304|245|246|247|1015|248|249|954|', '', '10300,323', '7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (12, 'Maso', 23, 0, -1, 1, 11, 10801126, 16777215, -1, 1866, 9, 15, 10000, 30, 678903, 100, 111, 0, 0, 0, 0, 0, 0, 260, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10179, 442, 98, '432;5;b,449;1;n,433;1;k,434;1;f,436;1;c,437;1;j,439;1;d,443;1;_,444;1;m,431;5;i', '331|1099|332|972|333|334|335|336|337|341|278|279|280|281|1113|282|283|350|1118|551|236|556|305|306|307|308|309|310|311|312|1016|313|1017|250|314|251|315|955|252|956|', '', '10296,243', '7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (13, 'Phoenix', 18, 5, -1, 0, 9, -1, -1, -1, 1156, 0, 1, 10000, 44, 3176418, 100, 90, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 148, 1, 0, 0, '*#%!p$:?i', 6946, 297, 100, '161;1;i,162;5;m,163;1;j,164;3;d,165;1;h,166;5;k,167;1;_,168;2;g,169;5;b,170;1;_,171;1;_,172;4;l,173;3;c', '1281|1286|1291|1292|782|1300|1301|792|1308|1317|1318|815|1328|561|562|563|564|565|821|566|1334|567|569|826|571|572|828|573|574|830|576|832|579|581|585|841|587|843|588|589|845|590|847|592|593|594|595|851|597|853|598|854|599|601|860|605|1373|862|608|864|609|866|611|868|613|875|632|633|634|636|892|638|640|641|897|645|901|646|903|649|652|653|654|656|920|923|1179|924|925|1181|1183|1185|1187|1189|1191|1193|1196|1198|1200|1202|1226|722|723|1235|724|725|726|1245|1260|1272|1273|765|766|', '', '7411,311', '6954,7411', '', 0, -1, 0, 0, '0;0', '0;1;19', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (14, 'Helen', 24, 0, -1, 0, 7, 11340358, 1668046, 16318726, 6901, 1, 1, 10000, 38, 1424486, 100, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 0, 0, 1, 0, 0, '*#%!pi$:?', 2079, 183, 0, '128;1;c,130;5;k,131;1;_,132;1;l,133;1;m,121;1;d,122;1;f,123;1;j,124;5;e,125;4;b,126;5;g,127;1;i', '899|778|660|661|926|927|928|929|930|805|1573|806|934|680|808|681|682|1578|683|684|940|1580|941|1581|1582|946|948|1594|1595|1596|1597|1598|1599|1600|706|707|708|836|709|1605|710|1606|711|1607|712|1615|1616|1617|1618|1619|1620|857|989|990|745|1001|746|1002|747|748|749|1005|750|1006|751|1007|624|752|625|626|1010|627|885|886|887|', '', '7361,207', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (15, 'Zwaard', 25, 0, -1, 0, 8, 16015114, 15622127, 5182478, 2869, 13, 1, 10000, 24, 349060, 100, 80, 0, 0, 0, 0, 0, 0, 0, 107, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 1856, 161, 100, '144;1;f,145;1;e,146;1;g,147;1;i,148;1;j,154;1;k,141;5;c,142;1;d,143;1;b', '643|837|713|714|779|716|717|718|719|913|662|663|858|809|810|811|812|685|813|686|687|688|689|753|690|754|691|755|628|692|756|629|693|757|630|758|759|760|888|761|889|890|', '', '7427,282', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (16, 'Resis', 26, 0, -1, 0, 12, 1654479, 2755678, 8779164, 2603, 14, 0, 10000, 25, 392136, 100, 120, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 6961, 248, 100, '688;5;f,689;1;_,690;1;e,691;1;_,692;1;c,693;1;g,694;1;i,686;1;b,687;1;d', '835|909|728|856|665|729|666|730|667|731|668|732|669|733|670|734|671|735|802|803|615|616|617|618|619|877|878|695|823|696|697|698|699|700|', '', '8035,384', '8037', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (17, 'Afstand', 27, 0, -1, 0, 9, 11578775, 3025780, 7853527, 8717, 1, 1, 10000, 38, 1413405, 100, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 0, 0, 1, 0, 0, '*#%!pi$:?', 2079, 381, 0, '161;1;b,162;1;l,163;5;i,164;1;d,165;5;j,166;5;e,167;1;_,168;1;_,169;1;c,170;1;_,171;1;_,172;4;k', '910|911|912|658|659|919|922|672|673|674|675|676|804|932|677|933|678|679|807|935|1576|1577|939|944|1584|1585|1586|1587|1588|1589|1590|1591|824|1592|1593|701|702|703|704|705|1602|1603|1604|838|839|1609|1610|715|1611|1612|1613|1614|736|737|738|739|740|741|997|742|998|743|999|744|1000|620|1004|621|622|623|879|880|881|1009|882|883|884|', '', '7378,368', '7411', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (18, 'Sympatico', 28, 5, -1, 0, 8, 16777215, 16777215, 16777215, 4762, 6, 46, 10000, 33, 880145, 100, 80, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 1, 0, 0, '*#%!p$:?', 10155, 251, 100, '144;1;_,145;1;_,146;1;e,147;1;f,148;1;g,150;1;i,151;1;_,154;1;_,141;5;c,142;4;d,143;5;b', '1024|1216|1025|1217|1026|1027|1283|1028|1284|1029|1285|1030|1031|1101|1231|1296|1238|1367|1304|1368|1247|1311|1256|1065|1066|1323|1071|1072|1073|1074|1266|1331|1207|1019|1275|1020|1021|1022|1214|1023|1215|', '', '6954,238', '7411', '', 0, -1, 0, 0, '0;0', '0;1;19', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (19, 'Bamboo', 29, 5, -1, 0, 12, 16777215, 16777215, 16777215, 4390, 6, 52, 10000, 33, 870046, 100, 120, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 0, 1, 0, 0, '*#%!p$:?', 10155, 210, 100, '688;5;b,689;1;f,690;1;e,691;1;_,692;1;j,693;1;h,694;5;c,695;1;_,696;1;_,686;4;g,687;1;d', '1280|1221|1222|1289|1038|1039|1040|1104|1041|1105|1297|1042|1106|1234|1043|1044|1045|1046|1047|1048|1049|1050|1306|1051|1243|1371|1052|1313|1250|1314|1258|1325|1268|1332|1208|1209|1210|1083|1084|1085|1086|1087|1279|', '', '6954,238', '', '', 0, -1, 0, 0, '0;0', '0;1;19', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (20, 'Svetluska', 30, 5, -1, 1, 7, 16777215, 16777215, 16777215, 4842, 6, 52, 10000, 33, 870046, 100, 71, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 0, 1, 0, 0, '*#%!p$:?', 10155, 210, 100, '128;1;c,130;4;k,131;1;j,132;1;_,121;1;d,122;1;i,123;1;_,124;1;g,125;5;b,126;5;e,127;1;f', '1088|1089|1090|1091|1092|1223|1224|1225|1290|1298|1299|1307|1244|1372|1053|1054|1055|1056|1057|1058|1059|1315|1060|1316|1061|1062|1063|1067|1259|1068|1069|1326|1327|1269|1333|1270|1271|1211|', '', '6954,238', '', '', 0, -1, 0, 0, '0;0', '0;1;19', 0, 2, 0, NULL, '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (21, 'Buttocks', 31, 0, -1, 0, 9, 368308, 4587128, 9210061, 0, 0, 0, 10000, 1, 0, 100, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10292, 284, 100, '161;1;b,164;1;d,169;1;c', '', '', '10292,284', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (22, 'Sunshine', 31, 0, -1, 1, 8, 11630991, 4690900, 13226538, 3107, 4, 5, 10000, 21, 207279, 100, 81, 0, 0, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 1, 0, 0, '*#%!p$:?', 10362, 320, 100, '144;1;e,145;1;f,146;1;_,147;1;_,148;1;_,154;1;_,141;5;c,142;4;d,143;1;b', '1344|1408|1409|1410|1666|1411|1412|1349|1413|1350|1351|1352|1353|1354|1163|1355|1164|1165|1166|1623|1624|1625|1626|1436|1437|1438|1439|1440|1377|1441|1378|1379|1380|1381|1382|1383|1384|1385|1642|1643|1455|1140|1141|1342|1406|1407|', '', '10294,280', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (23, 'Thunder', 32, 0, -1, 0, 5, 4681951, 15560304, 14850003, 2878, 3, 0, 10000, 20, 199163, 100, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 0, 0, 1, 0, 0, '*#%!p$:?', 10362, 320, 100, '81;1;c,82;1;b,83;1;d,84;1;f,100;4;e,88;1;_,92;5;i,93;1;_', '1667|1668|1414|1415|1416|1417|1418|1419|1420|1421|1422|1423|1424|1425|1170|1442|1443|1444|1445|1446|1447|1448|1456|1356|1357|1358|1359|1360|1361|1622|1627|1628|1629|1129|1386|1131|1387|1388|1644|1389|1645|1390|1646|1391|1392|1393|1394|1395|1396|1142|1654|1143|1655|', '', '10298,300', '', '2,0', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (24, 'Protein', 33, 0, -1, 0, 2, 12977412, 410746, 8674089, 1131, 1, 0, 10000, 8, 11695, 100, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 0, 0, 1, 0, 0, '*#%!pi$:?', 10362, 320, 100, '34;1;b,21;4;c,22;1;e,23;1;d,26;1;_', '1632|1634|1635|1636|1669|1670|1671|1672|1673|1674|1675|1647|1648|1173|1657|1658|1630|1631|', '', '10284,372', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (25, 'Deadeye', 34, 0, -1, 0, 4, 7204, 11183001, 11559378, 1193, 1, 0, 10000, 8, 11669, 100, 40, 0, 0, 0, 0, 0, 0, 0, 35, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10362, 320, 100, '65;1;d,66;1;k,68;1;e,72;1;c,61;4;b', '1664|1633|1637|1638|1639|1640|1676|1677|1678|1679|1680|1649|1681|1650|1651|1652|1659|1660|1661|1662|1663|', '', '10285,263', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (26, 'Mccloud', 33, 0, -1, 0, 9, 16777215, 16777215, 16714765, 6656, 9, 1, 10000, 30, 646625, 100, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 122, 1, 0, 0, '*#%!pi$:?', 6954, 341, 100, '161;1;n,162;1;j,418;1;d,163;1;m,164;1;c,165;1;l,167;1;k,168;1;o,169;5;b,170;1;h,172;5;i', '1153|1155|1157|1158|1159|1161|1426|1427|1428|1429|1430|1431|1432|1433|1321|1449|1450|1452|1453|1454|1204|1465|1341|1469|1470|1343|1472|1345|1473|1346|1474|1228|1485|1487|1489|1362|1363|1491|1364|1365|1252|1253|1254|1262|1264|1397|1398|1399|1400|1401|1402|1403|1404|1149|1150|1151|', '', '6954,238', '10317,10297', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (27, 'Skeletor', 33, 0, -1, 0, 4, 0, 14286859, 12976138, 128, 3, 0, 10000, 4, 1563, 100, 40, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10297, 300, 100, '65;1;d,66;1;_,72;1;c,61;1;b', '1697|1698|1700|', '', '10285,263', '10317', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (28, 'Test', 12, 140, -1, 1, 4, -1, -1, -1, 101487, 88, 2, 10000, 200, 7460186568, 100, 41, 0, 0, 0, 0, 0, 0, 0, 321, 0, 0, 0, 203, 1, 0, 0, '*#%!p$:?i', 2023, 432, 100, '64;1;_,65;6;d,66;1;h,67;4;f,68;1;_,69;1;_,70;1;_,71;6;g,72;6;c,73;6;i,74;6;e,75;1;_,76;1;_,77;1;_,78;1;_,79;6;j,80;1;_,1904;1;_,60;1;o,61;6;b,62;1;_,63;1;_', '11553|11894|11895|10319|', '', '10298,314', '', '24,0', 0, -1, 13, 0, '0;0', '', 0, 2, 0, '13', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (29, 'Hugrod', 12, 0, 9, 1, 1, -1, -1, -1, 51468, 64, 3, 8000, 200, 7410365795, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 398, 1, 0, 0, '*#%!pi$:?', 8845, 135, 100, '1;1;f,2;1;_,3;6;m,4;1;_,5;1;_,6;6;_,7;1;_,8;1;_,9;6;h,10;6;d,11;1;n,12;1;e,13;1;b,14;1;j,15;1;c,16;1;i,17;1;g,18;1;k,19;1;_,20;1;l,28;6;_,31;6;_,35;6;_,1901;6;_,188;6;_', '11113|11116|1709|11118|1839|11119|2031|1840|1841|1842|11094|441|11130|11162|', '', '10300,323', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (30, 'Vortol', 12, 0, -1, 0, 5, -1, -1, -1, 791, 34, 0, 10000, 200, 7407238851, 100, 50, 0, 0, 0, 0, 0, 0, 0, 175, 133, 0, 128, 145, 1, 0, 0, '*#%!pi$:?', 2023, 299, 100, '96;6;_,97;6;_,98;6;d,99;1;_,100;6;_,81;6;b,1905;1;_,82;1;_,83;6;_,84;1;_,85;1;j,86;1;_,87;6;_,88;1;_,89;6;c,90;6;e,91;1;o,92;6;_,93;6;m,94;1;_,95;1;n', '', '', '10298,300', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (37, 'Bravralunudoth', 12, 0, -1, 0, 10, -1, -1, -1, 0, 169, 995, 10000, 200, 7407232000, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 552, 413, 100, '192;1;_,193;6;d,194;1;_,195;1;_,196;1;_,197;6;e,198;1;_,199;1;_,200;1;c,181;1;_,182;1;_,1910;1;_,183;1;b,184;1;_,185;1;_,186;1;_,187;1;_,188;1;_,189;1;_,190;1;_,191;1;_', '', '', '10279,254', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (40, 'Asars', 13, 0, -1, 0, 6, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10276, 296, 100, '102;1;b,103;1;c,105;1;d', '', '', '10276,296', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (34, 'Kukorvasirnatiul', 1, 0, -1, 0, 1, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10300, 323, 100, '17;1;d,3;1;b,6;1;c', '', '', '10298,314', '', '', 0, -1, 0, 0, '0;0', '', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (38, 'Vell', 12, 0, -1, 0, 12, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10289, 236, 100, '692;1;c,686;1;b,687;1;d', '', '', '10289,236', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (39, 'Darabat', 13, 0, -1, 0, 11, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10296, 243, 100, '432;1;b,434;1;d,431;1;c', '', '', '10296,243', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (36, 'Scrufflepuff', 1, 0, -1, 0, 9, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10292, 284, 100, '161;1;b,164;1;d,169;1;c', '', '', '10292,284', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (41, 'Athamakariol', 13, 0, -1, 1, 1, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10300, 323, 100, '17;1;d,3;1;b,6;1;c', '', '', '10300,323', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);
INSERT INTO `players` VALUES (42, 'Unapudacorvath', 13, 0, -1, 0, 2, -1, -1, -1, 0, 0, 0, 10000, 1, 0, 100, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '*#%!pi$:?', 10284, 372, 100, '34;1;b,21;1;c,23;1;d', '', '', '10284,372', '', '', 0, -1, 0, 0, '0;0', '0;1', 0, 2, 0, '', '118,0;119,0;123,0;124,0;125,0;126,0', 0, NULL, 0, '0,0,0,0', 0, 0, 0, -2, -2, -2);

-- ----------------------------
-- Table structure for pubs
-- ----------------------------
DROP TABLE IF EXISTS `pubs`;
CREATE TABLE `pubs`  (
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `server` int(11) NOT NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `key` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `population` int(11) NULL DEFAULT 0,
  `isSubscriberServer` int(11) NULL DEFAULT 1,
  `uptime` bigint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servers
-- ----------------------------
INSERT INTO `servers` VALUES (2, 'Rushu', 'rushu', 0, 0, 1567958618538);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `Id` int(11) NOT NULL,
  `rank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(10000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'Founder, Game Developer', 'Scruff', '19 Year old Dutch university student studying Computing Science, absolute nerd with 5 years of experience programming in Java and 3 years of experience developing Dofus servers. Also worked on NDS romhacking with Hex and ARM9 assembly.');

-- ----------------------------
-- Table structure for stakes
-- ----------------------------
DROP TABLE IF EXISTS `stakes`;
CREATE TABLE `stakes`  (
  `winnerclass` int(11) NULL DEFAULT NULL,
  `winnerlevel` int(11) NULL DEFAULT NULL,
  `loserclass` int(11) NULL DEFAULT NULL,
  `loserlevel` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for subarea_data
-- ----------------------------
DROP TABLE IF EXISTS `subarea_data`;
CREATE TABLE `subarea_data`  (
  `id` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subarea_data
-- ----------------------------
INSERT INTO `subarea_data` VALUES (0, 0, 'Amakna');
INSERT INTO `subarea_data` VALUES (1, 0, 'Madrestam Harbour');
INSERT INTO `subarea_data` VALUES (2, 0, 'Crackler Mountain');
INSERT INTO `subarea_data` VALUES (3, 0, 'The Ingalsses\' Fields');
INSERT INTO `subarea_data` VALUES (4, 0, 'The Amakna Forest');
INSERT INTO `subarea_data` VALUES (5, 0, 'Gobball Corner');
INSERT INTO `subarea_data` VALUES (6, 0, 'The Cemetery');
INSERT INTO `subarea_data` VALUES (7, 0, 'The Crypts');
INSERT INTO `subarea_data` VALUES (8, 0, 'The Bwork Camp');
INSERT INTO `subarea_data` VALUES (9, 0, 'The Evil Forest');
INSERT INTO `subarea_data` VALUES (10, 0, 'The Village');
INSERT INTO `subarea_data` VALUES (11, 0, 'Porco Territory');
INSERT INTO `subarea_data` VALUES (12, 0, 'The Jelly Peninsula');
INSERT INTO `subarea_data` VALUES (13, 0, 'The Temple of Feca');
INSERT INTO `subarea_data` VALUES (14, 0, 'The Temple of Osamodas');
INSERT INTO `subarea_data` VALUES (15, 0, 'The Temple of Enutrof');
INSERT INTO `subarea_data` VALUES (16, 0, ' The Temple of Sram');
INSERT INTO `subarea_data` VALUES (17, 0, 'The Temple of Xelor');
INSERT INTO `subarea_data` VALUES (18, 0, 'The Temple of Ecaflip');
INSERT INTO `subarea_data` VALUES (19, 0, 'The Temple of Iop');
INSERT INTO `subarea_data` VALUES (20, 0, 'The Temple of Cra');
INSERT INTO `subarea_data` VALUES (21, 0, 'The Temple of Sadida');
INSERT INTO `subarea_data` VALUES (22, 0, 'Edge of the Evil Forest');
INSERT INTO `subarea_data` VALUES (23, 0, 'The Dreggon Peninsula');
INSERT INTO `subarea_data` VALUES (25, 1, 'Wabbit Tunnels');
INSERT INTO `subarea_data` VALUES (26, 0, 'The Temple of Eniripsa');
INSERT INTO `subarea_data` VALUES (27, 0, 'Asse Coast');
INSERT INTO `subarea_data` VALUES (28, 0, 'Amakna Garrison');
INSERT INTO `subarea_data` VALUES (29, 0, 'Tunnel');
INSERT INTO `subarea_data` VALUES (30, 4, 'The Cradle');
INSERT INTO `subarea_data` VALUES (31, 0, 'The Swamp');
INSERT INTO `subarea_data` VALUES (32, 5, 'Sufokia');
INSERT INTO `subarea_data` VALUES (33, 6, 'Treechnid Forest');
INSERT INTO `subarea_data` VALUES (34, 3, 'Prison');
INSERT INTO `subarea_data` VALUES (35, 0, 'Sufokia Gate');
INSERT INTO `subarea_data` VALUES (37, 7, 'Bonta');
INSERT INTO `subarea_data` VALUES (38, 8, 'Cania Plain');
INSERT INTO `subarea_data` VALUES (39, 0, 'The Rogues\' Hideout');
INSERT INTO `subarea_data` VALUES (41, 0, 'The Temple of Sacrier');
INSERT INTO `subarea_data` VALUES (42, 8, 'Road to Bonta');
INSERT INTO `subarea_data` VALUES (43, 7, 'Fortification of Bonta');
INSERT INTO `subarea_data` VALUES (44, 7, 'Bakers\' Quarter');
INSERT INTO `subarea_data` VALUES (45, 7, 'Militia District');
INSERT INTO `subarea_data` VALUES (46, 7, 'Butchers\' Quarter');
INSERT INTO `subarea_data` VALUES (47, 7, 'Smiths\' Quarter');
INSERT INTO `subarea_data` VALUES (48, 7, 'Lumberjacks\' Quarter');
INSERT INTO `subarea_data` VALUES (49, 7, 'Handymen\'s Quarter');
INSERT INTO `subarea_data` VALUES (50, 7, 'Tailors\' Quarter');
INSERT INTO `subarea_data` VALUES (51, 7, 'Jewellers\' Quarter');
INSERT INTO `subarea_data` VALUES (53, 11, 'Brakmar');
INSERT INTO `subarea_data` VALUES (54, 8, 'Cania Massif');
INSERT INTO `subarea_data` VALUES (55, 8, 'The Crow\'s Domain');
INSERT INTO `subarea_data` VALUES (56, 8, 'Cania Forest');
INSERT INTO `subarea_data` VALUES (57, 12, 'Sidemote Moor');
INSERT INTO `subarea_data` VALUES (59, 8, 'Bonta Cemetery');
INSERT INTO `subarea_data` VALUES (61, 12, 'Cemetery of the Tortured');
INSERT INTO `subarea_data` VALUES (62, 13, 'Dopple Village');
INSERT INTO `subarea_data` VALUES (63, 13, 'Dopple Prism');
INSERT INTO `subarea_data` VALUES (64, 13, 'First Hall of the Prism');
INSERT INTO `subarea_data` VALUES (65, 13, 'Second Hall of the Prism');
INSERT INTO `subarea_data` VALUES (66, 13, 'Third Hall of the Prism');
INSERT INTO `subarea_data` VALUES (67, 13, 'Fourth Hall of the Prism');
INSERT INTO `subarea_data` VALUES (68, 8, 'The Cania Fields');
INSERT INTO `subarea_data` VALUES (69, 8, 'Eltneg Woods');
INSERT INTO `subarea_data` VALUES (70, 8, 'Rocky Plains');
INSERT INTO `subarea_data` VALUES (71, 12, 'Gisgoul, the Devastated Village');
INSERT INTO `subarea_data` VALUES (72, 12, 'Brakmar Frontage');
INSERT INTO `subarea_data` VALUES (73, 7, 'Bonta Sewers');
INSERT INTO `subarea_data` VALUES (74, 13, 'Dopple Training');
INSERT INTO `subarea_data` VALUES (75, 11, 'Brakmar Sewers');
INSERT INTO `subarea_data` VALUES (76, 14, 'Imp Village');
INSERT INTO `subarea_data` VALUES (77, 0, 'The Jellith Dimension');
INSERT INTO `subarea_data` VALUES (78, 0, 'The (Royal) Jellith Dimension');
INSERT INTO `subarea_data` VALUES (79, 14, 'First Platform');
INSERT INTO `subarea_data` VALUES (80, 14, 'Second Platform');
INSERT INTO `subarea_data` VALUES (81, 14, 'Imp Prism');
INSERT INTO `subarea_data` VALUES (82, 4, 'Gobball Dungeon');
INSERT INTO `subarea_data` VALUES (83, 17, 'Tutorial');
INSERT INTO `subarea_data` VALUES (84, 15, 'Trool Fair');
INSERT INTO `subarea_data` VALUES (85, 16, 'Gobball Game');
INSERT INTO `subarea_data` VALUES (86, 15, 'Gladiatrool');
INSERT INTO `subarea_data` VALUES (87, 0, 'Amakna South');
INSERT INTO `subarea_data` VALUES (88, 17, 'Tainela');
INSERT INTO `subarea_data` VALUES (89, 0, 'MDJ');
INSERT INTO `subarea_data` VALUES (91, 0, 'Mysterious Tunnel');
INSERT INTO `subarea_data` VALUES (92, 18, 'Surroundings of Astrub');
INSERT INTO `subarea_data` VALUES (93, 2, 'Moon Beach');
INSERT INTO `subarea_data` VALUES (94, 12, 'Bworker Dungeon');
INSERT INTO `subarea_data` VALUES (95, 18, 'Astrub City');
INSERT INTO `subarea_data` VALUES (96, 18, 'Astrub Mines');
INSERT INTO `subarea_data` VALUES (97, 18, 'Astrub Forest');
INSERT INTO `subarea_data` VALUES (98, 18, 'Astrub Fields');
INSERT INTO `subarea_data` VALUES (99, 18, 'Astrub Tunnel');
INSERT INTO `subarea_data` VALUES (100, 18, 'Astrub Deep Tunnel');
INSERT INTO `subarea_data` VALUES (101, 18, 'Tofu Corner');
INSERT INTO `subarea_data` VALUES (102, 25, 'Cemetery of Heroes');
INSERT INTO `subarea_data` VALUES (103, 0, 'Bandit Territory');
INSERT INTO `subarea_data` VALUES (105, 19, 'Neutral Pandala');
INSERT INTO `subarea_data` VALUES (106, 20, 'Border of Akwadala');
INSERT INTO `subarea_data` VALUES (107, 22, 'Border of Feudala');
INSERT INTO `subarea_data` VALUES (108, 23, 'Border of Aerdala');
INSERT INTO `subarea_data` VALUES (109, 21, 'Border of Terrdala');
INSERT INTO `subarea_data` VALUES (110, 0, 'Amakna Past');
INSERT INTO `subarea_data` VALUES (111, 23, 'Aerdala Gate');
INSERT INTO `subarea_data` VALUES (112, 22, 'Feudala Gate');
INSERT INTO `subarea_data` VALUES (113, 20, 'Akwadala Gate');
INSERT INTO `subarea_data` VALUES (114, 21, 'Terrdala Gate');
INSERT INTO `subarea_data` VALUES (115, 23, 'Aerdala Village');
INSERT INTO `subarea_data` VALUES (116, 22, 'Feudala Village');
INSERT INTO `subarea_data` VALUES (117, 20, 'Akwadala Village');
INSERT INTO `subarea_data` VALUES (118, 21, 'Terrdala Village');
INSERT INTO `subarea_data` VALUES (119, 19, 'Pandala Village');
INSERT INTO `subarea_data` VALUES (120, 23, 'Aerdala Prism');
INSERT INTO `subarea_data` VALUES (121, 22, 'Feudala Prism');
INSERT INTO `subarea_data` VALUES (122, 20, 'Akwadala Prism');
INSERT INTO `subarea_data` VALUES (123, 21, 'Terrdala Prism');
INSERT INTO `subarea_data` VALUES (124, 24, 'Bulb Cavern');
INSERT INTO `subarea_data` VALUES (125, 24, 'Pandikazes\' Hideout - First Platform');
INSERT INTO `subarea_data` VALUES (126, 24, 'Pandikazes\' Hideout - Second Platform');
INSERT INTO `subarea_data` VALUES (127, 24, 'Pandikazes\' Hideout - Third Platform');
INSERT INTO `subarea_data` VALUES (128, 24, 'Pandikazes\' Hideout - Fourth Platform');
INSERT INTO `subarea_data` VALUES (129, 24, 'Pandikazes\' Hideout - Fifth Platform');
INSERT INTO `subarea_data` VALUES (130, 24, 'Pandikazes\' Hideout - Sixth Platform');
INSERT INTO `subarea_data` VALUES (131, 24, 'Pandikazes\' Hideout - Seventh Platform');
INSERT INTO `subarea_data` VALUES (132, 24, 'Pandikazes\' Hideout - Eight Platform');
INSERT INTO `subarea_data` VALUES (133, 24, 'Kitsou Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (134, 24, 'Kitsou Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (135, 24, 'Kitsou Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (136, 24, 'Kitsou Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (137, 24, 'Kitsou Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (138, 24, 'Kitsou Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (139, 24, 'Kitsou Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (140, 24, 'Kitsou Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (141, 24, 'Kitsou Dungeon - Tanukoui\'s Hideout');
INSERT INTO `subarea_data` VALUES (143, 19, 'Pandala Bridge');
INSERT INTO `subarea_data` VALUES (144, 24, 'Firefoux Dungeon');
INSERT INTO `subarea_data` VALUES (145, 24, 'Firefoux Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (146, 24, 'Firefoux Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (147, 24, 'Firefoux Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (148, 24, 'Firefoux Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (149, 24, 'Firefoux Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (150, 24, 'Firefoux Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (151, 24, 'Firefoux Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (152, 19, 'Nolifis Island');
INSERT INTO `subarea_data` VALUES (153, 24, 'Pandikazes\' Hideout - Final Platform');
INSERT INTO `subarea_data` VALUES (154, 43, 'Pig Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (155, 43, 'Pig Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (156, 43, 'Pig Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (157, 43, 'Pig Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (158, 43, 'Pig Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (159, 43, 'Pig Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (161, 1, 'Wabbit Island');
INSERT INTO `subarea_data` VALUES (162, 1, 'Small Wabbit Island');
INSERT INTO `subarea_data` VALUES (163, 1, 'Skeleton Wabbit Island');
INSERT INTO `subarea_data` VALUES (164, 1, 'Wabbit Castle Island');
INSERT INTO `subarea_data` VALUES (165, 2, 'The Deep Moon Jungle');
INSERT INTO `subarea_data` VALUES (166, 2, 'The Road to Moon');
INSERT INTO `subarea_data` VALUES (167, 2, 'The Pirate Boat');
INSERT INTO `subarea_data` VALUES (168, 6, 'Dark Treechnid Forest');
INSERT INTO `subarea_data` VALUES (169, 6, 'Edge of the Treechnid Forest');
INSERT INTO `subarea_data` VALUES (170, 0, 'Scaraleaf Plain');
INSERT INTO `subarea_data` VALUES (171, 19, 'Pandala Forest');
INSERT INTO `subarea_data` VALUES (173, 18, 'Astrub Meadows');
INSERT INTO `subarea_data` VALUES (174, 18, 'Camp of the One-armed Bandits');
INSERT INTO `subarea_data` VALUES (175, 27, 'Treechnid Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (177, 8, 'Blop Meadow');
INSERT INTO `subarea_data` VALUES (178, 8, 'Lousy Pig Plain');
INSERT INTO `subarea_data` VALUES (179, 0, 'Mushd Corner');
INSERT INTO `subarea_data` VALUES (180, 0, 'Amakna Castle');
INSERT INTO `subarea_data` VALUES (181, 0, 'Amakna Castle Dungeon');
INSERT INTO `subarea_data` VALUES (182, 28, 'Breeder Village');
INSERT INTO `subarea_data` VALUES (200, 26, 'The Dragon Pig\'s Maze');
INSERT INTO `subarea_data` VALUES (201, 29, 'Tofu Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (202, 29, 'Tofu Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (203, 29, 'Tofu Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (204, 29, 'Tofu Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (205, 29, 'Tofu Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (206, 29, 'Tofu Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (207, 29, 'Tofu Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (208, 29, 'Tofu Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (209, 30, 'Mintoror Island');
INSERT INTO `subarea_data` VALUES (210, 31, 'Labyrinth of the Minotoror');
INSERT INTO `subarea_data` VALUES (211, 32, 'Lord Crow\'s Library');
INSERT INTO `subarea_data` VALUES (212, 33, 'Canidae Dungeon - Entry');
INSERT INTO `subarea_data` VALUES (213, 33, 'Canidae Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (214, 33, 'Canidae Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (215, 33, 'Canidae Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (216, 33, 'Canidae Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (217, 33, 'Canidae Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (218, 33, 'Canidae Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (219, 33, 'Canidae Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (220, 33, 'Canidae Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (221, 33, 'Canidae Dungeon - Room 9');
INSERT INTO `subarea_data` VALUES (222, 33, 'Canidae Dungeon - Room 10');
INSERT INTO `subarea_data` VALUES (223, 34, 'Koolich Cavern - Room 1');
INSERT INTO `subarea_data` VALUES (224, 34, 'Koolich Cavern - Room 2');
INSERT INTO `subarea_data` VALUES (225, 34, 'Koolich Cavern - Room 3');
INSERT INTO `subarea_data` VALUES (226, 34, 'Koolich Cavern - Room 4');
INSERT INTO `subarea_data` VALUES (227, 34, 'Koolich Cavern - Room 5');
INSERT INTO `subarea_data` VALUES (228, 34, 'Koolich Cavern - Room 6');
INSERT INTO `subarea_data` VALUES (229, 34, 'Koolich Cavern - The Den');
INSERT INTO `subarea_data` VALUES (230, 28, 'Primitive Cemetery');
INSERT INTO `subarea_data` VALUES (231, 28, 'Enchanted Lakes');
INSERT INTO `subarea_data` VALUES (232, 28, 'Nauseating Swamps');
INSERT INTO `subarea_data` VALUES (233, 28, 'Bottomless Swamps');
INSERT INTO `subarea_data` VALUES (234, 28, 'Kaliptus Forest');
INSERT INTO `subarea_data` VALUES (235, 28, 'Wild Dragoturkey Territory');
INSERT INTO `subarea_data` VALUES (236, 36, 'Pet Sanctuary');
INSERT INTO `subarea_data` VALUES (243, 37, 'Crackler Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (244, 37, 'Crackler Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (245, 37, 'Crackler Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (246, 37, 'Crackler Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (247, 37, 'Crackler Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (248, 37, 'Crackler Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (249, 37, 'Crackler Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (250, 37, 'Crackler Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (251, 37, 'Crackler Dungeon - Room 10');
INSERT INTO `subarea_data` VALUES (252, 37, 'Crackler Dungeon - Room 10');
INSERT INTO `subarea_data` VALUES (253, 28, 'Wild Canyon');
INSERT INTO `subarea_data` VALUES (254, 35, 'Skeunk\'s Hideout - Room 1');
INSERT INTO `subarea_data` VALUES (255, 35, 'Skeunk\'s Hideout - Room 2');
INSERT INTO `subarea_data` VALUES (256, 35, 'Skeunk\'s Hideout - Room 3');
INSERT INTO `subarea_data` VALUES (257, 35, 'Skeunk\'s Hideout - Emeralda');
INSERT INTO `subarea_data` VALUES (258, 35, 'Skeunk\'s Hideout - Ruby');
INSERT INTO `subarea_data` VALUES (259, 35, 'Skeunk\'s Hideout - Sapphira');
INSERT INTO `subarea_data` VALUES (260, 35, 'Skeunk\'s Hideout - Diamondine');
INSERT INTO `subarea_data` VALUES (261, 35, 'Skeunk\'s Hideout - Den');
INSERT INTO `subarea_data` VALUES (266, 35, 'Skeunk\'s Hideout - Room 4');
INSERT INTO `subarea_data` VALUES (267, 35, 'Skeunk\'s Hideout - Room 5');
INSERT INTO `subarea_data` VALUES (268, 29, 'Tofu Dungeon - Room 9');
INSERT INTO `subarea_data` VALUES (269, 29, 'Tofu Dungeon - Room 10');
INSERT INTO `subarea_data` VALUES (270, 29, 'Tofu Dungeon - Room 11');
INSERT INTO `subarea_data` VALUES (271, 29, 'Tofu Dungeon - Room 12');
INSERT INTO `subarea_data` VALUES (272, 29, 'Tofu Dungeon - Room 13');
INSERT INTO `subarea_data` VALUES (273, 29, 'Tofu Dungeon - Room 14');
INSERT INTO `subarea_data` VALUES (274, 29, 'Tofu Dungeon - Room 15');
INSERT INTO `subarea_data` VALUES (275, 28, 'Agony V\'Helley');
INSERT INTO `subarea_data` VALUES (276, 0, 'The Goblin Camp');
INSERT INTO `subarea_data` VALUES (277, 0, 'Bwork Village');
INSERT INTO `subarea_data` VALUES (278, 18, 'Amakna Castle Gobball Breeding Station');
INSERT INTO `subarea_data` VALUES (279, 7, 'Edge of Bonta');
INSERT INTO `subarea_data` VALUES (280, 11, 'Edge of Brakmar');
INSERT INTO `subarea_data` VALUES (284, 39, 'Bwork Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (285, 39, 'Bwork Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (286, 39, 'Bwork Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (287, 39, 'Bwork Dungeon - Solitary confinement');
INSERT INTO `subarea_data` VALUES (288, 39, 'Bwork Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (289, 39, 'Bwork Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (290, 39, 'Bwork Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (291, 39, 'Bwork Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (292, 33, 'Canidae Dungeon - Room 11');
INSERT INTO `subarea_data` VALUES (293, 33, 'Canidae Dungeon - Room 12');
INSERT INTO `subarea_data` VALUES (294, 33, 'Canidae Dungeon - Room 13');
INSERT INTO `subarea_data` VALUES (295, 33, 'Canidae Dungeon - Room 14');
INSERT INTO `subarea_data` VALUES (296, 33, 'Canidae Dungeon - Room 15');
INSERT INTO `subarea_data` VALUES (297, 40, 'Scaraleaf Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (298, 40, 'Scaraleaf Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (299, 40, 'Scaraleaf Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (300, 40, 'Scaraleaf Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (301, 40, 'Scaraleaf Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (302, 40, 'Scaraleaf Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (303, 40, 'Scaraleaf Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (304, 40, 'Scaraleaf Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (306, 41, 'Field Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (307, 41, 'Field Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (308, 41, 'Field Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (309, 41, 'Field Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (310, 41, 'Field Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (311, 41, 'Field Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (312, 41, 'Field Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (313, 29, 'Tofu Dungeon - Room 16');
INSERT INTO `subarea_data` VALUES (314, 0, 'The Dreggons\' Sanctuary');
INSERT INTO `subarea_data` VALUES (315, 0, 'Dreggon Village');
INSERT INTO `subarea_data` VALUES (316, 0, 'Dreggon Tunnel');
INSERT INTO `subarea_data` VALUES (317, 37, 'Crackler Dungeon - Room 9');
INSERT INTO `subarea_data` VALUES (318, 18, 'Alkatraz');
INSERT INTO `subarea_data` VALUES (319, 31, 'Labyrinth of the Minotoror');
INSERT INTO `subarea_data` VALUES (320, 42, 'Kwismas Island');
INSERT INTO `subarea_data` VALUES (321, 42, 'Kwismas Dungeon');
INSERT INTO `subarea_data` VALUES (322, 43, 'Pig Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (323, 43, 'Pig Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (324, 43, 'Pig Dungeon - Room 9');
INSERT INTO `subarea_data` VALUES (325, 44, 'Dreggon Dungeon - Room 1');
INSERT INTO `subarea_data` VALUES (326, 44, 'Dreggon Dungeon - Room 2');
INSERT INTO `subarea_data` VALUES (327, 44, 'Dreggon Dungeon - Room 3');
INSERT INTO `subarea_data` VALUES (328, 44, 'Dreggon Dungeon - Room 4');
INSERT INTO `subarea_data` VALUES (329, 44, 'Dreggon Dungeon - Room 5');
INSERT INTO `subarea_data` VALUES (330, 44, 'Dreggon Dungeon - Room 6');
INSERT INTO `subarea_data` VALUES (331, 44, 'Dreggon Dungeon - Room 7');
INSERT INTO `subarea_data` VALUES (332, 44, 'Dreggon Dungeon - Room 8');
INSERT INTO `subarea_data` VALUES (333, 44, 'Dreggon Dungeon - Room 9');
INSERT INTO `subarea_data` VALUES (334, 8, 'Cania Bay');
INSERT INTO `subarea_data` VALUES (335, 18, 'Astrub Rocky Inlet');
INSERT INTO `subarea_data` VALUES (336, 18, 'Sand Dungeon');
INSERT INTO `subarea_data` VALUES (337, 7, 'Bonta Rat Dungeon');
INSERT INTO `subarea_data` VALUES (338, 11, 'Brakmar Rat Dungeon');
INSERT INTO `subarea_data` VALUES (339, 0, 'Amakna Castle Rat Dungeon');
INSERT INTO `subarea_data` VALUES (440, 45, 'Rocky Peaks');
INSERT INTO `subarea_data` VALUES (441, 45, 'Clearing');
INSERT INTO `subarea_data` VALUES (442, 45, 'Lake');
INSERT INTO `subarea_data` VALUES (443, 45, 'Forest');
INSERT INTO `subarea_data` VALUES (444, 45, 'Fields');
INSERT INTO `subarea_data` VALUES (445, 45, 'Meadow');
INSERT INTO `subarea_data` VALUES (446, 45, 'Temple');
INSERT INTO `subarea_data` VALUES (447, 45, 'Dungeon');
INSERT INTO `subarea_data` VALUES (448, 45, 'Miscellaneous');
INSERT INTO `subarea_data` VALUES (449, 45, 'Cemetery');
INSERT INTO `subarea_data` VALUES (450, 45, 'Exit of the Temple');
INSERT INTO `subarea_data` VALUES (451, 46, 'Castaways Island');
INSERT INTO `subarea_data` VALUES (452, 46, 'Sea');
INSERT INTO `subarea_data` VALUES (453, 46, 'Coral Beach');
INSERT INTO `subarea_data` VALUES (454, 46, 'Grass Plains');
INSERT INTO `subarea_data` VALUES (455, 46, 'Dark Jungle');
INSERT INTO `subarea_data` VALUES (457, 46, 'Bottomless Peat Bog');
INSERT INTO `subarea_data` VALUES (459, 46, 'Kimbo\'s Canopy');
INSERT INTO `subarea_data` VALUES (460, 46, 'Grotto Hesque');
INSERT INTO `subarea_data` VALUES (461, 46, 'Otomai\'s Ark');
INSERT INTO `subarea_data` VALUES (462, 46, 'Floramor\'s Clearing');
INSERT INTO `subarea_data` VALUES (463, 46, 'Tynril\'s Laboratory');
INSERT INTO `subarea_data` VALUES (464, 46, 'Tree Keeholo Trunk');
INSERT INTO `subarea_data` VALUES (465, 46, 'The Breeder Village');
INSERT INTO `subarea_data` VALUES (466, 46, 'The Coastal Village');
INSERT INTO `subarea_data` VALUES (467, 46, 'Otomai Island Cemetery');
INSERT INTO `subarea_data` VALUES (468, 47, 'Zoth Village');
INSERT INTO `subarea_data` VALUES (469, 46, 'Canopy Village');
INSERT INTO `subarea_data` VALUES (470, 46, 'Bherb\'s Gully');
INSERT INTO `subarea_data` VALUES (471, 46, 'Putrid Peat Bog');
INSERT INTO `subarea_data` VALUES (472, 46, 'Tree Keeholo Foliage');
INSERT INTO `subarea_data` VALUES (473, 46, 'Hidden Laboratory');
INSERT INTO `subarea_data` VALUES (474, 46, 'Hold of Otomai\'s Ark');
INSERT INTO `subarea_data` VALUES (476, 19, 'Nolifis Bridge');
INSERT INTO `subarea_data` VALUES (477, 47, 'Zoth Prism');
INSERT INTO `subarea_data` VALUES (478, 47, 'The Zoth Door Keepers');
INSERT INTO `subarea_data` VALUES (479, 0, 'Kawaii River');
INSERT INTO `subarea_data` VALUES (480, 0, 'Low Crackler Mountain');
INSERT INTO `subarea_data` VALUES (481, 0, 'Brouce Boulgoure\'s Clearing');
INSERT INTO `subarea_data` VALUES (482, 0, 'The Milicluster');
INSERT INTO `subarea_data` VALUES (483, 0, 'Abandoned Railway');
INSERT INTO `subarea_data` VALUES (484, 0, 'Edge of the Milicluster');
INSERT INTO `subarea_data` VALUES (485, 0, 'The Countryside');
INSERT INTO `subarea_data` VALUES (486, 0, 'Little Slope Grove');
INSERT INTO `subarea_data` VALUES (487, 19, 'Air Pandala Attic Confinement');
INSERT INTO `subarea_data` VALUES (488, 0, 'Amakna Tunnels');
INSERT INTO `subarea_data` VALUES (490, 0, 'Sufokian Gulf Shoreline');
INSERT INTO `subarea_data` VALUES (491, 0, 'Larva Dungeon');
INSERT INTO `subarea_data` VALUES (492, 0, 'Passage to Brakmar');
INSERT INTO `subarea_data` VALUES (493, 8, 'Blop Dungeon');
INSERT INTO `subarea_data` VALUES (494, 12, 'Fungus Dungeon');
INSERT INTO `subarea_data` VALUES (495, 12, 'Fungus Cavern');
INSERT INTO `subarea_data` VALUES (496, 12, 'Ku Tan\'s Dungeon');
INSERT INTO `subarea_data` VALUES (497, 8, 'Ilyzaelle\'s Dungeon');
INSERT INTO `subarea_data` VALUES (498, 8, '\'Hotomani Sanctuary');
INSERT INTO `subarea_data` VALUES (499, 30, 'Minotoror Island Cemetery');
INSERT INTO `subarea_data` VALUES (500, 47, 'Zoth Village Cemetery');
INSERT INTO `subarea_data` VALUES (501, 0, 'Isle O\'Anstitch');
INSERT INTO `subarea_data` VALUES (502, 11, 'Lumberjacks\' Quarter');
INSERT INTO `subarea_data` VALUES (503, 11, 'Butchers\' Quarter');
INSERT INTO `subarea_data` VALUES (504, 11, 'Militia Distric');
INSERT INTO `subarea_data` VALUES (505, 11, 'Bakers\' Quarter');
INSERT INTO `subarea_data` VALUES (506, 11, 'Jewellers\' Quarter');
INSERT INTO `subarea_data` VALUES (507, 11, 'Tailors\' Quarter');
INSERT INTO `subarea_data` VALUES (508, 11, 'Blacksmiths\' Quarter');
INSERT INTO `subarea_data` VALUES (509, 11, 'Handymen\'s Quarter');
INSERT INTO `subarea_data` VALUES (510, 11, 'Arena');
INSERT INTO `subarea_data` VALUES (511, 11, 'City Centre');
INSERT INTO `subarea_data` VALUES (512, 7, 'Arena');
INSERT INTO `subarea_data` VALUES (513, 7, 'City Centre');
INSERT INTO `subarea_data` VALUES (514, 7, 'Tower of Orders');
INSERT INTO `subarea_data` VALUES (515, 11, 'Tower of Orders');
INSERT INTO `subarea_data` VALUES (536, 0, 'Goultarminator');
INSERT INTO `subarea_data` VALUES (1021, 1020, 'Z');
INSERT INTO `subarea_data` VALUES (1023, 1022, 'la zone marchande');

-- ----------------------------
-- Table structure for world.entity.guilds
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.guilds`;
CREATE TABLE `world.entity.guilds`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `emblem` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lvl` int(11) NOT NULL DEFAULT 1,
  `xp` bigint(20) NOT NULL DEFAULT 0,
  `capital` int(11) NOT NULL DEFAULT 0,
  `maxCollectors` int(11) NOT NULL DEFAULT 1,
  `spells` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '462;0|461;0|460;0|459;0|458;0|457;0|456;0|455;0|454;0|453;0|452;0|451;0|',
  `stats` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '176;100|158;1000|124;100|',
  `date` bigint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of world.entity.guilds
-- ----------------------------
INSERT INTO `world.entity.guilds` VALUES (1, 'Test', '1,8w33x,1,0', 10, 203249, 35, 1, '451;0|452;0|453;0|454;0|455;0|456;0|457;0|458;0|459;0|460;0|461;0|462;0', '176;100|124;100|158;1000', 1567857656841);

-- ----------------------------
-- Table structure for world.entity.mounts
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.mounts`;
CREATE TABLE `world.entity.mounts`  (
  `id` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `xp` int(32) NOT NULL,
  `level` int(11) NOT NULL,
  `endurance` int(11) NOT NULL,
  `amour` int(11) NOT NULL,
  `maturity` int(11) NOT NULL,
  `serenity` int(11) NOT NULL,
  `reproductions` int(11) NOT NULL,
  `fatigue` int(11) NOT NULL,
  `energy` int(11) NOT NULL,
  `objects` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ancestors` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ',,,,,,,,,,,,,',
  `capacitys` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL,
  `map` int(11) NOT NULL,
  `cell` int(11) NOT NULL,
  `owner` int(11) UNSIGNED NOT NULL,
  `orientation` int(11) NOT NULL,
  `fecundatedDate` bigint(255) NOT NULL,
  `couple` int(11) NOT NULL,
  `savage` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of world.entity.mounts
-- ----------------------------
INSERT INTO `world.entity.mounts` VALUES (-7, 3, 1, 'taste', 0, 1, 10000, 10000, 3000, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, -1, -1, 29, 1, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-6, 3, 0, 'No Name', 0, 1, 10000, 10000, 3000, -138, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8746, 474, 1, 3, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-3, 3, 1, 'abc', 0, 1, 10000, 10000, 3000, 186, 0, 1, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8746, 530, 1, 3, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-4, 3, 0, 'def', 0, 1, 10000, 10000, 3000, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, -1, -1, 1, 1, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-5, 3, 0, 'No Name', 0, 1, 10000, 10000, 3000, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, -1, -1, 1, 1, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-8, 3, 0, 'test', 0, 1, 10000, 10000, 3000, -136, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8746, 585, 29, 1, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-11, 69, 1, 'No Name', 0, 1, 10000, 10000, 8000, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8745, 271, 1, 1, -1, 0, 0);
INSERT INTO `world.entity.mounts` VALUES (-9, 20, 0, 'No Name', 0, 1, 0, 0, 0, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8745, 271, 1, 1, -1, 0, 1);
INSERT INTO `world.entity.mounts` VALUES (-10, 10, 1, 'No Name', 0, 1, 0, 0, 1000, 0, 0, 0, 0, '', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, 8745, -1, 1, 1, -1, 0, 1);
INSERT INTO `world.entity.mounts` VALUES (-12, 46, 0, 'No Name', 0, 1, 10000, 10000, 2000, 0, 0, 0, 0, '11718;11719;11720;2248;11722;11723;9933;9934;9935;11185;11734;11735;11161;11900;11519', '?,?,?,?,?,?,?,?,?,?,?,?,?,?', '0', 100, -1, -1, 1, 1, -1, 0, 0);

-- ----------------------------
-- Table structure for world.entity.objects
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.objects`;
CREATE TABLE `world.entity.objects`  (
  `id` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `stats` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `puit` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `guid`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of world.entity.objects
-- ----------------------------
INSERT INTO `world.entity.objects` VALUES (2, 384, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (3, 304, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (4, 884, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (5, 885, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (6, 519, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (7, 365, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (8, 287, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2048, 2290, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (14, 385, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (15, 884, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (16, 885, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (17, 365, 34, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (18, 385, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (19, 884, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (20, 885, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (21, 365, 34, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (22, 884, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (23, 519, 52, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (28, 881, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (29, 883, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (30, 881, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (31, 2419, 1, 2, '7d#17#0#0#0d0+23', 0);
INSERT INTO `world.entity.objects` VALUES (32, 883, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (33, 881, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (34, 883, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (35, 885, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2081, 963, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (40, 384, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (41, 304, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (42, 384, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (43, 304, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (44, 385, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (45, 395, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2082, 8118, 1, -1, '6c#b#1e#0#1d20+10,b2#3#0#0#0d0+3,8a#14#0#0#0d0+20', 0);
INSERT INTO `world.entity.objects` VALUES (49, 383, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (50, 383, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (51, 384, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (55, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (56, 882, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2085, 998, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1531, 306, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (60, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (62, 304, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (63, 395, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (64, 2422, 1, 5, '8a#5#0#0#0d0+5,7d#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (65, 383, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (67, 310, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (69, 311, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (71, 307, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (72, 519, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (74, 365, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (77, 884, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (78, 885, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (81, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (82, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (83, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (84, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (85, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (86, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2083, 2609, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2087, 1017, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (96, 6900, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (98, 8227, 1, 5, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (99, 8234, 1, 7, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (100, 287, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (101, 8239, 1, 3, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (106, 8230, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11182, 7280, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11183, 7301, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2240, 1889, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (113, 6899, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2095, 7435, 20, -1, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (358, 6922, 1, -1, '73#3#0#0#0d0+3,d3#1#0#0#0d0+1,98#6#0#0#0d0+6,7c#4#0#0#0d0+4,9d#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (428, 1673, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (432, 6926, 1, 6, '70#1#0#0#0d0+1,7c#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (121, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (3883, 1545, 166, -1, '76#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (129, 384, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (130, 881, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (131, 385, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (132, 883, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (133, 395, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2104, 1551, 30, -1, '76#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (2105, 7442, 6, -1, 'b6#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2106, 1521, 250, -1, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2107, 1546, 60, -1, '7c#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (141, 882, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2478, 6913, 1, -1, '74#3#0#0#0d0+3,7c#4#0#0#0d0+4,7d#2#0#0#0d0+2,ae#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (147, 8228, 1, -1, '77#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (7953, 948, 1, -1, '98#5d#0#0#0d0+93,9a#122#0#0#0d0+290,9b#11d#0#0#0d0+285,9d#9e#0#0#0d0+158,7d#10#0#0#0d0+16,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2189, 9461, 1, -1, '76#4#0#0#0d0+4,7c#3#0#0#0d0+3,7d#22#0#0#0d0+34', 0);
INSERT INTO `world.entity.objects` VALUES (2241, 2056, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2242, 2060, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11900, 312, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2353, 6913, 1, -1, '74#2#0#0#0d0+2,75#1#0#0#0d0+1,7c#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (2246, 7494, 1, 1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2953, 8839, 1, -1, '70#8#0#0#0d0+8,f0#d#0#0#0d0+13,b0#c#0#0#0d0+12,d2#a#0#0#0d0+10,73#5#0#0#0d0+5,75#1#0#0#0d0+1,76#4a#0#0#0d0+74,8a#f#0#0#0d0+15,7c#2c#0#0#0d0+44,7d#96#0#0#0d0+150,ae#1c1#0#0#0d0+449', 0);
INSERT INTO `world.entity.objects` VALUES (240, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (214, 8542, 1, -1, '64#1#2#0#1d2+0', 0);
INSERT INTO `world.entity.objects` VALUES (215, 8539, 1, -1, '64#1#3#0#1d3+0,ae#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (7951, 948, 1, -1, '98#12c#0#0#0d0+300,9a#fc#0#0#0d0+252,7d#2#0#0#0d0+2,9d#12c#0#0#0d0+300,7e#17#0#0#0d0+23', 0);
INSERT INTO `world.entity.objects` VALUES (172, 884, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (173, 885, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (174, 8528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (180, 385, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (181, 881, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (182, 883, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (183, 519, 16, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (184, 365, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (188, 384, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (189, 304, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (190, 395, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (191, 383, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2046, 398, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2071, 2448, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2072, 304, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2073, 384, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2074, 385, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2075, 882, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2076, 2466, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (207, 385, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (208, 884, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (209, 885, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (210, 8528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (212, 384, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (213, 311, 45, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (217, 8529, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (224, 311, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (226, 307, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (227, 371, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (228, 519, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (236, 8545, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (241, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (242, 290, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (243, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (244, 365, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (245, 290, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (246, 307, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (247, 519, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (248, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (249, 365, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (250, 307, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (251, 519, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (252, 365, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (254, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (255, 6818, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (256, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (257, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (258, 379, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (259, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (260, 383, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (261, 384, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (262, 304, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (263, 385, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (264, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (265, 6818, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (266, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (267, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (268, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (269, 379, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (270, 384, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (271, 304, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (272, 6818, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (273, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (274, 311, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (275, 395, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (276, 379, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (277, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (278, 304, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (279, 384, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (280, 6818, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (281, 311, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (282, 379, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (283, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (285, 363, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (286, 881, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (287, 386, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (288, 387, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (289, 883, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (290, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (291, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (292, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (293, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (294, 385, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (295, 881, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (296, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (297, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (298, 883, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (299, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (300, 486, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (301, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (302, 394, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (303, 363, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (304, 364, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (305, 385, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (306, 386, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (307, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (308, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (309, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (310, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (311, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (312, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (313, 364, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (314, 881, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (315, 883, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (317, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (318, 680, 1, -1, '25d#2#2710#0#1d9999+1', 0);
INSERT INTO `world.entity.objects` VALUES (319, 300, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (320, 304, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (321, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (322, 309, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (323, 678, 1, -1, '25d#1#3e8#0#1d1000+0', 0);
INSERT INTO `world.entity.objects` VALUES (324, 680, 1, -1, '25d#2#2710#0#1d9999+1', 0);
INSERT INTO `world.entity.objects` VALUES (325, 300, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (326, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (327, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (328, 678, 1, -1, '25d#1#3e8#0#1d1000+0', 0);
INSERT INTO `world.entity.objects` VALUES (329, 679, 1, -1, '25d#1#64#0#1d100+0', 0);
INSERT INTO `world.entity.objects` VALUES (330, 383, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (331, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (332, 678, 1, -1, '25d#1#3e8#0#1d1000+0', 0);
INSERT INTO `world.entity.objects` VALUES (333, 679, 1, -1, '25d#1#64#0#1d100+0', 0);
INSERT INTO `world.entity.objects` VALUES (334, 395, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (335, 2449, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (336, 310, 16, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (337, 383, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (338, 8533, 1, 6, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (339, 8533, 1, 6, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (340, 8533, 1, 6, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (341, 8533, 1, 6, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (343, 310, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (344, 310, 16, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (345, 8545, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (347, 2336, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (348, 2323, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (349, 310, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (350, 2336, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (352, 2336, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (356, 1570, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2113, 1558, 10, -1, '80#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (360, 290, 40, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (361, 407, 35, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (362, 519, 55, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (363, 377, 50, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (364, 300, 44, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1532, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (366, 290, 47, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (367, 519, 53, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (368, 407, 26, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (369, 377, 45, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (370, 2571, 20, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (371, 300, 46, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (372, 290, 51, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (373, 377, 40, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2099, 7453, 50, -1, 'f2#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2096, 7451, 30, -1, 'b0#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (375, 300, 42, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (376, 365, 34, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (377, 2573, 21, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2100, 7433, 12, -1, '73#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2101, 7457, 30, -1, 'd5#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (382, 407, 38, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (383, 2572, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (385, 2571, 21, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (386, 2573, 23, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (387, 2573, 21, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (388, 378, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2103, 1545, 90, -1, '76#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2102, 1519, 384, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (392, 6929, 1, -1, 'dc#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (393, 2571, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2108, 1552, 20, -1, '7c#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (2109, 1523, 366, -1, '7d#5#0#0#0d0+5', 0);
INSERT INTO `world.entity.objects` VALUES (2110, 1548, 140, -1, '7d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (2111, 1554, 31, -1, '7d#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (401, 6919, 1, -1, 'b7#3#0#0#0d0+3,98#1b#0#0#0d0+27,9d#1b#0#0#0d0+27', 0);
INSERT INTO `world.entity.objects` VALUES (403, 6919, 1, -1, 'b7#1#0#0#0d0+1,98#1a#0#0#0d0+26,9d#8#0#0#0d0+8', 0);
INSERT INTO `world.entity.objects` VALUES (404, 2473, 1, -1, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#1#0#0#0d0+1,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (406, 2473, 1, -1, '76#2#0#0#0d0+2,77#2#0#0#0d0+2,7b#2#0#0#0d0+2,7c#1#0#0#0d0+1,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (407, 1674, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2312, 6913, 1, -1, '74#2#0#0#0d0+2,75#1#0#0#0d0+1,7c#3#0#0#0d0+3,7d#8#0#0#0d0+8', 0);
INSERT INTO `world.entity.objects` VALUES (411, 6913, 1, -1, '74#2#0#0#0d0+2,7c#c#0#0#0d0+12,7d#d#0#0#0d0+13,ae#1c#0#0#0d0+28', 0);
INSERT INTO `world.entity.objects` VALUES (2450, 6913, 1, -1, '74#2#0#0#0d0+2,75#1#0#0#0d0+1,7c#5#0#0#0d0+5', 0);
INSERT INTO `world.entity.objects` VALUES (415, 2574, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (417, 6921, 1, -1, '98#13#0#0#0d0+19,7c#9#0#0#0d0+9,9d#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (418, 2473, 1, 7, '76#2#0#0#0d0+2,77#2#0#0#0d0+2,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (419, 6922, 1, -1, '73#2#0#0#0d0+2,d3#3#0#0#0d0+3,98#d#0#0#0d0+13,7c#5#0#0#0d0+5,9d#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (420, 2572, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1841, 881, 400, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (423, 6929, 1, 3, 'dc#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (425, 2572, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (426, 6922, 1, -1, '73#3#0#0#0d0+3,d3#2#0#0#0d0+2,98#e#0#0#0d0+14,7c#6#0#0#0d0+6,9d#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (436, 6928, 1, 4, 'dc#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (437, 6919, 1, -1, 'b7#3#0#0#0d0+3,98#18#0#0#0d0+24,9d#19#0#0#0d0+25', 0);
INSERT INTO `world.entity.objects` VALUES (438, 653, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (441, 6919, 1, -1, 'b7#1#0#0#0d0+1,98#19#0#0#0d0+25,9d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (442, 2478, 1, 0, '76#1#0#0#0d0+1,77#2#0#0#0d0+2,7b#1#0#0#0d0+1,7c#1#0#0#0d0+1,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (443, 6913, 1, -1, '74#2#0#0#0d0+2,7c#9#0#0#0d0+9,7d#8#0#0#0d0+8,ae#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (2045, 519, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (447, 6921, 1, -1, '98#17#0#0#0d0+23,7c#d#0#0#0d0+13,9d#17#0#0#0d0+23', 0);
INSERT INTO `world.entity.objects` VALUES (2077, 2453, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (453, 6920, 1, -1, 'b8#1#0#0#0d0+1,98#19#0#0#0d0+25,9d#1c#0#0#0d0+28', 0);
INSERT INTO `world.entity.objects` VALUES (4475, 2531, 1, -1, '7d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (455, 307, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (456, 371, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (457, 2473, 1, -1, '76#1#0#0#0d0+1,77#2#0#0#0d0+2,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (458, 371, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (459, 307, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (460, 2473, 1, 7, '76#2#0#0#0d0+2,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#2#0#0#0d0+2,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (461, 371, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (462, 307, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (463, 6919, 1, -1, 'b7#2#0#0#0d0+2,98#1a#0#0#0d0+26,9d#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (1533, 306, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2031, 2438, 1, -1, '76#46#0#0#0d0+70,7e#1b#0#0#0d0+27', 0);
INSERT INTO `world.entity.objects` VALUES (7949, 948, 1, -1, '98#e9#0#0#0d0+233,9a#125#0#0#0d0+293,7d#18#0#0#0d0+24,9d#128#0#0#0d0+296,7e#10#0#0#0d0+16', 90);
INSERT INTO `world.entity.objects` VALUES (474, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (475, 434, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (476, 387, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (477, 435, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (478, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (479, 437, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (480, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (481, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (482, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (483, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (484, 434, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (485, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (486, 435, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (487, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (488, 437, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (489, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (490, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (491, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (492, 464, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (493, 434, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (494, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (495, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (496, 435, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (497, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (498, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (499, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (500, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (501, 463, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1840, 882, 460, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (504, 363, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (505, 363, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (506, 2413, 1, 7, '70#2#0#0#0d0+2,76#17#0#0#0d0+23,b6#1#0#0#0d0+1,7d#1b#0#0#0d0+27', 0);
INSERT INTO `world.entity.objects` VALUES (507, 463, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (508, 437, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (509, 363, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (511, 792, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (514, 6944, 1, 4, 'd2#4#0#0#0d0+4,73#4#0#0#0d0+4,76#8#0#0#0d0+8,8a#2#0#0#0d0+2,ae#50#0#0#0d0+80', 0);
INSERT INTO `world.entity.objects` VALUES (518, 2290, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (519, 2293, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (520, 2473, 1, -1, '76#2#0#0#0d0+2,77#2#0#0#0d0+2,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (521, 1466, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (522, 1467, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (523, 1456, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (524, 2290, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (525, 1467, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (526, 398, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (527, 1466, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (528, 1467, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (529, 398, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2049, 371, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2050, 307, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2051, 2293, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2052, 1466, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2053, 1467, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2043, 8154, 1, 8, '320#5#0#5,326#0#0#0,328#7e3#1a4#798,2cd#f0#0#4,2cd#f1#0#7,2cd#c2#0#6,2cd#c6#0#5,d2#5#0#0#0d0+5,d3#5#0#0#0d0+5,d4#7#0#0#0d0+7,d5#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (536, 2290, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (537, 2294, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (539, 1527, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (540, 398, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2078, 887, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2079, 395, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2080, 383, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (546, 1465, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (547, 1457, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (548, 1465, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (550, 2323, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (551, 1570, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (554, 5613, 1, -1, '32c#0#0#0#c,60#9#d#0#1d5+8,99#a#0#0#0d0+10,7b#5#0#0#0d0+5', 0);
INSERT INTO `world.entity.objects` VALUES (555, 2336, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (556, 2323, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (561, 385, 52, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (562, 8545, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (563, 307, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (564, 371, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (565, 884, 18, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (566, 885, 18, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (567, 519, 23, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (569, 6915, 1, -1, 'b2#1#0#0#0d0+1,7b#9#0#0#0d0+9', 0);
INSERT INTO `world.entity.objects` VALUES (571, 881, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (572, 883, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (573, 365, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (574, 8528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (576, 2460, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (579, 363, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (581, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (585, 287, 19, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (587, 6899, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (588, 6900, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (589, 6902, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (590, 8219, 1, -1, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (592, 304, 35, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (593, 384, 40, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (594, 395, 26, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (595, 383, 32, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (597, 2422, 1, 5, '8a#f#0#0#0d0+15,7d#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (598, 301, 14, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (599, 366, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (601, 367, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (605, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (608, 8680, 33, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (609, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (611, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (613, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (615, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (616, 307, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (617, 371, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (618, 519, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (619, 365, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (620, 307, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (621, 371, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (622, 519, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (623, 365, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (624, 371, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (625, 307, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (626, 519, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (627, 365, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (628, 307, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (629, 519, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (630, 365, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (632, 311, 33, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (633, 379, 33, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (634, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (636, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (638, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (640, 598, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (641, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (643, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (645, 1673, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (646, 2455, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (649, 2665, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (652, 882, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (653, 887, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (654, 2463, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (656, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (658, 881, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (659, 883, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (660, 881, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (661, 385, 45, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (662, 385, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (663, 881, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (665, 384, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (666, 304, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (667, 385, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (668, 301, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (669, 366, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (670, 383, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (671, 287, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (672, 384, 37, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (673, 304, 35, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (674, 385, 48, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (675, 2455, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (676, 395, 21, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (677, 301, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (678, 383, 31, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (679, 367, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (680, 304, 32, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (681, 384, 36, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (682, 301, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (683, 367, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (684, 287, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (685, 304, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (686, 384, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (687, 2449, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (688, 2393, 1, -1, 'b6#1#0#0#0d0+1,7d#d#0#0#0d0+13,9d#13#0#0#0d0+19', 0);
INSERT INTO `world.entity.objects` VALUES (689, 395, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (690, 301, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (691, 366, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (692, 367, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (693, 383, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (695, 395, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (696, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (697, 881, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (698, 883, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (699, 884, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (700, 885, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (701, 366, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (702, 2448, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (703, 884, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (704, 885, 14, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (705, 287, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (706, 395, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (707, 366, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (708, 883, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (709, 884, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (710, 885, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (711, 2453, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (712, 383, 25, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (713, 1568, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (714, 2476, 1, -1, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#1#0#0#0d0+1,7c#1#0#0#0d0+1,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (715, 2416, 1, 1, '61#4#8#0#1d5+3,63#4#8#0#1d5+3,b6#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (716, 883, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (717, 884, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (718, 885, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (719, 287, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (722, 290, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (723, 306, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (724, 373, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (725, 377, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (726, 300, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (728, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (729, 290, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (730, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (731, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (732, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (733, 377, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (734, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (735, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (736, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (737, 290, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (738, 387, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (739, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (740, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (741, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (742, 377, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (743, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (744, 300, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (745, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (746, 290, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (747, 387, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (748, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (749, 486, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (750, 393, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (751, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (752, 300, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (753, 290, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (754, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (755, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (756, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (757, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (758, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (759, 377, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (760, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (761, 300, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (763, 363, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (765, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (766, 2467, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (768, 290, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (769, 377, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (770, 300, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (773, 8545, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (774, 371, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (775, 307, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (776, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (778, 6844, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (779, 6845, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (782, 2448, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (784, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (785, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (786, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (787, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (788, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (789, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (792, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (794, 364, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (795, 2477, 1, 3, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (799, 366, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (800, 287, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (802, 407, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (803, 2573, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (804, 407, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (805, 407, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (806, 2571, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (807, 2477, 1, -1, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#1#0#0#0d0+1,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (808, 2573, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (809, 371, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (810, 6915, 1, -1, 'b2#1#0#0#0d0+1,7b#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (811, 6917, 1, -1, '7b#15#0#0#0d0+21,7c#7#0#0#0d0+7,9d#d#0#0#0d0+13,7e#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (812, 407, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (813, 2573, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (815, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (817, 407, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (818, 2573, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1185, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (821, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (823, 6852, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (824, 6852, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (826, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (828, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (830, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (832, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (835, 2462, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (836, 882, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (837, 882, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (838, 2422, 1, 5, '8a#8#0#0#0d0+8,7d#13#0#0#0d0+19', 0);
INSERT INTO `world.entity.objects` VALUES (839, 2425, 1, 0, '76#1#0#0#0d0+1,7e#5#0#0#0d0+5', 0);
INSERT INTO `world.entity.objects` VALUES (841, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (843, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (845, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (847, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (849, 2571, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (851, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (853, 2583, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (854, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (856, 2464, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (857, 2464, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (858, 887, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (860, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (862, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (864, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (866, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (868, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (870, 6818, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (871, 309, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (872, 301, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (873, 367, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (875, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (877, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (878, 887, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (879, 288, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (880, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (881, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (882, 882, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (883, 887, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (884, 2463, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (885, 2465, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (886, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (887, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (888, 288, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (889, 2466, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (890, 2463, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (892, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (894, 882, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (895, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (897, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (899, 2455, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (901, 9531, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (903, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (905, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (906, 2659, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (907, 374, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (909, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (910, 306, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (911, 374, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (912, 2414, 1, 7, '7d#32#0#0#0d0+50,ae#30#0#0#0d0+48', 0);
INSERT INTO `world.entity.objects` VALUES (913, 2477, 1, -1, '76#2#0#0#0d0+2,77#1#0#0#0d0+1,7b#1#0#0#0d0+1,7c#1#0#0#0d0+1,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (916, 6921, 1, 6, '98#d#0#0#0d0+13,7c#9#0#0#0d0+9,9d#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (917, 2460, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (919, 2453, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (920, 1568, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (922, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (923, 10721, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (924, 374, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (925, 2428, 1, 3, '9e#1ce#0#0#0d0+462', 0);
INSERT INTO `world.entity.objects` VALUES (926, 1568, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (927, 306, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (928, 373, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (929, 374, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (930, 2422, 1, 5, '8a#f#0#0#0d0+15,7d#11#0#0#0d0+17', 0);
INSERT INTO `world.entity.objects` VALUES (932, 2451, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (933, 727, 1, -1, '25c#0#0#0#0d0+0', 0);
INSERT INTO `world.entity.objects` VALUES (934, 377, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (935, 2428, 1, 3, '9e#12e#0#0#0d0+302', 0);
INSERT INTO `world.entity.objects` VALUES (939, 1568, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (940, 2449, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (941, 2463, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (944, 2425, 1, -1, '76#1#0#0#0d0+1,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (946, 2451, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (948, 6922, 1, 7, '73#3#0#0#0d0+3,d3#1#0#0#0d0+1,98#2#0#0#0d0+2,7c#9#0#0#0d0+9,9d#b#0#0#0d0+11', 0);
INSERT INTO `world.entity.objects` VALUES (951, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (952, 8680, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (953, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (954, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (955, 8680, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (956, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (958, 6948, 1, 3, 'd2#5#0#0#0d0+5,b7#5#0#0#0d0+5,7c#8#0#0#0d0+8,7d#8#0#0#0d0+8', 0);
INSERT INTO `world.entity.objects` VALUES (959, 2293, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (960, 1466, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (961, 2293, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2474, 6913, 1, -1, '74#2#0#0#0d0+2,ae#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (964, 1456, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (965, 1528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (967, 8680, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (968, 9531, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (969, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (970, 8680, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (971, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (972, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2097, 10662, 20, -1, 'b0#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2098, 7455, 30, -1, 'f0#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (977, 364, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (978, 5245, 1, -1, '32c#0#0#0#17,63#c#12#0#1d7+11,99#10#0#0#0d0+16,9c#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (979, 364, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (980, 1456, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (981, 792, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (982, 7423, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2490, 6913, 1, -1, '74#3#0#0#0d0+3,7c#3#0#0#0d0+3,7d#3#0#0#0d0+3,ae#7#0#0#0d0+7', 0);
INSERT INTO `world.entity.objects` VALUES (1842, 384, 350, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (989, 2448, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (990, 2478, 1, -1, '76#2#0#0#0d0+2,77#1#0#0#0d0+1,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (993, 1458, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (994, 1458, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (997, 2481, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (998, 2482, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (999, 2275, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1000, 2484, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1001, 2482, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1002, 2554, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1004, 2486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1005, 2481, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1006, 2275, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1007, 2484, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1009, 2479, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1010, 2486, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1012, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1013, 8437, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1014, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1015, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1016, 8437, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1017, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1019, 384, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1020, 385, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1021, 519, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1022, 395, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1023, 2476, 1, 5, '76#2#0#0#0d0+2,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1024, 365, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1025, 7918, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1026, 304, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1027, 881, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1028, 883, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1029, 884, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1030, 885, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1031, 383, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1032, 881, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1033, 385, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1034, 883, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1035, 395, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1036, 301, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1037, 366, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1038, 384, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1039, 385, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1040, 519, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1041, 395, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1042, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1043, 365, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1044, 366, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1045, 304, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1046, 881, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1047, 883, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1048, 884, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1049, 885, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1050, 2393, 1, 0, 'b6#1#0#0#0d0+1,7d#1c#0#0#0d0+28,9d#18#0#0#0d0+24', 0);
INSERT INTO `world.entity.objects` VALUES (1051, 383, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1052, 287, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1053, 384, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1054, 304, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1055, 385, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1056, 881, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1057, 883, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1058, 884, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1059, 885, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1060, 519, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1061, 365, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1062, 366, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1063, 383, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1065, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1066, 287, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1067, 1568, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1068, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1069, 287, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1071, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1072, 6818, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1073, 309, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1074, 2662, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1075, 6818, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1076, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1077, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1078, 2662, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1079, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1080, 373, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1081, 309, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1082, 383, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1083, 6818, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1084, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1085, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1086, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1087, 2662, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1088, 6818, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1089, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1090, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1091, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1092, 395, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1094, 610, 1, 0, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1095, 8437, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1096, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1097, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1098, 8437, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1099, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1101, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1102, 1568, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1103, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1104, 2448, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1105, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1106, 2455, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1108, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1109, 2583, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1110, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1111, 2583, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1112, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1113, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1115, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1116, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1117, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1118, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1129, 8539, 1, -1, '64#1#3#0#1d3+0,ae#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (1130, 8540, 1, -1, '64#1#3#0#1d3+0,ae#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (1131, 8540, 1, -1, '64#1#3#0#1d3+0,ae#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (1138, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1140, 2336, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1141, 310, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1142, 2336, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1143, 310, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1144, 2336, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1145, 310, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1149, 385, 30, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1150, 884, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1151, 885, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1153, 8528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1155, 311, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1157, 304, 19, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1158, 384, 18, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1159, 395, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1161, 383, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1163, 385, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1164, 884, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1165, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1166, 395, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1170, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1173, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1183, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1573, 2393, 1, 0, 'b6#1#0#0#0d0+1,7d#1e#0#0#0d0+30,9d#1d#0#0#0d0+29', 0);
INSERT INTO `world.entity.objects` VALUES (1179, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1181, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1187, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1189, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1191, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1193, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1196, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1198, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1200, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1202, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1204, 310, 20, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1206, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1207, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1208, 598, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1209, 8680, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1210, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1211, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1214, 311, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1215, 8680, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1216, 379, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1217, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1218, 311, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1219, 379, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1220, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1221, 311, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1222, 379, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1223, 311, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1224, 379, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1225, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1226, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1228, 2323, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1231, 598, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1233, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1234, 2583, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1235, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1238, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1239, 8437, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1240, 598, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1241, 8680, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1242, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1243, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1244, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1245, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1247, 8437, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1250, 8437, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1252, 371, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1253, 307, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1254, 519, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1256, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1257, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1258, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1259, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1260, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1262, 881, 9, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1264, 883, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1266, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1267, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1268, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1269, 2803, 1, 3, 'd3#3#0#0#0d0+3,da#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (1270, 2583, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1271, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1272, 610, 1, 0, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1273, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1275, 610, 1, 0, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1276, 2803, 1, 3, 'd3#4#0#0#0d0+4,da#b#0#0#0d0+11', 0);
INSERT INTO `world.entity.objects` VALUES (1277, 2583, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1278, 2302, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1279, 2302, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1280, 2303, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1281, 2803, 1, -1, 'd3#3#0#0#0d0+3,da#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (1283, 2803, 1, 3, 'd3#5#0#0#0d0+5,da#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (1284, 2583, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1285, 2302, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1286, 2803, 1, -1, 'd3#3#0#0#0d0+3,da#b#0#0#0d0+11', 0);
INSERT INTO `world.entity.objects` VALUES (1288, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1289, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1290, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1291, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1292, 2302, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1293, 610, 1, -1, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1295, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1296, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1297, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1298, 598, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1299, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1300, 8437, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1301, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1469, 2275, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1304, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1305, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1306, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1307, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1308, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1311, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1312, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1313, 2803, 1, 3, 'd3#4#0#0#0d0+4,da#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (1314, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1315, 8680, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1316, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1317, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1318, 2303, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1321, 2336, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1323, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1324, 9531, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1325, 9531, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1326, 727, 1, -1, '25c#0#0#0#0d0+0', 0);
INSERT INTO `world.entity.objects` VALUES (1327, 9531, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1328, 9531, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1331, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1332, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1333, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1334, 9531, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1341, 6899, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1342, 8229, 1, 5, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1343, 6902, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1344, 8217, 1, 0, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1345, 8222, 1, 4, '77#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1346, 287, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1349, 8545, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1350, 307, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1351, 371, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1352, 519, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1353, 377, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1354, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1355, 365, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1356, 290, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1357, 307, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1358, 371, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1359, 519, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1360, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1361, 365, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1362, 377, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1363, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1364, 300, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1365, 365, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1367, 8259, 1, 6, '70#1#0#0#0d0+1,75#1#0#0#0d0+1,d8#5#0#0#0d0+5,d9#5#0#0#0d0+5,da#5#0#0#0d0+5,db#5#0#0#0d0+5,7d#7#0#0#0d0+7', 0);
INSERT INTO `world.entity.objects` VALUES (1368, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1369, 9531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1370, 8254, 1, 4, 'b6#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1371, 9531, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1372, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1373, 9531, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1374, 610, 1, 0, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1375, 610, 3, -1, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1377, 304, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1378, 384, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1379, 6818, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1380, 306, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1381, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1382, 311, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1383, 379, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1384, 2302, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1385, 383, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1386, 384, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1387, 304, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1388, 306, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1389, 6818, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1390, 2659, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1391, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1392, 311, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1393, 379, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1394, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1395, 366, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1396, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1397, 8545, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1398, 6818, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1399, 2659, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1400, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1401, 2663, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1402, 2416, 1, 1, '61#4#8#0#1d5+3,63#4#8#0#1d5+3,b6#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1403, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1404, 379, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1406, 881, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1407, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1408, 883, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1409, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1410, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1411, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1412, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1413, 364, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1414, 2465, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1415, 8545, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1416, 385, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1417, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1418, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1419, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1420, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1421, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1422, 363, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1423, 881, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1424, 883, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1425, 2462, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1426, 386, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1427, 2466, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1428, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1429, 388, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1430, 486, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1431, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1432, 394, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1433, 887, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1436, 290, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1437, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1438, 387, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1439, 678, 1, -1, '25d#1#3e8#0#1d1000+0', 0);
INSERT INTO `world.entity.objects` VALUES (1440, 300, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1441, 309, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1442, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1443, 678, 1, -1, '25d#1#3e8#0#1d1000+0', 0);
INSERT INTO `world.entity.objects` VALUES (1444, 680, 1, -1, '25d#2#2710#0#1d9999+1', 0);
INSERT INTO `world.entity.objects` VALUES (1445, 395, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1446, 652, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1447, 2449, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1448, 383, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1449, 8546, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1450, 2662, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1454, 8533, 1, -1, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1452, 2451, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1453, 309, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1455, 8533, 1, 6, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1456, 8533, 1, -1, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1465, 2428, 1, 3, '9e#12b#0#0#0d0+299', 0);
INSERT INTO `world.entity.objects` VALUES (1470, 2486, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1472, 8241, 1, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1473, 6898, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1474, 6900, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1475, 8213, 1, -1, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1476, 8229, 1, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1477, 8237, 1, -1, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1478, 8239, 1, -1, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1481, 8225, 1, -1, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1482, 8226, 1, -1, '7b#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1484, 8242, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1485, 8245, 1, 6, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1487, 8234, 1, 7, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1489, 2449, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1491, 10289, 1, -1, '325#0#0#1545387403791', 0);
INSERT INTO `world.entity.objects` VALUES (1494, 2448, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1496, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1498, 6922, 1, -1, '73#2#0#0#0d0+2,d3#2#0#0#0d0+2,98#9#0#0#0d0+9,7c#8#0#0#0d0+8,9d#1c#0#0#0d0+28', 0);
INSERT INTO `world.entity.objects` VALUES (2528, 6913, 1, -1, '74#3#0#0#0d0+3,7c#4#0#0#0d0+4,7d#5#0#0#0d0+5,ae#7#0#0#0d0+7', 0);
INSERT INTO `world.entity.objects` VALUES (1501, 6818, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1502, 301, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1503, 6818, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1504, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1505, 287, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1506, 6818, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1508, 395, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1509, 887, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1511, 2455, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1512, 6928, 1, 2, 'dc#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1515, 464, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1517, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1519, 2259, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1520, 382, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1839, 2448, 49, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1523, 463, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1524, 2656, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1526, 362, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1527, 362, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1534, 373, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1541, 2659, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1544, 288, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1545, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1546, 309, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1547, 2661, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1548, 309, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1550, 306, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1551, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1552, 374, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1554, 8123, 1, 0, '70#1#0#0#0d0+1,ae#2d#0#0#0d0+45', 0);
INSERT INTO `world.entity.objects` VALUES (1555, 8127, 1, 1, '5b#4#5#0#1d2+3,73#2#0#0#0d0+2,d7#e#0#0#0d0+14,da#f#0#0#0d0+15,7d#b#0#0#0d0+11', 0);
INSERT INTO `world.entity.objects` VALUES (1556, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1557, 8125, 1, 6, '7c#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (1558, 8126, 1, 4, 'b2#1#0#0#0d0+1,b6#1#0#0#0d0+1,d9#4#0#0#0d0+4', 0);
INSERT INTO `world.entity.objects` VALUES (1559, 8124, 1, 3, '7b#f#0#0#0d0+15,7d#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (1560, 8126, 2, -1, 'b2#1#0#0#0d0+1,b6#1#0#0#0d0+1,d9#4#0#0#0d0+4', 0);
INSERT INTO `world.entity.objects` VALUES (1561, 288, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1562, 8128, 1, 5, '7c#1#0#0#0d0+1,7d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (1566, 1457, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1567, 1465, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1569, 2291, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1570, 2291, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1571, 8139, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1576, 276, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1577, 382, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1578, 382, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1580, 8320, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1581, 901, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1582, 2647, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1584, 8240, 1, -1, '77#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1585, 528, 1, -1, '6e#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (1586, 8242, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1587, 1986, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1588, 6899, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1589, 8230, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1590, 311, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1591, 6903, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1592, 8248, 1, 6, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1593, 586, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1594, 8240, 1, -1, '77#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1595, 1986, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1596, 8242, 1, 3, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1597, 6899, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1598, 311, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1599, 8248, 1, 6, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1600, 8235, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1602, 6900, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1603, 2613, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1604, 1013, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1605, 6900, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1606, 1013, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1607, 2613, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1609, 752, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1610, 8514, 2, -1, '8b#1#14#0#1d20+0', 0);
INSERT INTO `world.entity.objects` VALUES (1611, 8247, 1, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1612, 2315, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1613, 2316, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1614, 8223, 1, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1615, 8514, 2, -1, '8b#1#14#0#1d20+0', 0);
INSERT INTO `world.entity.objects` VALUES (1616, 6902, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1617, 2279, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1618, 2504, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1619, 2315, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1620, 2316, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1622, 8243, 1, 6, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1623, 8229, 1, -1, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1624, 6902, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1625, 6903, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1626, 287, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1627, 8242, 1, 3, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1628, 8248, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1629, 287, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1630, 6900, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1631, 6902, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1632, 6903, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1633, 8217, 1, 0, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1634, 8218, 1, 0, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1635, 8219, 1, 4, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1636, 287, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1637, 8229, 1, 5, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1638, 8247, 1, 6, '76#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1639, 6903, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1640, 287, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1642, 6900, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1643, 8235, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1644, 8225, 1, 5, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1645, 6900, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1646, 6903, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1647, 8224, 1, 2, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1648, 311, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1649, 8224, 1, 4, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1650, 6900, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1651, 311, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1652, 8218, 1, -1, '7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1654, 8231, 1, 7, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1655, 8213, 1, 0, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1657, 307, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1658, 519, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1659, 371, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1660, 307, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1661, 519, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1662, 377, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1663, 362, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1664, 365, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1666, 2663, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1667, 288, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1668, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1669, 384, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1670, 304, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1671, 385, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1672, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1673, 6818, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1674, 379, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1675, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1676, 304, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1677, 384, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1678, 6818, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1679, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1680, 379, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1681, 367, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1683, 306, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1688, 374, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1691, 8128, 1, -1, '7c#3#0#0#0d0+3,7d#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (1692, 2659, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1693, 373, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11911, 7407, 24, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11913, 7411, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1697, 884, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1698, 885, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1700, 8528, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1702, 10311, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1741, 9176, 1, -1, '64#8#11#0#1d10+7,60#6#a#0#1d5+5,63#6#a#0#1d5+5,70#4#0#0#0d0+4,f2#6#0#0#0d0+6,73#3#0#0#0d0+3,d4#8#0#0#0d0+8,76#31#0#0#0d0+49,77#26#0#0#0d0+38,7d#102#0#0#0d0+258', 0);
INSERT INTO `world.entity.objects` VALUES (1709, 77, 1, 0, '76#8#0#0#0d0+8,3ea#a#0#0#0d0+10,3eb#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (2088, 2253, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2089, 7494, 1, 1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2090, 951, 1, -1, '64#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11184, 7225, 134, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (1743, 9179, 1, -1, 'b0#14#0#0#0d0+20,70#8#0#0#0d0+8,e2#b#0#0#0d0+11,73#2#0#0#0d0+2,f3#6#0#0#0d0+6,76#22#0#0#0d0+34,77#22#0#0#0d0+34,7c#20#0#0#0d0+32,7d#ca#0#0#0d0+202,ae#138#0#0#0d0+312,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (1744, 9180, 1, -1, 'b0#1d#0#0#0d0+29,70#6#0#0#0d0+6,e2#1e#0#0#0d0+30,d3#7#0#0#0d0+7,75#1#0#0#0d0+1,76#36#0#0#0d0+54,77#2c#0#0#0d0+44,8a#a#0#0#0d0+10,7c#26#0#0#0d0+38,7d#e6#0#0#0d0+230', 0);
INSERT INTO `world.entity.objects` VALUES (11990, 7382, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11991, 7383, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11993, 7405, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11988, 7143, 1, -1, '70#8#0#0#0d0+8,e1#1b#0#0#0d0+27,73#9#0#0#0d0+9,76#54#0#0#0d0+84,77#2b#0#0#0d0+43,8a#15#0#0#0d0+21,7d#1b5#0#0#0d0+437,ae#12c#0#0#0d0+300', 3);
INSERT INTO `world.entity.objects` VALUES (11952, 9461, 1, -1, 'b0#12#0#0#0d0+18,70#6#0#0#0d0+6,f0#a#0#0#0d0+10,f2#7#0#0#0d0+7,73#a#0#0#0d0+10,d5#8#0#0#0d0+8,76#5f#0#0#0d0+95,b6#1#0#0#0d0+1,7c#1f#0#0#0d0+31,7d#1d7#0#0#0d0+471', 0);
INSERT INTO `world.entity.objects` VALUES (11927, 1551, 97, -1, '76#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (11929, 7433, 100, -1, '73#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11925, 7261, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11969, 7143, 1, -1, '70#a#0#0#0d0+10,e1#12#0#0#0d0+18,73#9#0#0#0d0+9,76#5c#0#0#0d0+92,77#1f#0#0#0d0+31,8a#d#0#0#0d0+13,7d#191#0#0#0d0+401,ae#12c#0#0#0d0+300', 0);
INSERT INTO `world.entity.objects` VALUES (11906, 7223, 117, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11907, 7224, 131, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11908, 7403, 20, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11909, 7404, 11, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11910, 7023, 49, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11894, 8989, 1, 6, '80#2#0#0#0d0+2,70#6#0#0#0d0+6,b0#f#0#0#0d0+15,f0#5#0#0#0d0+5,f1#5#0#0#0d0+5,b2#7#0#0#0d0+7,f2#4#0#0#0d0+4,f3#6#0#0#0d0+6,f4#5#0#0#0d0+5,7c#1a#0#0#0d0+26,7d#bd#0#0#0d0+189', 0);
INSERT INTO `world.entity.objects` VALUES (11895, 8264, 1, 5, '80#1#0#0#0d0+1,8a#4#0#0#0d0+4,ae#b4#0#0#0d0+180,b0#d#0#0#0d0+13,f0#8#0#0#0d0+8,f1#4#0#0#0d0+4,f2#7#0#0#0d0+7,73#2#0#0#0d0+2,d3#8#0#0#0d0+8,f3#5#0#0#0d0+5,d4#6#0#0#0d0+6,f4#5#0#0#0d0+5,76#21#0#0#0d0+33,b6#2#0#0#0d0+2,d7#4#0#0#0d0+4,7c#1b#0#0#0d0+27,7d#51#0#0#0d0+81,9e#10d#0#0#0d0+269', 0);
INSERT INTO `world.entity.objects` VALUES (11905, 7222, 125, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (3776, 8839, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (3788, 8839, 1, -1, '99#88#0#0#0d0+136,ae#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (3753, 8839, 1, -1, '7c#2#0#0#0d0+2,7d#1ef#0#0#0d0+495,76#2#0#0#0d0+2,ae#10#0#0#0d0+16', 0);
INSERT INTO `world.entity.objects` VALUES (3771, 8839, 1, -1, 'ae#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2735, 8839, 1, -1, 'b0#d#0#0#0d0+13,70#7#0#0#0d0+7,f0#8#0#0#0d0+8,d2#4#0#0#0d0+4,73#1#0#0#0d0+1,76#25#0#0#0d0+37,8a#6#0#0#0d0+6,7c#20#0#0#0d0+32,7d#d2#0#0#0d0+210,ae#de#0#0#0d0+222', 0);
INSERT INTO `world.entity.objects` VALUES (3744, 8839, 1, -1, 'b0#6#0#0#0d0+6,70#3#0#0#0d0+3,f0#4#0#0#0d0+4,76#3d#0#0#0d0+61,8a#6#0#0#0d0+6,7c#27#0#0#0d0+39,7d#15b#0#0#0d0+347,ae#12e#0#0#0d0+302', 0);
INSERT INTO `world.entity.objects` VALUES (3884, 1547, 146, -1, '7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2698, 2410, 1, -1, '7d#a9#0#0#0d0+169,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (7888, 948, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (3886, 2411, 1, -1, '76#b#0#0#0d0+11,7e#1b#0#0#0d0+27', 0);
INSERT INTO `world.entity.objects` VALUES (2611, 1557, 71, -1, '6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2701, 7921, 1, -1, '80#1#0#0#0d0+1,d4#7#0#0#0d0+7,77#2f#0#0#0d0+47,d7#7#0#0#0d0+7,a8#1#0#0#0d0+1,7c#1c#0#0#0d0+28,7d#a9#0#0#0d0+169', 0);
INSERT INTO `world.entity.objects` VALUES (3765, 2410, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2583, 6913, 1, -1, '75#1#0#0#0d0+1,7d#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (11150, 2528, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11151, 1890, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (2524, 6913, 1, -1, '74#3#0#0#0d0+3,7c#1#0#0#0d0+1,7d#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2459, 6913, 1, -1, '74#4#0#0#0d0+4,ae#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2405, 6913, 1, -1, '74#2#0#0#0d0+2,75#1#0#0#0d0+1,7c#4#0#0#0d0+4,7d#4#0#0#0d0+4,ae#9#0#0#0d0+9', 0);
INSERT INTO `world.entity.objects` VALUES (2406, 6913, 1, -1, '74#2#0#0#0d0+2,7c#d#0#0#0d0+13,7d#7#0#0#0d0+7,ae#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (2368, 6913, 1, -1, '74#2#0#0#0d0+2,7c#6#0#0#0d0+6,75#1#0#0#0d0+1,7d#2#0#0#0d0+2,ae#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (2498, 6913, 1, -1, '74#2#0#0#0d0+2,75#1#0#0#0d0+1,7c#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2908, 8839, 1, -1, 'f0#9#0#0#0d0+9,70#b#0#0#0d0+11,b0#10#0#0#0d0+16,d2#c#0#0#0d0+12,73#1#0#0#0d0+1,76#3c#0#0#0d0+60,8a#9#0#0#0d0+9,7c#22#0#0#0d0+34,7d#b4#0#0#0d0+180,ae#13d#0#0#0d0+317', 0);
INSERT INTO `world.entity.objects` VALUES (2248, 1546, 85, -1, '7c#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (2216, 9461, 1, -1, '70#2#0#0#0d0+2,b0#2#0#0#0d0+2,76#4a#0#0#0d0+74,7c#3#0#0#0d0+3,7d#17d#0#0#0d0+381', 0);
INSERT INTO `world.entity.objects` VALUES (11821, 2438, 1, -1, '76#4e#0#0#0d0+78,7e#11#0#0#0d0+17', 0);
INSERT INTO `world.entity.objects` VALUES (2176, 7438, 10, -1, '75#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2886, 1548, 209, -1, '7d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (2962, 2410, 1, -1, '7c#15#0#0#0d0+21,7d#15#0#0#0d0+21,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2965, 2410, 1, -1, '7c#6#0#0#0d0+6,7d#15#0#0#0d0+21,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2970, 2410, 1, -1, '7c#c#0#0#0d0+12,7d#1a#0#0#0d0+26,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2977, 2410, 1, -1, '7c#12#0#0#0d0+18,7d#22#0#0#0d0+34,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2980, 2410, 1, -1, '7c#6#0#0#0d0+6,7d#14#0#0#0d0+20,7f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (2987, 2531, 1, -1, '7c#c#0#0#0d0+12,7d#2e#0#0#0d0+46', 0);
INSERT INTO `world.entity.objects` VALUES (2993, 2531, 1, -1, '7c#6#0#0#0d0+6,7d#11#0#0#0d0+17', 0);
INSERT INTO `world.entity.objects` VALUES (3675, 2531, 1, -1, '7c#85#0#0#0d0+133,7d#435#0#0#0d0+1077', 0);
INSERT INTO `world.entity.objects` VALUES (3036, 2531, 1, -1, '7d#151#0#0#0d0+337', 179);
INSERT INTO `world.entity.objects` VALUES (3644, 2531, 1, -1, '7c#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (3901, 2411, 1, -1, '76#27#0#0#0d0+39,7d#5a#0#0#0d0+90,7e#1f#0#0#0d0+31', 0);
INSERT INTO `world.entity.objects` VALUES (3407, 2531, 1, -1, '75#1#0#0#0d0+1,7c#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (3647, 2531, 1, -1, '7c#40#0#0#0d0+64,7d#1fe#0#0#0d0+510', 0);
INSERT INTO `world.entity.objects` VALUES (3799, 2531, 1, -1, '7c#94#0#0#0d0+148,7d#489#0#0#0d0+1161', 0);
INSERT INTO `world.entity.objects` VALUES (3903, 2531, 1, -1, '7c#123#0#0#0d0+291,7d#376#0#0#0d0+886', 0);
INSERT INTO `world.entity.objects` VALUES (3674, 2531, 1, -1, '7c#38#0#0#0d0+56,7d#199#0#0#0d0+409', 0);
INSERT INTO `world.entity.objects` VALUES (3874, 8839, 1, -1, '70#1#0#0#0d0+1,73#3#0#0#0d0+3,76#3a#0#0#0d0+58,99#69#0#0#0d0+105,8a#b#0#0#0d0+11,7c#5#0#0#0d0+5,ae#1ad#0#0#0d0+429', 45);
INSERT INTO `world.entity.objects` VALUES (3887, 2411, 1, -1, '76#15#0#0#0d0+21,7e#1a#0#0#0d0+26', 0);
INSERT INTO `world.entity.objects` VALUES (3888, 2411, 1, -1, '76#12#0#0#0d0+18,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (3910, 2531, 1, -1, '7d#2f8#0#0#0d0+760,6f#12#0#0#0d0+18', 0);
INSERT INTO `world.entity.objects` VALUES (3916, 2531, 1, -1, '7c#21#0#0#0d0+33,7d#9#0#0#0d0+9,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (3923, 2531, 1, -1, '7c#27#0#0#0d0+39,7d#35#0#0#0d0+53,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (4111, 2531, 1, -1, '7d#11d#0#0#0d0+285', 56);
INSERT INTO `world.entity.objects` VALUES (4171, 2531, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (4196, 2531, 1, -1, '7d#14d#0#0#0d0+333', 82);
INSERT INTO `world.entity.objects` VALUES (7883, 948, 1, -1, '98#53#0#0#0d0+83,9a#105#0#0#0d0+261,9b#12c#0#0#0d0+300,7d#2#0#0#0d0+2,9d#12c#0#0#0d0+300', 0);
INSERT INTO `world.entity.objects` VALUES (9887, 8840, 1, -1, 'b0#d#0#0#0d0+13,70#e#0#0#0d0+14,f1#b#0#0#0d0+11,73#4#0#0#0d0+4,d3#e#0#0#0d0+14,99#7c#0#0#0d0+124,8a#9#0#0#0d0+9,7b#50#0#0#0d0+80,7c#8#0#0#0d0+8,ae#191#0#0#0d0+401', 25);
INSERT INTO `world.entity.objects` VALUES (7887, 948, 1, -1, '98#12c#0#0#0d0+300,9a#12c#0#0#0d0+300,9b#12c#0#0#0d0+300,7d#1e#0#0#0d0+30,9d#12c#0#0#0d0+300', 0);
INSERT INTO `world.entity.objects` VALUES (4758, 2531, 1, -1, '7d#46#0#0#0d0+70,7e#3a#0#0#0d0+58', 0);
INSERT INTO `world.entity.objects` VALUES (4730, 2531, 1, -1, '7d#2d#0#0#0d0+45,7e#3c#0#0#0d0+60', 0);
INSERT INTO `world.entity.objects` VALUES (4769, 2531, 1, -1, '7d#62#0#0#0d0+98,7e#9#0#0#0d0+9', 0);
INSERT INTO `world.entity.objects` VALUES (4777, 2531, 1, -1, '7d#6d#0#0#0d0+109', 97);
INSERT INTO `world.entity.objects` VALUES (4784, 2531, 1, -1, '7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (4791, 2531, 1, -1, '7d#61#0#0#0d0+97,7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (4800, 2531, 1, -1, '7d#12#0#0#0d0+18,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4808, 2531, 1, -1, '7d#10#0#0#0d0+16,7e#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (4812, 2531, 1, -1, '7d#1e9#0#0#0d0+489,7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (4817, 2531, 1, -1, '7d#1e3#0#0#0d0+483,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4820, 2531, 1, -1, '7d#66#0#0#0d0+102', 0);
INSERT INTO `world.entity.objects` VALUES (4827, 2531, 1, -1, '7d#9f#0#0#0d0+159,7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (4838, 2531, 1, -1, '7d#58#0#0#0d0+88,7e#15#0#0#0d0+21,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (4841, 2531, 1, -1, '7d#60#0#0#0d0+96', 0);
INSERT INTO `world.entity.objects` VALUES (4851, 2531, 1, -1, '7d#46#0#0#0d0+70,7e#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (7882, 948, 1, -1, '9a#1d#0#0#0d0+29,7b#4#0#0#0d0+4,9b#c2#0#0#0d0+194,9d#c7#0#0#0d0+199,7d#6#0#0#0d0+6,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (4868, 2531, 1, -1, '7d#69#0#0#0d0+105,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4870, 2531, 1, -1, '7d#5f#0#0#0d0+95', 0);
INSERT INTO `world.entity.objects` VALUES (4879, 2531, 1, -1, '7d#55#0#0#0d0+85,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4894, 2531, 1, -1, '7d#50#0#0#0d0+80,7e#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (4906, 2531, 1, -1, '7d#4e#0#0#0d0+78,7e#1b#0#0#0d0+27', 0);
INSERT INTO `world.entity.objects` VALUES (4914, 2531, 1, -1, '7d#5a#0#0#0d0+90,7e#3#0#0#0d0+3', 0);
INSERT INTO `world.entity.objects` VALUES (4918, 2531, 1, -1, '7d#4f#0#0#0d0+79,7e#6#0#0#0d0+6,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (4927, 2531, 1, -1, '7d#64#0#0#0d0+100', 0);
INSERT INTO `world.entity.objects` VALUES (4936, 2531, 1, -1, '7d#50#0#0#0d0+80,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4940, 2531, 1, -1, '7d#6c#0#0#0d0+108', 97);
INSERT INTO `world.entity.objects` VALUES (7876, 948, 1, -1, '98#100#0#0#0d0+256,9a#bb#0#0#0d0+187,7d#1a#0#0#0d0+26,9d#a#0#0#0d0+10,7e#25#0#0#0d0+37', 30);
INSERT INTO `world.entity.objects` VALUES (4958, 2531, 1, -1, '7d#5a#0#0#0d0+90,7e#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (4965, 2531, 1, -1, '7d#67#0#0#0d0+103', 0);
INSERT INTO `world.entity.objects` VALUES (4976, 2531, 1, -1, '7d#59#0#0#0d0+89,7e#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (7824, 948, 1, -1, '98#bb#0#0#0d0+187,9a#12c#0#0#0d0+300,7d#5#0#0#0d0+5', 79);
INSERT INTO `world.entity.objects` VALUES (5015, 2531, 1, -1, '7d#46#0#0#0d0+70,7e#27#0#0#0d0+39', 97);
INSERT INTO `world.entity.objects` VALUES (7060, 7884, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (5032, 2531, 1, -1, '7d#4b#0#0#0d0+75,7e#c#0#0#0d0+12', 0);
INSERT INTO `world.entity.objects` VALUES (7963, 948, 1, -1, '98#82#0#0#0d0+130,9a#da#0#0#0d0+218,9b#e2#0#0#0d0+226,7d#16#0#0#0d0+22', 0);
INSERT INTO `world.entity.objects` VALUES (6739, 1556, 94, -1, '7b#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (5098, 2531, 1, -1, '7d#51#0#0#0d0+81', 97);
INSERT INTO `world.entity.objects` VALUES (5107, 2531, 1, -1, '7d#94#0#0#0d0+148', 97);
INSERT INTO `world.entity.objects` VALUES (5110, 2531, 1, -1, '7d#50#0#0#0d0+80,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (7955, 948, 1, -1, '9a#24#0#0#0d0+36,9b#81#0#0#0d0+129,7d#4#0#0#0d0+4,9d#12c#0#0#0d0+300', 0);
INSERT INTO `world.entity.objects` VALUES (5290, 2531, 1, -1, '70#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (5437, 948, 1, -1, '98#2f#0#0#0d0+47,9a#d2#0#0#0d0+210,9b#136#0#0#0d0+310,9d#136#0#0#0d0+310,7d#1ef#0#0#0d0+495', 169);
INSERT INTO `world.entity.objects` VALUES (7964, 948, 1, -1, '98#122#0#0#0d0+290,9a#12c#0#0#0d0+300,9b#104#0#0#0d0+260', 0);
INSERT INTO `world.entity.objects` VALUES (9925, 897, 1, -1, '64#8#c#0#1d5+7,73#1#0#0#0d0+1,9b#12#0#0#0d0+18,7c#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (5800, 2531, 1, -1, '70#2#0#0#0d0+2,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (8339, 2531, 1, -1, '7d#f0#0#0#0d0+240,6f#1#0#0#0d0+1', 1);
INSERT INTO `world.entity.objects` VALUES (5799, 2531, 1, -1, '6f#1#0#0#0d0+1', 10);
INSERT INTO `world.entity.objects` VALUES (5981, 2531, 1, -1, '7d#fb#0#0#0d0+251,6f#1#0#0#0d0+1', 70);
INSERT INTO `world.entity.objects` VALUES (9929, 1026, 1, -1, '64#4#7#0#1d4+3,77#1e#0#0#0d0+30,98#a#0#0#0d0+10,7d#f#0#0#0d0+15', 0);
INSERT INTO `world.entity.objects` VALUES (5795, 8919, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (9926, 1373, 1, -1, '63#8#c#0#1d5+7,99#16#0#0#0d0+22,9c#12#0#0#0d0+18', 0);
INSERT INTO `world.entity.objects` VALUES (8195, 2531, 1, -1, '7d#112#0#0#0d0+274,6f#1#0#0#0d0+1', 4);
INSERT INTO `world.entity.objects` VALUES (8153, 2531, 1, -1, '7d#4f#0#0#0d0+79,6f#1#0#0#0d0+1', 97);
INSERT INTO `world.entity.objects` VALUES (6279, 2531, 1, -1, '7d#121#0#0#0d0+289,6f#1#0#0#0d0+1', 46);
INSERT INTO `world.entity.objects` VALUES (8096, 2438, 1, -1, '76#26#0#0#0d0+38,7e#11#0#0#0d0+17', 0);
INSERT INTO `world.entity.objects` VALUES (11017, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#1f#0#0#0d0+31,7d#6d#0#0#0d0+109,7e#25#0#0#0d0+37', 0);
INSERT INTO `world.entity.objects` VALUES (9423, 2438, 1, -1, '76#63#0#0#0d0+99,7e#14#0#0#0d0+20', 0);
INSERT INTO `world.entity.objects` VALUES (9374, 2438, 1, -1, '76#57#0#0#0d0+87,7e#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (9344, 2411, 1, -1, '7e#39#0#0#0d0+57', 0);
INSERT INTO `world.entity.objects` VALUES (8452, 2469, 1, -1, '7e#f#0#0#0d0+15,6f#1#0#0#0d0+1', 4);
INSERT INTO `world.entity.objects` VALUES (8971, 2469, 1, -1, '7e#32#0#0#0d0+50,6f#1#0#0#0d0+1', 10);
INSERT INTO `world.entity.objects` VALUES (8740, 2469, 1, -1, '7e#3f#0#0#0d0+63,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (9219, 2469, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (9927, 1374, 1, -1, '61#4#9#0#1d6+3,b8#4#0#0#0d0+4,9a#28#0#0#0d0+40', 0);
INSERT INTO `world.entity.objects` VALUES (9526, 8839, 1, -1, 'b0#1#0#0#0d0+1,76#48#0#0#0d0+72,99#1e#0#0#0d0+30,7c#25#0#0#0d0+37,ae#bf#0#0#0d0+191', 0);
INSERT INTO `world.entity.objects` VALUES (11022, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#1a#0#0#0d0+26,7d#84#0#0#0d0+132,7e#2e#0#0#0d0+46', 0);
INSERT INTO `world.entity.objects` VALUES (9575, 8839, 1, -1, '70#3#0#0#0d0+3,76#14#0#0#0d0+20,99#96#0#0#0d0+150', 0);
INSERT INTO `world.entity.objects` VALUES (9584, 8839, 1, -1, '70#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (9620, 8839, 1, -1, '99#96#0#0#0d0+150', 0);
INSERT INTO `world.entity.objects` VALUES (9928, 1504, 1, -1, '64#6#b#0#1d6+5,77#14#0#0#0d0+20,31b#1#0#0#0d0+1,7d#14#0#0#0d0+20', 0);
INSERT INTO `world.entity.objects` VALUES (9637, 8839, 1, -1, '70#4#0#0#0d0+4,f0#e#0#0#0d0+14,d2#5#0#0#0d0+5,73#4#0#0#0d0+4,75#1#0#0#0d0+1,76#50#0#0#0d0+80,99#96#0#0#0d0+150,8a#f#0#0#0d0+15,7c#32#0#0#0d0+50', 4);
INSERT INTO `world.entity.objects` VALUES (9930, 1369, 1, -1, '62#1#f#0#1d15+0,77#23#0#0#0d0+35,9c#20#0#0#0d0+32', 0);
INSERT INTO `world.entity.objects` VALUES (9719, 8840, 1, -1, '99#96#0#0#0d0+150,7b#1c#0#0#0d0+28,ae#8a#0#0#0d0+138', 1);
INSERT INTO `world.entity.objects` VALUES (9768, 8840, 1, -1, '99#96#0#0#0d0+150', 0);
INSERT INTO `world.entity.objects` VALUES (9891, 2474, 1, -1, '76#2#0#0#0d0+2,77#2#0#0#0d0+2,7b#2#0#0#0d0+2,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (9931, 919, 1, -1, '64#6#a#0#1d5+5,70#1#0#0#0d0+1,9d#1e#0#0#0d0+30,7e#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (11071, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#19#0#0#0d0+25,7d#78#0#0#0d0+120,7e#2b#0#0#0d0+43', 7);
INSERT INTO `world.entity.objects` VALUES (9933, 7666, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (9934, 8495, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (9935, 8496, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (9954, 150, 1, -1, '64#1#5#0#1d5+0', 0);
INSERT INTO `world.entity.objects` VALUES (9955, 454, 1, -1, '64#2#4#0#1d3+1', 0);
INSERT INTO `world.entity.objects` VALUES (11024, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#27#0#0#0d0+39,7d#6c#0#0#0d0+108,7e#2d#0#0#0d0+45', 0);
INSERT INTO `world.entity.objects` VALUES (10150, 1728, 1, -1, '320#2#0#2,326#7#0#7,328#7e3#2c2#525', 0);
INSERT INTO `world.entity.objects` VALUES (10175, 1728, 1, -1, '320#2#0#2,326#7#0#7,328#7e3#2c2#525', 0);
INSERT INTO `world.entity.objects` VALUES (11023, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#24#0#0#0d0+36,7d#8d#0#0#0d0+141,7e#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (10189, 9130, 1, 0, 'b0#e#0#0#0d0+14,70#7#0#0#0d0+7,d3#a#0#0#0d0+10,8a#20#0#0#0d0+32,7c#30#0#0#0d0+48,7d#109#0#0#0d0+265,ae#22e#0#0#0d0+558,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (10190, 9146, 1, -1, '70#8#0#0#0d0+8,b0#b#0#0#0d0+11,d2#8#0#0#0d0+8,75#1#0#0#0d0+1,b6#2#0#0#0d0+2,8a#28#0#0#0d0+40,7c#2a#0#0#0d0+42,7d#156#0#0#0d0+342', 0);
INSERT INTO `world.entity.objects` VALUES (11054, 388, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11734, 8405, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (10319, 7680, 1, -1, '7e#a#0#0#0d0+10', 0);
INSERT INTO `world.entity.objects` VALUES (10998, 1728, 1, -1, '320#8#0#8,326#7#0#7,328#7e3#2c2#525', 0);
INSERT INTO `world.entity.objects` VALUES (11025, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#20#0#0#0d0+32,7d#7d#0#0#0d0+125,7e#30#0#0#0d0+48', 0);
INSERT INTO `world.entity.objects` VALUES (11056, 519, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11074, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#18#0#0#0d0+24,7d#83#0#0#0d0+131,7e#34#0#0#0d0+52', 0);
INSERT INTO `world.entity.objects` VALUES (10999, 1561, 1, -1, '60#1#0#0#0d0+1,61#1#0#0#0d0+1,62#1#0#0#0d0+1,63#1#0#0#0d0+1,7c#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (10568, 7680, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11044, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#3#0#0#0d0+3,7c#15#0#0#0d0+21,7d#61#0#0#0d0+97,7e#18#0#0#0d0+24', 0);
INSERT INTO `world.entity.objects` VALUES (11067, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#2#0#0#0d0+2,7c#26#0#0#0d0+38,7d#6c#0#0#0d0+108,7e#20#0#0#0d0+32', 9);
INSERT INTO `world.entity.objects` VALUES (11052, 386, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11053, 387, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11055, 486, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (10923, 7680, 1, -1, 'b0#8#0#0#0d0+8,8a#1c#0#0#0d0+28,7c#2d#0#0#0d0+45,7d#190#0#0#0d0+400,7e#2a#0#0#0d0+42', 0);
INSERT INTO `world.entity.objects` VALUES (11077, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#1f#0#0#0d0+31,7d#85#0#0#0d0+133,7e#26#0#0#0d0+38', 0);
INSERT INTO `world.entity.objects` VALUES (11082, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7b#a#0#0#0d0+10,7c#25#0#0#0d0+37,7d#7f#0#0#0d0+127,7e#2b#0#0#0d0+43', 1);
INSERT INTO `world.entity.objects` VALUES (11087, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#1f#0#0#0d0+31,7d#94#0#0#0d0+148,7e#30#0#0#0d0+48', 4);
INSERT INTO `world.entity.objects` VALUES (11057, 393, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11058, 394, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11059, 463, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11060, 434, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11061, 307, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11062, 435, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11063, 371, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11064, 437, 7, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11065, 6909, 3, -1, 'b2#1#0#0#0d0+1,77#e#0#0#0d0+14', 0);
INSERT INTO `world.entity.objects` VALUES (11078, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#20#0#0#0d0+32,7d#82#0#0#0d0+130,7e#26#0#0#0d0+38', 0);
INSERT INTO `world.entity.objects` VALUES (11079, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#21#0#0#0d0+33,7d#96#0#0#0d0+150,7e#30#0#0#0d0+48', 0);
INSERT INTO `world.entity.objects` VALUES (11080, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#18#0#0#0d0+24,7d#8a#0#0#0d0+138,7e#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (11083, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#1e#0#0#0d0+30,7d#84#0#0#0d0+132,7e#21#0#0#0d0+33', 0);
INSERT INTO `world.entity.objects` VALUES (11084, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#26#0#0#0d0+38,7d#7b#0#0#0d0+123,7e#1f#0#0#0d0+31', 0);
INSERT INTO `world.entity.objects` VALUES (11093, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#28#0#0#0d0+40,7d#70#0#0#0d0+112,7e#35#0#0#0d0+53', 4);
INSERT INTO `world.entity.objects` VALUES (11094, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#16#0#0#0d0+22,7d#7b#0#0#0d0+123,7e#2f#0#0#0d0+47', 0);
INSERT INTO `world.entity.objects` VALUES (11098, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#1a#0#0#0d0+26,7d#93#0#0#0d0+147,7e#1f#0#0#0d0+31', 0);
INSERT INTO `world.entity.objects` VALUES (11101, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#27#0#0#0d0+39,7d#68#0#0#0d0+104,7e#25#0#0#0d0+37', 0);
INSERT INTO `world.entity.objects` VALUES (11102, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#27#0#0#0d0+39,7d#68#0#0#0d0+104,7e#23#0#0#0d0+35', 0);
INSERT INTO `world.entity.objects` VALUES (11103, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#27#0#0#0d0+39,7d#68#0#0#0d0+104,7e#25#0#0#0d0+37', 0);
INSERT INTO `world.entity.objects` VALUES (11105, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#20#0#0#0d0+32,7d#89#0#0#0d0+137,7e#29#0#0#0d0+41', 0);
INSERT INTO `world.entity.objects` VALUES (11106, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#20#0#0#0d0+32,7d#84#0#0#0d0+132,7e#29#0#0#0d0+41', 0);
INSERT INTO `world.entity.objects` VALUES (11109, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#24#0#0#0d0+36,7d#72#0#0#0d0+114,7e#2b#0#0#0d0+43', 0);
INSERT INTO `world.entity.objects` VALUES (11111, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#22#0#0#0d0+34,7d#72#0#0#0d0+114,7e#2b#0#0#0d0+43', 0);
INSERT INTO `world.entity.objects` VALUES (11113, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#3#0#0#0d0+3,7c#24#0#0#0d0+36,7d#6e#0#0#0d0+110,7e#2b#0#0#0d0+43', 0);
INSERT INTO `world.entity.objects` VALUES (11136, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#2#0#0#0d0+2,7c#25#0#0#0d0+37,7d#92#0#0#0d0+146,7e#2b#0#0#0d0+43', 0);
INSERT INTO `world.entity.objects` VALUES (11116, 7154, 1, -1, '64#9#11#0#1d9+8,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#20#0#0#0d0+32,7d#a3#0#0#0d0+163,7e#2d#0#0#0d0+45', 0);
INSERT INTO `world.entity.objects` VALUES (11118, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#5#0#0#0d0+5,7c#1e#0#0#0d0+30,7d#84#0#0#0d0+132,7e#29#0#0#0d0+41', 0);
INSERT INTO `world.entity.objects` VALUES (11119, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#3#0#0#0d0+3,7c#24#0#0#0d0+36,7d#72#0#0#0d0+114,7e#2b#0#0#0d0+43', 0);
INSERT INTO `world.entity.objects` VALUES (11840, 945, 92, -1, '7c#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (11126, 9147, 1, -1, 'b0#e#0#0#0d0+14,70#9#0#0#0d0+9,73#3#0#0#0d0+3,d4#6#0#0#0d0+6,d5#8#0#0#0d0+8,b6#1#0#0#0d0+1,77#1f#0#0#0d0+31,8a#13#0#0#0d0+19,7c#1b#0#0#0d0+27,7d#108#0#0#0d0+264,ae#105#0#0#0d0+261', 7);
INSERT INTO `world.entity.objects` VALUES (11130, 9147, 1, -1, '70#9#0#0#0d0+9,b0#e#0#0#0d0+14,73#5#0#0#0d0+5,d4#6#0#0#0d0+6,d5#5#0#0#0d0+5,b6#1#0#0#0d0+1,77#26#0#0#0d0+38,8a#b#0#0#0d0+11,7c#1c#0#0#0d0+28,7d#134#0#0#0d0+308,ae#10a#0#0#0d0+266', 5);
INSERT INTO `world.entity.objects` VALUES (11152, 1974, 14, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11153, 7030, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11154, 2551, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11841, 936, 90, -1, '7b#7#0#0#0d0+7', 0);
INSERT INTO `world.entity.objects` VALUES (11138, 7154, 1, -1, '63#4#8#0#1d5+3,63#9#11#0#1d9+8,65#1#0#0#0d0+1,73#4#0#0#0d0+4,7c#1f#0#0#0d0+31,7d#8c#0#0#0d0+140,7e#2f#0#0#0d0+47', 0);
INSERT INTO `world.entity.objects` VALUES (11141, 1521, 10, -1, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11143, 1523, 13, -1, '7d#5#0#0#0d0+5', 0);
INSERT INTO `world.entity.objects` VALUES (11145, 1554, 102, -1, '7d#32#0#0#0d0+50', 0);
INSERT INTO `world.entity.objects` VALUES (11146, 1522, 19, -1, '7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11839, 9461, 1, -1, '76#12#0#0#0d0+18', 0);
INSERT INTO `world.entity.objects` VALUES (11155, 2556, 12, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11156, 2557, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11157, 1773, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11903, 7024, 44, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11160, 1770, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11161, 1772, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11162, 6742, 1, -1, '73#1#0#0#0d0+1,75#1#0#0#0d0+1,7d#b#0#0#0d0+11', 0);
INSERT INTO `world.entity.objects` VALUES (11185, 7292, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11186, 7374, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11187, 7294, 5, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11188, 7343, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11836, 9461, 1, -1, '76#15#0#0#0d0+21', 0);
INSERT INTO `world.entity.objects` VALUES (11344, 2386, 1, 7, '70#5#0#0#0d0+5,73#a#0#0#0d0+10,ae#64#0#0#0d0+100', 0);
INSERT INTO `world.entity.objects` VALUES (11844, 2473, 1, -1, '76#4#0#0#0d0+4,7b#1#0#0#0d0+1,7c#2#0#0#0d0+2,7e#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11779, 9461, 1, -1, 'b0#e#0#0#0d0+14,d5#4#0#0#0d0+4,76#23#0#0#0d0+35,7c#5#0#0#0d0+5,7d#f4#0#0#0d0+244', 6);
INSERT INTO `world.entity.objects` VALUES (11403, 8530, 1, -1, '70#4#0#0#0d0+4,b6#5#0#0#0d0+5,7c#2#0#0#0d0+2,7d#3a#0#0#0d0+58,ae#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (11519, 1568, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11520, 385, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11521, 881, 18, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11522, 883, 17, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11523, 884, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11524, 885, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11525, 2469, 1, 4, '6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11552, 972, 1, -1, '7c#13#0#0#0d0+19', 0);
INSERT INTO `world.entity.objects` VALUES (11553, 972, 1, -1, '7c#29#0#0#0d0+41', 0);
INSERT INTO `world.entity.objects` VALUES (11616, 2531, 1, 6, '7d#1e#0#0#0d0+30,6f#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11658, 901, 40, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11659, 2646, 8, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11660, 8390, 22, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11661, 2647, 30, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11662, 2266, 4, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11664, 8320, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11665, 7509, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11666, 8392, 13, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11667, 479, 15, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11670, 2643, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11671, 2645, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11672, 10741, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11673, 8391, 6, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11674, 477, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11675, 7924, 10, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11714, 9234, 1, -1, '3cb#1#0#0#0d0+1,3cc#1#0#0#0d0+1,3cd#a#0#0#0d0+10,3ce#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11735, 10727, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11717, 7904, 28, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11718, 8061, 3, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11719, 7903, 27, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11720, 8063, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11722, 8064, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11723, 8059, 2, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11736, 8072, 1, -1, 'b0#d#0#0#0d0+13', 0);
INSERT INTO `world.entity.objects` VALUES (11904, 7025, 35, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11742, 10310, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11743, 10207, 1, -1, '325#0#0#1567366615170,,32e#0#0#620,32e#0#0#2311,32e#0#0#1ef4,32e#0#0#20f7,32e#0#0#1ee4,32e#0#0#230f,32e#0#0#20f4,32e#0#0#1fcb,32e#0#0#20f6,32e#0#0#1c90,32e#0#0#241f,32e#0#0#1fcf,32e#0#0#2080,32e#0#0#1f89,32e#0#0#22d5,32e#0#0#2420,32e#0#0#1c8d,32e#0#0#1d85,32e#0#0#1fdc,32e#0#0#1ef6,32e#0#0#621,32e#0#0#20f5,32e#0#0#1c8f,32e#0#0#1ef7,32e#0#0#1ae4,32e#0#0#2097,32e#0#0#2426,32e#0#0#1c8e,32e#0#0#1d57,32e#0#0#1fce,32e#0#0#2161,32e#0#0#230b,32e#0#0#1fdc,32e#0#0#230c,32e#0#0#2096,32e#0#0#622,32e#0#0#1fc7', 0);
INSERT INTO `world.entity.objects` VALUES (11788, 9461, 1, -1, 'b0#13#0#0#0d0+19,70#6#0#0#0d0+6,f0#9#0#0#0d0+9,f2#6#0#0#0d0+6,73#4#0#0#0d0+4,d5#8#0#0#0d0+8,b6#1#0#0#0d0+1,76#4b#0#0#0d0+75,7c#21#0#0#0d0+33,7d#18e#0#0#0d0+398,7e#1#0#0#0d0+1', 7);
INSERT INTO `world.entity.objects` VALUES (11827, 9461, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11809, 9461, 1, -1, '', 3);
INSERT INTO `world.entity.objects` VALUES (11829, 9461, 1, -1, '70#3#0#0#0d0+3,b0#e#0#0#0d0+14,f0#a#0#0#0d0+10,73#4#0#0#0d0+4,d5#1#0#0#0d0+1,76#3#0#0#0d0+3,b6#1#0#0#0d0+1,7c#28#0#0#0d0+40,7d#13e#0#0#0d0+318', 2);
INSERT INTO `world.entity.objects` VALUES (11869, 2473, 1, -1, '76#8#0#0#0d0+8', 0);
INSERT INTO `world.entity.objects` VALUES (11859, 2473, 1, -1, '76#6#0#0#0d0+6', 0);
INSERT INTO `world.entity.objects` VALUES (11866, 936, 1, -1, '', 0);
INSERT INTO `world.entity.objects` VALUES (11861, 2473, 1, -1, '76#5#0#0#0d0+5,77#2#0#0#0d0+2,7b#1#0#0#0d0+1,7c#1#0#0#0d0+1,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (11862, 945, 1, -1, '7c#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11863, 936, 1, -1, '7b#4#0#0#0d0+4', 0);
INSERT INTO `world.entity.objects` VALUES (11870, 936, 1, -1, '7b#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11842, 951, 1, -1, '64#1#0#0#0d0+1', 0);
INSERT INTO `world.entity.objects` VALUES (11846, 2473, 2, -1, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#2#0#0#0d0+2,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (11848, 2473, 1, -1, '76#1#0#0#0d0+1,77#1#0#0#0d0+1,7b#2#0#0#0d0+2,7c#1#0#0#0d0+1,7e#2#0#0#0d0+2', 0);
INSERT INTO `world.entity.objects` VALUES (11867, 945, 1, -1, '76#3#0#0#0d0+3,7c#1#0#0#0d0+1', 0);

-- ----------------------------
-- Table structure for world.entity.obvijevans
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.obvijevans`;
CREATE TABLE `world.entity.obvijevans`  (
  `id` int(10) NOT NULL,
  `template` int(10) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of world.entity.obvijevans
-- ----------------------------
INSERT INTO `world.entity.obvijevans` VALUES (17033, 1771);
INSERT INTO `world.entity.obvijevans` VALUES (17032, 1744);

-- ----------------------------
-- Table structure for world.entity.pets
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.pets`;
CREATE TABLE `world.entity.pets`  (
  `id` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `lastEatDate` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quantityEat` int(1) NOT NULL,
  `pdv` int(11) NOT NULL,
  `corpulence` int(11) NOT NULL,
  `isEPO` int(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of world.entity.pets
-- ----------------------------
INSERT INTO `world.entity.pets` VALUES (1703, 8151, '1546364366224', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1798, 8151, '1556201548144', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (-1, 8151, '1556293256207', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1934, 8151, '1556293373067', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1940, 8151, '1556294321127', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1942, 8151, '1556294412389', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1944, 8151, '1556294598724', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1946, 8151, '1556294624371', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1948, 8151, '1556294714068', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (1950, 8151, '1556294817219', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2037, 8151, '1558366999688', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2038, 8151, '1557225120961', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2043, 8151, '1558374258135', 0, 0, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2044, 8151, '1557226782368', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2049, 8151, '1557227220357', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2083, 1728, '1558346352644', 0, 0, -12, 0);
INSERT INTO `world.entity.pets` VALUES (2109, 1728, '1558346352646', 0, 0, -12, 0);
INSERT INTO `world.entity.pets` VALUES (2128, 1728, '1558374700282', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2139, 1728, '1558375260356', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2033, 8154, '1558366820735', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2211, 1728, '1558346352650', 0, 1, -11, 0);
INSERT INTO `world.entity.pets` VALUES (2216, 1728, '1558346352652', 0, 1, -11, 0);
INSERT INTO `world.entity.pets` VALUES (2032, 8154, '1558366687672', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2852, 8151, '1557916330354', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2855, 8151, '1557916418476', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2861, 8151, '1557917121162', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2862, 8151, '1557917407165', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2863, 8151, '1557917612175', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2865, 8151, '1557917623477', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2868, 8151, '1557917658312', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2870, 8151, '1557917766219', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2873, 8151, '1557917914262', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2039, 8154, '1558367678479', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2041, 8154, '1558367939550', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2060, 8154, '1558371006018', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2065, 8154, '1558371066775', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2067, 8154, '1558371298589', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2072, 8154, '1558372261444', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2074, 8154, '1558372400797', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2077, 8154, '1558372554577', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2079, 8154, '1558373130550', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2089, 8154, '1558373383266', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2095, 8154, '1558373554028', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2102, 8154, '1558373714452', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2110, 8154, '1558373957397', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2120, 8154, '1558374347336', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2134, 8154, '1558375086394', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2142, 8154, '1558375420924', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2149, 8154, '1558375558941', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2154, 1711, '1558375839084', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2155, 1711, '1558375917308', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2156, 6894, '1558375938361', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2157, 6895, '1558375945461', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2158, 1728, '1558376127432', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2159, 1728, '1558376131847', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2163, 6604, '1558381913147', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2164, 6604, '1558381916742', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2165, 6717, '1558382005609', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2166, 7710, '1558382301564', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2167, 10107, '1558382647605', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2168, 10802, '1558382714436', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2169, 10865, '1558382722208', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (2170, 10866, '1558382726021', 0, 10, 0, 0);
INSERT INTO `world.entity.pets` VALUES (10149, 1728, '1564918203537', 0, 4, -15, 0);
INSERT INTO `world.entity.pets` VALUES (10150, 1728, '1565090262556', 0, 2, -17, 0);
INSERT INTO `world.entity.pets` VALUES (10175, 1728, '1565090262595', 0, 2, -17, 0);
INSERT INTO `world.entity.pets` VALUES (10998, 1728, '1565090262592', 0, 8, -2, 0);

-- ----------------------------
-- Table structure for world.entity.players.quests
-- ----------------------------
DROP TABLE IF EXISTS `world.entity.players.quests`;
CREATE TABLE `world.entity.players.quests`  (
  `id` int(11) NOT NULL,
  `quest` int(11) NOT NULL,
  `finish` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `stepsValidation` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of world.entity.players.quests
-- ----------------------------
INSERT INTO `world.entity.players.quests` VALUES (1, 188, 1, 7, '778');
INSERT INTO `world.entity.players.quests` VALUES (2, 200, 1, 7, '');
INSERT INTO `world.entity.players.quests` VALUES (3, 183, 1, 7, '');
INSERT INTO `world.entity.players.quests` VALUES (4, 185, 1, 7, '758');
INSERT INTO `world.entity.players.quests` VALUES (5, 193, 1, 7, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (6, 198, 1, 7, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (11, 183, 1, 8, '');
INSERT INTO `world.entity.players.quests` VALUES (9, 188, 1, 8, '778');
INSERT INTO `world.entity.players.quests` VALUES (10, 200, 1, 8, '');
INSERT INTO `world.entity.players.quests` VALUES (12, 185, 0, 8, '');
INSERT INTO `world.entity.players.quests` VALUES (13, 172, 0, 8, '701');
INSERT INTO `world.entity.players.quests` VALUES (14, 181, 0, 8, '745');
INSERT INTO `world.entity.players.quests` VALUES (15, 188, 1, 9, '778');
INSERT INTO `world.entity.players.quests` VALUES (16, 200, 1, 9, '');
INSERT INTO `world.entity.players.quests` VALUES (17, 183, 1, 9, '');
INSERT INTO `world.entity.players.quests` VALUES (18, 185, 1, 9, '758');
INSERT INTO `world.entity.players.quests` VALUES (19, 172, 1, 9, '713;701');
INSERT INTO `world.entity.players.quests` VALUES (20, 181, 1, 9, '744;745');
INSERT INTO `world.entity.players.quests` VALUES (21, 182, 0, 9, '');
INSERT INTO `world.entity.players.quests` VALUES (22, 188, 1, 10, '778');
INSERT INTO `world.entity.players.quests` VALUES (23, 200, 1, 10, '');
INSERT INTO `world.entity.players.quests` VALUES (24, 183, 1, 10, '');
INSERT INTO `world.entity.players.quests` VALUES (25, 185, 1, 10, '758');
INSERT INTO `world.entity.players.quests` VALUES (26, 193, 1, 10, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (27, 198, 1, 10, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (28, 188, 1, 11, '778');
INSERT INTO `world.entity.players.quests` VALUES (29, 188, 1, 12, '778');
INSERT INTO `world.entity.players.quests` VALUES (30, 200, 1, 12, '');
INSERT INTO `world.entity.players.quests` VALUES (31, 200, 1, 11, '');
INSERT INTO `world.entity.players.quests` VALUES (32, 183, 1, 12, '');
INSERT INTO `world.entity.players.quests` VALUES (33, 183, 1, 11, '');
INSERT INTO `world.entity.players.quests` VALUES (34, 185, 1, 12, '758');
INSERT INTO `world.entity.players.quests` VALUES (35, 185, 1, 11, '758');
INSERT INTO `world.entity.players.quests` VALUES (36, 193, 1, 12, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (37, 193, 1, 11, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (38, 198, 1, 11, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (39, 198, 1, 12, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (40, 188, 1, 13, '778');
INSERT INTO `world.entity.players.quests` VALUES (41, 200, 1, 13, '');
INSERT INTO `world.entity.players.quests` VALUES (42, 183, 1, 13, '');
INSERT INTO `world.entity.players.quests` VALUES (43, 185, 0, 13, '');
INSERT INTO `world.entity.players.quests` VALUES (44, 172, 0, 13, '701');
INSERT INTO `world.entity.players.quests` VALUES (45, 181, 0, 13, '745');
INSERT INTO `world.entity.players.quests` VALUES (46, 193, 1, 13, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (47, 193, 1, 15, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (48, 193, 0, 17, '793');
INSERT INTO `world.entity.players.quests` VALUES (49, 193, 1, 8, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (50, 188, 1, 22, '778');
INSERT INTO `world.entity.players.quests` VALUES (51, 200, 1, 22, '');
INSERT INTO `world.entity.players.quests` VALUES (52, 183, 1, 22, '');
INSERT INTO `world.entity.players.quests` VALUES (53, 188, 1, 23, '778');
INSERT INTO `world.entity.players.quests` VALUES (54, 200, 1, 23, '');
INSERT INTO `world.entity.players.quests` VALUES (55, 183, 1, 23, '');
INSERT INTO `world.entity.players.quests` VALUES (56, 193, 1, 9, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (57, 198, 0, 9, '');
INSERT INTO `world.entity.players.quests` VALUES (59, 188, 1, 26, '778');
INSERT INTO `world.entity.players.quests` VALUES (60, 200, 1, 26, '');
INSERT INTO `world.entity.players.quests` VALUES (61, 183, 1, 26, '');
INSERT INTO `world.entity.players.quests` VALUES (62, 185, 1, 26, '758');
INSERT INTO `world.entity.players.quests` VALUES (63, 172, 1, 26, '713;701');
INSERT INTO `world.entity.players.quests` VALUES (64, 181, 1, 26, '744;745');
INSERT INTO `world.entity.players.quests` VALUES (65, 182, 1, 26, '746');
INSERT INTO `world.entity.players.quests` VALUES (66, 188, 1, 24, '778');
INSERT INTO `world.entity.players.quests` VALUES (67, 200, 1, 24, '');
INSERT INTO `world.entity.players.quests` VALUES (68, 183, 1, 24, '');
INSERT INTO `world.entity.players.quests` VALUES (69, 188, 1, 25, '778');
INSERT INTO `world.entity.players.quests` VALUES (70, 200, 1, 25, '');
INSERT INTO `world.entity.players.quests` VALUES (71, 183, 1, 25, '');
INSERT INTO `world.entity.players.quests` VALUES (72, 193, 1, 23, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (73, 193, 1, 25, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (74, 193, 1, 24, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (75, 193, 1, 22, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (76, 193, 1, 26, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (77, 190, 1, 26, '784;783');
INSERT INTO `world.entity.players.quests` VALUES (78, 194, 1, 26, '795;796');
INSERT INTO `world.entity.players.quests` VALUES (79, 198, 1, 26, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (80, 198, 1, 22, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (81, 198, 1, 23, '808;809');
INSERT INTO `world.entity.players.quests` VALUES (83, 198, 0, 24, '');
INSERT INTO `world.entity.players.quests` VALUES (82, 198, 0, 25, '');
INSERT INTO `world.entity.players.quests` VALUES (84, 188, 1, 27, '778');
INSERT INTO `world.entity.players.quests` VALUES (85, 200, 1, 27, '');
INSERT INTO `world.entity.players.quests` VALUES (86, 183, 1, 27, '');
INSERT INTO `world.entity.players.quests` VALUES (87, 185, 0, 27, '');
INSERT INTO `world.entity.players.quests` VALUES (88, 172, 0, 27, '701');
INSERT INTO `world.entity.players.quests` VALUES (89, 181, 1, 27, '744;745');
INSERT INTO `world.entity.players.quests` VALUES (90, 182, 1, 27, '746');
INSERT INTO `world.entity.players.quests` VALUES (113, 459, 0, 1, '');
INSERT INTO `world.entity.players.quests` VALUES (112, 465, 0, 1, '3172');
INSERT INTO `world.entity.players.quests` VALUES (92, 193, 1, 1, '793;794');
INSERT INTO `world.entity.players.quests` VALUES (93, 469, 1, 1, '3180;3181');
INSERT INTO `world.entity.players.quests` VALUES (102, 470, 0, 1, '3189;3190;3191;3193;3194;3195;3197;3198');
INSERT INTO `world.entity.players.quests` VALUES (103, 467, 0, 1, '');
INSERT INTO `world.entity.players.quests` VALUES (104, 463, 1, 1, '3168;3169');
INSERT INTO `world.entity.players.quests` VALUES (116, 468, 0, 1, '3178');
INSERT INTO `world.entity.players.quests` VALUES (117, 458, 0, 1, '3147');
INSERT INTO `world.entity.players.quests` VALUES (110, 466, 0, 1, '');
INSERT INTO `world.entity.players.quests` VALUES (111, 462, 0, 1, '3166');

-- ----------------------------
-- Table structure for world.event.type
-- ----------------------------
DROP TABLE IF EXISTS `world.event.type`;
CREATE TABLE `world.event.type`  (
  `id` int(5) NOT NULL,
  `maxPlayers` int(5) NOT NULL DEFAULT 8,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `firstWinner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `secondWinner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `thirdWinner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
