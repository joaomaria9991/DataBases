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
    public partial class TorrentSpecific : Form
    {

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection(@"Data Source = tcp:mednat.ieeta.pt\SQLSERVER,8101 ; " + "Initial Catalog = p4g7 ; uid = p4g7 ; " + "password = 123AB@-=:");

        }


        public bool verifySGBDConnection(SqlConnection cn)
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        public TorrentSpecific()
        {
            InitializeComponent();
        }

        public static string GetID { get; internal set; }
        public string GetLoginName { get; internal set; }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
           String ID = GetID;
            System.Diagnostics.Debug.WriteLine(ID);
        }


        public void ShowComments()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentComents", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID_ContentTorrent", GetID);
            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
            listBox1.Items.Clear();                       //limpar a lista para não ficar cheia de lixo
            TorrentComments ct = new TorrentComments();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {

                ct.Comentarios1 = reader["ConteudoComentario"].ToString();   //standart stuff se tiveres a classe criada 
                ct.UserNickName1 = reader["UserNickName"].ToString();


                listBox1.Items.Add(ct); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
            }
        }


        public void ShowLeech()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Torrent_leechers");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String leech = GetID;
            cmd.Parameters.AddWithValue("@id_torrent", GetID);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                textBox2.Text += ct.NomeContentTorrent.ToString();
            }

        }


        public void ShowSeed()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Torrent_Seeders");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String leech = GetID;
            cmd.Parameters.AddWithValue("@id_torrent", GetID);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                textBox3.Text += ct.NomeContentTorrent.ToString();
            }

        }



        public void ShowContentTorrent()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand();        //novo comando que acede à BD
            cmd.CommandText = "SELECT * FROM TorrentTracker.ContentTorrent"; //trocar por sp
            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.Parameters.Clear();


            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
                             //limpar a lista para não ficar cheia de lixo
            ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                //ct.ID_ContentTorrent = reader["ID_ContentTorrent"].ToString();
                ct.Tamanho = reader["Tamanho"].ToString();
                ct.DataHoraAdicao = reader["DataHoraAdicao"].ToString();
                //ct.NFO = reader["NFO"].ToString();
                //ct.Descricao = reader["Descricao"].ToString();
                ct.FreeLeechDataHoraLimite = reader["FreeleeechDataHoraLimite"].ToString();


                textBox1.Text = ct.NomeContentTorrent.ToString();
                textBox4.Text = ct.DataHoraAdicao.ToString();
                textBox5.Text = ct.Tamanho.ToString();
                textBox6.Text = ct.FreeLeechDataHoraLimite.ToString();


            }

        }




        private void TorrentSpecific_Load(object sender, EventArgs e)
        {
            ShowContentTorrent();
            ShowComments();
            ShowLeech();
            ShowSeed();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
