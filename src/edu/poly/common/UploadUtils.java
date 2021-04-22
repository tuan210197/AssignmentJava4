package edu.poly.common;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.stream.FileCacheImageInputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploadUtils {

	public static String processUploadFile(String fileName, HttpServletRequest request, String storedFolder,
			String storedFilename) throws IOException, ServletException {

		Part filePart = request.getPart(fileName);
		if (filePart == null || filePart.getSize() == 0) {
			return "";
		}
		if (storedFolder == null) {
			storedFolder = "/uploads";
		}
		if (storedFilename == null) {
			storedFilename = Path.of(filePart.getSubmittedFileName()).getFileName().toString();
		} else {

			storedFilename += "." + FilenameUtils.getExtension(Path.of(filePart.getSubmittedFileName()).toString());
		}

		String uploadFolder = request.getServletContext().getRealPath(storedFolder);

		Path uploaadPath = Paths.get(uploadFolder);

		if (!Files.exists(uploaadPath)) {
			Files.createDirectories(uploaadPath);
		}
		filePart.write(Paths.get(uploaadPath.toString(), storedFilename).toString());
		
		return storedFilename;
		
	}
}
