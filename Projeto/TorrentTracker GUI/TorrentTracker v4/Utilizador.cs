using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;


namespace TorrentUtilizador
{
	public class Utilizador
	{
		private String _ID_User;
		private String _UserPassword;
		private String _UserEmail;
		private String _UserDataRegisto;
		private String _UserNickName;
		private String _UserTorrentProgram;
		private String  _UserPermissaoDownload;

		public string ID_User { get => _ID_User; set => _ID_User = value; }
		public string UserPassword { get => _UserPassword; set => _UserPassword = value; }
		public string UserEmail { get => _UserEmail; set => _UserEmail = value; }
		public string UserDataRegisto { get => _UserDataRegisto; set => _UserDataRegisto = value; }
		public string UserNickName { get => _UserNickName; set => _UserNickName = value; }
		public string UserTorrentProgram { get => _UserTorrentProgram; set => _UserTorrentProgram = value; }
        public string UserPermissaoDownload { get => _UserPermissaoDownload; set => _UserPermissaoDownload = value; }

        public override string ToString()
		{
			return UserNickName;

		}

		public string getNick() {
			string s = UserNickName.ToString();
			return s;
		}


	}


}

