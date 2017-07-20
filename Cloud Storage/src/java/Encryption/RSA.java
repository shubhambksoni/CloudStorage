package Encryption;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RDRL
 */

import java.math.BigInteger;
import java.security.SecureRandom;

public class RSA {
    private final static BigInteger one=new BigInteger("1");
    private final static SecureRandom random=new SecureRandom();
    
    private BigInteger privateKey;
    private BigInteger publicKey;
    private BigInteger modulus;
    
    RSA(int n){
        BigInteger p=BigInteger.probablePrime(n/2, random);
        BigInteger q=BigInteger.probablePrime(n/2, random);
        BigInteger phi=(p.subtract(one)).multiply(q.subtract(one));
        
        modulus=p.multiply(q);
        publicKey=new BigInteger("65537");
        privateKey=publicKey.modInverse(phi);
    }
    
    byte[] encrypt(byte[] message){
        BigInteger msg=new BigInteger(message);
        return msg.modPow(privateKey, modulus).toByteArray();
    }
    
    byte[] decrypt(byte[] message){
        BigInteger msg=new BigInteger(message);
        return msg.modPow(privateKey, modulus).toByteArray();
    }
}
