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
    public partial class Registo : Form
    {
        public string loginname;



        public SqlConnection cn;

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


        public void loadWarnings()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Make_Temp_Tables");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


        }




        public void newPirate()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Registar_User");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_pass ", textBox1.Text);
            cmd.Parameters.AddWithValue("@user_mail ", textBox2.Text);
            cmd.Parameters.AddWithValue("@user_nick ", textBox3.Text);
            cmd.Parameters.AddWithValue("@user_ip ", textBox4.Text);
            cmd.Parameters.AddWithValue("@user_program ", textBox5.Text);
            cmd.Parameters.AddWithValue("@id_convite ", textBox6.Text);



            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

        }


        public void login()
        {


            loadWarnings();
            if (!verifySGBDConnection(cn)) { return; }

            SqlCommand cmd = new SqlCommand("TorrentTracker.LoginProcedure");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@utilizador", textBox3.Text);
            cmd.Parameters.AddWithValue("@password", textBox1.Text);

            SqlDataReader reader = cmd.ExecuteReader();
            int counter = 0;
            string name_to_find = "";


            while (reader.Read())
            {
                counter++;
                name_to_find = reader["UserNickName"].ToString();

             }
           
            if (counter == 1)
            {
                string message = "Bem Vindo";
                string caption = "Nice!";
                MessageBoxButtons buttons = MessageBoxButtons.OK;
                DialogResult result;

                result = MessageBox.Show(message, caption, buttons);

            if (result == System.Windows.Forms.DialogResult.OK)
                {
                    Main mainForm = new Main();
                    mainForm.GetLoginName = loginname;
                    mainForm.Show();
                    this.Hide();
                }
            }


        }

        public Registo()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            newPirate();
            //login();




        }





  

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void Registo_Load(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            loginname = textBox3.Text;
        }
    }
}
