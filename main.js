const puppeteer = require('puppeteer');

(async () => {
    const isDebug = false;
    const browser = await puppeteer.launch({ headless: !isDebug, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    page.setViewport({width: 1200, height: 1000});
    await page.goto('http://wiasf.cupmet-fi.it/ASFWeb/MMG/mmgRicercaMedici.do');
    await page.select('select[name="tipoMedico"]', "P");
    await page.select('select[name="ambitoTerritoriale"]', "043");
    await page.click('input.InputSub[type=submit]');
    await page.waitForSelector('label.LabelTitolo');
    await page.screenshot({ path: 'result.png', clip: {
        x: 260,
        y: 240,
        width: 900,
        height: 400,
    } });

    await browser.close();
})();
