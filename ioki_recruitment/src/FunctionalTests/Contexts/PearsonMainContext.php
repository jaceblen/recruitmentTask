<?php

namespace FunctionalTests\Contexts;

use FunctionalTests\Pages\PearsonPage;
use SensioLabs\Behat\PageObjectExtension\Context\PageObjectContext;

/**
 * Behat context class.
 */
class PearsonMainContext extends PageObjectContext
{
    /**
     * @When /^I visited pearsonpage$/
     */
    public function iVisitedThePage()
    {

        $this->getPage(PearsonPage::class)->isOpen();
    }
}