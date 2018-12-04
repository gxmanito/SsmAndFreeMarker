package gx.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.io.FileUtils;

public class FindUpdate {
	private static final String SRC = "src/";
	private static final String RES = "res/";
	private static final String CLASSPATH = "WebRoot/WEB-INF/classes/";
	private static final String JAVA_FILE_SUFFIX = ".java";
	private static final String JAVA_ClASS_FILE_SUFFIX = ".class";

	public static void main(String[] args) throws IOException {
		String svnProjectDir = "/schedule-web/";// svn项目代码路径 截止到项目
		String svnUpdateListFilePath = "/c:/Users/wings/Desktop/更新列表.txt"; // svn更列表文件路径
		String localProjectDir = "/D:/Workspaces/MyEclipse 10/schedule-web/"; // 本地项目路径
		String outputDir = "/C:/Users/wings/Desktop/schedule-web/"; // 输出文件夹名称 可以不创建

		deal(svnProjectDir, svnUpdateListFilePath, localProjectDir, outputDir);
	}

	private static void deal(String svnProjectDir,
			String svnUpdateListFilePath, String localProjectDir,
			String outputDir) throws IOException {
		File sFile = new File(svnUpdateListFilePath);
		File pDir = new File(localProjectDir);
		if (!sFile.exists()) {
			System.out.println("处理失败! svn更列表文件不存在");
			return;
		}
		if (!pDir.exists()) {
			System.out.println("处理失败! 本地项目目录在不存");
			return;
		}
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				new FileInputStream(sFile),"gbk"));

		String line;
		int l = svnProjectDir.length();
		while ((line = reader.readLine()) != null) {
			line = line.trim();
			System.out.println(line);
			if (line.length() == 0 || !line.startsWith(svnProjectDir)) {
				continue;
			}

			line = line.substring(l);
			File lFile = new File(localProjectDir + line);
			if (!lFile.exists()) {
				System.out.println("文件不存在 " + lFile.getAbsolutePath());
				continue;
			}

			if (line.startsWith(SRC) || line.startsWith(RES)) {// scr下文件更新
				if (line.endsWith(JAVA_FILE_SUFFIX)) {// java文件
					line = CLASSPATH
							+ line.substring(SRC.length(), line.length()
									- JAVA_FILE_SUFFIX.length())
							+ JAVA_ClASS_FILE_SUFFIX;
					lFile = new File(localProjectDir + line);
					String className = lFile.getName();
					final String subClassName = className.substring(
							0,
							className.length()
									- JAVA_ClASS_FILE_SUFFIX.length())
							+ "$";

					// 查找内部类或匿名类
					File[] fs = lFile.getParentFile().listFiles(
							new FilenameFilter() {
								@Override
								public boolean accept(File dir, String name) {
									return name.startsWith(subClassName);
								}
							});
					if (fs.length != 0) {
						File tFile;
						String name;
						String s = line.substring(0, line.length()
								- JAVA_ClASS_FILE_SUFFIX.length());
						for (int i = 0; i < fs.length; i++) {
							File f = fs[i];
							name = f.getName();
							tFile = new File(outputDir + s.substring("WebRoot/".length())
									+ name.substring(name.lastIndexOf('$')));
							tFile.getParentFile().mkdirs();
							FileUtils.copyFile(f, tFile);
							System.out.println("复制文件 " + f.getAbsolutePath()
									+ " 到 " + tFile.getAbsolutePath());
						}
					}
				} else {
					line = CLASSPATH + line.substring(SRC.length());
					lFile = new File(localProjectDir + line);
				}
			} else {
				lFile = new File(localProjectDir + line);
			}

			File tFile = new File(outputDir + line.substring("WebRoot/".length()));
			tFile.getParentFile().mkdirs();
			FileUtils.copyFile(lFile, tFile);
			System.out.println("复制文件 " + lFile.getAbsolutePath() + " 到 "
					+ tFile.getAbsolutePath());
		}
		System.out.println("完成！");
	}
}
