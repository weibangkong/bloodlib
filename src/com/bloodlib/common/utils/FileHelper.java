package com.bloodlib.common.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

/**
 * 文件读写工具类
 * 
 * @author WeiBang Kong
 *
 */
public class FileHelper{
	
	/**
	 * 替换文本内容
	 * 
	 * @param filePath
	 * @param resourcePath
	 */
	public static void reaplaceTextContent(String filePath,String resourcePath){
		File inputFile=new File(filePath);
		File outputFile=new File(resourcePath);
		//先开的后关
		//FileReader fr = null;//因涉及到编码问题，不可使用FileReader
		//FileWriter fw = null;//因涉及到编码问题，不可使用FileWriter
		FileInputStream fis=null;
		FileOutputStream fos=null;
		InputStreamReader isr=null;//使用InputStreamReader 构造时可以制定编码格式new isr(fileStream,"EncodingCode")
		OutputStreamWriter osw=null;//使用OutputStreamWriter 构造时可以制定编码格式new osw(fileStream,"EncodingCode")
		BufferedReader br = null;//处理流，需要依赖结果流，先关闭处理流，关闭处理流时候默认关闭结果流
		BufferedWriter bw = null;
		try {
			//实例字符缓冲输入流
			if(inputFile.exists()){
				//fr = new FileReader(inputFile);
				fis=new FileInputStream(inputFile);
				try {
					isr=new InputStreamReader(fis,"GB2312");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					System.err.println("isr流创建失败");
				}
			}else{
				System.err.println("文件不存在，请检查所选目录是否选择的文件");
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			System.err.println("字符输入流创建失败");
		}
	
		if(inputFile.isDirectory()){
			System.err.println("内容来源文件路径指向对象为文件夹");
			String[] filelist=inputFile.list();
			System.err.println(filelist.length);
		}else{
			System.out.println("内容来源文件路径指向对象为非文件夹");
			if(outputFile.exists()){
				try {//读取文件操作
					
					br=new BufferedReader(isr);
					//实例字符缓冲输出流
					//fw = new FileWriter(outputFile);
					fos=new FileOutputStream(outputFile);
					osw=new OutputStreamWriter(fos,"GB2312");
					bw = new BufferedWriter(osw);
					int length;
					while((length=br.read())>0){
						bw.write(length);
						bw.flush();
					}
					System.out.println("文件内容复制完毕");
				} catch (IOException e) {
					e.printStackTrace();
					System.err.println("文件复制出错，操作失败");
				} finally{
					if(null!=bw){
						try {//关闭字符缓冲输出流
							bw.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字符缓冲输出流关闭失败");
						} finally{
							bw=null;
						}
					}

//					if(null!=fw){
//						try {//关闭字符输出流
//						fw.close();
//					} catch (IOException e) {
//						e.printStackTrace();
//						System.err.println("字符输出流关闭失败");
//					} finally{
//						fw=null;
//					}
//					}

					if(null!=osw){
						try {//关闭字符缓冲输入流
							osw.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("输出流关闭失败");
						} finally{
							osw=null;
						}
					}
					
					if(null!=fos){
						try {//关闭字符缓冲输入流
							fos.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字节输出流关闭失败");
						} finally{
							fos=null;
						}
					}
				
					if(null!=br){
						try {//关闭字符缓冲输入流
							br.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字符缓冲输入流关闭失败");
						} finally{
							br=null;
						}
					}
					
//					if(null!=fr){
//						try {//关闭字符输入流
//							fr.close();
//							System.out.println("字符输入流关闭成功");
//						} catch (IOException e) {
//							e.printStackTrace();
//							System.err.println("字符输入流关闭失败");
//						} finally{
//							fr=null;
//						}
//					}
//					
					if(null!=isr){
						try {//关闭字符缓冲输入流
							isr.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("输入流关闭失败");
						} finally{
							isr=null;
						}
					}
					
					if(null!=fis){
						try {//关闭字符缓冲输入流
							fis.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字节输入流关闭失败");
						} finally{
							fis=null;
						}
					}
					
				}
			}else{
				System.err.println("目标文件不存在，创建新文件");
				boolean isCreateSuccess=false;
				try {
					isCreateSuccess=outputFile.createNewFile();
				} catch (IOException e) {
					System.err.println("文件创建失败了解一下");
					e.printStackTrace();
				}
				if(isCreateSuccess){
					reaplaceTextContent(filePath,resourcePath);
				}
			}
		}
	
	}
	
	/**
	 * 替换图片内容
	 * 
	 * @param filePath
	 * @param resourcePath
	 */
	public static void replacePictureContent(String filePath,String resourcePath){
		File inputFile=new File(filePath);
		File outputFile=new File(resourcePath);
		FileInputStream fis=null;
		FileOutputStream fos=null;
		try {
			//实例字节输入流
			if(inputFile.exists()){
				fis=new FileInputStream(inputFile);
			}else{
				System.err.println("文件不存在，请检查所选目录是否选择的文件");
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			System.err.println("字节输入流创建失败");
		}
	
		if(inputFile.isDirectory()){
			System.err.println("图片来源文件路径指向对象为文件夹");
			String[] filelist=inputFile.list();
			System.err.println(filelist.length);
		}else{
			System.out.println("图片来源文件路径指向对象为非文件夹");
			if(outputFile.exists()){
				try {//读取文件操作
					fos=new FileOutputStream(outputFile);
					byte[] bytes=new byte[fis.available()];
					@SuppressWarnings("unused")
					int length;
					while((length=fis.read(bytes))!=-1){
						System.out.println("正在复制图片内容");
						fos.write(bytes);
						fos.flush();
					}
					System.out.println("图片内容复制完毕");
				} catch (IOException e) {
					e.printStackTrace();
					System.err.println("图片复制出错，操作失败");
				} finally{			
					if(null!=fos){
						try {//关闭字节输出流
							fos.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字节输出流关闭失败");
						} finally{
							fos=null;
						}
					}					
					if(null!=fis){
						try {//关闭字节输入流
							fis.close();
						} catch (IOException e) {
							e.printStackTrace();
							System.err.println("字节输入流关闭失败");
						} finally{
							fis=null;
						}
					}
					
				}
			}else{
				System.err.println("目标文件不存在，创建新文件");
				boolean isCreateSuccess=false;
				try {
					isCreateSuccess=outputFile.createNewFile();
				} catch (IOException e) {
					System.err.println("文件创建失败了解一下");
					e.printStackTrace();
				}
				if(isCreateSuccess){
					replacePictureContent(filePath,resourcePath);
				}
			}
		}
	
	}
}
