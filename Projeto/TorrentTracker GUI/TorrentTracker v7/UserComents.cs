using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class UserComents
    {
        private String _UserNickName;
        private String _NomeContentTorrent;
        private String _Comentario;
        public string UserNickName { get => _UserNickName; set => _UserNickName = value; }
        public string NomeContentTorrent { get => _NomeContentTorrent; set => _NomeContentTorrent = value; }
        public string Comentario { get => _Comentario; set => _Comentario = value; }

        public override string ToString()
        {
            return NomeContentTorrent + "  |  "+ Comentario;

        }

    }

}


