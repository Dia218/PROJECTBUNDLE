package dao;
import java.util.ArrayList;
import dto.Project;

public class ProjectRepository {

	private ArrayList<Project> listOfProjects = new ArrayList<Project>();
	private static ProjectRepository instance = new ProjectRepository();
	
	public static ProjectRepository getInstance() {
		return instance;
	}
	
	/*
	public ProjectRepository() {
		
		Project webmarket = new Project("P1", "웹쇼핑몰", "WebMarket");
		webmarket.setInitialImage("P1_0.png");
		webmarket.setSubImages("P1_1.png");
		webmarket.setSubImages("P1_2.png");
		webmarket.setSubImages("P1_3.png");
		
		Project notebook = new Project("P2", "프로젝트2", "project2");

		Project tablet = new Project("P3", "프로젝트3", "project3");
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setCondition("Old");

		listOfProjects.add(webmarket);
		listOfProjects.add(notebook);
		listOfProjects.add(tablet);	
	}
	*/
	
	public ArrayList<Project> getAllProjects() {
		return listOfProjects;
	}
	
	public Project getProjectById(String projectId) {
		Project projectById = null;
		
		for(int i = 0; i < listOfProjects.size(); i++) {
			Project project = listOfProjects.get(i);
			
			if((project != null) && (project.getProjectId() != null) && (project.getProjectId().equals(projectId)) ) {
				projectById = project;
				break;
			}
		}
		return projectById;
	}
	
	public void addProduct(Project project) {
		listOfProjects.add(project);
	}
}