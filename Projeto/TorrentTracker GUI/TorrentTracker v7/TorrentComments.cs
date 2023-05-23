using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;


namespace TorrentTracker
{
	public class TorrentComments
	{
		private String Comentarios;
		private String UserNickName;
		private String ID_User;

        public string Comentarios1 { get => Comentarios; set => Comentarios = value; }
        public string UserNickName1 { get => UserNickName; set => UserNickName = value; }
        public string ID_User1 { get => ID_User; set => ID_User = value; }

        public override string ToString()
        {
            return String.Format("{0,20}{1,50}", UserNickName1, Comentarios1);
            //return UserNickName + "     |        " + Comentarios;

        }


    }



}

