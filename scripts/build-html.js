const fs = require("fs");
const path = require("path");
const yaml = require("js-yaml");

const ROOT = path.join(__dirname, "..");
const TEMPLATE_PATH = path.join(ROOT, "frontend/index.template.html");
const OUTPUT_PATH = path.join(ROOT, "frontend/index.html");
const DATA_PATH = path.join(ROOT, "data/crypto.yaml");

function generateCryptoHTML(cryptos) {
  return cryptos
    .map(
      (crypto) => `<div>
              <div class="d-flex align-items-center mb-2">
                <span class="fw-semibold">${crypto.name}</span>
                <button
                  class="btn btn-sm btn-outline-warning ms-auto"
                  data-copy
                  data-address="${crypto.address}"
                >
                  Copy
                </button>
              </div>
              <code class="crypto-address d-block">
                ${crypto.address}
              </code>
            </div>`
    )
    .join("\n            ");
}

function build() {
  const template = fs.readFileSync(TEMPLATE_PATH, "utf8");
  const data = yaml.load(fs.readFileSync(DATA_PATH, "utf8"));

  const cryptoHTML = generateCryptoHTML(data.cryptocurrencies);
  const output = template
    .replace("{{STRIPE_URL}}", data.stripe.url)
    .replace("{{CRYPTO_SECTION}}", cryptoHTML);

  fs.writeFileSync(OUTPUT_PATH, output);
  console.log("Generated frontend/index.html");
}

build();
