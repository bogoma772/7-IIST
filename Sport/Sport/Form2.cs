using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sport
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            comboBox1.Items.Add( "Yes / No");
            comboBox1.Items.Add("Другое");
            comboBox1.Text = comboBox1.Items[0].ToString();
            panel5.Visible = false;
            panel6.Visible = false;
            panel7.Visible = false;
            panel8.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel7.Visible = true;
            textBox4.Clear();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            panel8.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel8.Visible = true;
            textBox5.Clear();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            panel7.Visible = false;
            panel8.Visible = false;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.Text == comboBox1.Items[1].ToString())
            {
                panel5.Visible = true;
                panel6.Visible = true;
                textBox2.Clear();
                textBox3.Clear();
            }
            else
            {
                panel5.Visible = false;
                panel6.Visible = false;
            }
        }
    }
}
