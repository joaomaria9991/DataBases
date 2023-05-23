using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class balancos
    {
        String Ganho;
        String NumeroCompras;

        public string Ganho1 { get => Ganho; set => Ganho = value; }
        public string NumeroCompras1 { get => NumeroCompras; set => NumeroCompras = value; }

        public override string ToString()
        {
            return "Ganho de: " +Ganho1 + "  |  " +"Com o número de Compras: " + NumeroCompras1;

        }

    }
}
