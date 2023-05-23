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
    public partial class Loja : Form
    {

        public String text = "";
        public String planoID = "";

        public string GetLoginName { get; internal set; }

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



        public void ShowPlan()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.PlanosView");       
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();



            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {


                TorrentTracker.Plano ct = new TorrentTracker.Plano();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.Nome1 = reader["Nome"].ToString();   //standart stuff se tiveres a classe criada 
                ct.DescricaoPlano1 = reader["DescricaoPlano"].ToString();
                ct.Preco1 = reader["PrecoPlano"].ToString();


                listBox1.Items.Add(ct);

            }

        }


        public void ShowUserPurchaseHistoryPlan()
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

                //listBox1.Items.Add(ct);
                adquirido.Text = ct.Nome1;
            }

        }



        public Loja()
        {
            InitializeComponent();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.text = listBox1.GetItemText(listBox1.SelectedItem);
            string S = text;
            System.Diagnostics.Debug.WriteLine(planoID);

            if (listBox1.Items[0].ToString() == S)
            {
                planoID = "VIP 1";
            }

            if (listBox1.Items[1].ToString() == S)
            {
                planoID = "VIP 2";
            }
            if (listBox1.Items[2].ToString() == S)
            {
                planoID = "VIP 3";
            }
            if (listBox1.Items[3].ToString() == S)
            {
                planoID = "VIP 4";
            }

            selected.Text = planoID;



        }

        private void Loja_Load(object sender, EventArgs e)
        {
            ShowPlan();
            ShowUserPurchaseHistoryPlan();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
