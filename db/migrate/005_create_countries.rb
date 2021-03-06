class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :official_name
      t.integer :numeric_code
      t.string :common_name
      t.string :alpha_2_code
      t.string :alpha_3_code
    end
    #agrego los datos del fixture
    #Country.load_from_file
    countries = "INSERT INTO `countries` VALUES (1,'Cameroon','Republic of Cameroon',120,'','CM','CMR'),
      (2,'Egypt','Arab Republic of Egypt',818,'','EG','EGY'),
      (3,'Guinea','Republic of Guinea',324,'','GN','GIN'),
      (4,'Kyrgyzstan','Kyrgyz Republic',417,'','KG','KGZ'),
      (5,'Monaco','Principality of Monaco',492,'','MC','MCO'),
      (6,'Papua New Guinea','',598,'','PG','PNG'),
      (7,'Turkmenistan','',795,'','TM','TKM'),
      (8,'Canada','',124,'','CA','CAN'),
      (9,'El Salvador','Republic of El Salvador',222,'','SV','SLV'),
      (10,'Mongolia','',496,'','MN','MNG'),
      (11,'Paraguay','Republic of Paraguay',600,'','PY','PRY'),
      (12,'Turks and Caicos Islands','',796,'','TC','TCA'),
      (13,'Equatorial Guinea','Republic of Equatorial Guinea',226,'','GQ','GNQ'),
      (14,'Guinea-Bissau','Republic of Guinea-Bissau',624,'','GW','GNB'),
      (15,'Montenegro','Montenegro',499,'','ME','MNE'),
      (16,'Peru','Republic of Peru',604,'','PE','PER'),
      (17,'Tuvalu','',798,'','TV','TUV'),
      (18,'Eritrea','',232,'','ER','ERI'),
      (19,'Guyana','Republic of Guyana',328,'','GY','GUY'),
      (20,'Montserrat','',500,'','MS','MSR'),
      (21,'Philippines','Republic of the Philippines',608,'','PH','PHL'),
      (22,'Uganda','Republic of Uganda',800,'','UG','UGA'),
      (23,'Estonia','Republic of Estonia',233,'','EE','EST'),
      (24,'Haiti','Republic of Haiti',332,'','HT','HTI'),
      (25,'Morocco','Kingdom of Morocco',504,'','MA','MAR'),
      (26,'Pitcairn','',612,'','PN','PCN'),
      (27,'Ethiopia','Federal Democratic Republic of Ethiopia',231,'','ET','ETH'),
      (28,'Heard Island and McDonald Islands','',334,'','HM','HMD'),
      (29,'Poland','Republic of Poland',616,'','PL','POL'),
      (30,'Holy See (Vatican City State)','',336,'','VA','VAT'),
      (31,'Portugal','Portuguese Republic',620,'','PT','PRT'),
      (32,'Honduras','Republic of Honduras',340,'','HN','HND'),
      (33,'Puerto Rico','',630,'','PR','PRI'),
      (34,'Hong Kong','Hong Kong Special Administrative Region of China',344,'','HK','HKG'),
      (35,'Qatar','State of Qatar',634,'','QA','QAT'),
      (36,'Hungary','Republic of Hungary',348,'','HU','HUN'),
      (37,'Iceland','Republic of Iceland',352,'','IS','ISL'),
      (38,'Barbados','',52,'','BB','BRB'),
      (39,'India','Republic of India',356,'','IN','IND'),
      (40,'Belarus','Republic of Belarus',112,'','BY','BLR'),
      (41,'Indonesia','Republic of Indonesia',360,'','ID','IDN'),
      (42,'Belgium','Kingdom of Belgium',56,'','BE','BEL'),
      (43,'Iran, Islamic Republic of','Islamic Republic of Iran',364,'','IR','IRN'),
      (44,'Svalbard and Jan Mayen','',744,'','SJ','SJM'),
      (45,'Iraq','Republic of Iraq',368,'','IQ','IRQ'),
      (46,'Macedonia, Republic of','The Former Yugoslav Republic of Macedonia',807,'','MK','MKD'),
      (47,'Swaziland','Kingdom of Swaziland',748,'','SZ','SWZ'),
      (48,'Belize','',84,'','BZ','BLZ'),
      (49,'Congo','Republic of the Congo',178,'','CG','COG'),
      (50,'Ireland','',372,'','IE','IRL'),
      (51,'Madagascar','Republic of Madagascar',450,'','MG','MDG'),
      (52,'Sweden','Kingdom of Sweden',752,'','SE','SWE'),
      (53,'Benin','Republic of Benin',204,'','BJ','BEN'),
      (54,'Isle of Man','',833,'','IM','IMN'),
      (55,'Malawi','Republic of Malawi',454,'','MW','MWI'),
      (56,'Switzerland','Swiss Confederation',756,'','CH','CHE'),
      (57,'Bermuda','',60,'','BM','BMU'),
      (58,'Congo, The Democratic Republic of the','',180,'','CD','COD'),
      (59,'Israel','State of Israel',376,'','IL','ISR'),
      (60,'Malaysia','',458,'','MY','MYS'),
      (61,'Syrian Arab Republic','',760,'','SY','SYR'),
      (62,'Virgin Islands, British','British Virgin Islands',92,'','VG','VGB'),
      (63,'Bhutan','Kingdom of Bhutan',64,'','BT','BTN'),
      (64,'Cook Islands','',184,'','CK','COK'),
      (65,'Italy','Italian Republic',380,'','IT','ITA'),
      (66,'Maldives','Republic of Maldives',462,'','MV','MDV'),
      (67,'Niger','Republic of the Niger',562,'','NE','NER'),
      (68,'Taiwan, Province of China','Taiwan, Province of China',158,'Taiwan','TW','TWN'),
      (69,'Virgin Islands, U.S.','Virgin Islands of the United States',850,'','VI','VIR'),
      (70,'Bolivia','Republic of Bolivia',68,'','BO','BOL'),
      (71,'Costa Rica','Republic of Costa Rica',188,'','CR','CRI'),
      (72,'Georgia','',268,'','GE','GEO'),
      (73,'Mali','Republic of Mali',466,'','ML','MLI'),
      (74,'Nigeria','Federal Republic of Nigeria',566,'','NG','NGA'),
      (75,'Tajikistan','Republic of Tajikistan',762,'','TJ','TJK'),
      (76,'Wallis and Futuna','',876,'','WF','WLF'),
      (77,'Bosnia and Herzegovina','Republic of Bosnia and Herzegovina',70,'','BA','BIH'),
      (78,'Côte d''Ivoire','Republic of Côte d''Ivoire',384,'','CI','CIV'),
      (79,'Jamaica','',388,'','JM','JAM'),
      (80,'Malta','Republic of Malta',470,'','MT','MLT'),
      (81,'Niue','Republic of Niue',570,'','NU','NIU'),
      (82,'Tanzania, United Republic of','United Republic of Tanzania',834,'','TZ','TZA'),
      (83,'Western Sahara','',732,'','EH','ESH'),
      (84,'Botswana','Republic of Botswana',72,'','BW','BWA'),
      (85,'Croatia','Republic of Croatia',191,'','HR','HRV'),
      (86,'Germany','Federal Republic of Germany',276,'','DE','DEU'),
      (87,'Norfolk Island','',574,'','NF','NFK'),
      (88,'Saint Vincent and the Grenadines','',670,'','VC','VCT'),
      (89,'Thailand','Kingdom of Thailand',764,'','TH','THA'),
      (90,'Yemen','Republic of Yemen',887,'','YE','YEM'),
      (91,'Cuba','Republic of Cuba',192,'','CU','CUB'),
      (92,'Ghana','Republic of Ghana',288,'','GH','GHA'),
      (93,'Marshall Islands','Republic of the Marshall Islands',584,'','MH','MHL'),
      (94,'Northern Mariana Islands','Commonwealth of the Northern Mariana Islands',580,'','MP','MNP'),
      (95,'Timor-Leste','Democratic Republic of Timor-Leste',626,'','TL','TLS'),
      (96,'Zambia','Republic of Zambia',894,'','ZM','ZMB'),
      (97,'Cyprus','Republic of Cyprus',196,'','CY','CYP'),
      (98,'Gibraltar','',292,'','GI','GIB'),
      (99,'Martinique','',474,'','MQ','MTQ'),
      (100,'Samoa','Independent State of Samoa',882,'','WS','WSM'),
      (101,'Zimbabwe','Republic of Zimbabwe',716,'','ZW','ZWE'),
      (102,'Czech Republic','',203,'','CZ','CZE'),
      (103,'Greece','Hellenic Republic',300,'','GR','GRC'),
      (104,'Mauritania','Islamic Republic of Mauritania',478,'','MR','MRT'),
      (105,'Norway','Kingdom of Norway',578,'','NO','NOR'),
      (106,'San Marino','Republic of San Marino',674,'','SM','SMR'),
      (107,'Denmark','Kingdom of Denmark',208,'','DK','DNK'),
      (108,'Greenland','',304,'','GL','GRL'),
      (109,'Oman','Sultanate of Oman',512,'','OM','OMN'),
      (110,'Grenada','',308,'','GD','GRD'),
      (111,'Pakistan','Islamic Republic of Pakistan',586,'','PK','PAK'),
      (112,'Sao Tome and Principe','Democratic Republic of Sao Tome and Principe',678,'','ST','STP'),
      (113,'Guadeloupe','',312,'','GP','GLP'),
      (114,'Palau','Republic of Palau',585,'','PW','PLW'),
      (115,'Saudi Arabia','Kingdom of Saudi Arabia',682,'','SA','SAU'),
      (116,'Guam','',316,'','GU','GUM'),
      (117,'Palestinian Territory, Occupied','Occupied Palestinian Territory',275,'','PS','PSE'),
      (118,'Senegal','Republic of Senegal',686,'','SN','SEN'),
      (119,'Guatemala','Republic of Guatemala',320,'','GT','GTM'),
      (120,'Serbia','Republic of Serbia',688,'','RS','SRB'),
      (121,'Seychelles','Republic of Seychelles',690,'','SC','SYC'),
      (122,'Sierra Leone','Republic of Sierra Leone',694,'','SL','SLE'),
      (123,'Singapore','Republic of Singapore',702,'','SG','SGP'),
      (124,'Antigua and Barbuda','',28,'','AG','ATG'),
      (125,'Argentina','Argentine Republic',32,'','AR','ARG'),
      (126,'Armenia','Republic of Armenia',51,'','AM','ARM'),
      (127,'Slovakia','Slovak Republic',703,'','SK','SVK'),
      (128,'Aruba','',533,'','AW','ABW'),
      (129,'Lao People''s Democratic Republic','',418,'','LA','LAO'),
      (130,'Slovenia','Republic of Slovenia',705,'','SI','SVN'),
      (131,'Australia','',36,'','AU','AUS'),
      (132,'Cape Verde','Republic of Cape Verde',132,'','CV','CPV'),
      (133,'Latvia','Republic of Latvia',428,'','LV','LVA'),
      (134,'Solomon Islands','',90,'','SB','SLB'),
      (135,'Austria','Republic of Austria',40,'','AT','AUT'),
      (136,'Cayman Islands','',136,'','KY','CYM'),
      (137,'Lebanon','Lebanese Republic',422,'','LB','LBN'),
      (138,'Somalia','Somali Republic',706,'','SO','SOM'),
      (139,'Azerbaijan','Republic of Azerbaijan',31,'','AZ','AZE'),
      (140,'Central African Republic','',140,'','CF','CAF'),
      (141,'Lesotho','Kingdom of Lesotho',426,'','LS','LSO'),
      (142,'South Africa','Republic of South Africa',710,'','ZA','ZAF'),
      (143,'Ukraine','',804,'','UA','UKR'),
      (144,'Bahamas','Commonwealth of the Bahamas',44,'','BS','BHS'),
      (145,'Chad','Republic of Chad',148,'','TD','TCD'),
      (146,'Liberia','Republic of Liberia',430,'','LR','LBR'),
      (147,'Mozambique','Republic of Mozambique',508,'','MZ','MOZ'),
      (148,'South Georgia and the South Sandwich Islands','',239,'','GS','SGS'),
      (149,'United Arab Emirates','',784,'','AE','ARE'),
      (150,'Bahrain','Kingdom of Bahrain',48,'','BH','BHR'),
      (151,'Chile','Republic of Chile',152,'','CL','CHL'),
      (152,'Falkland Islands (Malvinas)','',238,'','FK','FLK'),
      (153,'Libyan Arab Jamahiriya','Socialist People''s Libyan Arab Jamahiriya',434,'','LY','LBY'),
      (154,'Myanmar','Union of Myanmar',104,'','MM','MMR'),
      (155,'Spain','Kingdom of Spain',724,'','ES','ESP'),
      (156,'United Kingdom','United Kingdom of Great Britain and Northern Ireland',826,'','GB','GBR'),
      (157,'Bangladesh','People''s Republic of Bangladesh',50,'','BD','BGD'),
      (158,'China','People''s Republic of China',156,'','CN','CHN'),
      (159,'Faroe Islands','',234,'','FO','FRO'),
      (160,'Liechtenstein','Principality of Liechtenstein',438,'','LI','LIE'),
      (161,'Namibia','Republic of Namibia',516,'','NA','NAM'),
      (162,'Sri Lanka','Democratic Socialist Republic of Sri Lanka',144,'','LK','LKA'),
      (163,'United States','United States of America',840,'','US','USA'),
      (164,'Christmas Island','',162,'','CX','CXR'),
      (165,'Fiji','Republic of the Fiji Islands',242,'','FJ','FJI'),
      (166,'Lithuania','Republic of Lithuania',440,'','LT','LTU'),
      (167,'Nauru','Republic of Nauru',520,'','NR','NRU'),
      (168,'Sudan','Republic of the Sudan',736,'','SD','SDN'),
      (169,'United States Minor Outlying Islands','',581,'','UM','UMI'),
      (170,'Cocos (Keeling) Islands','',166,'','CC','CCK'),
      (171,'Finland','Republic of Finland',246,'','FI','FIN'),
      (172,'Luxembourg','Grand Duchy of Luxembourg',442,'','LU','LUX'),
      (173,'Nepal','Kingdom of Nepal',524,'','NP','NPL'),
      (174,'Reunion','',638,'','RE','REU'),
      (175,'Suriname','Republic of Suriname',740,'','SR','SUR'),
      (176,'Uruguay','Eastern Republic of Uruguay',858,'','UY','URY'),
      (177,'Colombia','Republic of Colombia',170,'','CO','COL'),
      (178,'France','French Republic',250,'','FR','FRA'),
      (179,'Macao','Macao Special Administrative Region of China',446,'','MO','MAC'),
      (180,'Netherlands','Kingdom of the Netherlands',528,'','NL','NLD'),
      (181,'Romania','',642,'','RO','ROU'),
      (182,'Uzbekistan','Republic of Uzbekistan',860,'','UZ','UZB'),
      (183,'Comoros','Union of the Comoros',174,'','KM','COM'),
      (184,'French Guiana','',254,'','GF','GUF'),
      (185,'Netherlands Antilles','',530,'','AN','ANT'),
      (186,'Russian Federation','',643,'','RU','RUS'),
      (187,'Vanuatu','Republic of Vanuatu',548,'','VU','VUT'),
      (188,'French Polynesia','',258,'','PF','PYF'),
      (189,'New Caledonia','',540,'','NC','NCL'),
      (190,'Rwanda','Rwandese Republic',646,'','RW','RWA'),
      (191,'Venezuela','Bolivarian Republic of Venezuela',862,'','VE','VEN'),
      (192,'French Southern Territories','',260,'','TF','ATF'),
      (193,'New Zealand','',554,'','NZ','NZL'),
      (194,'Saint Barthélemy','',652,'','BL','BLM'),
      (195,'Viet Nam','Socialist Republic of Viet Nam',704,'','VN','VNM'),
      (196,'Gabon','Gabonese Republic',266,'','GA','GAB'),
      (197,'Nicaragua','Republic of Nicaragua',558,'','NI','NIC'),
      (198,'Saint Helena','',654,'','SH','SHN'),
      (199,'Gambia','Republic of the Gambia',270,'','GM','GMB'),
      (200,'Saint Kitts and Nevis','',659,'','KN','KNA'),
      (201,'Saint Lucia','',662,'','LC','LCA'),
      (202,'Saint Martin (French part)','',663,'','MF','MAF'),
      (203,'Saint Pierre and Miquelon','',666,'','PM','SPM'),
      (204,'Afghanistan','Islamic Republic of Afghanistan',4,'','AF','AFG'),
      (205,'Åland Islands','',248,'','AX','ALA'),
      (206,'Albania','Republic of Albania',8,'','AL','ALB'),
      (207,'Japan','',392,'','JP','JPN'),
      (208,'Algeria','People''s Democratic Republic of Algeria',12,'','DZ','DZA'),
      (209,'Bouvet Island','',74,'','BV','BVT'),
      (210,'Jersey','',832,'','JE','JEY'),
      (211,'American Samoa','',16,'','AS','ASM'),
      (212,'Brazil','Federative Republic of Brazil',76,'','BR','BRA'),
      (213,'Jordan','Hashemite Kingdom of Jordan',400,'','JO','JOR'),
      (214,'Andorra','Principality of Andorra',20,'','AD','AND'),
      (215,'British Indian Ocean Territory','',86,'','IO','IOT'),
      (216,'Kazakhstan','Republic of Kazakhstan',398,'','KZ','KAZ'),
      (217,'Togo','Togolese Republic',768,'','TG','TGO'),
      (218,'Angola','Republic of Angola',24,'','AO','AGO'),
      (219,'Brunei Darussalam','',96,'','BN','BRN'),
      (220,'Kenya','Republic of Kenya',404,'','KE','KEN'),
      (221,'Mauritius','Republic of Mauritius',480,'','MU','MUS'),
      (222,'Tokelau','',772,'','TK','TKL'),
      (223,'Mayotte','',175,'','YT','MYT'),
      (224,'Kiribati','Republic of Kiribati',296,'','KI','KIR'),
      (225,'Anguilla','',660,'','AI','AIA'),
      (226,'Bulgaria','Republic of Bulgaria',100,'','BG','BGR'),
      (227,'Djibouti','Republic of Djibouti',262,'','DJ','DJI'),
      (228,'Tonga','Kingdom of Tonga',776,'','TO','TON'),
      (229,'Mexico','United Mexican States',484,'','MX','MEX'),
      (230,'Korea, Democratic People''s Republic of','Democratic People''s Republic of Korea',408,'','KP','PRK'),
      (231,'Antarctica','',10,'','AQ','ATA'),
      (232,'Burkina Faso','',854,'','BF','BFA'),
      (233,'Dominica','Commonwealth of Dominica',212,'','DM','DMA'),
      (234,'Trinidad and Tobago','Republic of Trinidad and Tobago',780,'','TT','TTO'),
      (235,'Tunisia','Republic of Tunisia',788,'','TN','TUN'),
      (236,'Dominican Republic','',214,'','DO','DOM'),
      (237,'Burundi','Republic of Burundi',108,'','BI','BDI'),
      (238,'Korea, Republic of','',410,'','KR','KOR'),
      (239,'Micronesia, Federated States of','Federated States of Micronesia',583,'','FM','FSM'),
      (240,'Turkey','Republic of Turkey',792,'','TR','TUR'),
      (241,'Moldova','Republic of Moldova',498,'','MD','MDA'),
      (242,'Kuwait','State of Kuwait',414,'','KW','KWT'),
      (243,'Cambodia','Kingdom of Cambodia',116,'','KH','KHM'),
      (244,'Ecuador','Republic of Ecuador',218,'','EC','ECU'),
      (245,'Guernsey','',831,'','GG','GGY'),
      (246,'Panama','Republic of Panama',591,'','PA','PAN');"
        
    sql = ActiveRecord::Base.connection()
    sql.execute "SET autocommit=0"
    sql.begin_db_transaction
    sql.insert countries
    sql.commit_db_transaction

  end

  def self.down
    drop_table :countries
  end
end
