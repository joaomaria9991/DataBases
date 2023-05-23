



CREATE PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO (@Id_ContentTorrent INT, @nfo NVARCHAR(MAX))
AS 
	BEGIN
		UPDATE TorrentTracker.ContentTorrent 
		SET NFO = @nfo
		WHERE ID_ContentTorrent = @Id_ContentTorrent;
	END;

	PRINT 'TorrentTracker.ContentTorrent NFO UPDATE - DONE';
GO

CREATE PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML (@Id_ContentTorrent INT, @DescricaoHTML NVARCHAR(MAX))
AS 
	BEGIN
		UPDATE TorrentTracker.ContentTorrent 
		SET Descricao = @DescricaoHTML
		WHERE ID_ContentTorrent = @Id_ContentTorrent;
	END;

	PRINT 'TorrentTracker.ContentTorrent Descricao UPDATE - DONE';
GO


DECLARE @intput NVARCHAR(MAX) = '<br>
<br>
<br>
<span style="font-size: x-large;" original-title=""><strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span></strong></span>
<strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span></strong>
<span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span>
<em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em>
<span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span>
<em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em>
<span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span>
<strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span></strong>
<span style="font-size: x-large;" original-title=""><strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">Minecraft.Dungeons-CODEX</span></em></span></strong></span>
<br>
<br>
<img src="http://btnext.org/BTNextTeam/cover.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="https://i.imgur.com/xfJrqBH.jpg" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/info.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="https://btnext.org/nfo/NFO/11a46e9b1c25561c198h14.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
System Requirements (Minimum)

<ul>
<li>CPU: Core i5 2.8GHz or equivalent</li>
<li>RAM: 8 GB</li>
<li>OS: Windows 10, 8 or 7 (64-bit with the latest updates; some functionality not supported on Windows 7 and 8)</li>
<li>VIDEO CARD: NVIDIA GeForce GTX 660 or AMD Radeon HD 7870 or equivalent DX11 GPU</li>
<li>PIXEL SHADER: 5.0</li>
<li>VERTEX SHADER: 5.0</li>
<li>FREE DISK SPACE: 6 GB</li>
<li>DEDICATED VIDEO RAM: 2048 MB</li>
</ul>
<li>CPU: Core i5 2.8GHz or equivalent</li>
<li>RAM: 8 GB</li>
<li>OS: Windows 10, 8 or 7 (64-bit with the latest updates; some functionality not supported on Windows 7 and 8)</li>
OS: Windows 10, 8 or 7 (64-bit with the latest updates; some functionality not supported on Windows 7 and 8)
<li>OS: Windows 10, 8 or 7 (64-bit with the latest updates; some functionality not supported on Windows 7 and 8)</li>
<li>VIDEO CARD: NVIDIA GeForce GTX 660 or AMD Radeon HD 7870 or equivalent DX11 GPU</li>
<li>PIXEL SHADER: 5.0</li>
<li>VERTEX SHADER: 5.0</li>
<li>FREE DISK SPACE: 6 GB</li>
<li>DEDICATED VIDEO RAM: 2048 MB</li>
<ul>
<li>CPU: Core i5 2.8GHz or equivalent</li>
<li>RAM: 8 GB</li>
<li>OS: Windows 10, 8 or 7 (64-bit with the latest updates; some functionality not supported on Windows 7 and 8)</li>
<li>VIDEO CARD: NVIDIA GeForce GTX 660 or AMD Radeon HD 7870 or equivalent DX11 GPU</li>
<li>PIXEL SHADER: 5.0</li>
<li>VERTEX SHADER: 5.0</li>
<li>FREE DISK SPACE: 6 GB</li>
<li>DEDICATED VIDEO RAM: 2048 MB</li>
</ul>
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.sinopse.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
Fight your way through an all-new action-adventure game, inspired by classic dungeon crawlers and set in the Minecraft universe! Brave the dungeons alone, or team up with friends! Up to four players can battle together through action-packed, treasure-stuffed, wildly varied levels – all in an epic quest to save the villagers and take down the evil Arch-Illager! Discover a trove of powerful new weapons and items that will help you defeat ruthless swarms of new-and-nasty mobs. Fight or flee through canyons, swamps and – of course – mines! Any adventurer brave or foolish enough to explore this blocky and beautiful world will need to come prepared. So quickly, gear up! Dungeon Creeper! Battle new-and-nasty mobs in this all-new action-adventure, inspired by classic dungeon crawlers. Multiplayer! Up to four players can team up and fight together in co-op mode. Power Up! Unlock dozens of unique items and weapon enchantments for devastating special attacks.
<br>
<img src="http://btnext.org/BTNextTeam/banner.trailer.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<object width="500" height="314"><param name="movie" value="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><param name="wmode" value="transparent"><embed src="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></object>
<param name="movie" value="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent">
<param name="allowFullScreen" value="true">
<param name="allowscriptaccess" value="always">
<param name="wmode" value="transparent">
<embed src="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent">
<div pseudo="-webkit-plugin-replacement"><iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe></div>
<div pseudo="-webkit-plugin-replacement"><iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe></div>
<iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe>
<div pseudo="-webkit-plugin-replacement"><iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe></div>
<embed src="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent">
<object width="500" height="314"><param name="movie" value="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><param name="wmode" value="transparent"><embed src="http://www.youtube.com/v/rJ0jMN1iJqg?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></object>
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.semear.final.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.iloveyou.pequeno.png" alt="" original-title="" rel="resized_by_tsue">
<br>';

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML 1, @input;


SET @intput  = "
                                 ▄▄▄▄▄▄▄    ▄▄▄                   ▄▄
            ▄████▄      ▄████▄ ▓██████████ ▓████▓▄              ▓███▓
           ███▓███▓    ████████ ▓██▓███████ ▓██████▓▄          ▓███▓  ▀
      ▄   ███▓ ▀███▓  ███▓▀ ▓███ ███▓  ▀▓███ ███▓████▓▄▄      ▓███▓  ▄█
      ▓  ▓███   ▓████ ███    ███ ███     ███▓███  ▓███▓█▓    ▓███▓  ██ 
         ███▓     ▀▀ ███      ███▓██      ███▓██     ▓███▓ ▄▓███▓  ██▓
       █ ███         ███      ███▓██      ███▓████▓   ▓███▓▓███▓ ▓██▓
      ▓█ ███         ███      ███▓██      ███▓███▓     ▓██████▓ ▓███
      █▓ ███         ███▓    ▓███▓██     ▓███▓██        ▓████▓  ▓████▓
    ▓██  ▓███     ▄██▓███    ███ ███    ▄███▓███   ▓██▄▓██████▓  ▓████▓
   ▓██▓   ████▄ ▓███▓ ▓███ ▄███▓ ███▓ ▄▓███ █████ ▓███▓███▓▓███▓  ▓█████▓
   ▓██    ▓████████▓  ▓████████▓ █████████  ▓████████▓███▓▀ ▓███▓   █████▓
    ███▓   ███████▓ ▄  ▓██████▓  ▓███████    ███████▓███▓    ▓███▓   ████▓
    ▓████▓  █████▓  ▓█  ▓████▓   ▓██████  █▓  █████▓███▓   █  ▓███▓   ███▓
     ▓████▓  ▀██▓  ▓███  ▀██▀  █  ▓███▀  ▓██▓  ▀██▓███▓   ██▓  ▓███▓ ████▓
      ▓█████▓▄   ▄▓█████▓▄  ▄▓███▄    ▄▓██████▓▄       ▄▓████▓▄     ▄███▓
       ▓█████████████▓████████████████████▓████████████████████████████▓
        ▀▓███████████████████████████████████████████████████████████▓▀
          ▄█▓███████▀▀██████▓▄ ▀▓▀▀         ▀▀▓▀ ▄▓██████▀▀███████▓█▄
         ▓▀  ▓█▀▀▀      ▀▀███▓     C O D E X     ▓███▀▀      ▀▀▀█▓  ▀▓
          ▀ ▓█▄  ▄      ▄ ▄▓▀   P R E S E N T S   ▀▓▄ ▄      ▄  ▄█▓ ▀
            ▀███▀        ▀▀    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄    ▀▀        ▀███▀

		  
                     Minecraft Dungeons (c) Mojang Studios                      

						 
     Release Date :  01/2021              Protection : XboxLive+Auth+Themida         
     Discs        :  1                    Genre      : Action                        

  ▄██▄                                                                   ▄██▄
 ▓▀▀███▓   ▄▄     █▀█ █▀▀ █   █▀▀ █▀█ █▀▀ █▀▀   █ █▀█ █▀▀ █▀█     ▄▄   ▓███▀▀▓
 ▀▄  ▀██▓ ▀ ▀█  ▄ ▓▀▄ ▓▀  ▓   ▓▀  ▓▀▓ ▀▀▓ ▓▀    ▓ ▓ ▓ ▓▀  ▓ ▓ ▄  █▀ ▀ ▓██▀  ▄▀
      ███▓▄ ▄██▄▓ ▀ ▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀ ▀ ▀▀▀ ▀▀▀   ▀ ▀ ▀ ▀   ▀▀▀ ▓▄██▄ ▄▓███
    ▄█▓███████▀▀██████▓▄  ▄██▀█▄▄  ▀▄▄   ▄▄▀  ▄▄█▀██▄  ▄▓██████▀▀███████▓█▄
   █▀ ▄██▀▀▀      ▀▀███▓  ██▄  ▀▀▓█▄ ██ ██ ▄█▓▀▀  ▄██  ▓███▀▀      ▀▀▀██▄ ▀█
    ▀ ██▄  ▄      ▄ ▄█▀    ▀█▀     ▀██▀ ▀██▀     ▀█▀    ▀█▄ ▄      ▄  ▄██ ▀
      ▀███▀        ▀▀         ▀                 ▀         ▀▀        ▀███▀
      
  
      Unite. Fight. Survive. Brave the dungeons alone, or  team  up  with
      friends! Up to four players  can battle  together  through  action-
      packed, treasure-stuffed, wildly varied levelsùall in an epic quest
      to save the villagers and take down the evil Arch-Illager!
      

  ▄██▄                                                                   ▄██▄
 ▓▀▀███▓   ▄▄   █ █▀█ █▀▀ ▀█▀ █▀█ █   █     █▀█ █▀█ ▀█▀ █▀▀ █▀▀   ▄▄   ▓███▀▀▓
 ▀▄  ▀██▓ ▀ ▀█  ▓ ▓ ▓ ▀▀▓  ▓  ▓▀▓ ▓   ▓     ▓ ▓ ▓ ▓  ▓  ▓▀  ▀▀▓  █▀ ▀ ▓██▀  ▄▀
      ███▓▄ ▄██ ▀ ▀ ▀ ▀▀▀  ▀  ▀ ▀ ▀▀▀ ▀▀▀   ▀ ▀ ▀▀▀  ▀  ▀▀▀ ▀▀▀ ██▄ ▄▓███
    ▄█▓███████▀▀██████▓▄  ▄██▀█▄▄  ▀▄▄   ▄▄▀  ▄▄█▀██▄  ▄▓██████▀▀███████▓█▄
   █▀ ▄██▀▀▀      ▀▀███▓  ██▄  ▀▀▓█▄ ██ ██ ▄█▓▀▀  ▄██  ▓███▀▀      ▀▀▀██▄ ▀█
    ▀ ██▄  ▄      ▄ ▄█▀    ▀█▀     ▀██▀ ▀██▀     ▀█▀    ▀█▄ ▄      ▄  ▄██ ▀
      ▀███▀        ▀▀         ▀                 ▀         ▀▀        ▀███▀
      
      
      - Extract 
      - Burn or mount the .iso
      - Run setup.exe and install
      - Copy crack from CODEX dir to installdir
      - Play
      
      NOTES: This release is updated to Build 1.7.3.0_5135400 and includes
      the following DLC:
      
      > Minecraft Dungeons Jungle Awakens
      > Minecraft Dungeons Creeping Winter
      > Minecraft Dungeons Howling Peaks
      
  
      General Notes:

      - Block the game's exe in your firewall to prevent the game from 
        trying to go online ..
      - If you install games to your systemdrive, it may be necessary
        to run this game with admin privileges instead
      - Only SiMPLEX is allowed to use our isos for 0day releases.
        
       
  ▄██▄                                                                   ▄██▄
 ▓▀▀███▓   ▄▄      █▀▀ █▀█ █▀█ █ █ █▀█   █▀█ █▀█ ▀█▀ █▀▀ █▀▀      ▄▄   ▓███▀▀▓
 ▀▄  ▀██▓ ▀ ▀█  ▄  ▓ █ ▓▀▄ ▓ ▓ ▓ ▓ ▓▀▀   ▓ ▓ ▓ ▓  ▓  ▓▀  ▀▀▓  ▄  █▀ ▀ ▓██▀  ▄▀
      ███▓▄ ▄██▄▓▄ ▀▀▀ ▀ ▀ ▀▀▀ ▀▀▀ ▀     ▀ ▀ ▀▀▀  ▀  ▀▀▀ ▀▀▀ ▄▓▄██▄ ▄▓███
    ▄█▓███████▀▀██████▓▄  ▄██▀█▄▄  ▀▄▄   ▄▄▀  ▄▄█▀██▄  ▄▓██████▀▀███████▓█▄
   █▀ ▄██▀▀▀      ▀▀███▓  ██▄  ▀▀▓█▄ ██ ██ ▄█▓▀▀  ▄██  ▓███▀▀      ▀▀▀██▄ ▀█
    ▀ ██▄  ▄      ▄ ▄█▀    ▀█▀     ▀██▀ ▀██▀     ▀█▀    ▀█▄ ▄      ▄  ▄██ ▀
      ▀███▀        ▀▀         ▀                 ▀         ▀▀        ▀███▀
		  
                        CODEX is currently looking for
               ▄██▄                                         ▄██▄
              ▓██ ▀▀  ▄    nothing but competition!     ▄  ▀▀ ██▓
               ▓██▄ ▄▓▀▓                               ▓▀▓▄ ▄██▓
             ▄██████▓▀   Greetings to STEAMPUNKS & CPY   ▀▓██████▄
            ▓██▀  ▀██▄▄ ▄▄                           ▄▄ ▄▄██▀  ▀██▓
            ██   ▄ ▀█▓██▓▀█▄█▀█▄▄   ▄  ▄  ▄   ▄▄█▀█▄█▀▓██▓█▀ ▄   ██
            ▀██▄▄▀ ▄ █ █ ▄ ▀▄  ▀▀▓█▄ █ ▓ █ ▄█▓▀▀  ▄▀ ▄ █ █ ▄ ▀▄▄██▀
              ▀▀    ▀   ▀     ▄▀   ▀▀  ▀  ▀▀   ▀▄     ▀   ▀    ▀▀
                               ▀█▓▄ LNK^CPS ▄▓█▀
                                 ▄▀ 02/2015 ▀▄
                                ▓      ▄      ▓
                                 ▀   ▓▀▄▀▓   ▀
                                 ▄  █  ▓  █  ▄
                                  ▀▀       ▀▀
"

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO 1, @input;


SET @intput  = '
>                      ▓▓  ▓▓ ▓▓                            ▓  
>                      ▓▓  ▓▓                              ▓▓  
>                      ▓▓▓ ▓▓ ▓▓ ▓▓▓▓▓   ▓▓▓   ▓▓▓▓   ▓▓▓ ▓▓▓▓ 
>                      ▓▓▓ ▓▓ ▓▓ ▓▓  ▓▓ ▓  ▓▓ ▓▓  ▓▓ ▓  ▓▓ ▓▓  
>                      ▓▓ ▓▓▓ ▓▓ ▓▓  ▓▓  ▓▓▓▓ ▓▓▓▓    ▓▓▓▓ ▓▓  
>                      ▓▓ ▓▓▓ ▓▓ ▓▓  ▓▓ ▓▓ ▓▓   ▓▓▓▓ ▓▓ ▓▓ ▓▓  
>                      ▓▓  ▓▓ ▓▓ ▓▓  ▓▓ ▓▓ ▓▓ ▓▓  ▓▓ ▓▓ ▓▓ ▓▓  
>                      ▓▓  ▓▓ ▓▓ ▓▓  ▓▓  ▓▓▓▓  ▓▓▓▓   ▓▓▓▓  ▓▓ 
>                             
>                             PROUDLY  SHARING                        
>                     ▓▓▓▓▓▓▓                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                   
>                      ▓▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                     
>                        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                      
>                          ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                        
>                           ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                          
>                               ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                            
>                                   ▓▓▓▓▓▓▓▓▓▓▓▓▓                                 
>                                                                                 
>   Morangos.com.Acucar.O.Filme.2012.1080p.PORTUGUESE.NF.WEB-DL.H264.AAC-Ninasat
>
>   
> ┌──────────────────────────────────────────────────────────────────────────────┐
> │▓▓▓▓▓▒░  F i L E   i N F O  ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓│
> └──────────────────────────────────────────────────────────────────────────────┘
>
>
>
>   SiZE: 4.85 GB
>
>   RUNTiME: 1h 34min 00s
>
>   VIDEO CODEC: AVC H264 High@L4.0
>
>   FRAMERATE: 25.000 fps
>
>   BiTRATE: 7 217 kb/s
>
>   RESOLUTiON: 1920 x 1080
>
>   LANGUAGE: PORTUGUESE
>
>   AUDiO: AAC 2.0 @ 128kbps
>
>   CHAPTERS: NO
>
>   SOURCE: NETFLIX - Thanks!
>
>   SUBTITLES: PORTUGUESE [CC]
>
>   iMDB URL: https://www.imdb.com/title/tt2185846/
>
>   Genre: M/6 | 1h 37min | Comedy, Drama, Family | 30 August 2012 (Portugal)
>
>   RATiNG: 3,1/10 | 519
>
>   ENCODER: Ninasat
>
>   NOTES: Enjoy!!!
>
>   GREATS: WinTeaM, Mocunaman@iFT, A SPECiAL FRiEND...
>
>
>
>  ──────────────────────────────────────────────────────────────────────────────┐
>  └──┘                                                   [ascii.by.Ninasat]  └──┘ 
>  *─────────────────────────────────────────────────────────────────────────────*
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO 2, @input;

SET @intput  = '
<br>
<img src="http://i.imgur.com/fd0Mz.png" alt="" original-title="" rel="resized_by_tsue">
<br>
&gt;&gt;&gt;Morangos.com.Acucar.O.Filme.2012.1080p.PORTUGUESE.NF.WEB-DL.H264.AAC-Ninasat&lt;&lt;&lt;
<br>
<br>
<img src="http://i.imgur.com/rpVIe.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<img src="https://i.imgur.com/PDRB8CR.jpg" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://i.imgur.com/TD3iO.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<img src="https://nfomation.net/nfo.white/1623075364.Morangos.com.Acucar.O.Filme.2012.1080p.PORTUGUESE.NF.WEB-DL.H264.AAC-Ninasat.nfo.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<a href="https://anonymiz.com/?https://www.imdb.com/title/tt2185846/" target="_blank" rel="nofollow" title=""><img src="http://www.tubefilter.com/wp-content/uploads/2009/03/imdb_logo.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="http://www.tubefilter.com/wp-content/uploads/2009/03/imdb_logo.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://www.imdb.com/title/tt2185846/" target="_blank" rel="nofollow" title=""><img src="http://www.tubefilter.com/wp-content/uploads/2009/03/imdb_logo.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<br>
<img src="http://i.imgur.com/XpIwW.png" alt="" original-title="" rel="resized_by_tsue">
<br>
:elenco:
<br>
<br>
Lourenço Ortigão, Sara Matos, Sara Prata, Ricardo Sá, Mafalda Portela, Lia Carvalho, David Carreira, Guilherme Filipe, João Catarré, Pedro Carvalho
<br>
<br>
:sinopse:
<br>
<br>
É na loucura do Verão e ao som da música que o passado e o presente de "Morangos com Açúcar" se cruzam, numa aventura sem igual. Entre a praia e a piscina, o parque de campismo e o campo de férias, amigos de longa data reencontram-se e novas amizades acontecem. A alegria é geral e ninguém vai querer perder o grande festival de bandas que está prestes a acontecer. É num ambiente de grande festa que a energia da música vai dar ritmo aos amores e desamores de Verão. Uma coisa é certa, o Verão é agora!
<br>
<br>
<img src="http://i.imgur.com/K6w6e.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<a href="https://anonymiz.com/?https://ibb.co/YWPPXwf" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/LPYYrH9/vlcsnap-2021-06-07-15h04m30s112.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="https://i.ibb.co/LPYYrH9/vlcsnap-2021-06-07-15h04m30s112.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://ibb.co/YWPPXwf" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/LPYYrH9/vlcsnap-2021-06-07-15h04m30s112.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<a href="https://anonymiz.com/?https://ibb.co/C1H840j" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/98rgBYx/vlcsnap-2021-06-07-15h04m35s221.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="https://i.ibb.co/98rgBYx/vlcsnap-2021-06-07-15h04m35s221.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://ibb.co/C1H840j" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/98rgBYx/vlcsnap-2021-06-07-15h04m35s221.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<a href="https://anonymiz.com/?https://ibb.co/D8FZbvx" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/BrJ9PQX/vlcsnap-2021-06-07-15h04m38s156.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="https://i.ibb.co/BrJ9PQX/vlcsnap-2021-06-07-15h04m38s156.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://ibb.co/D8FZbvx" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/BrJ9PQX/vlcsnap-2021-06-07-15h04m38s156.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<a href="https://anonymiz.com/?https://ibb.co/yyXk89b" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/mqGyHjM/vlcsnap-2021-06-07-15h04m41s128.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="https://i.ibb.co/mqGyHjM/vlcsnap-2021-06-07-15h04m41s128.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://ibb.co/yyXk89b" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/mqGyHjM/vlcsnap-2021-06-07-15h04m41s128.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<a href="https://anonymiz.com/?https://ibb.co/Wn41CNf" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/Y2FGg4h/vlcsnap-2021-06-07-15h04m43s947.png" alt="" original-title="" rel="resized_by_tsue"></a>
<img src="https://i.ibb.co/Y2FGg4h/vlcsnap-2021-06-07-15h04m43s947.png" alt="" original-title="" rel="resized_by_tsue">
<a href="https://anonymiz.com/?https://ibb.co/Wn41CNf" target="_blank" rel="nofollow" title=""><img src="https://i.ibb.co/Y2FGg4h/vlcsnap-2021-06-07-15h04m43s947.png" alt="" original-title="" rel="resized_by_tsue"></a>
<br>
<br>
<img src="http://i.imgur.com/5zLa7.png" alt="" original-title="" rel="resized_by_tsue">
<br>
[video]https://www.youtube.com/v/r5PricTf3yE[/video]
<br>
<object width="500" height="314"><param name="movie" value="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><param name="wmode" value="transparent"><embed src="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></object>
<param name="movie" value="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent">
<param name="allowFullScreen" value="true">
<param name="allowscriptaccess" value="always">
<param name="wmode" value="transparent">
<embed src="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent">
<div pseudo="-webkit-plugin-replacement"><iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe></div>
<div pseudo="-webkit-plugin-replacement"><iframe width="100%" style="max-height: 100%" height="314" src="http://www.youtube.com/embed/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" frameborder="0" scrolling="no"></iframe></div>
<embed src="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent">
<object width="500" height="314"><param name="movie" value="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><param name="wmode" value="transparent"><embed src="http://www.youtube.com/v/r5PricTf3yE?version=3&amp;hd=1&amp;wmode=transparent" type="application/x-shockwave-flash" width="500" height="314" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></object>
<br>
<br>
<img src="http://i.imgur.com/4sP1H.png" alt="" original-title="" rel="resized_by_tsue">
<br>
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML 2, @input;


SET @intput  = 'The.Terminal.2004.2160p.WEB.H265-NAISU

https://www.imdb.com/title/tt0362227/'

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO 3, @input;


SET @intput  = '<br>
<br>
<span style="font-size: x-large;" original-title=""><strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span></strong></span>
<strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span></strong>
<span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span>
<em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em>
<span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span>
<em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em>
<span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span>
<strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span></strong>
<span style="font-size: x-large;" original-title=""><strong><span style="text-decoration: underline; color: #800080;" original-title=""><em><span style="text-decoration: underline;" original-title="">The.Terminal.2004.2160p.WEB.H265-NAISU</span></em></span></strong></span>
<br>
<br>
<img src="http://btnext.org/BTNextTeam/cover.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://tracker.btnext.com/data/torrents/torrent_images/l/2etVXcWUsoaWvOlRt3bSXIOrW5P.jpg" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/info.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="https://btnext.org/nfo/NFO/d41bi309422e517.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.sinopse.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<div class="CodeBlockQuote">
	<div class="quotecontent"><span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span></div>
</div>
<div class="quotecontent"><span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span></div>
<span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span>
<strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong>
Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.
<strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong>
<span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span>
<div class="quotecontent"><span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span></div>
<div class="CodeBlockQuote">
	<div class="quotecontent"><span style="font-size: medium;" original-title=""><strong>Um visitante do Leste, Viktor Navorski, torna-se residente no terminal do aeroporto JFK, em Nova Iorque. A guerra civil irrompe no seu país de origem e, com o vazio do governo, o seu passaporte deixa de ser válido, não podendo por isso ter o visto para entrar nos EUA. Viktor começa então a fazer amizade com o pessoal do terminal, acabando por se apaixonar por uma hospedeira da United Airlines.</strong></span></div>
</div>
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.semear.final.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.iloveyou.pequeno.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML 3, @input;


SET @intput  = '
 ╔═─════─═╗         ╔─╦──╦───╦═───═╦═───═╦───╦──╦─╗         ╔═─════─═╗
 ╚╬       ╚═─═════─═╝═╩══╩═══╩═════╩═════╩═══╩══╩═╚═─═════─═╝       ╬╝
  ║ Shared By ChingLiu   BE HAPPY !                                 ║  
  ║                                                                 ║
  ║                            ░ ░ ▓▓░▒                             ║  
  ║                      ▓███ ▒░▒ ▒░  ▓▒█▒                          ║  
  ║                     █████▓ ░  ░█░░ ░░░██   ░▒                   ║  
  ║                    ▒███▓▒░ ░ ▓  ▒     ░▓█▒▒▓▒█▒                 ║  
  ║                    ███▒░░▒  ▒▒     ░▒ ░██▒░ ▓▓█                 ║  
  ║                   ▒▒█▒ ▒▒ ░ ▓   ░░▒  ░ ▓█    ▒█                 ║  
  ║                 ██▓██▒ ░ ░░ ▒    ▒     ░█▒ ░░░█▓                ║  
  ║               █▒█▓███   ▒  ░▒    ░  ░   ▓ ░░░▓ ▒▒▒              ║  
  ║              ██▓▓██▓██▒░▒░▒▒░     ▒░ ░ ▒█   ▒  ▒▒█              ║  
  ║              ██▒▓█▒▓██░ ▒█▓██   ░███▒▒ ██▒░   ▒ ░█              ║  
  ║              ██████▓██▒ █░███    ██▒▒░██▒   ▒  ░░█              ║  
  ║               ████▒█▓██▒░██       ░█▒░█▒   ▒ ▒ ░█               ║  
  ║               ░███▒▓▓██░             ██ ░░   ▒ ██               ║  
  ║                █████▓█▒   ░██████     █  ▒▓ ░▒▒█                ║  
  ║                 █▒████   █████████    █ ░    ▓█▒                ║  
  ║                  ███ █      ███▓       █ ░  ▒█                  ║  
  ║                      ▒       █░        █   ▒█                   ║  
  ║                      ░       █       ░  ████▓                   ║  
  ║                       ▓░   ░░█▒░░  ▒▒     ███░                  ║  
  ║                       ░█    ▓ ░            ██                   ║  
  ║                      █                     ██▒                  ║  
  ║                                                                 ║
  ╚═────────────────────────═══════════════────────────────────────═╝  

  1. Install application from "Adobe CS6" folder by double clicking on
  the "Set-up.exe"
  2. Choose TRY install.
  3. Select your language.
  4. Copy "adobe.photoshop.cs6-patch.exe" from "PainteR" folder
  and paste iy in to the installation folder. It is generally ; 
  C:\Program Files\Adobe\Adobe Photoshop CS6
  5. Run the patch.
  6. IMPORTANT : Some security programs may give warning. It is false
  positive. (Virus total result is 13/42)
  7. Patch will block trial check and activate Adobe Photoshop CS6 but
  for your safety use firewall to stop internet connection of application.

  Thanks to PainteR.
    
  [ChingLiu] April 25, 2012

 ╔╝╦═══════════════════════════════════════════════════════════════╦╚╗
 ╚╬╝        PLEASE SEED  -  PLEASE SHARE  -  PLEASE UPLOAD         ╚╬╝
  ╚═════════════════════════════════════════════════════════════════╝
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO 4, @input;



SET @intput  = '
<img src="http://tracker.btnext.com/data/gallery/l/Mark.gif" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<span style="color: #626262;" original-title=""><strong>[REQ] Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu</strong></span>
<strong>[REQ] Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu</strong>
<span style="color: #626262;" original-title=""><strong>[REQ] Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu</strong></span>
<br>
<br>
<img src="http://tracker.btnext.com/data/gallery/l/Capa.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://tracker.btnext.com/data/torrents/torrent_images/l/Adobe.Photoshop.CS6.13.0.Final.Multilingual-REPACK-ChingLiu.jpg" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://tracker.btnext.com/data/gallery/l/Info.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="https://btnext.org/nfo/NFO/130d21a329c8610c58c.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://tracker.btnext.com/data/gallery/l/Agradece.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
<img src="http://btnext.org/BTNextTeam/banner.iloveyou.pequeno.png" alt="" original-title="" rel="resized_by_tsue">
<br>
<br>
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML 4, @input;


SET @intput  = "General
Format                      : Matroska
Format version              : Version 4
File size                   : 1.20 GiB
Duration                    : 43 min 47 s
Overall bit rate            : 3 926 kb/s
Encoded date                : UTC 2021-06-05 16:45:43
Writing application         : mkvmerge v53.0.0 ('Fool's Gold') 64-bit
Writing library             : libebml v1.4.1 + libmatroska v1.6.2

Video
ID                          : 1
Format                      : AVC
Format/Info                 : Advanced Video Codec
Format profile              : Main@L5
Format settings             : CABAC / 4 Ref Frames
Format settings, CABAC      : Yes
Format settings, Reference  : 4 frames
Codec ID                    : V_MPEG4/ISO/AVC
Duration                    : 43 min 47 s
Bit rate                    : 3 800 kb/s
Width                       : 1 920 pixels
Height                      : 950 pixels
Display aspect ratio        : 2.021
Frame rate mode             : Constant
Frame rate                  : 25.000 FPS
Color space                 : YUV
Chroma subsampling          : 4:2:0
Bit depth                   : 8 bits
Scan type                   : Progressive
Bits/(Pixel*Frame)          : 0.083
Stream size                 : 1.16 GiB (97%)
Title                       : MTRX
Writing library             : x264 core 157 r2935 545de2f
Encoding settings           : cabac=1 / ref=2 / deblock=1:0:0 / analyse=0x1:0x111 / me=hex / subme=6 / psy=1 / psy_rd=1.00:0.00 / mixed_ref=1 / me_range=16 / chroma_me=1 / trellis=1 / 8x8dct=0 / cqm=0 / deadzone=21,11 / fast_pskip=1 / chroma_qp_offset=-2 / threads=12 / lookahead_threads=2 / sliced_threads=0 / nr=0 / decimate=1 / interlaced=0 / bluray_compat=0 / constrained_intra=0 / bframes=3 / b_pyramid=2 / b_adapt=1 / b_bias=0 / direct=1 / weightb=1 / open_gop=0 / weightp=1 / keyint=250 / keyint_min=25 / scenecut=40 / intra_refresh=0 / rc_lookahead=30 / rc=2pass / mbtree=1 / bitrate=3800 / ratetol=1.0 / qcomp=0.60 / qpmin=0 / qpmax=69 / qpstep=4 / cplxblur=20.0 / qblur=0.5 / vbv_maxrate=135000 / vbv_bufsize=135000 / nal_hrd=none / filler=0 / ip_ratio=1.40 / aq=1:1.00
Language                    : Portuguese
Default                     : Yes
Forced                      : Yes
Color range                 : Limited
Color primaries             : BT.709
Transfer characteristics    : BT.709
Matrix coefficients         : BT.709

Audio
ID                          : 2
Format                      : AAC LC
Format/Info                 : Advanced Audio Codec Low Complexity
Codec ID                    : A_AAC-2
Duration                    : 43 min 47 s
Bit rate                    : 125 kb/s
Channel(s)                  : 2 channels
Channel layout              : L R
Sampling rate               : 48.0 kHz
Frame rate                  : 46.875 FPS (1024 SPF)
Compression mode            : Lossy
Delay relative to video     : -21 ms
Stream size                 : 39.3 MiB (3%)
Title                       : MTRX
Language                    : Portuguese
Default                     : Yes
Forced                      : Yes 
"

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_NFO 5, @input;

SET @intput  = '<div style="width: 100%; display:table;">
                                                                            <div style="width: 25%; display:table-cell; text-align: left; padding-right:15px;">
                                            <div class="text-bold text-info">Info Geral</div>
                                                                                            Formato: Matroska
                                                                                                    <br>
                                                                                                                                            Duração: 43 min 47 s
                                                                                                    <br>
                                                                                                                                            Tamanho: 1.2 GiB
                                                                                                    <br>
                                                                                                                                            Bit Rate Global: 3926kb/s
                                                                                                                                    </div>
                                                                                                                                                        <div style="width: 25%; display:table-cell; text-align: left;padding-right:15px;">
                                            <div class="text-bold text-info">Vídeo</div>
                                                                                                                                                            Formato: AVC
                                                                                                                    <br>
                                                                                                                                                                                                                                                                        Resolução: 1920 x 950
                                                                                                                    <br>
                                                                                                                                                                                                                                                                                                                                    Proporção: 2.021
                                                                                                                            <br>
                                                                                                                                                                                Frame Rate: 25.000 FPS
                                                                                                                            <br>
                                                                                                                                                                                Bit Rate: 3800kb/s
                                                                                                                            <br>
                                                                                                                                                                                Perfil: Main@L5
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                        <div style="width: 50%; display:table-cell; text-align: left;">
                                            <div class="text-bold text-info">Audio</div>
                                                                                            #1: 
                                                                                                    Portuguese
                                                                                                            /
                                                                                                                                                        AAC LC
                                                                                                            /
                                                                                                                                                        2.0ch
                                                                                                            /
                                                                                                                                                        125kb/s
                                                                                                            /
                                                                                                                                                        MTRX
                                                                                                                                                    <br>
                                                                                        </div>
                                                                        
                                    </div>
<div style="width: 100%; display:table;">
                                                                            <div style="width: 25%; display:table-cell; text-align: left; padding-right:15px;">
                                            <div class="text-bold text-info">Info Geral</div>
                                                                                            Formato: Matroska
                                                                                                    <br>
                                                                                                                                            Duração: 43 min 47 s
                                                                                                    <br>
                                                                                                                                            Tamanho: 1.2 GiB
                                                                                                    <br>
                                                                                                                                            Bit Rate Global: 3926kb/s
                                                                                                                                    </div>
                                                                                                                                                        <div style="width: 25%; display:table-cell; text-align: left;padding-right:15px;">
                                            <div class="text-bold text-info">Vídeo</div>
                                                                                                                                                            Formato: AVC
                                                                                                                    <br>
                                                                                                                                                                                                                                                                        Resolução: 1920 x 950
                                                                                                                    <br>
                                                                                                                                                                                                                                                                                                                                    Proporção: 2.021
                                                                                                                            <br>
                                                                                                                                                                                Frame Rate: 25.000 FPS
                                                                                                                            <br>
                                                                                                                                                                                Bit Rate: 3800kb/s
                                                                                                                            <br>
                                                                                                                                                                                Perfil: Main@L5
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                        <div style="width: 50%; display:table-cell; text-align: left;">
                                            <div class="text-bold text-info">Audio</div>
                                                                                            #1: 
                                                                                                    Portuguese
                                                                                                            /
                                                                                                                                                        AAC LC
                                                                                                            /
                                                                                                                                                        2.0ch
                                                                                                            /
                                                                                                                                                        125kb/s
                                                                                                            /
                                                                                                                                                        MTRX
                                                                                                                                                    <br>
                                                                                        </div>
                                                                        
                                    </div>
<div style="width: 25%; display:table-cell; text-align: left; padding-right:15px;">
                                            <div class="text-bold text-info">Info Geral</div>
                                                                                            Formato: Matroska
                                                                                                    <br>
                                                                                                                                            Duração: 43 min 47 s
                                                                                                    <br>
                                                                                                                                            Tamanho: 1.2 GiB
                                                                                                    <br>
                                                                                                                                            Bit Rate Global: 3926kb/s
                                                                                                                                    </div>
<div class="text-bold text-info">Info Geral</div>

                                                                                            Formato: Matroska
                                                                                                    
<br>

                                                                                                                                            Duração: 43 min 47 s
                                                                                                    
<br>

                                                                                                                                            Tamanho: 1.2 GiB
                                                                                                    
<br>

                                                                                                                                            Bit Rate Global: 3926kb/s
                                                                                                                                    
<div style="width: 25%; display:table-cell; text-align: left; padding-right:15px;">
                                            <div class="text-bold text-info">Info Geral</div>
                                                                                            Formato: Matroska
                                                                                                    <br>
                                                                                                                                            Duração: 43 min 47 s
                                                                                                    <br>
                                                                                                                                            Tamanho: 1.2 GiB
                                                                                                    <br>
                                                                                                                                            Bit Rate Global: 3926kb/s
                                                                                                                                    </div>
<div style="width: 25%; display:table-cell; text-align: left;padding-right:15px;">
                                            <div class="text-bold text-info">Vídeo</div>
                                                                                                                                                            Formato: AVC
                                                                                                                    <br>
                                                                                                                                                                                                                                                                        Resolução: 1920 x 950
                                                                                                                    <br>
                                                                                                                                                                                                                                                                                                                                    Proporção: 2.021
                                                                                                                            <br>
                                                                                                                                                                                Frame Rate: 25.000 FPS
                                                                                                                            <br>
                                                                                                                                                                                Bit Rate: 3800kb/s
                                                                                                                            <br>
                                                                                                                                                                                Perfil: Main@L5
                                                                                                                                                                                                                                                                </div>
<div class="text-bold text-info">Vídeo</div>

                                                                                                                                                            Formato: AVC
                                                                                                                    
<br>

                                                                                                                                                                                                                                                                        Resolução: 1920 x 950
                                                                                                                    
<br>

                                                                                                                                                                                                                                                                                                                                    Proporção: 2.021
                                                                                                                            
<br>

                                                                                                                                                                                Frame Rate: 25.000 FPS
                                                                                                                            
<br>

                                                                                                                                                                                Bit Rate: 3800kb/s
                                                                                                                            
<br>

                                                                                                                                                                                Perfil: Main@L5
                                                                                                                                                                                                                                                                
<div style="width: 25%; display:table-cell; text-align: left;padding-right:15px;">
                                            <div class="text-bold text-info">Vídeo</div>
                                                                                                                                                            Formato: AVC
                                                                                                                    <br>
                                                                                                                                                                                                                                                                        Resolução: 1920 x 950
                                                                                                                    <br>
                                                                                                                                                                                                                                                                                                                                    Proporção: 2.021
                                                                                                                            <br>
                                                                                                                                                                                Frame Rate: 25.000 FPS
                                                                                                                            <br>
                                                                                                                                                                                Bit Rate: 3800kb/s
                                                                                                                            <br>
                                                                                                                                                                                Perfil: Main@L5
                                                                                                                                                                                                                                                                </div>
<div style="width: 50%; display:table-cell; text-align: left;">
                                            <div class="text-bold text-info">Audio</div>
                                                                                            #1: 
                                                                                                    Portuguese
                                                                                                            /
                                                                                                                                                        AAC LC
                                                                                                            /
                                                                                                                                                        2.0ch
                                                                                                            /
                                                                                                                                                        125kb/s
                                                                                                            /
                                                                                                                                                        MTRX
                                                                                                                                                    <br>
                                                                                        </div>
<div class="text-bold text-info">Audio</div>

                                                                                            #1: 
                                                                                                    Portuguese
                                                                                                            /
                                                                                                                                                        AAC LC
                                                                                                            /
                                                                                                                                                        2.0ch
                                                                                                            /
                                                                                                                                                        125kb/s
                                                                                                            /
                                                                                                                                                        MTRX
                                                                                                                                                    
<br>
<div style="width: 50%; display:table-cell; text-align: left;">
                                            <div class="text-bold text-info">Audio</div>
                                                                                            #1: 
                                                                                                    Portuguese
                                                                                                            /
                                                                                                                                                        AAC LC
                                                                                                            /
                                                                                                                                                        2.0ch
                                                                                                            /
                                                                                                                                                        125kb/s
                                                                                                            /
                                                                                                                                                        MTRX
                                                                                                                                                    <br>
                                                                                        </div>
'

EXEC sp_executesql @input;

EXEC PROCEDURE TorrentTracker.INSERT_CONTENT_TORRENT_DESCRICAO_HTML 5, @input;
