using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class compra
    {
        String Nome;
        String DataHoraCompra;
        String DataHoraTermino;
        String DiasRestantes;

        public string Nome1 { get => Nome; set => Nome = value; }
        public string DataHoraCompra1 { get => DataHoraCompra; set => DataHoraCompra = value; }
        public string DataHoraTermino1 { get => DataHoraTermino; set => DataHoraTermino = value; }
        public string DiasRestantes1 { get => DiasRestantes; set => DiasRestantes = value; }


       public override string ToString()
        {
            return Nome1 + "  |   " + DataHoraCompra1 + "  |   " + DataHoraTermino1 + "  |   " + DiasRestantes1;

        }
    }
}
