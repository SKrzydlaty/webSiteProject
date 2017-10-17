
DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj` ()  NO SQL
SELECT "hello from proc"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puser` (IN `uId` INT)  NO SQL
SELECT `user_name`,`user_surname` FROM user where id_user_pk = uId$$

DELIMITER ;
