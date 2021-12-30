/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE IF NOT EXISTS ipa2n /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE ipa2n;
DROP table if exists agents;
CREATE TABLE `agents` (
  `agents_id` varchar(255) NOT NULL,
  `agents_name` varchar(255) DEFAULT NULL,
  `agents_phno` mediumtext,
  `agents_address` varchar(255) DEFAULT NULL,
  `agents_city` varchar(255) DEFAULT NULL,
  `agents_state` varchar(255) DEFAULT NULL,
  `agents_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS attorney;
CREATE TABLE `attorney` (
  `attorney_id` varchar(255) NOT NULL,
  `attorney_name` varchar(255) DEFAULT NULL,
  `attorney_phno` mediumtext,
  `attorney_address` varchar(255) DEFAULT NULL,
  `attorney_city` varchar(255) DEFAULT NULL,
  `attorney_state` varchar(255) DEFAULT NULL,
  `attorney_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`attorney_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS buyer;
CREATE TABLE `buyer` (
  `buyer_id` varchar(255) NOT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phno` mediumtext,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_city` varchar(255) DEFAULT NULL,
  `buyer_state` varchar(255) DEFAULT NULL,
  `buyer_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `buyer_type` varchar(255) DEFAULT NULL,
  `bank_acc` mediumtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS commercial_buyers;
CREATE TABLE `commercial_buyers` (
  `buyer_id` varchar(255) NOT NULL,
  `ssn` mediumtext,
  `tax_id` varchar(255) DEFAULT NULL,
  `owner_names` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`buyer_id`),
  CONSTRAINT `fk_cm_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS deals;
CREATE TABLE `deals` (
  `deals_id` int NOT NULL,
  `agents_id` varchar(255) DEFAULT NULL,
  `property_id` varchar(255) DEFAULT NULL,
  `owners_id` varchar(255) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT NULL,
  `realtors_id` varchar(255) DEFAULT NULL,
  `escrow_id` varchar(255) DEFAULT NULL,
  `lender_id` varchar(255) DEFAULT NULL,
  `attorney_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deals_id`),
  KEY `agents_id` (`agents_id`),
  KEY `property_id` (`property_id`),
  KEY `owners_id` (`owners_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `realtors_id` (`realtors_id`),
  KEY `escrow_id` (`escrow_id`),
  KEY `lender_id` (`lender_id`),
  KEY `attorney_id` (`attorney_id`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`agents_id`) REFERENCES `agents` (`agents_id`),
  CONSTRAINT `deals_ibfk_10` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `deals_ibfk_11` FOREIGN KEY (`owners_id`) REFERENCES `owners` (`owners_id`),
  CONSTRAINT `deals_ibfk_12` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  CONSTRAINT `deals_ibfk_13` FOREIGN KEY (`realtors_id`) REFERENCES `realtors` (`realtors_id`),
  CONSTRAINT `deals_ibfk_14` FOREIGN KEY (`escrow_id`) REFERENCES `escrow` (`escrow_id`),
  CONSTRAINT `deals_ibfk_15` FOREIGN KEY (`lender_id`) REFERENCES `lender` (`lender_id`),
  CONSTRAINT `deals_ibfk_16` FOREIGN KEY (`attorney_id`) REFERENCES `attorney` (`attorney_id`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `deals_ibfk_3` FOREIGN KEY (`owners_id`) REFERENCES `owners` (`owners_id`),
  CONSTRAINT `deals_ibfk_4` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  CONSTRAINT `deals_ibfk_5` FOREIGN KEY (`realtors_id`) REFERENCES `realtors` (`realtors_id`),
  CONSTRAINT `deals_ibfk_6` FOREIGN KEY (`escrow_id`) REFERENCES `escrow` (`escrow_id`),
  CONSTRAINT `deals_ibfk_7` FOREIGN KEY (`lender_id`) REFERENCES `lender` (`lender_id`),
  CONSTRAINT `deals_ibfk_8` FOREIGN KEY (`attorney_id`) REFERENCES `attorney` (`attorney_id`),
  CONSTRAINT `deals_ibfk_9` FOREIGN KEY (`agents_id`) REFERENCES `agents` (`agents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS escrow;
CREATE TABLE `escrow` (
  `escrow_id` varchar(255) NOT NULL,
  `escrow_name` varchar(255) DEFAULT NULL,
  `escrow_phno` mediumtext,
  `escrow_address` varchar(255) DEFAULT NULL,
  `escrow_city` varchar(255) DEFAULT NULL,
  `escrow_state` varchar(255) DEFAULT NULL,
  `escrow_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `notary_id` mediumtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`escrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS fha_buyers;
CREATE TABLE `fha_buyers` (
  `buyer_id` varchar(255) NOT NULL,
  `insurance_ID` varchar(255) DEFAULT NULL,
  `insurance_fee` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`buyer_id`),
  CONSTRAINT `fk_fha_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS lender;
CREATE TABLE `lender` (
  `lender_id` varchar(255) NOT NULL,
  `lender_name` varchar(255) DEFAULT NULL,
  `lender_phno` mediumtext,
  `lender_address` varchar(255) DEFAULT NULL,
  `lender_city` varchar(255) DEFAULT NULL,
  `lender_state` varchar(255) DEFAULT NULL,
  `lender_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `bank_acc` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS owners;
CREATE TABLE `owners` (
  `owners_id` varchar(255) NOT NULL,
  `owners_name` varchar(255) DEFAULT NULL,
  `owners_phno` mediumtext,
  `owners_address` varchar(255) DEFAULT NULL,
  `owners_city` varchar(255) DEFAULT NULL,
  `owners_state` varchar(255) DEFAULT NULL,
  `owners_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `bank_acc` mediumtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`owners_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS prop_owners;
CREATE TABLE `prop_owners` (
  `property_id` varchar(255) NOT NULL,
  `owners_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  KEY `fk_po_own_id` (`owners_id`),
  CONSTRAINT `fk_po_own_id` FOREIGN KEY (`owners_id`) REFERENCES `owners` (`owners_id`),
  CONSTRAINT `fk_po_prop_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS property;
CREATE TABLE `property` (
  `property_id` varchar(255) NOT NULL,
  `property_address` varchar(255) DEFAULT NULL,
  `property_city` varchar(255) DEFAULT NULL,
  `property_state` varchar(255) DEFAULT NULL,
  `property_zip` varchar(255) DEFAULT NULL,
  `legal_opinion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS realtors;
CREATE TABLE `realtors` (
  `realtors_id` varchar(255) NOT NULL,
  `realtors_name` varchar(255) DEFAULT NULL,
  `realtors_phno` mediumtext,
  `realtors_address` varchar(255) DEFAULT NULL,
  `realtors_city` varchar(255) DEFAULT NULL,
  `realtors_state` varchar(255) DEFAULT NULL,
  `realtors_zip` varchar(255) DEFAULT NULL,
  `state_id` mediumtext,
  `notary_id` mediumtext,
  `commission_acc` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`realtors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS va_buyers;
CREATE TABLE `va_buyers` (
  `buyer_id` varchar(255) NOT NULL,
  `military_ID` int DEFAULT NULL,
  `years_of_service` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`buyer_id`),
  UNIQUE KEY `military_ID` (`military_ID`),
  CONSTRAINT `fk_va_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO agents(agents_id,agents_name,agents_phno,agents_address,agents_city,agents_state,agents_zip,state_id,created_at) VALUES('A01','Stephen Johnson',X'39373336363035373231','19953 Strickler Rd','West Fork','AR','72774',X'3635363231383537','2021-12-02 15:20:31'),('A02','Jacqueline Johnson',X'37353834303937303439','29 Deer Haven Ct','Florence','KY','41042',X'3535373036303337','2021-12-03 12:57:40'),('A03','Michelle Smith',X'32393635303534363435','799 Gray Rd','Hohenwald','TN','38462',X'3532333237333034','2021-12-03 13:19:15'),('A04','Connie Johnson',X'33323334373035343531','17534 233rd Pl NE','Woodinville','WA','98072',X'3331383234323438','2021-12-03 13:19:17'),('A05','Geoffrey Smith',X'38343532383437353537','234 River Rd #1','New Milford','NJ','7646',X'3234343435383039','2021-12-03 13:19:18'),('A06','Jeanne Smith',X'38333732353839353735','2270 Mckelvy Rd','Camden','TN','38320',X'3533333737333038','2021-12-03 13:19:20');
select * from agents;

INSERT INTO attorney(attorney_id,attorney_name,attorney_phno,attorney_address,attorney_city,attorney_state,attorney_zip,state_id,created_at) VALUES('Z01','Bob Newhart',X'38373035313336393730','703 S Main St','Bald Knob','AR','72010',X'3636363238353239','2021-12-03 15:05:33'),('Z02','Sheldon Cooper ',X'38373035313336393731','940 N Chester St','Monticello','AR','71655',X'3836323931323538','2021-12-03 15:05:33'),('Z03','Leanord Hofstader',X'38373035313336393732','1663 Byers St','Batesville','AR','72501',X'3439353631323839','2021-12-03 15:05:33'),('Z04','Penny Lee',X'38373035313336393733','4 Mossy Oak Ln','Heber Springs','AR','72543',X'3934323638353132','2021-12-03 15:05:33'),('Z05','Shang Chi',X'38373035313336393734','10401 High Rd E','Mabelvale','AR','72103',X'3837393337383336','2021-12-03 15:05:33'),('Z06','James Law',X'38373035313336393735','962 County 951 Rd','Brookland','AR','72417',X'3131343331343934','2021-12-03 15:05:33');
select * from attorney;
INSERT INTO buyer(buyer_id,buyer_name,buyer_phno,buyer_address,buyer_city,buyer_state,buyer_zip,state_id,buyer_type,bank_acc,created_at) VALUES('B01','Chris Radar',X'38333732353839373731','912 A Red Branch Rd #M','Columbia','MD','21045',X'3135313939353533','FHA Buyer',X'33343739333733333935323432','2021-12-03 15:34:37'),('B02','James Connie',X'38333732353839373732','232 Bienbille St','Belton','MO','64012',X'3234343138313733','VA Buyer',X'31373637393632343333363939','2021-12-03 15:34:37'),('B03','John Richardson',X'38333732353839373733','120 Elm St','Park Forest','IL','60466',X'3137333731343236','CA Buyer',X'38373334323835353535383532','2021-12-03 15:34:37'),('B04','Lesly Shore',X'38333732353839373734','22916 N Pine Lane Rd','Fountain','FL','32438',X'3831343838313438','VA Buyer',X'39343234323237353331313235','2021-12-03 15:34:37'),('B05','Williams Kimberly',X'38333732353839373735','9720 Summit Bend Ln','Katy','TX','77494',X'3133363437323331','CA Buyer',X'35363639343636363739383833','2021-12-03 15:34:37'),('B06','Katie Piscatino',X'38333732353839373736','734 Valley St','Frankston','TX','75763',X'3434383336353132','FHA Buyer',X'31373637393632343332363030','2021-12-03 15:34:37');

INSERT INTO commercial_buyers(buyer_id,ssn,tax_id,owner_names,created_at) VALUES('B03',X'3235383531353435','123456789','John Richardson','2021-12-03 16:27:02'),('B05',X'3833383535313436','234567891','Williams Kimberley','2021-12-03 16:27:02');

INSERT INTO deals(deals_id,agents_id,property_id,owners_id,buyer_id,realtors_id,escrow_id,lender_id,attorney_id,created_at) VALUES(101,'A01','P01','O01','B01','R01','E01','L01','Z01','2021-12-03 23:04:14'),(102,'A02','P02','O02','B02','R02','E02','L02','Z02','2021-12-03 23:04:14'),(103,'A03','P03','O03','B03','R03','E03','L03','Z03','2021-12-03 23:04:14'),(104,'A04','P04','O04','B04','R04','E04','L04','Z04','2021-12-03 23:04:14'),(105,'A05','P05','O03','B05','R05','E05','L05','Z05','2021-12-03 23:04:14'),(106,'A06','P06','O01','B06','R06','E06','L06','Z06','2021-12-03 23:04:14'),(107,'A03','P02','O02','B02','R01','E02','L02','Z02','2021-12-03 23:04:14'),(108,'A02','P05','O03','B05','R03','E04','L05','Z05','2021-12-03 23:04:14'),(109,'A04','P04','O04','B04','R04','E04','L04','Z04','2021-12-03 23:04:14');

INSERT INTO escrow(escrow_id,escrow_name,escrow_phno,escrow_address,escrow_city,escrow_state,escrow_zip,state_id,notary_id,created_at) VALUES('E01','Andrew Johnson',X'32313838363433313536','21224 380th Ave','Battle Lake','MN','56515',X'3836363731323936',X'3132353631333336323334','2021-12-03 13:57:45'),('E02','Robert Smith',X'33323032333934303131','27244 Mickelson Dr','Starbuck','MN','56381',X'3638363435353333',X'3534383639373339343436','2021-12-03 14:22:55'),('E03','Don Johnson',X'35303738333131313033','1150 June Ct','Windom','MN','56101',X'3839373636363331',X'3431323335343933313237','2021-12-03 14:22:55'),('E04','Danver Johnson',X'35303738323433303835','411 East St N','Claremont','MN','55924',X'3432353232393432',X'3931383334333531343636','2021-12-03 14:22:55'),('E05','Allen Johnson',X'36353134363533333831','20192 345th St','Taylors Falls','MN','55084',X'3937373339323235',X'3937373633343434353932','2021-12-03 14:22:55'),('E06','Elizabeth Johnson',X'32313835383438343832','405 Main Ave W','Twin Valley','MN','56584',X'3432333639363537',X'3536373132313533343136','2021-12-03 14:22:55');

INSERT INTO fha_buyers(buyer_id,insurance_ID,insurance_fee,created_at) VALUES('B01','6392315864',20,'2021-12-03 15:41:29'),('B06','2937833341',30,'2021-12-03 15:41:29');

INSERT INTO lender(lender_id,lender_name,lender_phno,lender_address,lender_city,lender_state,lender_zip,state_id,bank_acc,created_at) VALUES('L01','Abbi Johnson',X'34363936363931323631','210 W Merriman Ave','Wynne','AR','72396',X'3138373132353833','97666634547','2021-12-03 14:56:02'),('L02','Deborah Smith',X'34363936363931323632','605 S Spring St','Fordyce','AR','71742',X'3831343239333234','88213886488','2021-12-03 14:56:02'),('L03','Clay Jenson',X'34363936363931323633','119 W University C2','Magnolia','AR','71753',X'3136393931393139','67275833228','2021-12-03 14:56:02'),('L04','Max Black',X'34363936363931323634','608 S 25th St','West Memphis','AR','72301',X'3932353633363736','91117998755','2021-12-03 14:56:02'),('L05','Caroline Channing',X'34363936363931323635','6166 A Green Ln','Everton','AR','72633',X'3632353131383233','28661252759','2021-12-03 14:56:02'),('L06','Elizibeth White',X'34363936363931323636','703 S Main St','Bald Knob','AR','72010',X'3238353135333937','99185597829','2021-12-03 14:56:02');

INSERT INTO owners(owners_id,owners_name,owners_phno,owners_address,owners_city,owners_state,owners_zip,state_id,bank_acc,created_at) VALUES('O01','Kristen Smith',X'38333732353839363735','19953 Strickler Rd','East Fork','AR','72774',X'3331373638323139',X'3834333337313433373735','2021-12-03 16:42:33'),('O02','Willson Cassandra',X'38333732353839363736','30 Deer Haven Ct','Florence','KY','41042',X'3738333534313635',X'3936323637313737333631','2021-12-03 16:42:33'),('O03','Dodd Rebecca',X'38333732353839363737','759 Gray Rd','Hohenwald','TN','38462',X'3536313934373936',X'3436313939313838313431','2021-12-03 16:42:33'),('O04','Chris Bank',X'38333732353839363738','17534 233rd Pl E','Woodinville','WA','98072',X'3731393438373337',X'3636383334363431343734','2021-12-03 16:42:33');

INSERT INTO prop_owners(property_id,owners_id,created_at) VALUES('P01','O01','2021-12-03 16:44:30'),('P02','O02','2021-12-03 16:44:30'),('P03','O03','2021-12-03 16:44:30'),('P04','O04','2021-12-03 16:44:30'),('P05','O03','2021-12-03 16:44:30'),('P06','O01','2021-12-03 16:44:30');

INSERT INTO property(property_id,property_address,property_city,property_state,property_zip,legal_opinion,created_at) VALUES('P01','210 E Merriman Ave','Wynne','AR','72396','Valid','2021-12-03 16:31:57'),('P02','605 N Spring St','Fordyce','AR','71742','No','2021-12-03 16:31:57'),('P03','119 NW University C2','Magnolia','AR','71753','Valid','2021-12-03 16:31:57'),('P04','608 N 25th St','West Memphis','AR','72301','Valid','2021-12-03 16:31:57'),('P05','6186 A Green Ln','Everton','AR','72633','Valid','2021-12-03 16:31:57'),('P06','703 SE Main St','Bald Knob','AR','72010','No','2021-12-03 16:31:57');

INSERT INTO realtors(realtors_id,realtors_name,realtors_phno,realtors_address,realtors_city,realtors_state,realtors_zip,state_id,notary_id,commission_acc,created_at) VALUES('R01','Billy Johnson',X'37333135383436363537','9176 Red Branch Rd','Columbia','MD','21045',X'3239303335343536',X'3537313938373235353531','5669455679883','2021-12-03 13:42:41'),('R02','Annette Philip',X'38313634323534303030','219 Bienbille St','Belton','MO','64012',X'39373339383732',X'3433333332393734323535','3479373395241','2021-12-03 13:42:43'),('R03','Clay Johnson',X'37303836373931323439','115 Elm St','Park Forest','IL','60466',X'3338363935333733',X'3535363236313439313331','1767962432699','2021-12-03 13:42:44'),('R04','Valeeta Smith',X'32303132363235373538','22916 NW Pine Lane Rd','Fountain','FL','32438',X'3638333538353339',X'3635373131343833323737','8734285554952','2021-12-03 13:42:46'),('R05','Beth Meyers',X'39333137393631353435','9714 Summit Bend Ln','Katy','TX','77494',X'3332323031333436',X'3239323931373631333433','1832364575135','2021-12-03 13:42:48'),('R06','John Smith',X'39303338373633363130','704 Valley St','Frankston','TX','75763',X'3534333439383337',X'3238393733333237313737','9424227531124','2021-12-03 13:42:50');
INSERT INTO va_buyers(buyer_id,military_ID,years_of_service,created_at) VALUES('B02',98712345,12,'2021-12-03 15:44:27'),('B04',12237896,8,'2021-12-03 15:44:27');

--writing a query to perform inner join between deals and property to see which legal opinion of properties which are up on deals;
select d.deals_id, p.property_id,p.legal_opinion
from deals d
INNER JOIN property p
on d.property_id=p.property_id;

--So I performed a full join between owners and prop_owners table to find out who names of owners with their respective properties

SELECT o.owners_id, o.owners_name,p.property_id
FROM owners o
left OUTER JOIN prop_owners p
on o.owners_id=p.owners_id
UNION
SELECT o.owners_id, o.owners_name,p.property_id
FROM owners o
right OUTER JOIN prop_owners p
on o.owners_id=p.owners_id;
--LEFT OUTER JOIN
SELECT b.buyer_name, v.years_of_service
from va_buyers v 
left outer join buyer b
on b.buyer_id=v.buyer_id;
--RIGHT OUTER JOIN
SELECT d.deals_id, d.buyer_id, f.insurance_ID, f.insurance_fee as " Insurance in %"
from deals d 
right outer join fha_buyers f 
on d.buyer_id= f.buyer_id;

select * from deals;
--INTERSECT
SELECT d.deals_id,d.buyer_id,b.buyer_name, d.realtors_id, r.realtors_name
from 
deals d 
inner join realtors r 
on d.realtors_id=r.realtors_id 
inner join buyer b on d.buyer_id=b.buyer_id
where d.buyer_id
IN(
SELECT d.buyer_id
from 
deals d 
INNER join fha_buyers b 
on d.buyer_id=b.buyer_id)
ORDER BY d.deals_id;


--UNION

select d.deals_id,a.agents_id,a.agents_name,o.owners_id,o.owners_name
from deals d 
inner join agents a 
on d.agents_id=a.agents_id
join owners o on d.owners_id=o.owners_id
where a.agents_state='TN'
union
select d.deals_id,a.agents_id,a.agents_name,o.owners_id,o.owners_name
from deals d 
inner join owners o 
on d.owners_id=o.owners_id
join agents a 
on d.agents_id=a.agents_id
where  o.owners_state='TN'
ORDER BY deals_id,agents_id,owners_id;





--EXCEPT
SELECT d.deals_id,d.owners_id ,o.owners_name,b.buyer_name
from 
deals d 
inner join owners o
on d.owners_id=o.owners_id 
inner join buyer b on d.buyer_id=b.buyer_id
where d.buyer_id
NOT IN(
SELECT d.buyer_id
from 
deals d 
INNER join fha_buyers b 
on d.buyer_id=b.buyer_id)
ORDER BY d.deals_id;