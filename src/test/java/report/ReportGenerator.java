package report;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class ReportGenerator {


    public static void main(String[]args){
        //String path="C:\\Users\\Eynar\\Desktop\\UCBRepositorios\\ucb_rest\\build\\reports\\cucumber\\";
        String path="C:\\Users\\gvane\\Documents\\DIPLOMADO UCB\\rest-items-project\\build\\reports\\cucumber\\";

        File reportOutPut= new File(path+"finalReportAPI");

        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add(path+"report.json");

        Configuration configuration =  new Configuration(reportOutPut,"UCB Diplomado");
        configuration.setBuildNumber("v50.0");
        configuration.addClassifications("SO","Windows");
        configuration.addClassifications("Owner","Ivan");
        configuration.addClassifications("Branch","cucumber");
        configuration.addClassifications("Type Report","Local");

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles,configuration);
        reportBuilder.generateReports();
    }





}
