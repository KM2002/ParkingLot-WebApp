using System;
using Google.Protobuf;
using System.Net;
using System.Net.Mail;
using System.Xml.Linq;
using ParkingLot.Entities.Data;
using ParkingLot.Entities.Interfaces;
using Microsoft.Extensions.Configuration;

namespace ParkingLot.Entities.Bll
{
	public class EmailServiceBll:IEmailService
	{
        private readonly IEmailConfiguration _emailConfig;

        public EmailServiceBll(IEmailConfiguration emailConfig)
		{
            _emailConfig = emailConfig;
		}

        

        public string SendEmail(string name, string email, string subject, string message)
		{
            string myEmail = _emailConfig.myEmail;
            string myPassword = _emailConfig.myPassword;
            MailMessage mail = new MailMessage(myEmail, email);
            mail.Subject = subject;
            mail.Body = "From " + name + " " + " " + message;

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); // Replace with your SMTP server and port
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(myEmail, myPassword);

            try
            {
                // Send the email
               smtpClient.Send(mail);
                return "success";
            }
            catch (SmtpException ex)
            {
                // Handle any exceptions or errors that occur during sending
                return "Error: " + ex.Message;
            }
        }
	}
}

