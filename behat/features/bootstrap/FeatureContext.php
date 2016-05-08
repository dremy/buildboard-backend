<?php

/**
 * @file
 * TFA-specific functions
 */

use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\BehatContext;
use Behat\Behat\Hook\Scope\AfterStepScope;


/**
 * Features context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {
  /**
   * @AfterStep
   */
  public function takeScreenShotAfterFailedStep(afterStepScope $scope)
  {
    if (99 === $scope->getTestResult()->getResultCode()) {
      $html = $this->getSession()->getDriver()->getContent();
      $filename = $scope->getFeature()->getTitle() . '_' . $scope->getStep()->getText() . '_' . date("Ymd") . '.html';
      $filename = preg_replace('/[^\-\.\w]/', '_', strtolower($filename));
      $dir = '/tmp';
      file_put_contents($dir . '/' . $filename, $html);
      echo 'ERROR running scenario. HTML output stored in: ' . $dir . '/' . $filename;
    }
  }

  /**
   * @Then :cssid checkbox should be checked
   */
  public function checkboxShouldBeChecked($cssid)
  {
    $radio_button_status = $this->getSession()->getPage()->find('css', 'input[type="radio"]:checked#'.$cssid);
    if (!$radio_button_status) {
      throw new Exception('Radio button with id ' . $cssid.' is not checked');
    }
  }

  /**
  * @Given /^I drag the image atom "([^"]*)" to "([^"]*)"$/
  */
  public function iDragTheImageAtomTo($path, $upload_field) {
    // Make a new scald with $file.
    if ($this->getMinkParameter('files_path')) {
      $fullPath = rtrim(realpath($this->getMinkParameter('files_path')), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$path;
      if (!is_file($fullPath)) {
        throw new \Exception(sprintf("Could not find file at %s", $fullPath));
      }
    }

    $file = file_save_data(file_get_contents($fullPath), 'public://' . $path);

    if (!$file) {
      throw new \Exception(sprintf("Could not make file from path %s", $fullPath));
    }

    $atom = new ScaldAtom('image', 'scald_image');
    $atom->title = $file->filename;
    $atom->base_id = $file->fid;
    $atom->scald_thumbnail[LANGUAGE_NONE][0] = (array) $file;
    $atom->save();

    if (!isset($atom->sid)) {
      throw new \Exception(sprintf("Could not make an atom from %s", $path));
    }

    // Put that scald id in $upload_field.
    $this->getSession()->getPage()->fillField($upload_field, $atom->sid);
  }

  /**
   * @When I wait for the paragraph element :css_element_id to appear
   */
  public function iWaitForTheParagraphsBoxToAppear($css_element_id)
  {
    $this->getSession()->wait(5000);
    $page = $this->getSession()->getPage();
    $css_id = $page->find('css',$css_element_id);
    if (empty($css_id)) {
      throw new Exception (sprintf('The paragraph element %s was not found', $css_element_id));
    }
  }

  /**
   * @When I set :element :name element visible
   */
  public function iSetElementVisible($element, $name) {
    $js = <<<HEREDOC
     jQuery("'$element'[name='$name']").css('visibility', 'visible');
     jQuery("'$element'[name='$name']").show();
HEREDOC;
    $this->getSession()->executeScript($js);
  }
}
