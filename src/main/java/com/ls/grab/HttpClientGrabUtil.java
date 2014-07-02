package com.ls.grab;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.common.io.Files;

public class HttpClientGrabUtil {

	public static void main(String[] args) {

		try {

			// http://sh.58.com/meirongshi/pn2/
			String url = "http://sh.58.com/meirongshi/pn0/";
			
			fetchHTMLwithURL(url, "D:\\Jerry\\58.txt");
			
		

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public static String fetchHTMLwithURL(String url) {
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);

	    request.addHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20100101 Firefox/25.0");
		request.addHeader("Content-Type", " text/html;charset=UTF-8");
		StringBuffer result = new StringBuffer();
		try {
			HttpResponse response = client.execute(request);
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));

			String line = "";
			while ((line = bufferedReader.readLine()) != null) {
				result.append(line);
				result.append("\n");
			}

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}
	
	public static String fetchHTMLwithURL(String url, String fileToStore) throws IOException {
		
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);

		// add request header
	    request.addHeader("User-Agent", "Test");
		request.addHeader("Content-Type", " text/html;charset=UTF-8");
		HttpResponse response = client.execute(request);

		BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));

		StringBuffer result = new StringBuffer();
		String line = "";
		FileWriter fileWriter = new FileWriter(new File(fileToStore));
		
		while ((line = rd.readLine()) != null) {
			// result.append(line + "\n");

			System.out.println(line);
			fileWriter.write(line  + "\n");
		}

		fileWriter.close();
		
		return result.toString();
	}

}
