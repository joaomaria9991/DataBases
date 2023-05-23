using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;




namespace TorrentTracker
{
    public partial class Profile : Form
    {

        public string GetLoginName
        {
            get;
            set;
        }


        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection(@"Data Source = tcp:mednat.ieeta.pt\SQLSERVER,8101 ; " + "Initial Catalog = p4g7 ; uid = p4g7 ; " + "password = 123AB@-=:");
        }

        public void ShowUtilizador()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand();        //novo comando que acede à BD
            cmd.CommandText = "SELECT * FROM TorrentTracker.Utilizador WHERE UserNickName =  @nickname" ; //trocar por sp
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@nickname", nickname);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {

                TorrentUtilizador.Utilizador ct = new TorrentUtilizador.Utilizador();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.UserNickName = reader["UserNickName"].ToString();   //standart stuff se tiveres a classe criada 
                ct.UserEmail = reader["UserEMail"].ToString();
                ct.UserDataRegisto = reader["UserDataRegisto"].ToString();
                //ct.UserDataRegisto = reader["DataHoraAdicao"].ToString();
                ct.UserPermissaoDownload = reader["UserPermissaoDownload"].ToString();


                textBox1.Text+=ct.UserNickName.ToString(); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
                textBox2.Text += ct.UserEmail.ToString(); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
                textBox4.Text += ct.UserDataRegisto.ToString(); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
                textBox6.Text += ct.UserPermissaoDownload.ToString(); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent



            }

        }
        public bool verifySGBDConnection(SqlConnection cn)
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }


        public void ShowRole()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.UserRole");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                role.Text += ct.NomeContentTorrent.ToString();
            }

        }



        public void ShowUserComents()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("UserComents");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@UserNickName", nickname);
            System.Diagnostics.Debug.WriteLine(nickname);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
    

                TorrentTracker.UserComents ct = new TorrentTracker.UserComents();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.UserNickName = reader["UserNickName"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Comentario = reader["ConteudoComentario"].ToString();
                ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();

                listBox1.Items.Add(ct);

            }

        }

        public void ShowConvitesAvailable()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.User_CovitesNumDisponivel");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                nConvites.Text += ct.NomeContentTorrent.ToString();
            }

        }


        public void ShowUserPurchaseHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.HsitoricoCompras_User");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.compra ct = new TorrentTracker.compra();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.Nome1 = reader["Nome"].ToString();   //standart stuff se tiveres a classe criada 
                ct.DataHoraCompra1 = reader["DataHoraCompra"].ToString();
                ct.DataHoraTermino1 = reader["DataHoraTermino"].ToString();
                ct.DiasRestantes1 = reader["Dias Restantes"].ToString();

                listBox1.Items.Add(ct);
            }

        }


        public void ShowUserWarningHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Historico_Avisos_User");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.Aviso ct = new TorrentTracker.Aviso();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.Nome1 = reader["Nome"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Dataa1 = reader["Dataa"].ToString();

             


                listBox1.Items.Add(ct);
            }

        }


        public void ShowUserAwardHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.PremiosSpecificUser");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.PremioData ct = new TorrentTracker.PremioData();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.Nome1 = reader["Nome"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Design1 = reader["Design"].ToString();
                ct.Dataa1 = reader["Dataa"].ToString();
                ct.NomeE1 = reader["NomeE"].ToString();

                listBox1.Items.Add(ct);




            }

        }


        public void ShowUserUploadHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Historico_Uploads");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.DownloadData ct = new TorrentTracker.DownloadData();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent1 = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Tamanho1 = reader["Tamanho"].ToString();
                ct.DataHoraAdicao1 = reader["DataHoraAdicao"].ToString();


                listBox1.Items.Add(ct);




            }

        }

        public void ShowUserDownloadHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Historico_Downloads");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.UploadData ct = new TorrentTracker.UploadData();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent1 = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Tamanho1 = reader["Tamanho"].ToString();
                ct.DataHoraAdicao1 = reader["DataHoraAdicao"].ToString();
                ct.Grupo1 = reader["Grupo"].ToString();


                listBox1.Items.Add(ct);

            }

        }



        public void ShowRatio()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Racio_User");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.UploadData ct = new TorrentTracker.UploadData();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent1 = reader["return value"].ToString();   //standart stuff se tiveres a classe criada 

                ratio.Text = ct.NomeContentTorrent1.ToString();

            }


        }


        public Profile()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        public static implicit operator Profile(Main v)
        {
            throw new NotImplementedException();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Profile_Load(object sender, EventArgs e)
        {
            ShowUtilizador();
            ShowUserComents();
            ShowConvitesAvailable();
            ShowRole();
            ShowRatio();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            ConvitesEnviados ConvitesEnviadosPage = new ConvitesEnviados();
            ConvitesEnviadosPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            ConvitesEnviadosPage.Show();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            EnviarConvite EnviarConvitePage = new EnviarConvite();
            EnviarConvitePage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            EnviarConvitePage.Show();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserPurchaseHistory();


            //HistoricoCompras HistoricoComprasPage = new HistoricoCompras();
            //HistoricoComprasPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            //HistoricoComprasPage.Show();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserComents();

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserWarningHistory();
            if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Não tem Cadastro");
            }


        }

        private void rewards_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserAwardHistory();
                if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Não tem Prémios");
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserUploadHistory();
          if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Ainda não fez nenhum upload");
            }

        }

        private void button8_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            ShowUserDownloadHistory();

         if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Ainda não fez nenhum Download");
            }

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }
    }
    
}
