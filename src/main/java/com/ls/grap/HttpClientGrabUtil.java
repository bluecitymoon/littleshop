package com.ls.grap;

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

public class HttpClientGrabUtil {

	public static void main(String[] args) {

		try {

			// http://sh.58.com/meirongshi/pn2/
			String url = "http://sh.58.com/meirongshi/pn2/";

			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet(url);

			// add request header
		    request.addHeader("User-Agent", "Test");
			request.addHeader("Content-Type", " text/html;charset=UTF-8");
			//request.addHeader("Transfer-Encoding", " chunked");
			HttpResponse response = client.execute(request);

			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));

			StringBuffer result = new StringBuffer();
			String line = "";
			FileWriter fileWriter = new FileWriter(new File("D:\\Jerry\\58.txt"));
			while ((line = rd.readLine()) != null) {
				// result.append(line + "\n");

				System.out.println(line);
				fileWriter.write(line  + "\n");
			}

			fileWriter.close();
			// System.out.println(result.toString());

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
