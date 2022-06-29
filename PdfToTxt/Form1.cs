using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace PdfToTxt
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            button2.Enabled = false;
            progressBar1.Visible = false;
            label2.Visible = false;
           
        }
        string path;
        int count = 0;
        List<string> filePaths;
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                count = 0;
                OpenFileDialog op1 = new OpenFileDialog();
            op1.Multiselect = true;
                op1.Filter = "allfiles|*.pdf";
                op1.ShowDialog();
                string[] FName;
                filePaths = new List<string>();
                op1.FileNames.ToList().ForEach(file =>
                    
                {
                        filePaths.Add(file);
                        listBox1.Items.Add(count+1 +"  "+ file);
                        count++;
                }

                );
                progressBar1.Visible = true;
                label2.Visible = true;
               // label2.Text = "Done: 0 of " + count;
                MessageBox.Show(Convert.ToString(count) + " File(s) copied");
                button2.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
           
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                
                button1.Enabled = false;
                button2.Enabled = false;
                button3.Enabled = false;
                int done = 0;
              
                foreach (var path in filePaths)
                {
                    SautinSoft.PdfFocus f = new SautinSoft.PdfFocus();
                    string dir = Path.Combine(System.IO.Path.GetDirectoryName(Application.ExecutablePath), "ConvertedFiles");
                    
                    // If directory does not exist, create it
                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }
                    String filename = Path.GetFileName(path);
                    filename = Path.ChangeExtension(filename, ".txt");
                    byte[] pdf = File.ReadAllBytes(path);
                    f.OpenPdf(pdf);
                    if (f.PageCount > 0)
                    {
                        string text = f.ToText();
                        // richTextBox1.Text = text;
                        File.WriteAllText(Path.Combine(dir,filename), text);
                    
                    }
                    done = done+1;
                    incrementlabel(done);
 
                    incrementProgress(done);
                }
                button3.Enabled = true;
                MessageBox.Show("Successfully Converted "+count+" files");
              
            }
            catch (Exception)
            {
                MessageBox.Show("Contact To Developer");
                throw;
            }
           
        }

        public void incrementProgress(int done)
        {
            double percent = ((done * 100) / count);
          //  label2.Text = "Done: " + percent +" of " + count;
           // Thread.Sleep(30);
            progressBar1.Value =(int)(Convert.ToInt32(percent));
            

        }
        public void incrementlabel(int done)
        {
           // MessageBox.Show(" " +done);
            label2.Text = "Done: " + done + " of " + count;
            //Thread t = new Thread(new ThreadStart(change));
            //t.Start();
            //Thread.Sleep(3000);
            //t.Abort();
            


        }
        public void clear()
        {
           // richTextBox1.Text = "";
            path = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            button1.Enabled = true;
            button2.Enabled = true;
            progressBar1.Visible = false;
            label2.Visible = false;
            listBox1.Items.Clear();
            path = "";
            count = 0;
            filePaths = new List<string>();
        }
    }
}
