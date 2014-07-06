package com.ls.jobs.fe;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Random;

import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

public class Test {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args)  throws Exception{
//		compileFile();
//		
//		Class test = Class.forName("com.ls.jobs.fe.Jiang");
//		
//		Method testMethod = test.getDeclaredMethod("test", null);
//		
//		testMethod.invoke(test.getConstructor(null).newInstance(null), null);
		
		Random random = new Random();
		
		System.out.println(random.nextInt(100));
		
	}
	
	public static void compileFile() throws IOException{


		File[] files = new File[] { new File("D:\\data\\Jerry\\littleshop\\src\\main\\java\\com\\ls\\jobs\\fe\\Jiang.java") };

		JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();

		StandardJavaFileManager fileManager = compiler.getStandardFileManager(null, null, null);

		Iterable<? extends JavaFileObject> compilationUnits1 = fileManager.getJavaFileObjectsFromFiles(Arrays.asList(files));

		compiler.getTask(null, fileManager, null, null, null, compilationUnits1).call();

		fileManager.close();
	
	}

}
