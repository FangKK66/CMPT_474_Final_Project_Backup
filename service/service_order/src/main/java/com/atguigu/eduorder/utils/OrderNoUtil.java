package com.atguigu.eduorder.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

import javax.crypto.*;
import javax.crypto.spec.DESKeySpec;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Locale;
import java.util.Random;

import static org.apache.commons.codec.binary.Hex.decodeHex;

// 全局唯一id生成工具类

@Slf4j
public class OrderNoUtil {
    static String baseNumLetter = "0123456789ABCDEFGHJKLMNOPQRSTUVWXYZ";

    private static final String data = "a81dfab773f05633e755ce05af7347b130b0ac544b053889e04b1e195864d15bBA";

    /** 获取机器名 */
    public static final String getHostName() {
        String hostName = "";
        try {
            hostName = InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            log.error(e.getMessage(), e);
        }
        return hostName;
    }

    /** 获取网卡序列号 */
    public static final String getDUID() {
        String address = "";
        String command = "cmd.exe /c ipconfig /all";
        try {
            Process p = Runtime.getRuntime().exec(command);
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line;
            while ((line = br.readLine()) != null) {
                if (line.indexOf("DUID") > 0) {
                    int index = line.indexOf(":");
                    index += 2;
                    address = line.substring(index);
                    break;
                }
            }
            br.close();
        } catch (IOException ignored) {
        }
        return address.replaceAll("-","").substring(0,20);
    }

    public static String randomSort(String str){
        char[] arr=str.toCharArray();
        Random r = new Random();//创建随机数对象
        for (int i = 0; i < arr.length; i++) {//打乱顺序的原理是第i个数组元素与随机出来的0-4小标的元素进行互换位置
            int r1 = r.nextInt(arr.length);//将随机出来的数存入r1中//这里括号里不用具体数值，就是为了代码的多场景性
            char temp;//定义一个中间变量
            temp = arr[i];//开始互换元素
            arr[i] = arr[r1];
            arr[r1] = temp;
        }
        return new String(arr);
    }

    private static String getUid(String str, int length){
        str=str.toUpperCase(Locale.ROOT);
        char []ch=str.toCharArray();
        char[]root= baseNumLetter.toCharArray();
        StringBuilder sb=new StringBuilder();
        for(int i=0;i<ch.length;i++){
            for(int j=0;j<root.length; j++){
                if(ch[i]==root[j]){
                    sb.append(j);
                    continue;
                }
            }
        }
        String uidStr=sb.toString();

        StringBuffer sbt = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sbt.append(uidStr.charAt(random.nextInt(uidStr.length())));
        }
        String tempUid=sbt.toString();
        if(tempUid.startsWith("0")){
            random = new Random();
            Integer number= random.nextInt();
            tempUid.replace("0",number+"");
        }
        return tempUid;
    }

    //生成加密解密的随机种子
    private static String encrypt(String password) throws NoSuchAlgorithmException, DecoderException,
            InvalidKeyException, InvalidKeySpecException, NoSuchPaddingException, BadPaddingException, IllegalBlockSizeException {
        byte[] key = decodeHex(data);
        //从原始密钥数据创建DESKeySpec对象
        DESKeySpec desKeySpec = new DESKeySpec(key);
        //创建一个密钥工厂，然后把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        //cipher对象实际完成加密操作
        Cipher cipher = Cipher.getInstance("DES");
        //用密钥初始化Cipher对象
        cipher.init(Cipher.ENCRYPT_MODE,secretKey);
        byte[] bytes = cipher.doFinal(password.getBytes());
        return Hex.encodeHexString(bytes);
    }

    public static String getId() {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime()+System.currentTimeMillis();
        String uid= null;
        try {
            uid = encrypt(randomSort(getDUID()+time));
        } catch (NoSuchAlgorithmException | BadPaddingException | NoSuchPaddingException | IllegalBlockSizeException | InvalidKeyException | DecoderException | InvalidKeySpecException ignored) {
        }
        return getUid(uid,20);
    }

    public static void main(String[] args) throws NoSuchPaddingException, BadPaddingException, NoSuchAlgorithmException, IllegalBlockSizeException, DecoderException, InvalidKeyException, InvalidKeySpecException {
        System.out.println(getId());
        System.out.println(getDUID());
        System.out.println(getHostName());
    }

}
