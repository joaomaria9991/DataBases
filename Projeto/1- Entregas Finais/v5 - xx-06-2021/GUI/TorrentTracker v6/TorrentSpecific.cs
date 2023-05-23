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

        String type_content;

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

    

            SqlCommand cmd = new SqlCommand("IdToName");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID_ContentTorrent", GetID);



            cmd.Connection = cn;   //esta não percebo bem, mas funcionar




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
                //textBox6.Text = ct.FreeLeechDataHoraLimite.ToString();


            }

        }


        public void ShowContentTorrentIMDB()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;



            SqlCommand cmd = new SqlCommand("TorrentTracker.IMDB");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id_torrent", GetID);



            cmd.Connection = cn;   




            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
                                                          //limpar a lista para não ficar cheia de lixo
            progdata ct = new progdata();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.IMDB_Nome1 = reader["IMDB_Nome"].ToString();   //standart stuff se tiveres a classe criada 
                ct.IMDB_Ano1 = reader["IMDB_Ano"].ToString();
                ct.IMDB_Classificacao1 = reader["IMDB_Classificacao"].ToString();
                ct.IMDB_Sinopse1 = reader["ReleaseType"].ToString();
                ct.Episodio1 = reader["Episodio"].ToString();
                ct.Temporada1 = reader["Temporada"].ToString();




                serie2.Text = ct.IMDB_Nome1.ToString();
                serie3.Text = ct.IMDB_Ano1.ToString();
                serie4.Text = ct.IMDB_Classificacao1.ToString();
                serie10.Text = ct.IMDB_Sinopse1.ToString();

                t1.Text = ct.Episodio1.ToString();
                ep1.Text = ct.Temporada1.ToString();




            }

        }


        public void ShowType()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.CategoriaTorrent");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id_torrent", GetID);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                TorrentTracker.UploadData ct = new TorrentTracker.UploadData();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent1 = reader["return value"].ToString();   //standart stuff se tiveres a classe criada 

                serie1.Text = ct.NomeContentTorrent1.ToString();
                String type_content= serie1.Text;

            }


        }


        public void ShowContentTorrentProg()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;



            SqlCommand cmd = new SqlCommand("TorrentTracker.Info_Programs_Game");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id_torrent", GetID);

            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
                                                          //limpar a lista para não ficar cheia de lixo
            imdb ct = new imdb();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.NomeGame1 = reader["NomeProgram"].ToString();   //standart stuff se tiveres a classe criada 
                ct.OS1 = reader["OS"].ToString();



                progname1.Text = ct.NomeGame1.ToString();
                os1.Text = ct.OS1.ToString();

            }

        }



        public void ShowContentTorrentGame()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;



            SqlCommand cmd = new SqlCommand("TorrentTracker.Info_Programs_Game");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id_torrent", GetID);

            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
                                                          //limpar a lista para não ficar cheia de lixo
            imdb ct = new imdb();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.NomeGame1 = reader["NomeGame"].ToString();   //standart stuff se tiveres a classe criada 
                ct.OS1 = reader["OS"].ToString();



                progname1.Text = ct.NomeGame1.ToString();
                os1.Text = ct.OS1.ToString();

            }

        }



        private void TorrentSpecific_Load(object sender, EventArgs e)
        {



            ShowContentTorrent();
            ShowComments();
            ShowLeech();
            ShowSeed();
            ShowType();

           // System.Diagnostics.Debug.WriteLine("------------------");

            //System.Diagnostics.Debug.WriteLine(serie1.Text);

            if(serie1.Text == "Program" )
            {
                ShowContentTorrentProg();
                serie1.Hide();
                serie2.Hide();
                serie3.Hide();
                serie4.Hide();
                serie5.Hide();
                serie6.Hide();
                serie7.Hide();
                serie8.Hide();
                serie9.Hide();
                serie10.Hide();


                t.Hide();
                t1.Hide();

                ep.Hide();
                ep1.Hide();


            }


            if (serie1.Text == "Game" )
            {
                ShowContentTorrentGame();
                serie1.Hide();
                serie2.Hide();
                serie3.Hide();
                serie4.Hide();
                serie5.Hide();
                serie6.Hide();
                serie7.Hide();
                serie8.Hide();
                serie9.Hide();
                serie10.Hide();


                t.Hide();
                t1.Hide();

                ep.Hide();
                ep1.Hide();


            }







            if (serie1.Text == "Movie" )
            {
                ShowContentTorrentIMDB();
                serie9.Hide();
                serie10.Hide();

                os.Hide();
                os1.Hide();

                t.Hide();
                t1.Hide();

                ep.Hide();
                ep1.Hide();
                progname.Hide();
                progname1.Hide();

            }

            if (serie1.Text == "Serie")
            {
                ShowContentTorrentIMDB();
                os.Hide();
                os1.Hide();
                progname.Hide();
                progname1.Hide();
            }


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

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void serie10_TextChanged(object sender, EventArgs e)
        {

        }

        private void serie5_Click(object sender, EventArgs e)
        {

        }
    }
}
