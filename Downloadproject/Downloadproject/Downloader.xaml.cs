using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;
using System.Threading;
using System.Net;
using System.IO;

namespace Downloadproject
{
    /// <summary>
    /// Interaction logic for Downloader.xaml
    /// </summary>

    public partial class Downloader : UserControl
    {
        private BackgroundWorker bw;
        private BackgroundWorker bw2;
        private BackgroundWorker bw3;
        private BackgroundWorker bw4;
        public Uri fileurl;
        public String filename;
        String url;
        public enum WorkerState { Running,Paused };
        private WorkerState BWState1;
        private WorkerState BWState2;
        private WorkerState BWState3;
        private WorkerState BWState4;
        public RunWorkerCompletedEventHandler complete1;
        public RunWorkerCompletedEventHandler complete2;
        public RunWorkerCompletedEventHandler complete3;
        public RunWorkerCompletedEventHandler complete4;

        public Downloader()
        {

            InitializeComponent();
            bw = new BackgroundWorker();
            bw2 = new BackgroundWorker();
            bw3 = new BackgroundWorker();
            bw4 = new BackgroundWorker();
            BWState1 = WorkerState.Running;
            BWState2 = WorkerState.Running;
            BWState3 = WorkerState.Running;
            BWState4 = WorkerState.Running;
            RunWorkerCompletedEventHandler complete1 = null;
            RunWorkerCompletedEventHandler complete2 = null;
            RunWorkerCompletedEventHandler complete3 = null;
            RunWorkerCompletedEventHandler complete4 = null;

            


            bw.DoWork += (object senderbw1, DoWorkEventArgs ebw1) =>
            {
                String filename1 = filename;
                //Code for utilizing webrequests were used from this site. http://www.codeguru.com/columns/dotnettips/article.php/c7005/Downloading-Files-with-the-WebRequest-and-WebResponse-Classes.htm
                long bytesProcessed1 = 0;
                long sizeoffile1 = 0;
                Stream remoteStream1 = null;
                Stream localStream1 = null;
                WebResponse response1 = null;
                WebRequest request1 = WebRequest.Create(fileurl);
                response1 = request1.GetResponse();
                sizeoffile1 = response1.ContentLength;
                remoteStream1 = response1.GetResponseStream();
                localStream1 = File.Create(filename);
                byte[] buffer = new byte[2048];
                int bytesRead1;

                do
                {
                    while (BWState1 == WorkerState.Paused){
                        Thread.Sleep(5);}

                    bytesRead1 = remoteStream1.Read(buffer, 0, buffer.Length);
                    localStream1.Write(buffer, 0, bytesRead1);
                    bytesProcessed1 += bytesRead1;
                    //System.Console.WriteLine((int)(((double)bytesProcessed / (double)sizeoffile)*100));
                    bw.ReportProgress((int)(((double)bytesProcessed1 / (double)sizeoffile1) * 100));

                    if (bw.CancellationPending){
                        ebw1.Cancel = true;
                        bytesRead1 = 0;}
                } while (bytesRead1 > 0);

                ebw1.Result = filename1;
                response1.Close();
                remoteStream1.Close();
                localStream1.Close();
            };

            bw.WorkerReportsProgress = true;
            bw.WorkerSupportsCancellation = true;
            

            //Background Worker 2
            bw2.DoWork += (object senderbw2, DoWorkEventArgs ebw2) =>
            {
                String filename2 = filename;
                //Code for utilizing webrequests were used from this site. http://www.codeguru.com/columns/dotnettips/article.php/c7005/Downloading-Files-with-the-WebRequest-and-WebResponse-Classes.htm
                long bytesProcessed2 = 0;
                long sizeoffile2 = 0;
                Stream remoteStream2 = null;
                Stream localStream2 = null;
                WebResponse response2 = null;
                WebRequest request2 = WebRequest.Create(fileurl);
                response2 = request2.GetResponse();
                sizeoffile2 = response2.ContentLength;
                remoteStream2 = response2.GetResponseStream();
                localStream2 = File.Create(filename);
                byte[] buffer2 = new byte[2048];
                int bytesRead2;

                do
                {
                    while (BWState2 == WorkerState.Paused){
                        Thread.Sleep(5);}

                    bytesRead2 = remoteStream2.Read(buffer2, 0, buffer2.Length);
                    localStream2.Write(buffer2, 0, bytesRead2);
                    bytesProcessed2 += bytesRead2;
                    //System.Console.WriteLine((int)(((double)bytesProcessed / (double)sizeoffile)*100));
                    bw2.ReportProgress((int)(((double)bytesProcessed2 / (double)sizeoffile2) * 100));

                    if (bw2.CancellationPending){
                        ebw2.Cancel = true;
                        bytesRead2 = 0;}
                } while (bytesRead2 > 0);

                ebw2.Result = filename2;
                response2.Close();
                remoteStream2.Close();
                localStream2.Close();
            };

            bw2.WorkerReportsProgress = true;
            bw2.WorkerSupportsCancellation = true;

            bw3.DoWork += (object senderbw3, DoWorkEventArgs ebw3) =>
            {
                String filename3 = filename;
                //Code for utilizing webrequests were used from this site. http://www.codeguru.com/columns/dotnettips/article.php/c7005/Downloading-Files-with-the-WebRequest-and-WebResponse-Classes.htm
                long bytesProcessed3 = 0;
                long sizeoffile3 = 0;
                Stream remoteStream3 = null;
                Stream localStream3 = null;
                WebResponse response3 = null;
                WebRequest request3 = WebRequest.Create(fileurl);
                response3 = request3.GetResponse();
                sizeoffile3 = response3.ContentLength;
                remoteStream3 = response3.GetResponseStream();
                localStream3 = File.Create(filename);
                byte[] buffer3 = new byte[2048];
                int bytesRead3;

                do
                {
                    while (BWState3 == WorkerState.Paused){
                        Thread.Sleep(5);}

                    bytesRead3 = remoteStream3.Read(buffer3, 0, buffer3.Length);
                    localStream3.Write(buffer3, 0, bytesRead3);
                    bytesProcessed3 += bytesRead3;
                    //System.Console.WriteLine((int)(((double)bytesProcessed / (double)sizeoffile)*100));
                    bw3.ReportProgress((int)(((double)bytesProcessed3 / (double)sizeoffile3) * 100));

                    if (bw3.CancellationPending){
                        ebw3.Cancel = true;
                        bytesRead3 = 0;}
                } while (bytesRead3 > 0);

                ebw3.Result = filename3;
                response3.Close();
                remoteStream3.Close();
                localStream3.Close();
            };
           
            bw3.WorkerReportsProgress = true;
            bw3.WorkerSupportsCancellation = true;

            bw4.DoWork += (object senderbw4, DoWorkEventArgs ebw4) =>
            {
                String filename4 = filename;
                //Code for utilizing webrequests were used from this site. http://www.codeguru.com/columns/dotnettips/article.php/c7005/Downloading-Files-with-the-WebRequest-and-WebResponse-Classes.htm
                long bytesProcessed4 = 0;
                long sizeoffile4 = 0;
                Stream remoteStream4 = null;
                Stream localStream4 = null;
                WebResponse response4 = null;
                WebRequest request4 = WebRequest.Create(fileurl);
                response4 = request4.GetResponse();
                sizeoffile4 = response4.ContentLength;
                remoteStream4 = response4.GetResponseStream();
                localStream4 = File.Create(filename);
                byte[] buffer4 = new byte[2048];
                int bytesRead4;

                do
                {
                    while (BWState4 == WorkerState.Paused){
                        Thread.Sleep(5);}

                    bytesRead4 = remoteStream4.Read(buffer4, 0, buffer4.Length);
                    localStream4.Write(buffer4, 0, bytesRead4);
                    bytesProcessed4 += bytesRead4;
                    //System.Console.WriteLine((int)(((double)bytesProcessed / (double)sizeoffile)*100));
                    bw4.ReportProgress((int)(((double)bytesProcessed4 / (double)sizeoffile4) * 100));

                    if (bw4.CancellationPending){
                        ebw4.Cancel = true;
                        bytesRead4 = 0;}
                } while (bytesRead4 > 0);

                ebw4.Result = filename4;
                response4.Close();
                remoteStream4.Close();
                localStream4.Close();
            };

            bw4.WorkerReportsProgress = true;
            bw4.WorkerSupportsCancellation = true;
        }
        

        //Handler for all downloads
        private void HandlerDownloadStart(object sender, RoutedEventArgs e)
        {
            if ((Inputtext.Text).Equals(""))
            {
                MessageBox.Show("The input is empty", "Url Input Error!", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                url = Inputtext.Text;
                try
                {
                    fileurl = new Uri(url);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("The input for the Url is not valid", "Download Error!", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

                Microsoft.Win32.SaveFileDialog download = new Microsoft.Win32.SaveFileDialog();
                download.FileName = "";
                download.DefaultExt = "";
                WebClient webc = new System.Net.WebClient();

                try
                {
                    download.FileName = System.IO.Path.GetFileName(fileurl.LocalPath);
                    webc.Dispose();
                    Nullable<bool> result = download.ShowDialog();
                    if (result == true)
                        {
                        filename = download.FileName;

                        if (!bw.IsBusy)
                        {

                            Downloadcontrol a = new Downloadcontrol();
                            Downloadpanal.Children.Add(a);

                            a.setState(1);
                            a.progress.Value = 0;
                            a.Downloaditemname.Content = "Downloading: " + fileurl;
                            a.PauseRequested += (object sendera_1, RoutedEventArgs ea_1) => { BWState1 = WorkerState.Paused; a.setState(2); };
                            a.UnpauseRequested += (object sendera_2, RoutedEventArgs ea_2) => { BWState1 = WorkerState.Running; a.setState(1); };
                            a.CancelRequested += (object sendera_3, RoutedEventArgs ea_3) => { bw.CancelAsync(); };
                            bw.ProgressChanged += (object sendera_4, ProgressChangedEventArgs ea_4) => { a.progress.Value = (Double)ea_4.ProgressPercentage; };
                            complete1 = (object sendera_5, RunWorkerCompletedEventArgs ea_5) =>
                            {
                                if (ea_5.Cancelled)
                                {
                                    Downloadpanal.Children.Remove(a);
                                    MessageBox.Show("Download Cancelled: ", "Download Message!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                                }
                                else
                                {
                                    Downloadpanal.Children.Remove(a);
                                    MessageBox.Show("Download Complete: " + ea_5.Result, "Download Message!", MessageBoxButton.OK, MessageBoxImage.Information);
                                }
                                bw.RunWorkerCompleted -= complete1;
                            };
                            bw.RunWorkerCompleted += complete1;
                            bw.RunWorkerAsync();

                        }

                        else if (!bw2.IsBusy)
                        {
                            Downloadcontrol a2 = new Downloadcontrol();
                            Downloadpanal.Children.Add(a2);

                            a2.setState(1);
                            a2.progress.Value = 0;
                            a2.Downloaditemname.Content = "Downloading: " + fileurl;
                            a2.PauseRequested += (object sendera2_1, RoutedEventArgs ea2_1) => { BWState2 = WorkerState.Paused; a2.setState(2); };
                            a2.UnpauseRequested += (object sendera2_2, RoutedEventArgs ea2_2) => { BWState2 = WorkerState.Running; a2.setState(1); };
                            a2.CancelRequested += (object sendera2_3, RoutedEventArgs ea2_3) => { bw2.CancelAsync(); };

                            bw2.ProgressChanged += (object sendera2_4, ProgressChangedEventArgs ea2_4) => { a2.progress.Value = (Double)ea2_4.ProgressPercentage; };
                            complete2 = (object sendera2_5, RunWorkerCompletedEventArgs ea2_5) =>
                            {
                                if (ea2_5.Cancelled)
                                {
                                    Downloadpanal.Children.Remove(a2);
                                    MessageBox.Show("Download Cancelled: ", "Download Message!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                                }
                                else
                                {
                                    Downloadpanal.Children.Remove(a2);
                                    MessageBox.Show("Download Complete: ", "Download Message!" + ea2_5.Result, MessageBoxButton.OK, MessageBoxImage.Information);
                                }
                                bw2.RunWorkerCompleted -= complete2;
                            }; bw2.RunWorkerAsync();
                            bw2.RunWorkerCompleted += complete2;
                        }

                        else if (!bw3.IsBusy)
                        {
                            Downloadcontrol a3 = new Downloadcontrol();
                            Downloadpanal.Children.Add(a3);

                            a3.setState(1);
                            a3.progress.Value = 0;
                            a3.Downloaditemname.Content = "Downloading: " + fileurl;
                            a3.PauseRequested += (object sendera3_1, RoutedEventArgs ea3_1) => { BWState3 = WorkerState.Paused; a3.setState(2); };
                            a3.UnpauseRequested += (object sendera3_2, RoutedEventArgs ea3_2) => { BWState3 = WorkerState.Running; a3.setState(1); };
                            a3.CancelRequested += (object sendera3_3, RoutedEventArgs ea3_3) => { bw3.CancelAsync(); };

                            bw3.ProgressChanged += (object sendera3_4, ProgressChangedEventArgs ea3_4) => { a3.progress.Value = (Double)ea3_4.ProgressPercentage; };
                            complete3 = (object sendera3_5, RunWorkerCompletedEventArgs ea3_5) =>
                            {

                                if (ea3_5.Cancelled)
                                {
                                    Downloadpanal.Children.Remove(a3);
                                    MessageBox.Show("Download Cancelled: ", "Download Message!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                                }
                                else
                                {
                                    Downloadpanal.Children.Remove(a3);
                                    MessageBox.Show("Download Complete: ", "Download Message!" + ea3_5.Result, MessageBoxButton.OK, MessageBoxImage.Information);
                                }
                                bw3.RunWorkerCompleted -= complete3;
                            }; bw3.RunWorkerAsync();
                            bw3.RunWorkerCompleted += complete3;
                        }


                        else if (!bw4.IsBusy)
                        {
                            Downloadcontrol a4 = new Downloadcontrol();
                            Downloadpanal.Children.Add(a4);

                            a4.setState(1);
                            a4.progress.Value = 0;
                            a4.Downloaditemname.Content = "Downloading: " + fileurl;
                            a4.PauseRequested += (object sendera4_1, RoutedEventArgs ea4_1) => { BWState4 = WorkerState.Paused; a4.setState(2); };
                            a4.UnpauseRequested += (object sendera4_2, RoutedEventArgs ea4_2) => { BWState4 = WorkerState.Running; a4.setState(1); };
                            a4.CancelRequested += (object sendera4_3, RoutedEventArgs ea4_3) => { bw4.CancelAsync(); };

                            bw4.ProgressChanged += (object sendera4_4, ProgressChangedEventArgs ea4_4) => { a4.progress.Value = (Double)ea4_4.ProgressPercentage; };
                            complete4 = (object sendera4_5, RunWorkerCompletedEventArgs ea4_5) =>
                            {

                                if (ea4_5.Cancelled)
                                {
                                    Downloadpanal.Children.Remove(a4);
                                    MessageBox.Show("Download Cancelled: ", "Download Message!", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                                }
                                else
                                {
                                    Downloadpanal.Children.Remove(a4);
                                    MessageBox.Show("Download Complete: ", "Download Message!" + ea4_5.Result, MessageBoxButton.OK, MessageBoxImage.Information);
                                }
                                bw4.RunWorkerCompleted -= complete4;
                            }; bw4.RunWorkerAsync();
                            bw4.RunWorkerCompleted += complete4;
                        }

                        else
                        {
                            MessageBox.Show("There are no downloaders availiable for use. Please wait.", "Download Error!", MessageBoxButton.OK, MessageBoxImage.Warning);
                        }

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("The input for the Url does not link to a valid site", "Download Error!", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

            }
        }

      
    }
}

