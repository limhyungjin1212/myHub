package com.lhj.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID(); // UUID(Universally Unique Identifier) : 범용 고유 식별자
		String savedName = uid.toString() + "_" + originalName; // 파일이름이 똑같으면 uuid랜덤으로 구별.

		// 경로를 년 월 일 폴더를 만들어서 관리.
		String savedPath = calcPath(uploadPath);

		// 업로드 경로 + 년 월 일 폴더 경로 에 savedName 파일을 만들어라
		File target = new File(uploadPath + savedPath, savedName);

		// 파일 입출력을 담당하는 클래스  fileData로 수집해서 target으로 보내겠다.
		//FileCopyUtils.copy(in,out);
		FileCopyUtils.copy(fileData, target);

		// 원래 이름에서 확장자를 확인하기위해 .뒤를 탐색
		// lastIndexOf : 문자열에서 탐색하는 문자열이 마지막으로 등장하는 위치에 대한 index를 반환
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadFileName = null;

		if (MediaUtils.getMediaType(formatName) != null) { // 확장자를 확인해서 이미지이면
			uploadFileName = makeThumbnail(uploadPath, savedPath, savedName); // 썸네일을 만들고
		} else {
			uploadFileName = makeIcon(uploadPath, savedPath, savedName); // 아니면 아이콘을 생성
		}

		return uploadFileName;
	}

	private static String calcPath(String uploadPath) {

		// 달력 정보를 가져온다.
		Calendar cal = Calendar.getInstance();

		// File.separator 는 파일 구분자. / yearPath : /2020
		String yearPath = File.separator + cal.get(Calendar.YEAR);

		// NumberFormat 클래스와는 달리, DecimalFormat 클래스는 new 연산자를 사용하여 객체를 생성한다.
		// DecimalFormat 클래스는 format 메소드를 사용하여 특정 패턴으로 값을 포맷할 수 있다. (반환 값 String)
		// Calendar.MONTH 는 1월을 0부터 시작. 그래서 +1을 함 monthPath : /2020/01
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		// datePath : /2020/01/날짜
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}

	// 매개변수에 가변배열. paths안에 위에 yearPath,monthPath,datePath가 들어간다
	private static void makeDir(String uploadPath, String... paths) {

		// paths의 마지막에 같은 폴더가 있으면 생성하지않고 리턴
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) { // paths배열에 가지고올 항목이 존재할 경우 path변수

			File dirPath = new File(uploadPath + path); // ex) uploadPath + /2020 /01/07 이런식으로.
			if (!dirPath.exists()) { // dirPath가 존재하지 않으면 즉 디렉토리가 없으면
				dirPath.mkdir(); // mkdir()메서드는 폴더를 생성.
			}
		}
	}

	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

		// 이미지를 경로와 파일 이름으로 읽어들인다 BufferedImage는 가상의 저장공간?
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 불러들인 이미지를 사이즈 조정 후 destImg에 저장
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일 이름은 파일앞에 s_가 붙는다
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		// 새로운 파일 생성 썸네일 이름으로.
		File newFile = new File(thumbnailName);
		// 확장자이름은 .으로구분
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 이미지를 write메소드로 저장. 원하는이름과 경로에
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		//썸네일 이름에 \\ 를 / 로 치환한다.
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {

		String iconName = uploadPath + path + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
