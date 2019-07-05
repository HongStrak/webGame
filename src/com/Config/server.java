package com.Config;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

import org.junit.Test;




public class server {
	private static ArrayList<Socket> socList = new ArrayList<Socket>();
	
	public server(){
		ServerSocket server = null;
		try {
			server = new ServerSocket(6666);
			while(true){
				Socket socket = server.accept();
				System.out.println(socket.getRemoteSocketAddress()+"：用户连接");
				
				chat chat = new chat(socket);
				chat.start();
				socList.add(socket);
				System.out.println("当前在线人数："+socList.size());
				}
			
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	class chat extends Thread{
		Socket socket;
		public chat(Socket socket){
			this.socket=socket;
		}
		
		
		@Override
		public void run() {
			DataInputStream dis = null;
			DataOutputStream dos = null;
			String str;
			boolean ctrl=true;
			try {
				dis = new DataInputStream(socket.getInputStream());
				
				while(ctrl){
					str = dis.readUTF();
					System.out.println(socket.getRemoteSocketAddress()+":"+str);
					synchronized (socList) {
						for(Socket s : socList){
							dos = new DataOutputStream(s.getOutputStream());
							dos.writeUTF(str);
						}
					}
					
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				synchronized (socList) {
					socList.remove(socket);
				}
				
				socket = null;
				ctrl=false;
				System.out.println("已有用户下线，当前在线人数："+socList.size());
			}finally{
				try {
					dis.close();
					dos.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
		}
	}
}
