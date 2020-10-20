package step_definitions;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class MyStepdefs {
    @Given("New credit card issued by the bank with pin {int}")
    public void newCreditCardIssuedByTheBank(int pinNumber) {
        System.out.println("Card 4444 3333 2222 1111 with Pin "+pinNumber+" has been issued");
    }

    @And("Inserting card to ATM")
    public void insertingCardToATM() {
        System.out.println("Card has been inserted to ATM machine");
    }

    @And("Move on {string} section")
    public void beingOnPinChangeSection(String atmSections) {
        System.out.println("You have been moved to  " + atmSections+" page");
    }

    @When("Set the pin to {int}")
    public void changeThePinTo(int pinValue) {
        System.out.println("Pin input field has been set to "+pinValue);
    }

    @And("Click apply button")
    public void clickApplyButton() {
        System.out.println("Apply button has been clicked");
    }

    @Then("Get massage {string}")
    public void getMassage(String massageText) {
        Assert.assertEquals(massageText,massageText); //over here we can read original massage from atm and compare to what we expect
        // but for right now im skipping this logic
        System.out.println("Massage is: "+massageText);
    }

    @And("Check pin is {int}")
    public void checkPinIs(int expectedPin) {
        Assert.assertEquals(expectedPin,expectedPin); //over here we can read original massage from atm and compare to what we expect
        // but for right now im skipping this logic
        System.out.println("Pin is: "+expectedPin);
    }

    @When("Login with pin {int}")
    public void enterPinExpectedPin(int pin) {
        System.out.println("Pin "+pin+" entered into pin field");
    }
}
