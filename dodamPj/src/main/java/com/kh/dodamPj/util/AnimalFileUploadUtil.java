package com.kh.dodamPj.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class AnimalFileUploadUtil {
	
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) throws Exception {
		
		String datePath = calcPath(uploadPath);
		UUID uuid = UUID.randomUUID();
		String filePath = datePath + "/" + uuid + "_" + originalFilename;
		System.out.println("filePath : " + filePath);
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		boolean isImage = isImage(filePath);
		System.out.println("isImage : " + isImage);
		if(isImage) {
			filePath = makeThumbnail(filePath);
		}
		return filePath;
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String dateString = year + "/" + month + "/" + date;
		String datePath = uploadPath + "/" + dateString;
		
		File f = new File(datePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		return datePath;
	}
	
	// 파일 확장명 얻기
	private static String getExtName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(dotIndex + 1);
		return ext.toUpperCase();
	}
	
	// 이미지 파일 여부
	private static boolean isImage(String fileName) {
		String ext = getExtName(fileName);
		if(ext.equals("JPG") || ext.equals("GIF") || ext.equals("PNG")) {
			return true;
		}
		return false;
	}
	
	public static String makeThumbnail(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String thumbnailPath = front + "tb_" + rear;
		File orgFile = new File(filePath);
		File thumbFile = new File(thumbnailPath);
		
		try {
			BufferedImage srcImage = ImageIO.read(orgFile);
			BufferedImage destImage = Scalr.resize(
					srcImage, Scalr.Method.AUTOMATIC,
					Scalr.Mode.FIT_TO_HEIGHT, 450);
			ImageIO.write(destImage, getExtName(thumbnailPath), thumbFile);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return thumbnailPath;
	}
	
	public static void deleteFile(String fileName) throws Exception {
		File f = new File(fileName);
		if(isImage(fileName)) {
			String[] names = fileName.split("tb_");
			String orgFile = names[0] + names[1];
		}
	}
	
	
}
