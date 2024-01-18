
import java.util.Random;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author HUDA
 */
public class OTPgenerator {
    public String otp()
    {
               
           Random r = new Random();
String randomNumber = String.format("%04d", r.nextInt(1001));
return randomNumber;
    }
}
