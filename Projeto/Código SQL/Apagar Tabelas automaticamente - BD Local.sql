USE [TorrentTracker]
GO
/****** Object:  StoredProcedure [TorrentTracker].[INSERT_CONTENT_TORRENT_NFO]    Script Date: 15/06/2021 21:03:56 ******/
DROP PROCEDURE [TorrentTracker].[INSERT_CONTENT_TORRENT_NFO]
GO
/****** Object:  StoredProcedure [TorrentTracker].[INSERT_CONTENT_TORRENT_DESCRICAO_HTML]    Script Date: 15/06/2021 21:03:56 ******/
DROP PROCEDURE [TorrentTracker].[INSERT_CONTENT_TORRENT_DESCRICAO_HTML]
GO
ALTER TABLE [TorrentTracker].[UtilizadorVip] DROP CONSTRAINT [FK_UtilizadoVIP_Utilizador_ID_User_ID_User]
GO
ALTER TABLE [TorrentTracker].[Utilizador] DROP CONSTRAINT [FK_Utilizador_TrackerComunidade_ID_TrackerComunidade_ID]
GO
ALTER TABLE [TorrentTracker].[UserAdministrativo] DROP CONSTRAINT [FK_UserAdministrativo_Utilizador_ID_User_ID_User]
GO
ALTER TABLE [TorrentTracker].[Uploader] DROP CONSTRAINT [FK_Uploader_Utilizador_ID_User_ID_User]
GO
ALTER TABLE [TorrentTracker].[TorrentAtivo] DROP CONSTRAINT [FK_TorrentAtivo_Utilizador_ID_TorrentAtivo_ID_User]
GO
ALTER TABLE [TorrentTracker].[TorrentAtivo] DROP CONSTRAINT [FK_TorrentAtivo_ContentTorrent_ID_ContentTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[Staff] DROP CONSTRAINT [FK_Staff_UserAdministrativo_ID_User_ID_User]
GO
ALTER TABLE [TorrentTracker].[Staff] DROP CONSTRAINT [FK_Staff_UserAdministrativo_ID_Adminstrativo_ID_Administrativo]
GO
ALTER TABLE [TorrentTracker].[PremioAtribuicao] DROP CONSTRAINT [FK_PremioAtribuicao_Utilizador_ID_DestinatarioPremio_ID_User]
GO
ALTER TABLE [TorrentTracker].[PremioAtribuicao] DROP CONSTRAINT [FK_PremioAtribuicao_UserAdministrativo_ID_RemetentePremio_ID_User]
GO
ALTER TABLE [TorrentTracker].[PremioAtribuicao] DROP CONSTRAINT [FK_PremioAtribuicao_Premio_ID_Premio_ID_Premio]
GO
ALTER TABLE [TorrentTracker].[NukedTorrent] DROP CONSTRAINT [FK_AvisoNukedTorrent_Aviso_ID_Aviso_ID]
GO
ALTER TABLE [TorrentTracker].[Convite] DROP CONSTRAINT [FK_ConviteD_Admin_ID_AdministrativoRemetente_ID_Administrativo]
GO
ALTER TABLE [TorrentTracker].[Convite] DROP CONSTRAINT [FK_Convite_Utilizador_ID_RemetenteConvite_ID_User]
GO
ALTER TABLE [TorrentTracker].[Convite] DROP CONSTRAINT [FK_Convite_Admin_ID_AdminRemetente_ID_User]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentSeries] DROP CONSTRAINT [FK_ContentTorrentSeries_CategoriasInfoAutoDownload_ID_TT_IMDB_ID_TT_IMDB]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentSeries] DROP CONSTRAINT [FK_ContentTorrentSeries_CategoriasInfoAutoDownload_ID_ContentTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentProgram] DROP CONSTRAINT [FK_ContentTorrentProgram_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentMovies] DROP CONSTRAINT [FK_ContentTorrentMovies_CategoriasInfoAutoDownload_ID_TT_IMDB_ID_TT_IMDB]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentMovies] DROP CONSTRAINT [FK_ContentTorrentMovies_CategoriasInfoAutoDownload_ID_ContentTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[ContentTorrentGame] DROP CONSTRAINT [FK_ContentTorrentGame_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[ContentTorrent] DROP CONSTRAINT [FK_ContentTorrent_Uploader_ID_UserUploader_ID_User]
GO
ALTER TABLE [TorrentTracker].[ContentTorrent] DROP CONSTRAINT [FK_ContentTorrent_TrackerComunidade_ID_TrackerComunidade_ID]
GO
ALTER TABLE [TorrentTracker].[Compra] DROP CONSTRAINT [FK_Compra_UtilizadorVIP_ID_Comprador_ID_User]
GO
ALTER TABLE [TorrentTracker].[Compra] DROP CONSTRAINT [FK_Compra_PlanosDoacaoSubscricoes_ID_Plano_ID]
GO
ALTER TABLE [TorrentTracker].[Comentario] DROP CONSTRAINT [FK_Comentario_ContentTorrent_ID_ContentTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[CategoriasInfoAutoDownload] DROP CONSTRAINT [FK_CategoriasInfoAutoDownload_ContentTorrent_ID_ContenTorrent_ID_ContentTorrent]
GO
ALTER TABLE [TorrentTracker].[AvisoTemporario] DROP CONSTRAINT [FK_AvisoTemporario_Aviso_ID_Aviso_ID]
GO
ALTER TABLE [TorrentTracker].[AvisoPermanente] DROP CONSTRAINT [FK_AvisoPermanente_Aviso_ID_Aviso_ID]
GO
ALTER TABLE [TorrentTracker].[AvisoHitAndRun] DROP CONSTRAINT [FK_AvisoHitAndRun_Aviso_ID_Aviso_ID]
GO
ALTER TABLE [TorrentTracker].[Aviso] DROP CONSTRAINT [FK_Aviso_Utilizador_ID_DestinatarioAviso_ID_User]
GO
ALTER TABLE [TorrentTracker].[Admin] DROP CONSTRAINT [FK_Admin_UserAdministrativo_ID_User_ID_User]
GO
ALTER TABLE [TorrentTracker].[Admin] DROP CONSTRAINT [FK_Admin_UserAdministrativo_ID_Adminstrativo_ID_Administrativo]
GO
/****** Object:  Table [TorrentTracker].[UtilizadorVip]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[UtilizadorVip]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[UtilizadorVip]
GO
/****** Object:  Table [TorrentTracker].[Utilizador]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Utilizador]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Utilizador]
GO
/****** Object:  Table [TorrentTracker].[UserAdministrativo]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[UserAdministrativo]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[UserAdministrativo]
GO
/****** Object:  Table [TorrentTracker].[Uploader]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Uploader]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Uploader]
GO
/****** Object:  Table [TorrentTracker].[TrackerComunidade]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[TrackerComunidade]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[TrackerComunidade]
GO
/****** Object:  Table [TorrentTracker].[TorrentAtivo]    Script Date: 15/06/2021 21:03:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[TorrentAtivo]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[TorrentAtivo]
GO
/****** Object:  Table [TorrentTracker].[Staff]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Staff]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Staff]
GO
/****** Object:  Table [TorrentTracker].[PremioAtribuicao]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[PremioAtribuicao]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[PremioAtribuicao]
GO
/****** Object:  Table [TorrentTracker].[Premio]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Premio]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Premio]
GO
/****** Object:  Table [TorrentTracker].[PlanosDoacaoSubscricoes]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[PlanosDoacaoSubscricoes]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[PlanosDoacaoSubscricoes]
GO
/****** Object:  Table [TorrentTracker].[NukedTorrent]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[NukedTorrent]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[NukedTorrent]
GO
/****** Object:  Table [TorrentTracker].[Convite]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Convite]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Convite]
GO
/****** Object:  Table [TorrentTracker].[ContentTorrentSeries]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[ContentTorrentSeries]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[ContentTorrentSeries]
GO
/****** Object:  Table [TorrentTracker].[ContentTorrentProgram]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[ContentTorrentProgram]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[ContentTorrentProgram]
GO
/****** Object:  Table [TorrentTracker].[ContentTorrentMovies]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[ContentTorrentMovies]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[ContentTorrentMovies]
GO
/****** Object:  Table [TorrentTracker].[ContentTorrentGame]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[ContentTorrentGame]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[ContentTorrentGame]
GO
/****** Object:  Table [TorrentTracker].[ContentTorrent]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[ContentTorrent]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[ContentTorrent]
GO
/****** Object:  Table [TorrentTracker].[Compra]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Compra]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Compra]
GO
/****** Object:  Table [TorrentTracker].[Comentario]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Comentario]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Comentario]
GO
/****** Object:  Table [TorrentTracker].[CategoriasInfoAutoDownload]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[CategoriasInfoAutoDownload]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[CategoriasInfoAutoDownload]
GO
/****** Object:  Table [TorrentTracker].[AvisoTemporario]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[AvisoTemporario]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[AvisoTemporario]
GO
/****** Object:  Table [TorrentTracker].[AvisoPermanente]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[AvisoPermanente]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[AvisoPermanente]
GO
/****** Object:  Table [TorrentTracker].[AvisoHitAndRun]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[AvisoHitAndRun]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[AvisoHitAndRun]
GO
/****** Object:  Table [TorrentTracker].[Aviso]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Aviso]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Aviso]
GO
/****** Object:  Table [TorrentTracker].[Admin]    Script Date: 15/06/2021 21:03:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TorrentTracker].[Admin]') AND type in (N'U'))
DROP TABLE [TorrentTracker].[Admin]
GO
/****** Object:  UserDefinedDataType [TorrentTracker].[OS]    Script Date: 15/06/2021 21:03:57 ******/
DROP TYPE [TorrentTracker].[OS]
GO
/****** Object:  UserDefinedDataType [TorrentTracker].[NOME]    Script Date: 15/06/2021 21:03:57 ******/
DROP TYPE [TorrentTracker].[NOME]
GO
/****** Object:  UserDefinedDataType [TorrentTracker].[LINK]    Script Date: 15/06/2021 21:03:57 ******/
DROP TYPE [TorrentTracker].[LINK]
GO
/****** Object:  UserDefinedDataType [TorrentTracker].[ID_NULL]    Script Date: 15/06/2021 21:03:57 ******/
DROP TYPE [TorrentTracker].[ID_NULL]
GO
/****** Object:  UserDefinedDataType [TorrentTracker].[ID]    Script Date: 15/06/2021 21:03:58 ******/
DROP TYPE [TorrentTracker].[ID]
GO
/****** Object:  Schema [TorrentTracker]    Script Date: 15/06/2021 21:03:58 ******/
DROP SCHEMA [TorrentTracker]
GO
