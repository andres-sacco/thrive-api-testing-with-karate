import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;


class CucumberReport {

    @Test
    void testParallel() {
        File file = new File("target/cucumber-html-reports/");
        String[] myFiles;
        if(file.isDirectory()){
            myFiles = file.list();
            assert myFiles != null;
            for (String s : myFiles) {
                File myFile = new File(file, s);
                System.out.println("Deleteing files: " + myFile);
                myFile.delete();
            }
        }
        Results results = Runner.path("classpath:reservation", "classpath:clusters")
                .outputCucumberJson(true)
                .parallel(1);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Report-Name");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
