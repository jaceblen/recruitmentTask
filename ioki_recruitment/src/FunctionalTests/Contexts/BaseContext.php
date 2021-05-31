<?php

namespace FunctionalTests\Contexts;

/**
 * Behat context class.
 */
class BaseContext extends MainContext
{
    /**
     * @param $url
     *
     * @When /^I go to (.*) site$/
     */
    public function goToWwwSite($url)
    {
        $this->getSession()->getDriver()->visit($url);
    }

    /**
     * @param string $expectedUrl
     *
     * @throws \Exception
     *
     * @Then /^I should be on (.*) site$/
     */
    public function assertPage($expectedUrl)
    {
        $currentUrl = $this->getSession()->getCurrentUrl();

        if ($currentUrl !== $expectedUrl) {
            throw new \Exception("Current url $currentUrl is not as expected $expectedUrl");
        }
    }
}