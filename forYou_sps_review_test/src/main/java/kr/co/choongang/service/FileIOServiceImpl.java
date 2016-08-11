package kr.co.choongang.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileIOServiceImpl implements FileIOService {

	@Override
	public String saveMultiPartsFileOne(HttpServletRequest request) throws IOException {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		String originalFileName = null;
		HttpSession session = request.getSession();
		String rootPath = session.getServletContext().getRealPath("/");
		while (iterator.hasNext()) {
			MultipartFile multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();

				InputStream streamReader = multipartFile.getInputStream();
				byte[] byteArray = new byte[1024];
				int nRead;
				File file = new File(rootPath + "resources/upload/" + originalFileName);
				OutputStream streamWriter = new FileOutputStream(file);

				while ((nRead = streamReader.read(byteArray, 0, byteArray.length)) != -1) {
					streamWriter.write(byteArray, 0, nRead);
				}
				streamWriter.flush();
				streamWriter.close();
				streamReader.close();
				System.out.println(rootPath + "resources/upload/" + originalFileName);
			}
		}
		return "/resources/upload/" + originalFileName;
	}

}
