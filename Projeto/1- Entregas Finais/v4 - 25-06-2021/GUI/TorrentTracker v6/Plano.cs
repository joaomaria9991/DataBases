using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class Plano
    {

        String Nome;
        String DescricaoPlano;
        String Preco;

        public string Nome1 { get => Nome; set => Nome = value; }
        public string DescricaoPlano1 { get => DescricaoPlano; set => DescricaoPlano = value; }
        public string Preco1 { get => Preco; set => Preco = value; }




        public override string ToString()
        {

            return Nome1 + "|"+ DescricaoPlano1 +"|" +Preco1;
            //return String.Format("{1,10}{1,50}{2,30}", Nome1, DescricaoPlano1,Preco1);

        }

    }
}
