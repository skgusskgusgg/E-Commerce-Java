package org.team.board;

import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private int board_id;
	private int user_id;
	private String title;
	private String content;
	private String img;
	private String regdate;
	private String updatedate;
	private String view;
	private String user_name;
	private List<String> imgFiles;
	
	public List<String> getImgFiles() {
        return imgFiles;
    }

    public void setImgFiles(List<String> imgFiles) {
        this.imgFiles = imgFiles;
    }
}