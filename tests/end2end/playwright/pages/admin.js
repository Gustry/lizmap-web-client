// @ts-check

import {expect, Locator, Page} from '@playwright/test';
import { BasePage } from './base';

export class AdminPage extends BasePage {
    /**
     * Main administrator menu
     * @type {Locator}
     */
    menu;

    /**
     * Main administrator message bar
     * @type {Locator}
     */
    warningMessage;

    /**
     * Constructor for an administrator page
     * @param {Page} page The playwright page
     */
    constructor(page) {
        super(page);
        this.menu = page.locator('#menu');
        this.warningMessage = page.locator('.alert');
    }

    /**
     * Navigate in the administrator menu by clicking in the menu
     * @param {string} expected Name of the page
     */
    async openPage(expected){
        await this.page.getByRole('link', { name: expected }).click();
        await this.checkPage(expected);
    }

    /**
     * Check that the menu is OK
     * @param {string} expected Name of the page
     */
    async checkPage(expected){
        await expect(this.menu.locator('li.active')).toHaveText(expected);
    }
}