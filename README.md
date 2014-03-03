compression
===========

compression calculator. requires the LP_solve library installed.


Also requires the Eve SDE installed in mysql, and a table called compression in a DB called evesupport

 CREATE TABLE `compression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

That contains an id running from 1 upwards, and the typeid of the item you're using for compression.
