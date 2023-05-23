/*Sistema de Gestão de Gestão de um Torrent Tracker*/
--P4G7 Álvaro Freixo 93116, João Machado 89132
-- INSERTS --



USE p4g7;
GO

-- 2 Trackers
DBCC CHECKIDENT('TorrentTracker.TrackerComunidade', RESEED, 1);
GO

INSERT INTO TorrentTracker.TrackerComunidade([LinkTracker],[NomeTracker]) VALUES('https://portugas.org/','Portugas'),('https://iptorrents.com/','IpTorrents');
GO


-- 100 Utilizadores
DBCC CHECKIDENT('TorrentTracker.Utilizador', RESEED, 1);
GO

INSERT INTO TorrentTracker.Utilizador([UserPassword],[UserEMail],[UserDataRegisto],[UserNickName],[UserIP],[UserTorrentProgram],[UserPermissaoDownload],[ID_TrackerComunidade]) VALUES('NSW52MMJ0WN','tincidunt.pede@ullamcorpermagna.co.uk','2017-05-22 23:12:55','Kendall','9622.2858.0563.5967','eMule',1,1),('LVD39RED6FT','in.consectetuer.ipsum@penatibuset.co.uk','2019-01-13 08:16:53','Joseph','6184.3031.7871.7085','Lime',0,1),('RUF33TCV6LX','nulla.at@variuseteuismod.org','2018-06-23 19:23:20','Bert','8628.4641.5266.2366','Vuze',1,1),('EUD30TTS6VM','elementum.lorem@nec.edu','2019-07-09 00:04:09','Melyssa','9120.6437.1481.5118','Vuze',0,1),('YPD96RZM0BZ','felis.purus@Quisquetinciduntpede.co.uk','2018-09-24 11:20:59','Arthur','9877.7385.1856.7558','Transmission',1,1),('KNO70YME7HX','a.felis.ullamcorper@semperrutrum.edu','2018-12-22 08:12:52','Duncan','9725.2579.8232.1492','Transmission',0,1),('ALT23PXK4JP','iaculis@dolorFuscefeugiat.co.uk','2019-10-04 20:55:05','Jonas','6091.8480.9099.0935','Vuze',1,1),('HVB97CQU2HG','nisi@ametultriciessem.net','2017-02-09 04:01:58','Marshall','0534.0116.3805.6876','qBitTorrent',0,1),('BRF35AFN3SO','enim@Maecenasliberoest.org','2017-10-13 07:26:49','Warren','3233.5783.8827.5121','uTorrent',1,1),('CTS26JEW8LP','lacus@dolorNullasemper.edu','2015-10-21 06:28:00','Ryder','6057.9694.5999.6659','Transmission',0,1),('NTH62FWI6GA','turpis.egestas.Fusce@sociis.edu','2015-10-20 06:29:27','Beatrice','1722.1652.7758.7607','qBitTorrent',1,1),('BHY60POC2WP','eu@tinciduntpedeac.ca','2017-04-04 08:17:47','Tyler','0786.2762.6185.0140','qBitTorrent',0,1),('OOZ51TRC1TM','malesuada.ut.sem@porttitor.org','2018-11-19 23:18:38','Amos','9457.1135.9861.4657','Lime',1,1),('FWM58JSA7XH','amet@porttitortellusnon.com','2018-08-28 08:09:59','Athena','1351.0065.8375.5107','Vuze',1,1),('EYY65MZF3IK','id.risus@ametorci.co.uk','2019-03-24 23:47:44','Scott','2955.9741.1580.9164','uTorrent',0,1),('RZS82PDA2QM','amet.risus.Donec@ipsum.org','2019-06-22 17:43:55','Harriet','8133.1931.1412.3982','uTorrent',0,1),('SHF23EKG6IW','a@dignissimmagnaa.org','2020-01-24 13:42:22','Madaline','6438.1180.5023.7656','Transmission',1,1),('DLI13PMQ5CH','dolor@ametconsectetueradipiscing.org','2015-06-09 02:47:11','Theodore','4657.5499.8164.4389','uTorrent',1,1),('TIX01MQE6QM','dictum@acfacilisis.com','2017-02-01 14:09:35','Stephanie','7450.6522.9237.4357','Vuze',0,1),('MJG14TQZ0OP','pede@maurisblandit.ca','2019-10-18 12:24:26','Kirestin','6708.7993.1718.7407','eMule',0,1),('USB18EDT1EQ','eu@nectempus.ca','2016-03-01 11:00:45','Magee','2231.3172.7146.3294','Transmission',1,1),('KUN69HIV9TG','Integer.vulputate@malesuadamalesuadaInteger.edu','2016-01-18 17:38:22','Elton','0291.9977.7373.5931','Lime',0,1),('BSV45AKB7SK','sit.amet@luctusvulputatenisi.edu','2016-03-26 04:20:35','Geraldine','4085.8006.9516.6330','qBitTorrent',1,1),('TPX89GAJ4JK','lorem.tristique.aliquet@magna.com','2019-08-10 08:33:30','Karina','5929.8561.8873.9199','Vuze',0,1),('ENU04BDT5UF','et.risus.Quisque@loremvitaeodio.com','2016-06-24 07:21:55','Duncan','4166.8931.7783.8179','Lime',1,1),('BGE03DVH3TB','arcu@arcuVestibulum.net','2019-06-10 13:16:12','Aline','0388.5902.8832.0095','uTorrent',1,1),('KMU97NRZ9AX','ac.libero@arcuacorci.com','2016-12-30 16:02:38','Irene','7606.6501.6994.9630','Transmission',0,1),('UCJ39ZIT8DX','fermentum.risus@convalliserat.org','2019-02-26 10:09:35','Garth','7946.5526.1896.6355','qBitTorrent',1,1),('DCJ77ESR8SQ','Curabitur@Namac.com','2016-06-03 05:06:21','Victor','7120.8620.5175.5929','Transmission',1,1),('XLD59IWC1XZ','sociosqu@dapibusgravida.ca','2020-05-08 03:13:42','Buckminster','7993.2857.0089.8480','Lime',0,1),('KWZ91EMI2WX','erat.in.consectetuer@Crasdolor.ca','2017-12-19 09:55:57','Samuel','6394.3990.8468.0212','Vuze',0,1),('ZHA74BPK2WB','nisi.nibh.lacinia@egestasrhoncusProin.co.uk','2020-01-09 18:49:22','Selma','9021.9409.6575.0729','Transmission',0,1),('VAW02BLR0TJ','augue@orci.co.uk','2020-01-06 08:17:14','Amery','5340.9651.8106.6761','eMule',1,1),('XDF02PRZ3AQ','nec.tellus@porttitorvulputateposuere.org','2015-12-28 08:15:04','Fletcher','9494.2892.0695.0653','eMule',0,1),('TRK57GUC7EQ','tortor@Fusce.net','2019-02-18 08:29:27','Tarik','1959.8971.5322.3937','uTorrent',1,1),('PVB20QNE3AE','pharetra@Pellentesque.co.uk','2016-04-18 09:19:58','Ocean','2274.3613.3753.5208','eMule',0,1),('SPK38MXM6KJ','congue.elit@hendrerit.com','2017-05-17 07:03:51','Quamar','3207.2545.0171.0200','Vuze',0,1),('EEF13QXU9SG','dictum.magna.Ut@risusDonec.edu','2015-07-04 09:56:51','Ruby','3687.8026.8781.9697','Transmission',0,1),('TZC95TFP7DD','euismod.est.arcu@laciniaSed.edu','2017-05-21 04:34:29','Vance','5609.4291.1443.8794','Vuze',1,1),('VOE58MAY2GW','convallis.in.cursus@idante.org','2020-05-20 10:04:36','Kellie','3048.0529.6017.3309','uTorrent',0,1),('JKM28ULU6FM','Donec@congueturpis.com','2016-03-27 12:07:39','Channing','8322.0420.1187.5761','Transmission',0,1),('YKD53VCC7HM','In.scelerisque@semeget.edu','2015-09-03 10:45:33','Jakeem','0404.3555.1459.7528','Vuze',1,1),('IOL56TYW9KG','et.tristique@sitamet.ca','2019-11-28 18:24:36','Connor','1990.2710.1649.8788','uTorrent',0,1),('BHC74XVX3IF','et.malesuada.fames@facilisisnon.net','2017-12-21 15:24:46','Stephen','9132.1053.5551.2938','eMule',1,1),('TKX02IWH4XV','non@justofaucibus.com','2015-12-26 07:37:31','Barrett','6673.1539.3945.4708','uTorrent',0,1),('EJI31XVG5RY','faucibus.lectus@duiSuspendisse.com','2017-10-06 11:12:28','Merritt','9813.8427.2885.5261','Transmission',0,1),('JMJ10YNA5CR','Maecenas.libero.est@justo.ca','2019-03-20 01:06:43','Anne','1434.6995.1370.7085','Transmission',1,1),('YFN97VIY6IS','dolor@enim.org','2015-06-14 09:26:52','Gary','0940.3077.8579.4326','eMule',0,1),('MGD18LCR6XM','Donec@Curabitur.co.uk','2017-06-27 17:56:07','Roary','9866.9540.4005.2966','eMule',0,1),('KDX09ILZ7KB','sagittis.placerat.Cras@aceleifend.com','2016-03-01 18:13:18','Kyle','0814.6791.2995.1088','Lime',0,1),('YKZ45WQF2UP','eu.neque.pellentesque@euultrices.com','2016-02-21 19:29:25','Roth','5360.4045.4982.0303','Lime',1,1),('LJU40WRI2VV','feugiat.placerat@vestibulumMauris.co.uk','2017-01-04 21:29:03','Colton','0387.8954.5092.3848','Vuze',1,1),('KLX67XZL9XJ','Ut@ultricies.org','2019-10-06 16:38:27','Alexandra','7150.9456.8355.2655','Vuze',0,1),('KAL23KCQ6ER','ultricies@augue.co.uk','2017-03-11 12:44:23','Jillian','8977.8546.2886.3792','uTorrent',0,1),('EZD00QHN4LK','est.mollis@urna.edu','2018-12-21 08:39:12','Ingrid','3302.1659.2260.9056','Transmission',1,1),('EBK88UNN6RA','Quisque.purus.sapien@risusquis.net','2018-04-11 10:10:36','Amaya','8431.4000.3960.3458','uTorrent',0,1),('AEV67NAJ0LI','a@dui.edu','2019-01-06 07:23:39','Arden','4030.8444.9884.4530','Transmission',0,1),('LIZ54LPS6VA','vestibulum@cursusluctusipsum.edu','2018-01-16 04:30:32','Desirae','9218.0515.7133.1721','Lime',0,1),('QUQ04XAK6IB','Curabitur.vel.lectus@a.org','2018-03-29 04:29:02','Calvin','2396.0516.1371.2232','uTorrent',0,1),('AJO66ZQN8LI','in.dolor@mauris.com','2016-04-11 13:04:57','Charde','8298.2966.2321.9141','eMule',1,1),('NHS16MZJ2CQ','nisi.Mauris.nulla@ipsum.net','2019-03-04 08:56:04','Sarah','2003.1095.2477.0288','Vuze',1,1),('QWY36HCQ4ZB','Phasellus@Nuncmauris.co.uk','2016-10-09 09:58:52','Farrah','5406.0740.6341.7510','uTorrent',0,1),('EIG49ZWK8IO','molestie.tortor@nec.org','2016-09-20 20:20:35','Nissim','7459.5245.2508.7211','Lime',0,1),('DCY53HOQ9RM','leo@loremauctor.com','2020-01-14 03:07:58','Beck','4865.5638.2671.7419','eMule',1,1),('XHB37YCT8JG','a.neque.Nullam@quispedePraesent.org','2018-08-17 15:47:51','Fredericka','4613.2814.7759.1917','Lime',1,1),('OCO18IRH0RW','semper@semperet.net','2017-08-26 21:53:14','Slade','9099.2360.9233.8890','Transmission',1,1),('RZX41IZR8OY','risus.Donec.egestas@Integer.co.uk','2016-03-05 17:34:16','Keiko','5602.5589.2911.2991','Vuze',0,1),('YCQ02UBL1CZ','et@mauris.co.uk','2019-12-08 09:54:05','Baker','0042.3599.5341.8107','Vuze',1,1),('CVD35LFT5FL','ac.eleifend@pretiumnequeMorbi.net','2020-03-28 19:25:17','Hasad','9638.7638.4011.2880','Lime',1,1),('WNH94YUR9YV','Praesent.luctus@massaVestibulum.co.uk','2020-02-23 02:01:41','Jermaine','5374.5629.7059.2913','Vuze',1,1),('PNL35XQF1WX','facilisis.facilisis.magna@ultriciesadipiscing.org','2018-03-05 04:24:32','Reece','5377.4054.2727.0616','Vuze',0,1),('EQF05ADZ2NB','gravida.molestie.arcu@quisarcuvel.net','2016-06-26 15:30:40','Lawrence','0341.9553.5172.6484','uTorrent',0,1),('LAV01WJD6UL','mi.felis@faucibus.ca','2017-11-02 05:24:58','Richard','2297.2089.6151.7315','Transmission',1,1),('XVT60GQC9KG','et@sociis.org','2016-03-26 10:25:50','Avye','2333.0422.6328.4183','eMule',0,1),('EXC07ESU0ZA','lorem@placerataugueSed.edu','2017-11-05 03:11:34','Josephine','9867.4118.1495.4988','uTorrent',0,1),('QDD99PYK1ZX','mus.Aenean.eget@dictumProineget.co.uk','2018-06-26 21:13:33','Mark','8713.7541.2791.4361','Vuze',0,1),('PVI39TWN2JJ','ornare.facilisis@mipedenonummy.co.uk','2015-11-18 00:24:30','Malachi','5765.8565.1932.9435','uTorrent',1,1),('UUJ83RXV5KB','Cras.convallis@eueros.ca','2016-04-21 10:11:26','Haley','9317.6655.1794.6374','uTorrent',0,1),('CJK08VFZ3CX','semper@Fuscediam.ca','2019-04-14 02:36:12','Celeste','7532.7477.3668.9359','eMule',0,1),('SXK84RGF1JG','pharetra.Nam.ac@nectempusscelerisque.com','2018-06-28 22:30:31','Griffin','9454.3180.0376.0787','qBitTorrent',1,1),('JXB68XMA3OY','amet@posuerecubiliaCurae.ca','2018-02-02 09:57:43','Quyn','0506.9839.1910.2025','Transmission',0,1),('DQY69IST4AO','Integer.vitae@non.edu','2017-05-26 07:09:44','Libby','3521.1290.6258.9098','Transmission',0,1),('XYZ87UTF3QM','a@eu.com','2017-03-21 10:36:46','Halla','5649.1106.9085.6661','eMule',1,1),('FPC44KPA3PQ','lorem@ultricessit.co.uk','2019-04-17 07:27:11','Sigourney','6748.7391.8439.3545','Lime',0,1),('MDJ13SUW0UP','venenatis.lacus.Etiam@dictum.net','2015-10-19 17:34:20','Sydney','5475.3563.4114.1336','Vuze',0,1),('EFZ54HRU4MF','senectus@ametfaucibusut.edu','2018-10-05 03:35:18','Patrick','4096.5224.4905.0810','Vuze',0,1),('ORV42PII8EC','Curabitur.massa.Vestibulum@risusQuisque.com','2016-08-24 08:34:41','Raya','6277.3940.9970.5338','Transmission',1,1),('XYS08RMX9YI','lorem@non.ca','2018-07-05 19:32:32','Orson','1036.1436.5720.1809','Vuze',0,1),('JGR29NEI9GM','eget.magna@ornare.org','2017-09-11 17:29:54','Vernon','7227.7949.5015.8189','Transmission',0,1),('RGV62UUG7PB','elit.sed.consequat@utmiDuis.co.uk','2016-07-09 13:25:53','Deacon','2907.3699.6008.8686','eMule',1,1),('DDW27MOU2YO','odio.auctor.vitae@hymenaeosMaurisut.ca','2020-05-16 11:35:02','Macy','2091.4864.2881.7636','qBitTorrent',0,1),('YGD40LNW0VJ','et@nisiCum.net','2018-05-16 17:08:30','Rama','7019.4840.0732.7952','Lime',1,1),('BXA55NVG2LN','tristique@Aliquam.com','2016-01-09 06:57:51','Quin','7171.1400.5063.9494','uTorrent',1,1),('GAL41DIF7IR','auctor.ullamcorper.nisl@Fuscedolorquam.net','2015-11-20 12:03:33','Mallory','2825.3710.8441.0910','Vuze',0,1),('PFB03EZK6IF','libero@sociosquad.co.uk','2018-09-10 11:26:47','Jenette','8988.3221.7626.1916','Lime',1,1),('QGV17KRX1JZ','dignissim.pharetra@lacusQuisquepurus.edu','2016-07-15 17:04:31','Jonah','2991.8759.1257.3140','qBitTorrent',1,1),('BYR31QRV2ZB','et.nunc@quamvelsapien.com','2018-05-25 19:53:31','Hanae','7016.3288.5062.4762','eMule',1,1),('SGA72VBK3KY','metus.urna@ligulaAliquamerat.co.uk','2016-01-26 07:29:39','Hector','6861.9278.6053.0333','Lime',0,1),('QZF86ZNM2GH','sem.semper@duiaugueeu.co.uk','2017-03-19 23:44:10','Beverly','9294.0770.8482.9884','Vuze',1,1),('QFA82APH9PU','at@dui.ca','2019-03-26 20:20:19','Cody','0170.8600.4526.3601','Vuze',0,1);
GO


-- 5 Uploaders
INSERT INTO TorrentTracker.Uploader([ID_User],[ImunidadeHitRun],[FreeleechTotal],[Grupo]) VALUES(24,1,1,'Vosky'),(92,1,1,'BitCracker'),(74,1,1,'Vosky'),(43,1,1,'HCiSo'),(99,1,1,'HCiSo');
GO


-- 5 Torrents
DBCC CHECKIDENT('TorrentTracker.ContentTorrent', RESEED, 1);
GO

INSERT INTO TorrentTracker.ContentTorrent([Tamanho],[DataHoraAdicao],[NFO],[Descricao],[NomeContentTorrent],[FreeleeechDataHoraLimite],[ID_TrackerComunidade],[ID_UserUploader]) VALUES
		(1515.520,'2020-07-22 10:15:36',NULL,NULL,'Minecraft.Dungeons-CODEX','2017-05-31 12:55:13',1,24),
		(4966.400,'2021-08-16 02:21:25',NULL,NULL,'Morangos.com.Acucar.O.Filme.2012.1080p.PORTUGUESE.NF.WEB-DL.H264.AAC-Ninasat','2021-10-09 10:16:58',1,74),
		(14131,'2021-06-01 08:15:05',NULL,NULL,'The.Terminal.2004.2160p.WEB.H265-NAISU','2017-08-17 00:51:02',1,43),
		(1832.960,'2021-11-16 11:20:58',NULL,NULL,'Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu', NULL,1,92),
		(1228.8,'2021-12-19 17:27:23',NULL ,NULL,'Prisao.Domiciliaria.S01E08.1080p.OPTO.WEBRip.H264-MTRX',NULL,1,74);
GO

-- 10 Comentarios
DBCC CHECKIDENT('TorrentTracker.Comentario', RESEED, 1);
GO

INSERT INTO TorrentTracker.Comentario([ID_Writer],[ConteudoComentario],[DataHoraCriacao],[ID_UserResponse],[ID_ContentTorrent]) VALUES(5,'Muito Obrigado! Salvaste-me o Mestrado','2020-03-09 14:29:18',80,5),(3,'Melhor que pagar IVA! faz mais uploads!','2019-04-17 11:30:08',87,2),(3,'Não Gostei...','2020-03-24 07:36:06',23,3),(5,'This torrent cured my depression fam!!','2019-01-13 19:22:38',22,4),(4,'This torrent cured my depression fam!!','2022-01-04 21:11:35',56,1),(3,'Melhor que pagar IVA! faz mais uploads!','2018-11-06 01:07:55',60,3),(2,'Good Work!','2020-06-23 12:19:25',64,4),(2,'Muito Obrigado! Salvaste-me o Mestrado','2017-11-05 03:49:15',92,1),(3,'Não Gostei...','2018-11-06 21:37:15',45,5),(4,'This torrent cured my depression fam!!','2018-04-03 01:22:31',48,5),(5,'Muito Obrigado! Salvaste-me o Mestrado','2017-09-06 15:43:10',53,3),(2,'Noob!! Vai dar uma curva...','2017-07-26 22:53:19',27,2),(5,'I dont like it...','2022-02-20 15:47:18',87,1),(2,'This torrent cured my depression fam!!','2020-12-24 21:46:10',80,1),(5,'Muito Obrigado! Salvaste-me o Mestrado','2018-10-14 23:38:01',100,2),(4,'I dont like it...','2017-01-11 22:58:15',65,1),(2,'Melhor que pagar IVA! faz mais uploads!','2018-03-10 17:53:56',30,5),(2,'Muito Obrigado! Salvaste-me o Mestrado','2020-08-23 11:32:48',55,3),(1,'Muito Obrigado! Salvaste-me o Mestrado','2021-10-29 12:58:03',62,5),(3,'Noob!! Vai dar uma curva...','2020-01-09 09:49:54',13,4),(5,'This torrent cured my depression fam!!','2018-01-28 02:26:37',32,4),(3,'Muito Obrigado! Salvaste-me o Mestrado','2016-06-19 05:12:07',68,2),(1,'Não Gostei...','2019-09-08 20:36:41',50,1),(3,'Muito Obrigado! Salvaste-me o Mestrado','2017-11-28 09:09:40',64,4),(3,'This torrent cured my depression fam!!','2019-03-16 22:24:21',71,1),(3,'Melhor que pagar IVA! faz mais uploads!','2016-07-25 18:53:10',37,4),(5,'Não Gostei...','2017-09-17 08:34:59',22,4),(5,'Épico!','2016-12-20 13:15:22',93,2),(4,'Good Work!','2018-11-12 03:24:12',99,3),(5,'Melhor que pagar IVA! faz mais uploads!','2021-11-28 12:31:58',18,4),(3,'This torrent cured my depression fam!!','2020-03-15 12:37:59',25,3),(4,'Não Gostei...','2020-11-15 15:52:13',35,4),(3,'Good Work!','2016-07-10 15:37:45',79,2),(5,'Nice!','2021-02-17 21:16:39',42,5),(5,'Noob!! Vai dar uma curva...','2016-10-14 12:34:28',61,5),(2,'Obrigado! :)','2020-12-23 15:38:23',68,2),(3,'I dont like it...','2017-08-06 03:38:22',83,5),(1,'Nice!','2016-09-08 10:57:05',88,2),(3,'Good Work!','2016-09-02 19:57:54',35,2),(4,'Good Work!','2017-09-01 03:53:56',76,5),(1,'Nice!','2018-09-17 12:05:39',51,2),(4,'Melhor que pagar IVA! faz mais uploads!','2016-08-20 10:37:17',40,3),(2,'I dont like it...','2021-07-19 02:41:24',92,1),(5,'Melhor que pagar IVA! faz mais uploads!','2021-04-18 15:10:46',62,1),(3,'Muito Obrigado! Salvaste-me o Mestrado','2017-02-01 18:44:47',9,4),(2,'Muito Obrigado! Salvaste-me o Mestrado','2020-03-23 10:18:48',40,3),(1,'Nice!','2019-03-12 09:36:41',15,1),(5,'This torrent cured my depression fam!!','2019-09-13 10:28:55',58,1),(1,'Épico!','2019-09-18 08:39:19',97,2),(2,'This torrent cured my depression fam!!','2022-02-16 19:25:43',24,4);
GO


INSERT INTO TorrentTracker.ContentTorrentGame([ID_ContentTorrent],[NomeGame],[Capa],[OS]) VALUES(1,'Minecraft Dungeons',NULL,'Windows');
GO

INSERT INTO TorrentTracker.ContentTorrentProgram([ID_ContentTorrent],[NomeProgram],[Capa],[OS]) VALUES(4,'Adobe Photoshop CS6 13.0.',NULL,'Windows');
GO

INSERT INTO TorrentTracker.CategoriasInfoAutoDownload([ID_ContentTorrent],[ID_TT_IMDB],[IMDB_Link],[IMDB_Nome],[IMDB_Ano],[IMDB_Classificacao],[IMDB_Sinopse]) VALUES
		(2,'2185846','https://www.imdb.com/title/tt2185846?ref_=nv_sr_srsg_1','Morangos com Açúcar - O Filme',2012,6.9,'Margarida (Sara Matos) e Rui (Lourenço Ortigão), depois de estudarem em Inglaterra, regressam a Portugal para um acampamento de férias, onde reencontram amigos de outros tempos. Aproveitam também para participar num Festival de Verão. Missy M, a Tatiana (Mafalda Portela) mete-se no meio do casalinho e vive uma aventura romântica com Rui.'),
		(3,'0362227','https://www.imdb.com/title/tt0362227?ref_=nv_sr_srsg_0','Terminal de Aeroporto',2004,7.4,'Um visitante do Leste Europeu, Viktor Navorski, torna-se residente no terminal do aeroporto de Nova Iorque quando uma guerra civil faz o seu país desaparecer e o torna num apátrida, sem qualquer documento válido para a Imigração dos EUA.'),
		(5,'14051864','https://www.imdb.com/title/tt14051864/?ref_=ttep_ep_tt','Prisão Domiciliária',2021,8.2,'Um político em prisão domiciliária. Uma família a desmoronar-se. E demasiadas perguntas por responder. Quem tramou Álvaro Vieira Branco? Será o fim da sua carreira política? Como manter uma vida de luxo e poder quando tudo deixou de ser como antes?');
GO

INSERT INTO TorrentTracker.ContentTorrentSeries([ID_ContentTorrent],[ID_TT_IMDB],[ReleaseType],[Temporada],[Episodio]) VALUES(5,'14051864','WEBRip',1,8);
GO

INSERT INTO TorrentTracker.ContentTorrentMovies([ID_ContentTorrent],[ID_TT_IMDB],[ReleaseType]) VALUES(2,'2185846','WEB-DL'),(3,'0362227','WEB-DL');
GO

DBCC CHECKIDENT('TorrentTracker.TorrentAtivo', RESEED, 1);
GO

INSERT INTO TorrentTracker.TorrentAtivo([ID_UserTorrentAtivo],[DadosEnviados],[DadosRecebidos],[TempoSeeding],[ID_ContentTorrent]) VALUES(46,1511,1520,'08:26:19',1),(9,916,5000,'00:16:00',2),(62,1074,5000,'21:39:20',2),(97,1535,1240,'07:19:42',5),(35,1890,294,'18:16:40',4),(77,729,2000,'11:51:56',4),(17,126,20000,'20:17:35',3),(77,1363,142,'13:23:35',2),(82,258,973,'03:12:30',3),(4,136,135,'02:41:03',2),(85,603,527,'01:24:58',5),(9,203,17,'03:24:25',4),(10,227,5000,'08:05:52',2),(72,57,2000,'16:45:25',5),(35,573,917,'00:47:24',1),(18,1,2000,'10:12:10',1),(31,202,2000,'07:23:56',5),(42,976,708,'14:36:19',5),(59,305,20000,'23:41:13',3),(89,1024,794,'11:52:56',5),(9,1705,293,'13:17:11',1),(78,278,108,'16:57:17',2),(35,1377,873,'13:20:19',3),(44,1067,406,'19:11:14',3),(35,1133,690,'05:30:30',1),(62,1078,832,'15:33:14',1),(33,1712,176,'15:12:03',5),(48,1102,638,'18:52:08',3),(18,248,54,'18:12:43',5),(33,543,199,'18:05:11',5),(93,1272,89,'06:05:04',3),(73,770,920,'01:03:43',1),(5,1396,336,'05:28:09',1),(33,546,431,'14:20:26',2),(13,1755,347,'01:20:39',2),(79,1762,196,'04:16:39',4),(68,370,582,'19:51:21',5),(34,986,942,'20:59:36',4),(49,497,675,'15:45:02',4),(16,912,529,'18:42:06',1),(1,278,677,'14:41:12',4),(38,1568,12,'02:32:29',1),(8,1010,989,'21:36:53',3),(63,1724,979,'07:19:38',3),(81,74,302,'01:54:35',4),(98,509,323,'02:16:19',2),(37,872,29,'09:46:43',5),(3,727,960,'09:36:21',3),(74,312,898,'14:56:08',3),(38,1068,504,'19:13:29',3),(77,681,717,'01:28:14',4),(21,678,315,'09:46:15',2),(8,129,317,'23:36:15',4),(100,254,757,'22:20:34',2),(43,1510,853,'11:40:25',2),(20,1201,671,'19:14:00',4),(76,439,88,'07:49:38',5),(94,1039,983,'19:34:01',5),(37,641,803,'11:29:41',2),(75,236,489,'20:44:09',4);
GO

-- 3 Prémios
DBCC CHECKIDENT('TorrentTracker.Premio', RESEED, 1);
GO

INSERT INTO TorrentTracker.Premio ([Designacao],[Nome]) VALUES 
	('Membro considerado "Mobília da Casa" e com grande dedicação à Comunidade.','Trusted Member'),
	('Dedicação no auxílio à Comunidade.','Best Supporter'),
	('Membro com melhor desempenho geral em prol da Comunidade.','Most Wanted Member');
GO


-- TorrentTracker.UserAdministrativo
DBCC CHECKIDENT('TorrentTracker.UserAdministrativo', RESEED, 1);
GO

INSERT INTO TorrentTracker.UserAdministrativo([ID_User],[ImunidadeHitRun],[FreeleechTotal]) VALUES(1,1,1),(42,1,1),(65,1,1),(85,1,1),(98,1,1),(20,1,1),(82,1,1),(97,1,1),(16,1,1),(13,1,1);
GO


DBCC CHECKIDENT('TorrentTracker.PremioAtribuicao', RESEED, 1);
GO

INSERT INTO TorrentTracker.PremioAtribuicao([ID_DestinatarioPremio],[ID_Premio],[DataAtribuicao],[ID_RemetentePremio]) VALUES(7,'1','2017-03-10 14:36:07','10'),(35,'1','2021-02-10 17:53:32','3'),(31,'1','2016-08-28 15:58:09','1'),(64,'1','2021-01-15 22:33:20','8'),(86,'1','2018-06-02 10:00:59','1'),(36,'1','2019-02-06 19:22:42','6'),(78,'3','2018-12-21 18:45:43','4'),(56,'1','2020-09-28 07:00:57','7'),(17,'2','2019-10-12 09:43:10','1'),(20,'3','2017-01-08 13:54:25','3'),(100,'1','2019-08-31 22:19:02','5'),(56,'1','2022-03-02 17:44:16','2'),(58,'1','2021-08-13 16:55:50','4'),(92,'1','2016-09-30 14:44:04','5'),(14,'2','2020-02-08 11:04:15','5'),(25,'2','2017-07-15 01:47:55','9'),(96,'3','2018-02-10 23:16:50','1'),(88,'2','2021-10-04 01:59:14','10'),(55,'3','2017-09-01 14:40:30','1'),(80,'1','2016-09-08 02:44:47','5'),(95,'2','2018-01-17 03:11:30','9'),(41,'3','2017-08-08 18:47:02','6'),(51,'2','2019-01-22 04:29:27','6'),(79,'3','2016-06-05 16:15:16','1'),(94,'2','2017-11-12 12:57:41','5'),(17,'1','2016-11-15 02:49:59','9'),(87,'1','2019-03-20 03:00:28','8'),(15,'3','2020-06-28 21:20:05','3'),(71,'3','2018-05-22 11:34:01','1'),(12,'3','2020-03-18 03:26:15','10');
GO


-- TorrentTracker.Admin
INSERT INTO TorrentTracker.Admin ([ID_User],[ID_Administrativo]) VALUES (1,1);

-- Convite
DBCC CHECKIDENT('TorrentTracker.Convite', RESEED, 1);
GO

INSERT INTO TorrentTracker.Convite([ID_RemetenteConvite],[DestinatarioEMail],[DataEnvio],[ID_AdminRemetente],[ID_AdministrativoRemetente]) VALUES(96,NULL,'2022-03-28 00:55:02','1','1'),(15,NULL,'2021-03-05 04:38:06','1','1'),(76,NULL,'2022-02-11 14:15:22','1','1'),(65,NULL,'2018-04-12 06:50:23','1','1'),(96,'massa.Suspendisse@Utsagittislobortis.co.uk','2018-10-19 20:29:54','1','1'),(93,'risus.a@luctus.org','2021-12-11 22:33:33','1','1'),(36,'lectus.sit@Integer.edu','2017-11-20 21:40:09','1','1'),(54,'metus@necurna.com','2019-02-09 07:16:43','1','1'),(49,NULL,'2016-12-14 10:19:51','1','1'),(43,NULL,'2021-03-08 16:03:31','1','1'),(53,NULL,'2019-01-17 08:35:41','1','1'),(37,NULL,'2020-11-06 07:43:06','1','1'),(27,NULL,'2017-11-26 23:40:27','1','1'),(16,NULL,'2017-11-26 23:40:27','1','1'),(65,NULL,'2017-04-27 19:15:57','1','1'),(69,'Proin@Quisquelibero.net','2017-04-01 01:58:19','1','1'),(10,NULL,'2020-10-06 19:05:42','1','1'),(19,NULL,'2021-07-25 01:10:43','1','1'),(78,'et@semperdui.ca','2021-12-02 04:46:59','1','1'),(64,'rutrum.urna.nec@neceleifend.net','2016-11-27 16:11:27','1','1'),(77,'adipiscing.lobortis.risus@euismod.ca','2021-09-10 20:01:37','1','1'),(67,NULL,'2021-09-10 20:01:37','1','1'),(36,'a.arcu@porttitorinterdumSed.org','2019-08-05 23:37:55','1','1'),(74,'pulvinar.arcu@orci.com','2019-07-10 11:05:19','1','1'),(94,'molestie.pharetra.nibh@lobortisquam.edu','2017-10-24 00:12:36','1','1'),(98,'gravida.sagittis@idenim.net','2018-12-15 09:56:05','1','1'),(7,'enim.condimentum.eget@tellusfaucibusleo.org','2021-09-18 23:45:16','1','1'),(96,'gravida.non@Integer.org','2019-08-23 19:59:19','1','1'),(40,'quam.dignissim.pharetra@aaliquet.com','2018-05-13 12:50:25','1','1'),(94,'non.bibendum.sed@dui.co.uk','2017-01-17 19:45:10','1','1'),(36,'sit@Integereu.net','2021-09-24 13:53:35','1','1'),(99,'quis@habitantmorbi.com','2021-09-22 15:22:00','1','1'),(57,'dapibus.rutrum.justo@asollicitudinorci.ca','2021-11-25 01:35:21','1','1'),(82,'sed@in.com','2018-05-04 18:49:02','1','1'),(94,'posuere@lacinia.ca','2021-07-03 12:10:31','1','1'),(98,'ornare.facilisis@sociisnatoquepenatibus.net','2020-04-27 06:24:55','1','1'),(73,'nec.urna@montesnasceturridiculus.org','2020-04-11 21:57:59','1','1'),(89,'Morbi@libero.net','2020-06-20 22:58:49','1','1'),(84,'Integer.sem@auctorquis.org','2016-10-13 10:24:00','1','1'),(96,'varius@adipiscingligulaAenean.org','2021-01-05 19:31:51','1','1'),(85,'risus.varius@Vivamusnon.com','2022-03-03 19:11:14','1','1'),(32,'diam.luctus.lobortis@libero.co.uk','2018-06-29 17:32:06','1','1'),(43,'interdum.libero.dui@CuraeDonectincidunt.org','2019-07-04 03:04:54','1','1'),(67,'gravida.non@Inornaresagittis.co.uk','2017-05-03 12:57:06','1','1'),(3,'massa@erateget.org','2020-12-12 02:52:00','1','1'),(93,'egestas.ligula.Nullam@purusNullam.com','2019-05-26 18:42:00','1','1'),(45,'molestie.tellus.Aenean@dui.ca','2019-02-06 08:39:39','1','1'),(93,'molestie.arcu@tortor.co.uk','2020-04-17 02:18:23','1','1'),(42,'mollis.Integer@urna.co.uk','2018-10-15 07:42:37','1','1'),(70,'volutpat@eumetusIn.net','2021-05-10 12:34:49','1','1'),(69,'ipsum.porta.elit@Integertinciduntaliquam.co.uk','2016-09-12 16:17:01','1','1'),(83,'Maecenas@tinciduntcongueturpis.co.uk','2020-09-25 12:44:52','1','1'),(81,'metus@Loremipsum.co.uk','2018-09-05 13:45:41','1','1'),(24,'Etiam.gravida.molestie@egetmagna.org','2019-12-08 03:12:51','1','1'),(39,'nec.luctus.felis@eget.com','2018-04-08 14:22:03','1','1'),(86,'ante.dictum.cursus@netusetmalesuada.net','2021-04-05 04:59:51','1','1'),(12,'Fusce@a.org','2020-10-30 14:34:06','1','1'),(74,'nonummy@risus.org','2019-04-19 12:53:38','1','1'),(82,'Quisque.varius@dolor.ca','2018-04-03 09:29:20','1','1'),(54,'blandit.enim.consequat@magnaUttincidunt.edu','2019-12-07 17:00:24','1','1'),(52,'sem.semper.erat@necorci.edu','2016-10-07 12:02:49','1','1'),(23,'natoque@auctorvitae.net','2022-02-17 07:45:43','1','1'),(43,'cursus.diam@Morbisit.org','2021-10-29 06:16:56','1','1'),(15,'lacinia.Sed.congue@aenimSuspendisse.ca','2020-04-17 16:48:07','1','1'),(62,'eget@laciniavitae.org','2019-08-14 13:52:12','1','1'),(60,'dictum@Inscelerisque.net','2021-12-14 12:37:10','1','1'),(8,'orci.lobortis.augue@commodotinciduntnibh.ca','2019-12-10 09:30:10','1','1'),(83,'ac@sitamet.org','2016-06-28 03:12:53','1','1'),(1,'Aliquam.nisl@metuseuerat.ca','2018-09-15 11:09:07','1','1'),(26,'In@acrisus.net','2020-06-08 07:40:18','1','1'),(88,'arcu.eu.odio@mauriseuelit.com','2020-10-27 05:29:42','1','1'),(90,'eu@adlitora.com','2018-02-23 01:51:35','1','1'),(100,'lobortis.augue.scelerisque@Craseutellus.net','2016-07-17 12:55:30','1','1'),(37,'et.pede.Nunc@egetmagna.net','2021-02-10 22:03:51','1','1'),(35,'sagittis.placerat.Cras@augue.edu','2017-05-25 05:37:50','1','1'),(44,'Integer.mollis@nonlacinia.com','2016-08-05 00:53:24','1','1'),(20,'Cras@ametultriciessem.com','2017-08-30 01:28:05','1','1'),(97,'nibh.Donec@arcuSed.ca','2017-01-15 12:10:36','1','1'),(42,'amet@anteblanditviverra.org','2021-06-15 09:00:47','1','1'),(82,'vel.pede.blandit@laciniaorci.co.uk','2020-05-16 03:07:39','1','1'),(25,'risus.In@nectempus.net','2017-03-01 20:19:09','1','1'),(72,'tempus.scelerisque@sempertellus.edu','2017-02-08 18:52:08','1','1'),(57,'neque@sit.com','2019-10-06 23:38:22','1','1'),(58,'non@sitamet.co.uk','2017-04-11 01:07:52','1','1'),(6,'et.netus.et@tinciduntdui.net','2019-02-13 15:05:17','1','1'),(59,'dictum@Curabitur.org','2020-03-19 16:53:07','1','1'),(87,'Vivamus@lectusNullamsuscipit.net','2021-06-02 04:23:31','1','1'),(61,'adipiscing.elit@fringilla.com','2017-08-31 10:41:19','1','1'),(89,'massa@Aliquamnecenim.co.uk','2020-03-14 07:53:50','1','1'),(77,'pede.Praesent.eu@Nullamlobortisquam.co.uk','2018-07-03 10:51:48','1','1'),(92,'Sed.dictum@massaMaurisvestibulum.org','2019-06-03 07:39:56','1','1'),(90,'interdum@ametdiameu.co.uk','2018-11-25 23:49:59','1','1'),(65,'lorem@rhoncus.ca','2020-08-25 01:42:45','1','1'),(63,'felis@Donecelementumlorem.org','2021-07-24 03:13:19','1','1'),(23,'enim.nec@eratvel.net','2017-08-02 14:06:20','1','1'),(96,'elementum.dui@consequat.co.uk','2022-03-17 00:08:38','1','1'),(21,'turpis@ametmassa.com','2017-01-22 16:21:09','1','1'),(21,'lobortis.quis.pede@enimsit.ca','2017-01-08 16:49:46','1','1'),(8,'Nam.ligula.elit@feliseget.ca','2016-06-22 13:04:01','1','1'),(55,'porttitor.vulputate@variusultrices.com','2018-04-15 17:55:41','1','1'),(78,'tellus.Aenean.egestas@enimMaurisquis.com','2019-06-09 14:15:43','1','1'),(36,'dignissim.pharetra@dolorsitamet.co.uk','2017-04-14 19:43:42','1','1'),(73,'sed@luctuslobortisClass.com','2016-12-17 06:28:21','1','1'),(73,'Morbi@faucibusorciluctus.net','2018-12-31 05:25:08','1','1'),(4,'eu.turpis@orciUtsagittis.org','2021-02-17 17:05:21','1','1'),(10,'non.egestas@facilisiSedneque.org','2020-06-15 15:41:59','1','1'),(92,'ipsum@sagittisNullam.edu','2017-04-23 00:25:28','1','1'),(22,'rhoncus.Proin@erat.edu','2020-07-26 19:34:34','1','1'),(87,'per.conubia@tinciduntpede.ca','2017-03-13 17:04:11','1','1'),(25,'Sed@Proinvelnisl.co.uk','2020-12-13 15:22:40','1','1'),(57,'mauris.sagittis@arcu.org','2021-11-02 17:00:06','1','1'),(84,'tellus.Aenean.egestas@semegestas.com','2020-06-19 16:50:54','1','1'),(88,'et.netus.et@elitCurabitursed.co.uk','2021-01-12 23:39:23','1','1'),(24,'Aliquam.gravida@porttitorvulputateposuere.ca','2019-08-21 04:42:00','1','1'),(55,'velit.in@Nullam.org','2018-03-08 17:10:52','1','1'),(14,'Donec@Quisquenonummyipsum.com','2018-12-12 15:47:48','1','1'),(97,'Cras.dictum.ultricies@magnaatortor.net','2018-08-16 01:16:30','1','1'),(34,'eu@leo.org','2017-12-29 00:42:54','1','1'),(2,'rutrum.Fusce@Praesent.co.uk','2019-08-01 20:08:10','1','1'),(60,'orci.consectetuer.euismod@auctor.co.uk','2016-10-14 08:14:24','1','1'),(97,'Cras.dolor@atfringilla.net','2017-02-18 18:43:48','1','1'),(15,'sit.amet@mi.ca','2019-06-03 13:23:29','1','1'),(27,'lobortis@Nulla.net','2021-12-17 10:53:54','1','1'),(87,'pede.Cum@Nullatempor.org','2019-04-16 09:44:06','1','1'),(55,'at.iaculis.quis@acsem.edu','2016-07-25 20:22:13','1','1'),(20,'urna.et.arcu@egetvarius.org','2018-07-20 05:09:28','1','1'),(2,'eget@necmetus.ca','2017-08-01 23:39:18','1','1'),(60,'metus@molestiepharetra.org','2017-09-24 19:04:44','1','1'),(13,'vulputate.eu@elit.net','2018-05-02 07:27:24','1','1'),(77,'id@enimEtiam.ca','2017-08-09 16:16:33','1','1'),(2,'fringilla.cursus.purus@cubiliaCuraePhasellus.co.uk','2016-11-06 05:33:29','1','1'),(75,'semper.et@molestiearcuSed.edu','2017-02-19 16:42:24','1','1'),(38,'sit.amet@urna.co.uk','2017-04-26 04:37:31','1','1'),(69,'at.pretium.aliquet@seddolor.org','2021-05-07 04:19:10','1','1'),(12,'Proin.ultrices@egestasrhoncusProin.org','2019-11-23 14:47:43','1','1'),(75,'ornare.lectus.ante@pretiumaliquet.com','2020-04-04 15:28:09','1','1'),(41,'Nullam.lobortis@famesacturpis.org','2022-02-12 22:59:11','1','1'),(26,'Donec.dignissim@egetipsumSuspendisse.edu','2019-02-04 03:02:42','1','1'),(30,'molestie.sodales.Mauris@eratvolutpat.com','2017-03-01 13:49:34','1','1'),(57,'sem.egestas@Nuncsedorci.co.uk','2019-09-21 07:54:09','1','1'),(99,'sapien.gravida.non@ultricesmauris.net','2019-02-10 01:40:44','1','1'),(86,'at.risus@pedeCras.co.uk','2017-03-08 07:52:01','1','1'),(21,'nonummy.Fusce.fermentum@Nulla.edu','2017-08-02 13:33:51','1','1'),(75,'semper.rutrum.Fusce@natoquepenatibuset.com','2020-08-28 03:49:00','1','1'),(86,'magna.Sed.eu@ornaretortor.net','2019-09-30 16:13:08','1','1'),(47,'molestie@euismodenimEtiam.com','2019-02-20 22:03:17','1','1'),(88,'ligula.Aenean.gravida@orci.ca','2019-01-27 14:05:18','1','1'),(83,'sit@faucibusleoin.net','2018-03-09 13:45:15','1','1'),(58,'Vivamus.sit@nonlobortis.edu','2016-08-27 19:40:35','1','1'),(86,'erat@conubia.com','2019-09-14 01:16:39','1','1'),(36,'arcu@tellus.ca','2021-03-29 06:49:24','1','1'),(53,'non.egestas.a@velitCras.co.uk','2016-11-17 01:27:12','1','1'),(31,'mauris.sagittis@ante.ca','2019-02-26 12:47:02','1','1'),(25,'Phasellus.fermentum.convallis@Duismienim.org','2016-09-15 20:10:48','1','1'),(25,'ipsum.Suspendisse.sagittis@sitametrisus.co.uk','2018-08-03 05:59:12','1','1'),(90,'sit.amet@dolor.edu','2021-07-29 19:19:20','1','1'),(12,'Nunc.ac@mitemporlorem.org','2019-12-30 22:47:29','1','1'),(14,'laoreet@Crasvehiculaaliquet.co.uk','2018-12-04 07:44:27','1','1'),(16,'pellentesque.eget.dictum@Duis.co.uk','2017-01-27 18:18:31','1','1'),(27,'Curae.Donec@diam.net','2018-09-19 19:25:30','1','1'),(4,'enim.nisl@at.ca','2019-09-17 07:37:30','1','1'),(91,'et.netus.et@semmolestiesodales.net','2018-09-17 13:23:53','1','1'),(18,'turpis@auctorvitae.co.uk','2019-11-02 04:20:00','1','1'),(40,'magnis@Nulla.org','2021-05-20 14:55:35','1','1'),(11,'cursus.vestibulum.Mauris@loremac.org','2016-09-29 06:20:22','1','1'),(3,'nulla@nibh.edu','2019-05-14 23:39:41','1','1'),(36,'facilisis@amet.edu','2017-10-28 05:07:22','1','1'),(78,'Nulla.dignissim.Maecenas@felis.edu','2018-06-29 10:06:49','1','1'),(1,'Donec@commodoipsumSuspendisse.net','2016-09-22 00:24:14','1','1'),(57,'ac@etnuncQuisque.ca','2020-06-13 16:54:38','1','1'),(8,'lorem.vitae@Integer.com','2017-04-23 08:49:50','1','1'),(20,'suscipit@Suspendisseacmetus.ca','2020-01-16 05:43:06','1','1'),(83,'elit.elit@vulputaterisus.co.uk','2018-03-30 18:01:08','1','1'),(13,'a.facilisis@eu.co.uk','2018-07-23 22:48:40','1','1'),(71,'per@eu.ca','2020-05-13 13:22:43','1','1'),(21,'mauris.a.nunc@inhendreritconsectetuer.org','2021-02-06 00:41:04','1','1'),(84,'elit.elit@ac.org','2018-09-09 01:09:42','1','1'),(21,'vel@eu.ca','2020-11-24 10:06:30','1','1'),(69,'orci.tincidunt@utlacus.edu','2020-12-31 12:47:01','1','1'),(79,'vulputate@nisinibhlacinia.org','2017-09-23 07:04:16','1','1'),(92,'pretium.et.rutrum@euturpisNulla.ca','2017-03-14 08:59:22','1','1'),(38,'dui@nequenonquam.com','2019-08-30 04:42:01','1','1'),(88,'nonummy@egestasascelerisque.net','2021-06-24 05:33:56','1','1'),(46,'lacus.Quisque.imperdiet@ante.com','2020-01-12 01:10:53','1','1'),(33,'vel@Donecegestas.org','2019-05-23 10:06:03','1','1'),(2,'magna@cursusaenim.ca','2019-05-16 11:29:07','1','1'),(5,'Curae.Donec.tincidunt@ac.ca','2021-09-11 21:54:51','1','1'),(67,'ligula.consectetuer.rhoncus@Etiamimperdietdictum.ca','2020-05-29 10:21:09','1','1'),(57,'et.lacinia@habitantmorbitristique.edu','2021-12-20 14:23:02','1','1'),(50,'Nam.porttitor@amagnaLorem.edu','2016-09-28 05:12:27','1','1'),(75,'libero.mauris.aliquam@dapibus.co.uk','2017-08-12 03:47:39','1','1'),(72,'vitae@euodioPhasellus.edu','2018-05-18 18:13:30','1','1'),(62,'pellentesque.a.facilisis@felisegetvarius.ca','2016-07-18 21:28:47','1','1'),(39,'in.consectetuer.ipsum@eliterat.org','2019-03-29 10:48:45','1','1'),(10,'at.nisi@ornare.ca','2019-05-22 00:56:31','1','1'),(56,'mauris@congue.com','2019-02-08 01:49:21','1','1'),(12,'amet@magnis.co.uk','2019-03-28 18:49:43','1','1'),(40,'nulla.Cras.eu@necleoMorbi.ca','2018-04-19 04:26:14','1','1'),(73,'enim.commodo.hendrerit@velvenenatisvel.net','2018-05-21 02:27:00','1','1'),(42,'Duis.volutpat.nunc@Pellentesque.ca','2019-09-29 04:48:54','1','1');
GO

-- 20 Avisos
DBCC CHECKIDENT('TorrentTracker.Aviso', RESEED, 1);
GO

INSERT INTO TorrentTracker.Aviso ([ID_DestinatarioAviso]) VALUES (90),(24),(6),(20),(74),(14),(36),(97),(38),(83),(85),(77),(31),(63),(27),(100),(66),(7),(83),(22);
GO

-- 10 avisos
INSERT INTO TorrentTracker.AvisoPermanente ([ID_Aviso]) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
GO

-- 10 avisos
INSERT INTO TorrentTracker.AvisoTemporario ([DataHoraLimite],[ID_Aviso]) VALUES ('2021-01-01 13:30:31',11),('2021-09-14 20:33:22',12),('2022-02-03 07:28:04',13),('2021-12-28 22:17:18',14),('2020-08-07 04:06:53',15),('2020-06-21 03:52:25',16),('2020-08-05 08:25:23',17),('2022-01-26 18:25:35',18),('2022-01-27 17:25:45',19),('2022-02-20 18:21:45',20);
GO
-- 10 avsisos
INSERT INTO TorrentTracker.AvisoHitAndRun ([ID_Aviso]) VALUES (1),(18),(3),(4),(14),(6),(7),(8),(9),(11);
GO
-- 10 avisos
INSERT INTO TorrentTracker.NukedTorrent ([ID_Aviso]) VALUES (10),(12),(13),(5),(15),(16),(17),(2),(19),(20);
GO

-- 20 Utilizadores
INSERT INTO TorrentTracker.UtilizadorVip([ID_User],[ImunidadeHitRun],[FreeleechTotal],[EMailPagamento],[DataHoraPagamento]) VALUES
(79,1,1,'nunc.ullamcorper.eu@eget.co.uk','2019-02-28 22:22:00'),(40,1,1,'scelerisque.sed@augue.org','2017-12-20 07:37:18'),
(72,1,1,'mi@leoelementum.edu','2017-11-18 18:42:28'),(14,1,1,'scelerisque@risusIn.net','2017-06-20 01:54:15'),
(75,1,1,'sed.leo.Cras@suscipitestac.org','2019-07-01 01:20:45'),(19,1,1,'ornare.facilisis@sociis.org','2017-08-26 04:25:17'),
(95,1,1,'est@Etiamligulatortor.edu','2017-06-30 23:08:55'),(4,1,1,'egestas@Praesenteudui.ca','2022-02-08 19:40:18'),
(85,1,1,'egestas.a@orciUt.net','2018-12-21 09:32:33'),(69,1,1,'Curabitur.sed.tortor@metus.co.uk','2018-09-15 02:28:48'),
(45,1,1,'Suspendisse@faucibus.ca','2021-07-27 04:27:49'),(68,1,1,'metus@mattis.co.uk','2020-11-07 15:06:38'),
(87,1,1,'quam.vel@urna.org','2019-01-11 15:40:12'),(21,1,1,'amet.ante.Vivamus@etultrices.co.uk','2018-11-25 13:39:41'),
(57,1,1,'laoreet.lectus.quis@luctuset.net','2018-05-31 03:41:58'),(20,1,1,'metus@sapienimperdietornare.edu','2018-09-12 12:56:09'),
(74,1,1,'sagittis.placerat.Cras@Donectempuslorem.net','2020-08-28 05:36:46'),(82,1,1,'mi@CrasinterdumNunc.net','2018-12-10 16:29:36'),
(6,1,1,'molestie.arcu@faucibusorciluctus.net','2019-07-21 13:13:41'),(71,1,1,'ultrices@Curabitur.ca','2020-01-17 02:04:27');
GO


-- 4 Planos
DBCC CHECKIDENT('TorrentTracker.PlanosDoacaoSubscricoes', RESEED, 1);
GO

INSERT INTO TorrentTracker.PlanosDoacaoSubscricoes ([LimiteTempoPlano],[DescricaoPlano],[PrecoPlano],[Nome],[GB_Upload]) VALUES 
	(15,'25 GB Upload, Freeleech Global, Imunidade a Hit&Run, Nome Destacado',5,'VIP 1',25),
	(30,'100 GB Upload, Freeleech Global, Imunidade a Hit&Run, Desativar Avisos Hit&Run, Nome Destacado',10,'VIP 2',100),
	(180,'750 GB Upload, Freeleech Global, Imunidade a Hit&Run, Desativar Avisos Hit&Run, Nome Destacado',50,'VIP 3',750),
	(365,'2000 GB Upload, Freeleech Global, Imunidade a Hit&Run, Desativar Avisos Hit&Run, Nome Destacado',100,'VIP 4',2000);
GO

-- 20 Compras
--DELETE FROM TorrentTracker.Compra;

DBCC CHECKIDENT('TorrentTracker.Compra', RESEED, 1);
GO

INSERT INTO TorrentTracker.Compra([ID_Comprador],[ID_Plano],[DataHoraCompra],[DataHoraTermino]) VALUES(79,2,'2020-09-26 19:03:26',NULL),(79,2,'2020-10-27 09:49:51',NULL),(79,4,'2020-11-24 09:37:11',NULL),(79,4,'2019-05-17 12:23:16',NULL),(79,1,'2020-11-19 18:37:29',NULL),(79,2,'2019-11-21 07:28:14',NULL),(79,2,'2018-08-15 15:00:09',NULL),(79,4,'2017-06-30 01:40:09',NULL),(79,2,'2022-03-24 02:12:01',NULL),(79,3,'2019-09-07 03:39:31',NULL),(79,4,'2021-09-28 15:29:39',NULL),(79,4,'2020-06-23 15:01:44',NULL),(79,3,'2022-01-06 15:15:08',NULL),(79,2,'2020-02-07 05:06:20',NULL),(79,3,'2022-04-28 09:23:15',NULL),(79,2,'2019-12-09 04:14:15',NULL),(79,2,'2020-05-22 00:59:42',NULL),(79,4,'2019-12-29 08:56:57',NULL),(79,1,'2020-11-20 09:15:18',NULL),(79,3,'2020-07-29 21:03:13',NULL);
GO

BEGIN
	DECLARE @id_user INT;
	DECLARE @cont INT = 1;

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT ID_User
		FROM TorrentTracker.UtilizadorVip;

	OPEN C;

	FETCH C INTO @id_user;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE TorrentTracker.Compra 
		SET ID_Comprador = @id_user
		WHERE ID_Compra = @cont;

		FETCH C INTO @id_user;
		SET @cont = @cont +1;
	END;

	CLOSE C;

	DEALLOCATE C;

	PRINT 'TorrentTracker.Compra - DONE';

END
GO

BEGIN
	DECLARE @data_compra SMALLDATETIME;
	DECLARE @dias INT;
	DECLARE @cont INT = 1;

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT DataHoraCompra, LimiteTempoPlano
		FROM (TorrentTracker.Compra JOIN TorrentTracker.PlanosDoacaoSubscricoes ON Compra.ID_Plano=PlanosDoacaoSubscricoes.ID);

	OPEN C;

	FETCH C INTO @data_compra, @dias;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE TorrentTracker.Compra 
		SET DataHoraTermino = DATEADD(DAY, @dias, @data_compra)
		WHERE ID_Compra = @cont;

		FETCH C INTO @data_compra, @dias;
		SET @cont = @cont +1;
	END;

	CLOSE C;

	DEALLOCATE C;

	PRINT 'TorrentTracker.Compra - DONE';

END
GO


-- TorrentTracker.Staff

BEGIN
	DECLARE @id_staff INT, @id_administrativo INT;

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT ID_User, ID_Administrativo
		FROM TorrentTracker.UserAdministrativo
		WHERE UserAdministrativo.ID_User NOT IN (SELECT ID_User FROM TorrentTracker.Admin);

	OPEN C;

	FETCH C INTO @id_staff, @id_administrativo;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO TorrentTracker.Staff ([ID_User],[ID_Administrativo]) VALUES (@id_staff, @id_administrativo);
		FETCH C INTO @id_staff, @id_administrativo;
	END;

	CLOSE C;

	DEALLOCATE C;

	PRINT 'TorrentTracker.Staff - DONE';

END
GO


-- Cifragem de Passwords - Inserir na BD
BEGIN
	DECLARE @user_password VARCHAR(500);
	DECLARE @cont INT = 1;

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT UserPassword
		FROM TorrentTracker.Utilizador;

	OPEN C;

	FETCH C INTO @user_password;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE TorrentTracker.Utilizador 
		SET UserPassword = HASHBYTES('SHA2_256', @user_password)
		WHERE ID_User = @cont;

		FETCH C INTO @user_password;
		SET @cont = @cont +1;
	END;
	CLOSE C;
	DEALLOCATE C;
	PRINT 'TorrentTracker.Utilziador Password Encriptada  - DONE';
END
GO





