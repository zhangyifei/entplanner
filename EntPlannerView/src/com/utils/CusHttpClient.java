package com.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.entity.Input;
import com.google.gson.Gson;

public class CusHttpClient {

	public static String getResult(Input input) {

		DefaultHttpClient httpClient = new DefaultHttpClient();
		String reString = null;

		// String urlString =
		// "http://127.0.0.1:8080/serviceMashupTomcat/rest/plan/getsolutionAsString";
		// String urlString
		// ="http://ec2-54-218-103-65.us-west-2.compute.amazonaws.com:8080/plannerService/m/getplanAsString";
		String urlString = Constants.SERVER_HOST
				+ "CSPcomposeService/m/getplanAsString";
		System.out.println(urlString);
		// String urlString =
		// "http://ec2-54-218-103-65.us-west-2.compute.amazonaws.com:8080/entplanner/rest/plan/getsolutionString";
		HttpPost httpPost = new HttpPost(urlString);
		// httpPost.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY,new
		// HttpHost("127.0.0.1", 8580));
		try {

//			input.setMv("true");
//			input.setDv("true");

			Gson gson = new Gson();

			String inputString = gson.toJson(input);
			StringEntity stringEntity = new StringEntity(inputString);
			stringEntity.setContentType("application/json");
			httpPost.setEntity(stringEntity);
			HttpResponse response = httpClient.execute(httpPost);
			int code = response.getStatusLine().getStatusCode();
			if (code == 200) {
				reString = EntityUtils.toString(response.getEntity());
				System.out.println(reString);

			} else {
				System.out.println("error code " + code);
				System.out.println(response.getStatusLine());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return reString;
	}



	public static String httpGetDetail(String serviceType, String serviceId)
			throws IOException {
		// String urlString =
		// "http://ec2-54-218-103-65.us-west-2.compute.amazonaws.com:8080/plannerService/m/getActivityDetail/"+
		// serviceType+"/"+serviceId;
		String urlString = Constants.SERVER_HOST
				+ "CSPcomposeService/m/getActivityDetail/" + serviceType + "/"
				+ serviceId;

		HttpURLConnection connection = null;
		String result = null;
		try {
			// 创建连接
			URL url = new URL(urlString);
			connection = (HttpURLConnection) url.openConnection();

			// 设置http连接属性

			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("GET"); // 可以根据需要 提交
												// GET、POST、DELETE、INPUT等http提供的功能
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);

			// 设置http头 消息
			connection.setRequestProperty("Content-Type", "application/json"); // 设定
																				// 请求格式
																				// json，也可以设定xml格式的
			// connection.setRequestProperty("Content-Type", "text/xml"); //设定
			// 请求格式 xml，
			connection.setRequestProperty("Accept", "application/json");// 设定响应的信息的格式为
																		// json，也可以设定xml格式的
			// connection.setRequestProperty("X-Auth-Token","xx");
			// //特定http服务器需要的信息，根据服务器所需要求添加
			connection.connect();

			// 读取响应
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String lines;
			StringBuffer sb = new StringBuffer("");
			while ((lines = reader.readLine()) != null) {
				lines = new String(lines.getBytes(), "utf-8");
				sb.append(lines);
			}
			// System.out.println(sb);
			reader.close();
			// // 断开连接
			connection.disconnect();

			result = sb.toString();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
