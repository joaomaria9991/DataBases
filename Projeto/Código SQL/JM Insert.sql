USE TorrentTracker;
GO


DBCC CHECKIDENT('TorrentTracker.TrackerComunidade', RESEED, 0);
GO

INSERT INTO TorrentTracker.TrackerComunidade([LinkTracker],[NomeTracker]) VALUES('https://portugas.org/','Portugas'),('https://iptorrents.com/','IpTorrents');
GO

-- 100 Utilizadores
DBCC CHECKIDENT('TorrentTracker.Utilizador', RESEED, 0);
GO

INSERT INTO TorrentTracker.Utilizador([UserPassword],[UserEMail],[UserDataRegisto],[UserNickName],[UserIP],[UserTorrentProgram],[UserPermissaoDownload]) VALUES('JLU43TEG0DU','Morbi.quis.urna@acmattissemper.co.uk','2015-09-05 17:52:53','Marah','8624.7084.5048.1465','QBittorrent',0),('XOE15UOF4RU','massa.non.ante@dolorDonecfringilla.com','2017-12-23 15:10:19','Laith','2317.9874.4001.9344','QBittorrent',1),('PUS48IQV7RR','ultricies.ligula@velitPellentesque.org','2020-03-28 14:09:08','Sebastian','0897.1991.0571.8266','uTorrent',1),('YXP59XAS3AN','ridiculus@Maecenas.com','2018-08-18 01:21:40','May','3779.6129.6465.6413','Emule',0),('ZPP00DHS1LM','Aliquam.auctor@senectusetnetus.co.uk','2022-03-30 04:54:57','Reed','6604.8588.7041.9027','Emule',1),('SFR55YBP5WS','Morbi.metus@Cras.edu','2020-01-25 03:17:41','Charde','0423.8428.6964.5328','BitTorrent',1),('JEN98RJR0IO','nibh.Phasellus@maurisInteger.edu','2017-12-17 18:27:17','Macon','0652.6438.9131.8057','Transmission',1),('ZHO94AVP7YY','elit.erat.vitae@fermentum.edu','2021-02-19 15:03:50','Phelan','9416.7300.9020.0788','BitTorrent',1),('DLJ83KLM1AN','amet.diam@inlobortis.edu','2018-09-16 08:30:25','Kristen','2280.4854.8056.5604','Emule',0),('BTE72CUZ7WZ','orci@elit.ca','2017-01-22 05:46:55','Reece','2061.4410.9925.6945','QBittorrent',1),('MSH80IEA1TQ','ac.mattis.ornare@aliquetvel.com','2016-06-14 20:28:17','Shannon','4634.4374.2364.7179','QBittorrent',0),('GZF08SKZ9KH','dui@Maecenasmi.net','2017-05-04 15:28:50','Cathleen','2746.0885.7115.7758','Emule',0),('ULX66TGQ1BJ','ac.libero@gravidaPraesenteu.co.uk','2020-09-23 06:25:38','Leonard','1677.2722.9342.7230','uTorrent',1),('GBE46GYQ5MR','amet.dapibus.id@lectusa.org','2021-09-06 16:11:56','Duncan','8450.6779.1901.8764','Emule',0),('OND88HRG0OQ','egestas@Donec.edu','2020-05-08 19:50:45','Lillith','3542.6061.2276.5612','Transmission',0),('PDN42XVU1ED','consectetuer.euismod@Sed.com','2020-11-29 01:39:02','Justina','3157.3254.9043.6114','QBittorrent',0),('NAX50SJM1TP','odio@nequevitaesemper.co.uk','2017-11-07 13:16:15','Steel','7425.7207.2351.9034','BitTorrent',1),('KNO50MVR5UD','ipsum@aliquamarcuAliquam.edu','2020-02-12 03:47:41','Basia','9323.4862.2313.7697','BitTorrent',0),('BXY65USH4AU','malesuada.vel@at.org','2018-04-04 01:11:29','Cadman','8217.5131.8743.1512','BitTorrent',0),('QWD51HGK7PD','justo.sit.amet@purus.ca','2021-02-13 02:53:21','Karleigh','1284.9506.9578.9062','uTorrent',0),('PMX04XYT6CY','Nulla.tincidunt@ametdiameu.org','2015-11-26 01:53:16','Chloe','2823.1098.5582.1267','BitTorrent',0),('RRQ09ABW1FY','augue@lectus.net','2020-09-16 23:41:17','Orli','5381.2406.9081.6931','uTorrent',0),('NIS85HWQ0MI','eros@In.org','2018-12-10 20:31:24','Phillip','5684.8586.9125.7123','Transmission',0),('NIL10ALE8CG','arcu@eleifendCrassed.ca','2018-08-08 21:54:26','Lyle','6774.6856.9820.7297','BitTorrent',1),('OMH60CDZ1WW','orci@ipsum.com','2017-11-14 00:09:58','Mara','3344.3573.5066.0453','uTorrent',1),('QYD21YOR8PA','dolor.egestas@semPellentesque.co.uk','2021-01-30 02:55:58','Kibo','5016.3929.4853.4856','uTorrent',1),('ABX29ZUB6EN','orci.quis.lectus@enim.org','2019-02-25 20:38:17','Adam','0507.6957.6315.8146','Emule',0),('MEA34YVT5ES','faucibus.Morbi@nec.net','2015-07-24 10:22:14','Ursa','2941.5836.7837.8840','Emule',0),('CCM75LBP3EQ','id.sapien@nulla.net','2015-11-10 19:27:14','Elijah','1361.3055.9514.1001','uTorrent',1),('DXM80YNG4DJ','erat.vitae@infaucibus.ca','2016-04-03 23:11:42','Colby','5654.5341.5515.3946','QBittorrent',1),('OKP29JBT4CD','neque.sed.sem@facilisis.com','2020-01-05 08:06:02','Eaton','0492.0811.4109.5147','Emule',0),('RJM63KYZ7RC','ultricies.dignissim@Inscelerisquescelerisque.com','2019-03-14 12:56:49','Jayme','7260.1283.2063.7996','QBittorrent',1),('AOW65MNY4NL','ac.feugiat@dapibus.org','2016-02-13 08:47:18','Paloma','5718.6096.6695.6661','Emule',0),('MIA11EMF9ZP','sollicitudin.adipiscing@estmauris.ca','2019-07-03 12:47:01','Bianca','5249.2643.8644.9202','BitTorrent',1),('MPZ89KXW4FD','euismod@dignissimlacus.co.uk','2019-02-04 11:24:11','Lani','9584.2446.1979.9546','QBittorrent',0),('UZJ66YEM6BV','sit@felispurus.org','2017-10-13 19:52:33','Bree','4447.7470.8059.4321','Transmission',1),('WUY85MAM8KS','sit.amet.ultricies@Maecenasliberoest.net','2017-07-17 20:30:55','Peter','8354.7455.7334.8860','Emule',1),('PAA66NIW8LC','sollicitudin.adipiscing@afelis.co.uk','2021-06-11 00:35:46','Wilma','4877.6799.2340.1352','Transmission',1),('DJI09MRN1AK','elementum.sem.vitae@scelerisque.edu','2021-10-25 15:52:38','Colette','7129.0952.8833.7891','Emule',1),('YJD78WJU3HK','sit@non.net','2021-03-05 18:20:30','Austin','0097.7776.8706.0977','BitTorrent',1),('MLG76GMA1IO','dui.Cras@dictumplacerat.co.uk','2020-11-22 09:59:04','Omar','4821.1412.8071.0096','Emule',1),('FYT85YSY4WU','lacus.vestibulum.lorem@Aenean.ca','2022-03-30 03:14:05','Gabriel','5912.9210.6836.3387','BitTorrent',1),('SOL87MRI9JU','ligula@et.ca','2021-09-15 17:52:16','Alika','5949.5560.0253.4858','BitTorrent',1),('NZI53VSN0IM','erat.neque@nonummy.org','2016-06-10 02:25:50','Ali','4883.7458.5003.0918','Emule',1),('DGD19FOL3RT','et@aaliquetvel.co.uk','2016-12-26 10:36:49','Paki','0488.6211.5884.4644','QBittorrent',0),('QMW25KPS9LZ','sem.magna@dolorNullasemper.org','2021-10-31 22:12:49','Colton','0758.0246.6423.4761','Transmission',1),('GML54CUN4ZC','Vivamus.nibh.dolor@rhoncusProin.com','2022-02-16 08:11:35','Donovan','7144.3953.7638.7298','BitTorrent',1),('IKO38YJT5XU','tellus.id@auctor.com','2020-12-08 04:04:26','Nicole','3673.1197.2994.5797','Transmission',1),('TJR50DGN3LD','Aliquam@egestas.org','2018-07-02 02:22:24','Lesley','4753.7666.0140.3265','uTorrent',1),('UVB44NCY2YF','molestie@miac.com','2018-11-13 17:39:29','Fatima','5621.5532.9709.0898','uTorrent',1),('XZH94OFT7ZU','turpis.nec@consectetueripsumnunc.com','2017-08-12 06:17:47','Aurora','7388.8164.5024.8194','BitTorrent',1),('AFM90BMG2VJ','Nullam.feugiat@eratEtiamvestibulum.edu','2017-08-31 08:45:38','Basil','5754.4824.9658.7050','BitTorrent',1),('ZXV34KCA0BQ','risus@sodaleseliterat.net','2022-04-23 18:45:07','Branden','4779.3166.2136.1880','BitTorrent',0),('RYW97XNU7OS','Cras.interdum.Nunc@sedturpis.ca','2019-04-25 13:16:10','Minerva','6450.9662.0178.5882','uTorrent',0),('EAM22MZB1LC','elit@enimMaurisquis.com','2021-10-25 21:22:48','Eaton','8194.6979.6636.0829','uTorrent',1),('QBQ98QHD9CL','sit.amet@nonlobortisquis.net','2016-06-10 10:52:08','Jelani','7775.7902.0361.4416','Transmission',0),('HDM46SEP5FW','dolor.Fusce@atortor.edu','2016-11-22 13:45:25','Rajah','2904.0204.2377.6381','Emule',0),('OOR31DCX1VJ','ipsum.ac@atauctor.org','2018-06-27 14:32:29','Bruno','4995.2298.7985.1077','BitTorrent',1),('DBT59NZE4XW','nunc@consectetuercursus.ca','2019-03-21 16:13:04','Malachi','2013.5908.4962.9675','QBittorrent',0),('UOD94RYW2IR','ornare.sagittis@lectusjustoeu.org','2018-07-27 20:59:59','Sylvester','2458.9070.1341.8073','uTorrent',1),('OHQ04THN3PW','at.egestas.a@miAliquamgravida.ca','2015-12-13 18:31:14','Irma','9561.6611.5324.3885','Transmission',0),('XYX07LSI5MP','a.arcu.Sed@semut.org','2018-11-17 03:56:10','Quentin','8903.0685.0962.5793','BitTorrent',0),('GWD60AQD1YZ','auctor@euismodmauriseu.edu','2021-05-17 08:07:05','Jeremy','6084.1287.7779.8462','BitTorrent',1),('QAX84GTE9YD','leo.Morbi@convalliserat.net','2021-12-10 12:18:14','Mason','6049.2828.5916.5728','Emule',0),('KEB61CWQ2LU','quis@diamDuismi.com','2016-09-25 07:31:17','Melinda','4456.2829.9490.2029','Transmission',0),('UUE67HFB4LG','nisi.magna@Aliquam.edu','2019-09-16 16:55:06','Ashely','9215.0829.7369.6023','Transmission',1),('HPJ09IHW9GE','nec.tempus@diamProin.com','2017-08-22 18:08:05','Nasim','4998.6841.9825.2173','uTorrent',1),('NTA25ZVA2ZZ','Quisque@habitantmorbitristique.org','2020-10-17 13:08:33','Valentine','5568.2213.0768.9665','QBittorrent',0),('EHV54UGX4FI','scelerisque.mollis.Phasellus@uterosnon.ca','2019-02-11 19:30:16','Bruce','6704.8117.8308.4789','QBittorrent',1),('FIH74DCE2EE','lorem.fringilla.ornare@imperdietdictum.co.uk','2018-07-23 05:08:48','Quinlan','9482.7791.5241.2360','Emule',0),('WTH64UDZ7UD','odio@nisiaodio.net','2016-04-08 05:16:41','Sean','1409.0700.7950.8875','BitTorrent',0),('MQI06ZRP8GQ','Suspendisse@Phasellus.co.uk','2017-02-21 00:28:53','Quin','1847.7290.9718.2278','Emule',1),('SOE75YIJ2WQ','velit.dui@vestibulumlorem.edu','2016-02-02 20:18:50','Harriet','9680.1347.2893.1347','Emule',0),('PYZ13NVQ5TF','pellentesque.a@nisi.net','2021-07-01 00:00:23','Wanda','8677.3179.2768.5217','QBittorrent',1),('MAL46SYW8SP','commodo.at.libero@DonecestNunc.net','2020-06-11 09:16:55','Eaton','2823.4398.9867.5165','QBittorrent',0),('IRK61EUF3RO','porttitor.scelerisque.neque@maurisIntegersem.com','2017-12-23 06:28:09','Owen','9536.1456.4492.2964','Emule',1),('WVO47CHU5EP','rhoncus.id@vel.co.uk','2019-01-09 01:33:06','Martha','4555.9210.1132.1252','Transmission',0),('BRT96DPD4FM','et@ipsum.co.uk','2017-09-28 17:06:18','Maile','3061.4030.6429.4143','Transmission',1),('BBV73IWF4NL','magnis.dis@nonummy.edu','2017-05-31 02:01:46','Emmanuel','4360.4622.8468.3806','BitTorrent',1),('NXS01BWJ6QV','consequat@Nulla.ca','2017-07-05 05:16:25','Cole','8860.1102.7493.4728','QBittorrent',0),('LQR87VJD7ZC','Mauris@purusaccumsan.net','2020-03-20 03:12:38','Randall','8878.7517.6393.1731','Emule',1),('UIL96NSS5VS','sem.ut@quismassaMauris.org','2020-06-16 21:48:15','Elmo','7309.5250.7560.1570','BitTorrent',0),('IJA71SFD5FO','nibh.dolor@ProinmiAliquam.net','2015-10-25 12:15:37','Uriah','4552.4904.9264.1247','BitTorrent',0),('PEP34GFT9CN','nibh.vulputate@etipsum.com','2018-07-11 00:40:32','Mikayla','2539.0036.7627.0340','Emule',0),('EGO82GWV5CO','tristique@idenimCurabitur.org','2016-01-07 07:58:35','Ciaran','1090.9318.0272.8020','Emule',1),('KBN21MIK7YC','Cras.interdum@orcilobortis.ca','2019-04-13 15:13:29','Chanda','0577.6956.9637.7703','BitTorrent',1),('SRU79LKT7KC','ut.dolor.dapibus@purusaccumsan.net','2016-04-15 00:32:47','Keith','4172.1291.7502.8859','Emule',1),('ZQP16OQK7NQ','mauris.id@inceptos.edu','2019-06-03 15:44:39','Fitzgerald','6671.1747.0831.8827','BitTorrent',0),('VSM56LVN1TW','Fusce@felisullamcorperviverra.co.uk','2020-02-18 13:55:38','Charissa','9425.0662.6344.7704','QBittorrent',1),('FEK35VIV6WM','sociis@liberoet.net','2022-05-17 22:13:19','Stephen','4073.9307.2389.3694','uTorrent',1),('SDZ23CML0UG','a.arcu.Sed@atvelitCras.net','2017-10-13 23:43:47','Timon','7427.8762.5180.6931','Transmission',0),('IHM32YKZ0AK','sem.ut.dolor@adipiscingfringilla.com','2019-02-11 10:06:28','Dana','0730.4739.4647.8790','uTorrent',0),('YFH44KOL7KQ','nibh@Sednuncest.net','2016-03-30 16:34:35','Kennedy','2009.9338.0589.9250','uTorrent',1),('KXY36QUY8DO','ac@Nam.com','2019-05-08 04:59:52','Diana','9098.6480.3101.8387','uTorrent',0),('FVK87LJH1TR','velit.in@odioPhasellus.edu','2017-05-18 13:36:42','Amber','6220.6033.4869.6593','Emule',1),('ZQF03ESY7NE','Vivamus@Nullamvelit.com','2022-04-20 17:11:10','Hoyt','6571.3219.9619.8796','Transmission',1),('GBM74NEF2WJ','a@leoVivamusnibh.net','2018-08-25 12:36:01','Megan','6237.1187.5275.4016','BitTorrent',1),('GEM92XRW9VE','cubilia@semmollis.edu','2017-05-19 10:33:47','Aurelia','7747.7708.4396.3125','Transmission',0),('UTV31QEZ1XI','mus@utpellentesqueeget.net','2017-07-11 10:44:28','Fletcher','7563.1556.7716.7712','BitTorrent',1),('OEF90QCN5GQ','iaculis@turpisnec.edu','2021-08-29 03:28:25','Blaze','5436.9216.3414.5226','Transmission',1);
GO


DBCC CHECKIDENT('TorrentTracker.ContentTorrent', RESEED, 0);
GO

INSERT INTO TorrentTracker.ContentTorrent([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite]) VALUES
		(1515.520,'2020-07-22 10:15:36','NULL','NULL','Minecraft.Dungeons-CODEX','2017-05-31 12:55:13'),
		(4966.400,'2021-08-16 02:21:25','NULL','NULL','Morangos.com.Acucar.O.Filme.2012.1080p.PORTUGUESE.NF.WEB-DL.H264.AAC-Ninasat','2021-10-09 10:16:58'),
		(14131,'2021-06-01 08:15:05','NULL','NULL','The.Terminal.2004.2160p.WEB.H265-NAISU','2017-08-17 00:51:02'),
		(1832.960,'2021-11-16 11:20:58','NULL','NULL','Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu', NULL),
		(1228.8,'2021-12-19 17:27:23','NULL' ,'NULL','Prisao.Domiciliaria.S01E08.1080p.OPTO.WEBRip.H264-MTRX',NULL);
GO