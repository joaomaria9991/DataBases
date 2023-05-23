using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class ComprasComplexas
    {
        String UserNickName;
        String Nome;
        String PrecoPlano;
        String DataHoraCompra;
        String DataHoraTermino;

        public string UserNickName1 { get => UserNickName; set => UserNickName = value; }
        public string Nome1 { get => Nome; set => Nome = value; }
        public string PrecoPlano1 { get => PrecoPlano; set => PrecoPlano = value; }
        public string DataHoraCompra1 { get => DataHoraCompra; set => DataHoraCompra = value; }
        public string DataHoraTermino1 { get => DataHoraTermino; set => DataHoraTermino = value; }


        public override string ToString()
        {
            return UserNickName1 + "  |  " + Nome1 + "  |  " +PrecoPlano1 + "  |  " +DataHoraCompra1 + "  |  " +DataHoraTermino1;

        }


    }
}
