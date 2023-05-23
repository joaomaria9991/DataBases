using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class ComprasSimples
    {

        String UserNickName;
        String PrecoPlano;
    

        public string UserNickName1 { get => UserNickName; set => UserNickName = value; }
        public string PrecoPlano1 { get => PrecoPlano; set => PrecoPlano = value; }


        public override string ToString()
        {
            return UserNickName1 + "  |  " + PrecoPlano1;

        }


    }
}



 