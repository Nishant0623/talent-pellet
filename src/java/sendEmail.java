
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author HUDA
 */
public class sendEmail {
    public void email(String tomail,String subject,String randomNumber)
    {
         String toMail=tomail;
                 
        final String fromMail="choicestationary6@gmail.com";
        final String password="ryylmkmwiwvtpjcu";
        
        Properties properties=new Properties();
         properties.put("mail.smtp.host","smtp.gmail.com");
        
        properties.put("mail.smtp.port","587");





        
        properties.put("mail.smtp.auth","true");
         properties.put("mail.smtp.starttls.enable","true");
           properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
       
       
        Session session=Session.getDefaultInstance(properties,new javax.mail.Authenticator()
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(fromMail,password);
            }
        });
        
        MimeMessage message=new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(fromMail));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(toMail));
            /* Set the specified recipient type to the given addresses.*/
            message.setSubject(subject);
            message.setText(randomNumber);
            Transport.send(message);
            /*message sent to receipents specified in meesage */
            System.out.println("Succesfull");
        } catch (MessagingException ex) {
            System.out.println(ex);
            
        }
    }
     
}
