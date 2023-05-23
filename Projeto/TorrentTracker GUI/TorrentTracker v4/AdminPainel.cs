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
    public partial class AdminPainel : Form
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


        public void ShowComplexCompras()

        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.HistoricoCompras_Geral");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@ordenacao", 2);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {


                TorrentTracker.ComprasComplexas ct = new TorrentTracker.ComprasComplexas();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.UserNickName1 = reader["UserNickName"].ToString();   //standart stuff se tiveres a classe criada 
                ct.Nome1 = reader["Nome"].ToString();
                ct.PrecoPlano1 = reader["PrecoPlano"].ToString();
                ct.DataHoraCompra1 = reader["DataHoraCompra"].ToString();
                ct.DataHoraTermino1 = reader["DataHoraTermino"].ToString();



                listBox1.Items.Add(ct);

            }

        }



        public void ShowSimplesCompras()

        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.HistoricoCompras_Geral");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@ordenacao", 1);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {


                TorrentTracker.ComprasSimples ct = new TorrentTracker.ComprasSimples();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.UserNickName1 = reader["UserNickName"].ToString();   //standart stuff se tiveres a classe criada 
                ct.PrecoPlano1 = reader["Sumatorio_Preco"].ToString();
  



                listBox1.Items.Add(ct);

            }

        }





        public void ShowBalanco()

        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Compras_ValorTotal_Geral");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
          

            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {


                TorrentTracker.balancos ct = new TorrentTracker.balancos();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.Ganho1 = reader["Ganho Total (Euros)"].ToString();   //standart stuff se tiveres a classe criada 
                ct.NumeroCompras1 = reader["Número Compras"].ToString();




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
            cmd.Parameters.AddWithValue("@user_nick", textBox1.Text);


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




        public void ShowUserWarningHistory()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Historico_Avisos_User");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", textBox1.Text);


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



        public AdminPainel()
        {
            InitializeComponent();
        }

        public string GetLoginName { get; internal set; }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();


            if (checkBox1.Checked)
            {
                
                ShowComplexCompras();
            }

            else
            {
                ShowSimplesCompras();
            }


            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            ShowBalanco();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(textBox1.Text);

            listBox1.Items.Clear();
            ShowUserAwardHistory();

            if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Utilizador não tem prémios ");
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            ShowUserWarningHistory();


            if (listBox1.Items.Count.ToString() == "0")
            {
                listBox1.Items.Add("Utilizador não tem Avisos ");
            }
        }
    }
}
