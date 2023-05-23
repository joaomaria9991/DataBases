using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    public class PremioData
    {
        String Nome;
        String Design;
        String Dataa;
        String NomeE;

        public string Nome1 { get => Nome; set => Nome = value; }
        public string Design1 { get => Design; set => Design = value; }
        public string Dataa1 { get => Dataa; set => Dataa = value; }
        public string NomeE1 { get => NomeE; set => NomeE = value; }


        public override string ToString()
        {
            return Nome1 + "  |  " + Design1 + " |  " +Dataa1 +" | " +NomeE1;

        }

    }
}
