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
                System.Diagnostics.Debug.WriteLine("---------------------------------------------------------");

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


            //SqlCommand cmd = new SqlCommand("loginProcedure", cn);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Clear();
            //cmd.Parameters.AddWithValue("@utilizador", user.Text);
            //cmd.Parameters.AddWithValue("@password", password.Text);




            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                System.Diagnostics.Debug.WriteLine("--------------");
                System.Diagnostics.Debug.WriteLine(nickname);

                TorrentTracker.UserComents ct = new TorrentTracker.UserComents();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.UserNickName = reader["UserNickName"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Comentario = reader["ConteudoComentario"].ToString();
                ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();

                listBox1.Items.Add(ct);

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
    }
}
