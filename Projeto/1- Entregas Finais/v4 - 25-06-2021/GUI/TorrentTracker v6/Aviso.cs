using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class Aviso
    {
        String Nome;
        String Dataa;

        public string Nome1 { get => Nome; set => Nome = value; }
        public string Dataa1 { get => Dataa; set => Dataa = value; }


        public override string ToString()
        {
            return Nome1 + "  |  " + Dataa1;

        }

    }
}
