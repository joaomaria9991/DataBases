using System;
using System.Collections.Generic;
using System.Text;

namespace TorrentTracker
{
    class Convite
    {
        String DestinatarioEmail;
        String DataEnvio;

        public string DestinatarioEmail1 { get => DestinatarioEmail; set => DestinatarioEmail = value; }
        public string DataEnvio1 { get => DataEnvio; set => DataEnvio = value; }



        public override string ToString()
        {
            return String.Format("{0,20}{1,50}", DestinatarioEmail1, DataEnvio1);

        }

    }


}
