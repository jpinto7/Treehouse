package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class Controller {

    @FXML private TextField firstName;

    public void handleSaySup(ActionEvent actionEvent) {
        System.out.printf("My name is %s%n", firstName.getText());
    }
}
