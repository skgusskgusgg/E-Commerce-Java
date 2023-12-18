package org.team.faq;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FaqBoardVO {
	private int faqId;
	private String faqTitle;
	private String faqContents;
	private int user_id;
	private String regdate;
	private String updateDate;
	private String img;
	private String viewCount;
	private String user_name;
	private List<String> imgFiles;
	
	public List<String> getImgFiles() {
        return imgFiles;
    }

    public void setImgFiles(List<String> imgFiles) {
        this.imgFiles = imgFiles;
    }
    

}
