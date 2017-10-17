
DELIMITER $$
--
-- Zdarzenia
--
CREATE DEFINER=`root`@`localhost` EVENT `e_store_ts` ON SCHEDULE EVERY 10 SECOND STARTS '2016-10-25 10:27:16' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO myschema.mytable VALUES (UNIX_TIMESTAMP())$$

CREATE DEFINER=`root`@`localhost` EVENT `resetCounter` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-11 20:00:00' ON COMPLETION NOT PRESERVE ENABLE DO update visit set visit_cnt = 0 where minute(timediff(VISIT_TIME,now())) > 5$$

CREATE DEFINER=`root`@`localhost` EVENT `resetLogtable` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-17 00:06:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE from logtable WHERE datediff(now(), logtable_time) > 1$$

CREATE DEFINER=`root`@`localhost` EVENT `resetSession` ON SCHEDULE EVERY 5 MINUTE STARTS '2016-12-29 11:32:00' ON COMPLETION NOT PRESERVE ENABLE DO delete from session where minute(timediff(SESSION_TIME,now())) > 10$$

DELIMITER ;
