<?php

namespace FunctionalTests\Contexts;

use Behat\MinkExtension\Context\RawMinkContext;
use SensioLabs\Behat\PageObjectExtension\Context\PageObjectAware;
use SensioLabs\Behat\PageObjectExtension\PageObject\Factory;

/**
 * Behat context class.
 */
class MainContext extends RawMinkContext implements PageObjectAware
{
    /**
     * @var Factory
     */
    protected $pageFactory = null;

    /**
     * @param Factory $pageFactory
     */
    public function setPageObjectFactory(Factory $pageFactory)
    {
        $this->pageFactory = $pageFactory;
    }
}