package gx.util;

import java.io.IOException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class RSACoder {
  private static final Logger logger = LoggerFactory.getLogger(RSACoder.class);
  private static final String PRIVATE_KEY;
  public static final String PUBLIC_KEY;
  public static final String KEY_ALGORITHM = "RSA";

  static {
    KeyPairGenerator keyPairGen = null;
    try {
      keyPairGen = KeyPairGenerator.getInstance(KEY_ALGORITHM);
    } catch (NoSuchAlgorithmException e) {
      logger.error("创建密钥失败", e);
    }
    keyPairGen.initialize(1024);

    KeyPair keyPair = keyPairGen.generateKeyPair();
 // 公钥
    RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
    PUBLIC_KEY = encryptBASE64(publicKey.getEncoded());
    // 私钥
    RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
    PRIVATE_KEY = encryptBASE64(privateKey.getEncoded());
  }

  /**
   * 私钥解密
   * 
   * @param data
   * @return
   */
  public static byte[] decryptByPrivateKey(byte[] data) {
    byte[] result = null;
    try {
      byte[] keyBytes = decryptBASE64(PRIVATE_KEY);
      PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
      KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
      Key privateKey = keyFactory.generatePrivate(pkcs8KeySpec);

      Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
      cipher.init(Cipher.DECRYPT_MODE, privateKey);
      result = cipher.doFinal(data);
    } catch (Exception e) {
      logger.error("解密失败", e);
    }
    return result;
  }

  /**
   * 私钥解密
   * 
   * @param data
   * @return
   */
  public static byte[] encryptByPublicKey(byte[] data) {
    byte[] result = null;
    try {
      byte[] keyBytes = decryptBASE64(PUBLIC_KEY);
      X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
      KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
      Key publicKey = keyFactory.generatePublic(x509KeySpec);

      Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
      cipher.init(Cipher.ENCRYPT_MODE, publicKey);
      result = cipher.doFinal(data);
    } catch (Exception e) {
      logger.error("解密失败", e);
    }
    return result;
  }

  public static byte[] decryptBASE64(String key) throws IOException {
    return new BASE64Decoder().decodeBuffer(key);
  }

  public static String encryptBASE64(byte[] bytes) {
    return new BASE64Encoder().encodeBuffer(bytes);
  }
}
