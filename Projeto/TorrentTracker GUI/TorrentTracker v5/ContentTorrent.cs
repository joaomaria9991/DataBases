using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

namespace TorrentTracker
{
   public class ContentTorrent
    {


		private String _ID_ContentTorrent;
		private String _Tamanho;
		private String _DataHoraAdicao;
		private String _NFO;
		private String _Descricao;
		private String _NomeContentTorrent;
		private String _FreeLeechDataHoraLimite;

        public String ID_ContentTorrent { get => _ID_ContentTorrent; set => _ID_ContentTorrent = value; }
        public String Tamanho { get => _Tamanho; set => _Tamanho = value; }
        public String DataHoraAdicao { get => _DataHoraAdicao; set => _DataHoraAdicao = value; }
        public String NFO { get => _NFO; set => _NFO = value; }
        public String NomeContentTorrent { get => _NomeContentTorrent; set => _NomeContentTorrent = value; }
        public String FreeLeechDataHoraLimite { get => _FreeLeechDataHoraLimite; set => _FreeLeechDataHoraLimite = value; }
        public String Descricao { get => _Descricao; set => _Descricao = value; }


        public override string ToString()
        {
            return  _NomeContentTorrent;

        }

    }

}
