import java.awt.Color;

import com.vp.plugin.ApplicationManager;
import com.vp.plugin.ProjectManager;
import com.vp.plugin.VPPlugin;
import com.vp.plugin.VPPluginCommandLineSupport;
import com.vp.plugin.VPPluginInfo;
import com.vp.plugin.diagram.IDiagramElement;
import com.vp.plugin.diagram.IDiagramUIModel;
import com.vp.plugin.diagram.format.IDiagramElementLineModel;
import com.vp.plugin.model.IProject;

public class VPPLineVisibilityFix implements VPPlugin, VPPluginCommandLineSupport {
    public void loaded(VPPluginInfo info) {}
    public void unloaded() {}

    public void invoke(String[] args) {
        ProjectManager projects = ApplicationManager.instance().getProjectManager();
        IProject project = projects.getProject();
        if (project == null) {
            throw new IllegalStateException("No Visual Paradigm project is open.");
        }

        boolean found = false;
        Color lineColor = new Color(96, 96, 96);
        for (IDiagramUIModel diagram : project.toDiagramArray()) {
            if (!"Tierpartnerschaft eingehen und verwalten".equals(diagram.getName())) {
                continue;
            }

            found = true;
            for (IDiagramElement element : diagram.toDiagramElementArray()) {
                IDiagramElementLineModel line = element.getLineModel();
                if (line != null) {
                    if (!line.setColor(lineColor, true) || !line.setWeight(1.5f, true)) {
                        throw new IllegalStateException(
                            "Could not update line formatting for diagram element " + element.getId());
                    }
                }
            }
        }

        if (!found) {
            throw new IllegalStateException("Could not find the tier-partnership sequence diagram.");
        }
        if (!projects.saveProject()) {
            throw new IllegalStateException("Could not save the Visual Paradigm project.");
        }
    }
}
