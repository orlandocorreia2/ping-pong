const express = require("express");
const playwright = require("playwright");
const app = express();
const port = 3000;

app.get("/ping", async (_, res) => {
  const browser = await playwright.chromium.launch({
    headless: false,
  });
  const context = await browser.newContext(
    playwright.devices["Desktop Chrome"]
  );
  const page = await context.newPage();

  await page.goto(
    "https://venda-imoveis.caixa.gov.br/sistema/detalhe-imovel.asp?hdnOrigem=index&hdnimovel=10176203"
  );
  const photo_link_src = await page.locator("#preview").getAttribute("src");
  await context.close();
  await browser.close();

  res.json({ message: "pong", photo_link_src });
});

app.listen(port, () => {
  console.log(`App example is running on port: ${port}`);
});
