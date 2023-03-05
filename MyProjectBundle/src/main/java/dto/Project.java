package dto;

import java.io.Serializable;
import java.util.ArrayList;

public class Project implements Serializable {

	private static final long serialVersionUID = -427400572038677000L;

	private String projectId; // 프로젝트 아이디
	private String projectName; // 프로젝트 이름
	private String projectNameEn; // 프로젝트 영문명
	private String developer; // 개발자
	private String releaseDate; // 버전(월/년)
	private String description; // 설명
	private String category; // 유형
	private String condition; // 진행 상태 : 진행중 or 완성 or 수정중 or 미완성
	private String initialImage; // 대표 이미지
	private ArrayList<String> subImages = new ArrayList<String>(); // 서브 이미지
	private String imgInfo[]; // 이미지 설명
	private String github; // 깃허브 링크


	public Project() {
		super();
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectNameEn() {
		return projectNameEn;
	}

	public void setProjectNameEn(String projectNameEn) {
		this.projectNameEn = projectNameEn;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getInitialImage() {
		return initialImage;
	}

	public void setInitialImage(String initialImage) {
		this.initialImage = initialImage;
	}

	public ArrayList<String> getSubImages() {
		return subImages;
	}

	public void setSubImages(String subImage) {
		this.subImages.add(subImage);
	}

	public String[] getImgInfo() {
		return imgInfo;
	}

	public void setImgInfo(String[] imgInfo) {
		this.imgInfo = imgInfo;
	}
	
	public String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		this.github = github;
	}
	

	public Project(String projectId, String projectName, String projectNameEn) {
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectNameEn = projectNameEn;
	}
}
