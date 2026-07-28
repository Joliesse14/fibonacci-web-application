#!/bin/bash
cd ~
mkdir myplaywright
cd myplaywright

npm init -y
npm install playwright@latest
npx playwright install chromium

cat > demo.js <<EOF
const playwright = require("playwright-core");
const delay = ms => new Promise(resolve => setTimeout(resolve, ms))

async function main() {
        const browser = await playwright.chromium.launch({});
        const context = await browser.newContext({});
        const page = await context.newPage();
        await page.setViewportSize({ width: 800, height: 600 });

        await page.goto("http://apache/");
        console.log("wait...")
        await delay(1000)
        console.log("waited...")

        await page.screenshot({ path: "playwright.png", fullPage: true });
        await browser.close();
}
main();
EOF
echo "

=================
installation should be fine
go to ~/myplaywright/
and call
  node demo.js
afterward look at the screenshot (not on windows)
  convert playwright.png six:-; echo
"
