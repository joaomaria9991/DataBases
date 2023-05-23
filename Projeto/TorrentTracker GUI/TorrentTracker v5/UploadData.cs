using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class UploadData
    {
        String NomeContentTorrent;
        String Tamanho;
        String DataHoraAdicao;
        String Grupo;

        public string NomeContentTorrent1 { get => NomeContentTorrent; set => NomeContentTorrent = value; }
        public string Tamanho1 { get => Tamanho; set => Tamanho = value; }
        public string DataHoraAdicao1 { get => DataHoraAdicao; set => DataHoraAdicao = value; }
        public string Grupo1 { get => Grupo; set => Grupo = value; }

        public override string ToString()
        {
            return NomeContentTorrent1 + "  |  " + Tamanho1 + " |  " + DataHoraAdicao1+ " | "+ Grupo1;

        }

    }
}
